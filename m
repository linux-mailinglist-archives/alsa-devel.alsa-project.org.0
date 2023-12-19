Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4D1818E45
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:37:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4D4E94;
	Tue, 19 Dec 2023 18:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4D4E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007457;
	bh=IPgrM1saYRQovJkWh8Am1q21cREmsnFRR1jQ2LDZ9ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PEAhLV2UKVwGEHtXuF4+GEIQ0EAJlDKVByKPGi0UWk3vISM5R2bT1JOByzA04kzfU
	 0QpQasYhZeCnFf8i3FbBDriyJC87g1tRslGCj20HNBgAnuLDCuSL4KC8GM/FT8fpI7
	 LshTnCMdxfjK2nCl/nTGM54rpt7kFcjI5L1jRU88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFBAEF80589; Tue, 19 Dec 2023 18:37:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D267CF805CA;
	Tue, 19 Dec 2023 18:37:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA202F8056F; Tue, 19 Dec 2023 18:37:08 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F237BF80557
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:37:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F237BF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=faHNPnoB
Received: by m.b4.vu (Postfix, from userid 1000)
	id 59CC3604B9F7; Wed, 20 Dec 2023 04:07:00 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 59CC3604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007420; bh=8ETulCIE9Z69wcqSdAOg8PPnM13gfiYjvR7IHw2Ie3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faHNPnoB6i6kSJXkV/pAFKVpIboUm0LoeTJRYsqr9OXWofxsLJn1SHa22hFq0tnnT
	 MrjzCx86UGM5/zjM7oTE+a6pdP7oRRUsOuGfeEncgBHQ5bc0LPGKujdVlNcJW4Eoel
	 +GyLuofT5vv/WukZdH+JhqMn9lINj80ByvrCVEgla5lQBnoahUZiI0PmbcLm2gqpCa
	 y6k0soNGslDdXgXMECZhzHat/rgA7vOPnFktH9sRzowChN2Fvbce9QgRuTHz9U179t
	 5a4dHApBLaXQDlL75ITrz7TxlKWYK2Ol+lqVbEhV3sIo7GtW9k8jaMmoOIfSjd4ZwM
	 V8/RuV0TH+ZWQ==
Date: Wed, 20 Dec 2023 04:07:00 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 02/11] ALSA: scarlett2: Add missing error check to
 scarlett2_config_save()
Message-ID: <bf0a15332d852d7825fa6da87d2a0d9c0b702053.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: TYILH4UWJMRJZKATDDWXPOUAKR24T6AA
X-Message-ID-Hash: TYILH4UWJMRJZKATDDWXPOUAKR24T6AA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYILH4UWJMRJZKATDDWXPOUAKR24T6AA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

scarlett2_config_save() was ignoring the return value from
scarlett2_usb(). As this function is not called from user-space we
can't return the error, so call usb_audio_err() instead.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
---
 sound/usb/mixer_scarlett2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index a0dbdf921745..a0ba53372f7b 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1524,9 +1524,11 @@ static void scarlett2_config_save(struct usb_mixer_interface *mixer)
 {
 	__le32 req = cpu_to_le32(SCARLETT2_USB_CONFIG_SAVE);
 
-	scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
-		      &req, sizeof(u32),
-		      NULL, 0);
+	int err = scarlett2_usb(mixer, SCARLETT2_USB_DATA_CMD,
+				&req, sizeof(u32),
+				NULL, 0);
+	if (err < 0)
+		usb_audio_err(mixer->chip, "config save failed: %d\n", err);
 }
 
 /* Delayed work to save config */
-- 
2.43.0

