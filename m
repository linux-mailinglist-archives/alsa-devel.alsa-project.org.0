Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF727B3F01
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D231FEE7;
	Sat, 30 Sep 2023 10:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D231FEE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061377;
	bh=aYsMe0JrxhmaaEOMwsTrnro0JHK8XQpDDJBPUlbF5KY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i9dT6vHUE+4Zp4UDJvj8WCjQXpOkCmbhoh0a5We0Ban5tst9vcM3dfpyrhk+oU+d0
	 YYyYBQNJcPZKXyGlwql8Z+/rWTNzixBbAqB6V4dwKsq88hOOrOgA576xi5UAkEdtjK
	 XYst9psn9ZjXCA85X8PzwDktrkogemqBdH51IZUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4482EF80638; Sat, 30 Sep 2023 10:07:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 842FDF80632;
	Sat, 30 Sep 2023 10:06:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B38F8016A; Wed, 27 Sep 2023 13:36:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85152F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 13:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85152F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DlQvJySj
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40646537450so1922405e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695814563; x=1696419363;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9u/sPXh8DGIJEKl6VxSqJ4Tdbh2OLQqwRTjgDTG9r3k=;
        b=DlQvJySjBlMXh0HwRw5CFQEuxQDlB7dIskGx2+E93J9ktcz3rdhY/FekcRQq/MkeDv
         hfU/oQ2P128Ujs2HV/hYhjMpjbkohIBST2HMbu52FwSvjd78894COmPKtQ/QjgQ2ttbu
         A385A2e8uuldIGHFl1TglAbS+rvCxcqljMiTyvYSW68H4JObZpkhJeqZ3CHKL68D3YuO
         dklBKr2DDIH51JoDN3ExTX0pHg4uryViTIO/19+xHK+VqA5pAgw8Ah6+fiENV0Odyv0B
         T5KfvafgLuEI+R+G9Mv0yc9sRTBgbe3RvigyaVdG7ombkyn+99Tprb17JwKu6vPOq7wt
         aU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695814563; x=1696419363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9u/sPXh8DGIJEKl6VxSqJ4Tdbh2OLQqwRTjgDTG9r3k=;
        b=Js+FQ2pItEKyY75uL5JCd1MJS97YjO2EUvTwC/sN5NPkDxfiDbbq9jBO/ttEyxSzub
         +xuKv6CVukmBaM1EU92j/Psha+0AjZ+wZrl3hEJHskWF36a7TosekPFM2sxZwGXWkN8v
         ECo3g1C/9fdtPQ9ZrGO4duBCHIr97CRITSAKS77dvGFDfo713Jx+QuokdGedIJYYAoz2
         3enrOPUycUQl+LzSCME5hXUD0Hyqa8uPBb+dLqQvCMY2FZzev18yBBLBr411zGU+qXYx
         gI/hVDYXMALwz3xMGIkcxrqAB4X6kXVu52tVJ0ubILySOIwP3PZ97ynx2KJRLJtt2Wd2
         sKig==
X-Gm-Message-State: AOJu0Yw0m7yiaYlgaskJIzwhsuvOSrZ6YE/2FzrYbwvDgmIQoBNBMSGu
	rm6HytSjUHMUHIVybPIaN5ECvd59UiM=
X-Google-Smtp-Source: 
 AGHT+IEfvU1GXChFDRog9lEAtxgm1qp3JABNWWobi+ZBqf/8VcRnFCbocOWveeX4gKCfgF3bMJ43JQ==
X-Received: by 2002:a05:600c:4f48:b0:401:c07f:72bd with SMTP id
 m8-20020a05600c4f4800b00401c07f72bdmr1758417wmq.4.1695814563310;
        Wed, 27 Sep 2023 04:36:03 -0700 (PDT)
Received: from ivan-HLYL-WXX9.guest.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a5d5343000000b0030ae53550f5sm16792874wrv.51.2023.09.27.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:36:02 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: aloop: Add control element for getting the access
 mode
