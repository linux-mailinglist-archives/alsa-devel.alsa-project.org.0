Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403B818E4E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:39:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AEFBDF1;
	Tue, 19 Dec 2023 18:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AEFBDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007586;
	bh=B6AfhooOo/f58PQVWikUFOcOdGWfzWywYJajswstrGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dqpRuSSdquMc3/qnh5wlvIrPJ2YTxpdTAXoQZwYC5K6zFm8HWVJFCYEgNdu3PcJbl
	 uRJAyJt1pxMUkizwjTRHmhbvYiGUwhCgJUB7n5G5DL4bnpBgWPX1wbjD2Gj2Tr5g4M
	 jtrWhxKQdOkG3V/IWxB4Bhiod5P471ykwxnWVxwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96048F805C3; Tue, 19 Dec 2023 18:39:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06D75F805C8;
	Tue, 19 Dec 2023 18:39:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CFCEF8055A; Tue, 19 Dec 2023 18:38:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73830F8055B
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73830F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=oT6NOiH7
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5CB6D604B9F7; Wed, 20 Dec 2023 04:08:09 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5CB6D604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007489; bh=7GVO3MNMTMsgTji6rIpd6tjr7bcMr8xM2wntNzv+XCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oT6NOiH7qkCP5Ea27LIagVg1gtBMTTHvX0ojS716+ZvMAlTdvHCoWdmNoB/W06Ksx
	 uqb3TYrYmkSNgd3dnCFlbMNYTA2ujK3FVrUpxqWwTccbPapdYovQMbfui+zOs9do+Q
	 u+1URU3/Su+fctIP3uy4rVqV7qxWmhnvXjwHoqg9leZ2FkTZzwPtcqw0iU8EiIuJ2j
	 Uh0UBl1mE7ji5b0dxNiUQW4yDNk97ZS+v8XcfaTJxbXrWii2YpTflPG8ksgXGM5zwS
	 vA83ZSWRAbrfBtDyTlH9dASS8tY2e0WKhxpqqXqal9muo5b36slVjCLvEUermz6QWE
	 R95dXIHBdYnjw==
Date: Wed, 20 Dec 2023 04:08:09 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 06/11] ALSA: scarlett2: Add missing mutex lock around get
 meter levels
Message-ID: <77e093c27402c83d0730681448fa4f57583349dd.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: BZGKWMMCLLTLEM7DWS7UN5JIIUN42HT2
X-Message-ID-Hash: BZGKWMMCLLTLEM7DWS7UN5JIIUN42HT2
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZGKWMMCLLTLEM7DWS7UN5JIIUN42HT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As scarlett2_meter_ctl_get() uses meter_level_map[], the data_mutex
should be locked while accessing it.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 2b17abb0dec4 ("ALSA: scarlett2: Remap Level Meter values")
---
 sound/usb/mixer_scarlett2.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f1636a1614da..73f5badceb19 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -3880,10 +3880,12 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 	u16 meter_levels[SCARLETT2_MAX_METERS];
 	int i, err;
 
+	mutex_lock(&private->data_mutex);
+
 	err = scarlett2_usb_get_meter_levels(elem->head.mixer, elem->channels,
 					     meter_levels);
 	if (err < 0)
-		return err;
+		goto unlock;
 
 	/* copy & translate from meter_levels[] using meter_level_map[] */
 	for (i = 0; i < elem->channels; i++) {
@@ -3898,7 +3900,10 @@ static int scarlett2_meter_ctl_get(struct snd_kcontrol *kctl,
 		ucontrol->value.integer.value[i] = value;
 	}
 
-	return 0;
+unlock:
+	mutex_unlock(&private->data_mutex);
+
+	return err;
 }
 
 static const struct snd_kcontrol_new scarlett2_meter_ctl = {
-- 
2.43.0

