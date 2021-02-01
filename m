Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC5030D3C4
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE33178E;
	Wed,  3 Feb 2021 08:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE33178E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612335952;
	bh=JN/FfOWwhlq4t4TuS0OT/ARk+kKBm6r9xBBzzEZipHM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=usRUrVDGJj2UXEqjiUfQxYpUdrZJQmGpdyw3U109FrpukLP7SdbYBVnekZTPCzZb1
	 AhAgxO1UDmSlQQDJNwOYHRiUeModlOgyRvxwEZkdQ5/Yx7gLlcId/6U2sOpt1L3sUg
	 72+Mpkqfw1ZDY9Oj/7K0eJwIPPdxR4hQy8JPHONw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BC5F80425;
	Wed,  3 Feb 2021 08:01:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96EFDF80153; Mon,  1 Feb 2021 15:29:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE02F800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 15:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE02F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IhvwKfAh"
Received: by mail-ej1-x631.google.com with SMTP id a9so6291855ejr.2
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 06:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=lR2dB+UJkwbRQf/mMTm4+iJ1loSQESEjMwNubu2y7xU=;
 b=IhvwKfAhZtUoenS84F7H+JErm55fJJbmtI6P667IdWWte3T1fz7O02fPedb8w17PSV
 B9NUZOTEFQ7oGeLMLbz9wTNPetbeWhFKVnH6TDfLjKkbgVqAB56wnrWGZmgfaNoWmlak
 oA5XjA9Kizzws2IHoPP1eD1XwIdr2kB7wBv8iEH7waWwkNj7f5/yAkyieVVyeNcPh4tK
 Ss2lmgBmXZ0rlR0AlvcSrp0jc9iIaeJ7xiE7eoRbuFSIq9oHt1sFwCs3rzQ0OlfBGuSG
 qs1T+SHFydseqQtj4c74xI1wJ8VdikTfmDOttkqHuHcKRDkG2A0aS8xtWXJpXLdVUo/U
 UxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lR2dB+UJkwbRQf/mMTm4+iJ1loSQESEjMwNubu2y7xU=;
 b=b+w3sMR/+BsAklv1znaOTK+4dd6n88ljBIAoZZr6i42hKFU0d+MJishz+25ko7VQo1
 NfVSAIBfMV3bCDT44X45eMYmLh5zo3v6tILYla9joeZ2/T5WL2ZKMkqonP3uT02YXZF8
 SDZOfPqrO6u7l8gRYYXLS0R4yUla87dqV3FmZyB4SkZFIQOGLF0vOo1gVtmEhQ/i0dsG
 ZodT4qhuZc0ZtNtEJqc3JRj0qBqjk4AOxERnEPCsc+6Yr+KYR1J+Lh1q+EsGDthJZqec
 kLVjroPEmPpgO+63re4V8kAW2xzkrFK2MstvF2oAzLpV2QxNAE7+xrIfD1Olqla+aNkc
 J5Ug==
X-Gm-Message-State: AOAM5301rfL7HWEOt2Py3ciuBwtVt+13EuTLZVg+WFyANKtMUXwIlTEa
 PMwdcSoVwrI7MXrsx/jerGY1O31TyIT1EiHL
X-Google-Smtp-Source: ABdhPJwmJZBwuqza22H4EJ5QnhGhcO/nEO1xTCDwWrXX4qXeeY04FNSEsJO5HGkQJYtMCcBdoIIhRQ==
X-Received: by 2002:a17:906:86d7:: with SMTP id
 j23mr18246585ejy.5.1612189734476; 
 Mon, 01 Feb 2021 06:28:54 -0800 (PST)
Received: from ?IPv6:2a02:8388:1987:9380:198d:5d8b:d8f:7b56?
 (2a02-8388-1987-9380-198d-5d8b-0d8f-7b56.cable.dynamic.v6.surfer.at.
 [2a02:8388:1987:9380:198d:5d8b:d8f:7b56])
 by smtp.gmail.com with ESMTPSA id g22sm2156781ejw.31.2021.02.01.06.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 06:28:53 -0800 (PST)
Subject: Re: [PATCH] sound: pci/rme9652 - implement and expose controls for
 output
To: Takashi Iwai <tiwai@suse.de>
References: <3cd2889a-e71a-aa3f-e79a-d11a4833c581@gmail.com>
 <s5h35ygji0q.wl-tiwai@suse.de>
 <730e7f87-6e6c-77cf-c6cf-2baf23bd1f4c@gmail.com>
 <s5heehzj3ox.wl-tiwai@suse.de>
From: fassl <superfassl@gmail.com>
Message-ID: <95cb3117-e85a-51a6-c2ce-bf736e70fc4c@gmail.com>
Date: Mon, 1 Feb 2021 15:28:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <s5heehzj3ox.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: alsa-devel@alsa-project.org, Allen Pais <allen.lkml@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Colin Ian King <colin.king@canonical.com>,
 Romain Perier <romain.perier@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From a9072f701f945ba00c42f612e85830395d81450d Mon Sep 17 00:00:00 2001
From: Jasmin Fazlic <superfassl@gmail.com>
Date: Sun, 31 Jan 2021 22:17:22 +0100
Subject: [PATCH] sound: pci/rme9652 - hardware output loopback

Output loopback is a feature where you can record what you hear.
The HDSP series of the RME interfaces provides this functionality
at the hardware level and this patch exposes controls to enable or
disable it per output (playback) channel.