Date: Wed, 27 Sep 2023 12:35:55 +0100
Message-Id: <20230927113555.14877-2-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
References: <20230927113555.14877-1-ivan.orlov0322@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GULKKUMRNHJQJ3SCGC2YFGVCLQTHCSIN
X-Message-ID-Hash: GULKKUMRNHJQJ3SCGC2YFGVCLQTHCSIN
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:06:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GULKKUMRNHJQJ3SCGC2YFGVCLQTHCSIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new control element 'PCM Slave Access Mode' which shows the access
mode (interleaved/non-interleaved) for the PCM playing device. Add
corresponding control change notification calls.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 sound/drivers/aloop.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index ab116b1fed96..e87dc67f33c6 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -119,11 +119,13 @@ struct loopback_setup {
 	unsigned int rate_shift;
 	snd_pcm_format_t format;
 	unsigned int rate;
+	snd_pcm_access_t access;
 	unsigned int channels;
 	struct snd_ctl_elem_id active_id;
 	struct snd_ctl_elem_id format_id;
 	struct snd_ctl_elem_id rate_id;
 	struct snd_ctl_elem_id channels_id;
+	struct snd_ctl_elem_id access_id;
 };
 
 struct loopback {
@@ -367,6 +369,11 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 							&setup->channels_id);
 			setup->channels = runtime->channels;
 		}
+		if (setup->access != runtime->access) {
+			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
+							&setup->access_id);
+			setup->access = runtime->access;
+		}
 	}
 	return 0;
 }
@@ -1520,6 +1527,30 @@ static int loopback_channels_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int loopback_access_info(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_info *uinfo)
+{
+	const char * const texts[] = {"Interleaved", "Non-interleaved"};
+
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
+}
+
+static int loopback_access_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct loopback *loopback = snd_kcontrol_chip(kcontrol);
+	snd_pcm_access_t access;
+
+	mutex_lock(&loopback->cable_lock);
+	access = loopback->setup[kcontrol->id.subdevice][kcontrol->id.device].access;
+
+	ucontrol->value.enumerated.item[0] = access == SNDRV_PCM_ACCESS_RW_NONINTERLEAVED ||
+					     access == SNDRV_PCM_ACCESS_MMAP_NONINTERLEAVED;
+
+	mutex_unlock(&loopback->cable_lock);
+	return 0;
+}
+
 static const struct snd_kcontrol_new loopback_controls[]  = {
 {
 	.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
@@ -1566,7 +1597,15 @@ static const struct snd_kcontrol_new loopback_controls[]  = {
 	.name =         "PCM Slave Channels",
 	.info =         loopback_channels_info,
 	.get =          loopback_channels_get
-}
+},
+#define ACCESS_IDX 6
+{
+	.access =	SNDRV_CTL_ELEM_ACCESS_READ,
+	.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
+	.name =		"PCM Slave Access Mode",
+	.info =		loopback_access_info,
+	.get =		loopback_access_get,
+},
 };
 
 static int loopback_mixer_new(struct loopback *loopback, int notify)
@@ -1587,6 +1626,7 @@ static int loopback_mixer_new(struct loopback *loopback, int notify)
 			setup->notify = notify;
 			setup->rate_shift = NO_PITCH;
 			setup->format = SNDRV_PCM_FORMAT_S16_LE;
+			setup->access = SNDRV_PCM_ACCESS_RW_INTERLEAVED;
 			setup->rate = 48000;
 			setup->channels = 2;
 			for (idx = 0; idx < ARRAY_SIZE(loopback_controls);
@@ -1618,6 +1658,9 @@ static int loopback_mixer_new(struct loopback *loopback, int notify)
 				case CHANNELS_IDX:
 					setup->channels_id = kctl->id;
 					break;
+				case ACCESS_IDX:
+					setup->access_id = kctl->id;
+					break;
 				default:
 					break;
 				}
-- 
2.34.1

