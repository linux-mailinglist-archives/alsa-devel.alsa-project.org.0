Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E670781DC24
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C6DECF;
	Sun, 24 Dec 2023 20:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C6DECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446369;
	bh=mPWiWUUY/BQ6xboADMfC6smArbGekVriurLq81uef7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DEbzqPe9qzuSc7xMOJui+D5qWCybBUliuthovhClEde6tWq2he1DxKzmBjoWmCiTH
	 F1yDjTyEmO+TQuNfYEL1IHtORSWX+nfVsMQwk9mdi20JmjBPB1408Dr8QiIMWn7bXz
	 Ke4XouLUWBFz2w3qepfIeEdeEhOnLeACFLm/6maE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33522F805C2; Sun, 24 Dec 2023 20:32:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5607F8057F;
	Sun, 24 Dec 2023 20:32:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C6E3F80578; Sun, 24 Dec 2023 20:32:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CAC1F805FB
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CAC1F805FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=DYaDltya
Received: by m.b4.vu (Postfix, from userid 1000)
	id E88A7604B9CB; Mon, 25 Dec 2023 06:00:38 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu E88A7604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446238; bh=IM3v0Nv1z9Ik6nKAZ+Y0zaINdNmwxjzDUhSISUBT0o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DYaDltya3y3+Qp63XpsUmHiT5jwjsWAw615Ufx3Fs5srYqbhk0rzwcni+tTqZhhwg
	 RtQ4Ok2vmtn2rfku3zjNLOAzRzG7/X4sJ8tVDMCyhUWa1GroEELkcTOVwjOrqnqqit
	 7M/yl0f2Zx2GfnxA5aZhjCkyWi0I4WCnc8czb32sMWXb+O6V7ekIFMeaY/YCWBpMZT
	 b19F/f36DcvGE/EfvDAEkayYmncbczTeSHBYIB4pnWaxD9Ok3jcTvFIozyMFexVnb+
	 +5GZVHbm8KFFzmMvpdroKlsl9YhEeYvgZW7ahenVk3bEz2Gqjfk5oaICC4sys/BE2r
	 7EkfHckYqwYfw==
Date: Mon, 25 Dec 2023 06:00:38 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 21/23] ALSA: scarlett2: Rename db_scale_scarlett2_gain to
 volume
Message-ID: <d544ec7cc5d5a849da104a5a78b17f61f50657c1.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: SJZY6VJG4ON2KI6NPQE3IMX57VJ6567H
X-Message-ID-Hash: SJZY6VJG4ON2KI6NPQE3IMX57VJ6567H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJZY6VJG4ON2KI6NPQE3IMX57VJ6567H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

db_scale_scarlett2_gain is the TLV for the output volume controls.
Gen 4 has software-controllable input gain controls, so rename this to
db_scale_scarlett2_volume so we can use that name for the inputs.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 186d6d04381c..a9bbad29ad4f 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2417,7 +2417,7 @@ static int scarlett2_volume_ctl_put(struct snd_kcontrol *kctl,
 }
 
 static const DECLARE_TLV_DB_MINMAX(
-	db_scale_scarlett2_gain, -SCARLETT2_VOLUME_BIAS * 100, 0
+	db_scale_scarlett2_volume, -SCARLETT2_VOLUME_BIAS * 100, 0
 );
 
 static const struct snd_kcontrol_new scarlett2_master_volume_ctl = {
@@ -2428,7 +2428,7 @@ static const struct snd_kcontrol_new scarlett2_master_volume_ctl = {
 	.info = scarlett2_volume_ctl_info,
 	.get  = scarlett2_master_volume_ctl_get,
 	.private_value = 0, /* max value */
-	.tlv = { .p = db_scale_scarlett2_gain }
+	.tlv = { .p = db_scale_scarlett2_volume }
 };
 
 static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
@@ -2440,7 +2440,7 @@ static const struct snd_kcontrol_new scarlett2_line_out_volume_ctl = {
 	.get  = scarlett2_volume_ctl_get,
 	.put  = scarlett2_volume_ctl_put,
 	.private_value = 0, /* max value */
-	.tlv = { .p = db_scale_scarlett2_gain }
+	.tlv = { .p = db_scale_scarlett2_volume }
 };
 
 /*** Mute Switch Controls ***/
-- 
2.43.0