This probably works on other cards but due to a lack of hardware
it is only tested and enabled for the HDSP9632 card with this patch.

Should this patch be accepted a separate patch will be posted to
https://github.com/alsa-project/alsa-tools/tree/master/hdspmixer
which adds "LPBK" buttons to each ouput in the playback strip for
the user to be able to control this feature from the user land.
Users from Windows tool TotalMixFX should be familiar with this.

Signed-off-by: Jasmin Fazlic <superfassl@gmail.com>
---
 sound/pci/rme9652/hdsp.c | 74 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index cea53a878c36..6d9029333a12 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -469,6 +469,7 @@ struct hdsp {
 	unsigned char	      qs_out_channels;
 	unsigned char         ds_out_channels;
 	unsigned char         ss_out_channels;
+	u32                   io_loopback;          /* output loopback channel states*/
 
 	struct snd_dma_buffer capture_dma_buf;
 	struct snd_dma_buffer playback_dma_buf;
@@ -3253,6 +3254,60 @@ static const struct snd_kcontrol_new snd_hdsp_96xx_aeb =
 			HDSP_AnalogExtensionBoard);
 static struct snd_kcontrol_new snd_hdsp_adat_sync_check = HDSP_ADAT_SYNC_CHECK;
 
+
+static bool hdsp_loopback_get(struct hdsp *const hdsp, const u8 channel)
+{
+	return hdsp->io_loopback & (1 << channel);
+}
+
+static int hdsp_loopback_set(struct hdsp *const hdsp, const u8 channel, const bool enable)
+{
+	if (hdsp_loopback_get(hdsp, channel) == enable)
+		return 0;
+
+	hdsp->io_loopback ^= (1 << channel);
+
+	hdsp_write(hdsp, HDSP_inputEnable + (4 * (hdsp->max_channels + channel)), enable);
+
+	return 1;
+}
+
+static int snd_hdsp_loopback_get(struct snd_kcontrol *const kcontrol,
+				 struct snd_ctl_elem_value *const ucontrol)
+{
+	struct hdsp *const hdsp = snd_kcontrol_chip(kcontrol);
+	const u8 channel = snd_ctl_get_ioff(kcontrol, &ucontrol->id);
+
+	if (channel >= hdsp->max_channels)
+		return -ENOENT;
+
+	ucontrol->value.integer.value[0] = hdsp_loopback_get(hdsp, channel);
+
+	return 0;
+}
+
+static int snd_hdsp_loopback_put(struct snd_kcontrol *const kcontrol,
+				 struct snd_ctl_elem_value *const ucontrol)
+{
+	struct hdsp *const hdsp = snd_kcontrol_chip(kcontrol);
+	const u8 channel = snd_ctl_get_ioff(kcontrol, &ucontrol->id);
+	const bool enable = ucontrol->value.integer.value[0] & 1;
+
+	if (channel >= hdsp->max_channels)
+		return -ENOENT;
+
+	return hdsp_loopback_set(hdsp, channel, enable);
+}
+
+static struct snd_kcontrol_new snd_hdsp_loopback_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_HWDEP,
+	.name = "Output Loopback",
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.info = snd_ctl_boolean_mono_info,
+	.get = snd_hdsp_loopback_get,
+	.put = snd_hdsp_loopback_put
+};
+
 static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 {
 	unsigned int idx;
@@ -3297,6 +3352,17 @@ static int snd_hdsp_create_controls(struct snd_card *card, struct hdsp *hdsp)
 		}
 	}
 
+	/* Output loopback controls for H9632 cards */
+	if (hdsp->io_type == H9632) {
+		snd_hdsp_loopback_control.count = hdsp->max_channels;
+		kctl = snd_ctl_new1(&snd_hdsp_loopback_control, hdsp);
+		if (kctl == NULL)
+			return -ENOMEM;
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
+			return err;
+	}
+
 	/* AEB control for H96xx card */
 	if (hdsp->io_type == H9632 || hdsp->io_type == H9652) {
 		if ((err = snd_ctl_add(card, kctl = snd_ctl_new1(&snd_hdsp_96xx_aeb, hdsp))) < 0)
@@ -4956,7 +5022,7 @@ static int snd_hdsp_enable_io (struct hdsp *hdsp)
 
 static void snd_hdsp_initialize_channels(struct hdsp *hdsp)
 {
-	int status, aebi_channels, aebo_channels;
+	int status, aebi_channels, aebo_channels, i;
 
 	switch (hdsp->io_type) {
 	case Digiface:
@@ -4983,6 +5049,12 @@ static void snd_hdsp_initialize_channels(struct hdsp *hdsp)
 		hdsp->ss_out_channels = H9632_SS_CHANNELS+aebo_channels;
 		hdsp->ds_out_channels = H9632_DS_CHANNELS+aebo_channels;
 		hdsp->qs_out_channels = H9632_QS_CHANNELS+aebo_channels;
+		/* Disable loopback of output channels, as the set function
+		 * only sets on a change we fake all bits (channels) as enabled.
+		 */
+		hdsp->io_loopback = 0xffffffff;
+		for (i = 0; i < hdsp->max_channels; ++i)
+			hdsp_loopback_set(hdsp, i, false);
 		break;
 
 	case Multiface:
-- 
2.27.0


