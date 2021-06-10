Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFF3A2739
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 10:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BF6B1761;
	Thu, 10 Jun 2021 10:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BF6B1761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623314278;
	bh=g5ou8WAYQczwW9u6PwwtpN4oKBisV7GoYpyYnSmRbAo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WOrCbEJyy6lrSfTzjom6VxjMh2OIKwUqtR6hFhtfjvhqJdJQfdpU1a0hUlPXET7xb
	 bNXulUwsmWsraT/W03WraXaFW3cGKN91raTNyeCgmVRLwdayOL7dkbPtGw61nXmeNU
	 FuXEsHtpci/+BCbX1An7tN48ScUirQW2vQyZ5iGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17CEEF804AC;
	Thu, 10 Jun 2021 10:36:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E574F804AC; Thu, 10 Jun 2021 10:36:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7F49F80149
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 10:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F49F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=zamaudio-com.20150623.gappssmtp.com
 header.i=@zamaudio-com.20150623.gappssmtp.com header.b="RwxkzriQ"
Received: by mail-pf1-x42f.google.com with SMTP id z26so1007100pfj.5
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 01:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zamaudio-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=41rZJ+AhTp2xiZ6fucMGsT4N4bwy6FKIkQPDtfFr5d4=;
 b=RwxkzriQE3IeXAyVnXULghV87S89l+JHC8cPqngJO4X5bw0eWDmjY302s7FeU7o3Sn
 ll4Oiljh8sWiVU5kGY9C0vFx6NDqObSY/LGPmkJYlQPWbtK+/PZ3txPVnhc4lHu34HgH
 KuZHvFyNW5WFTPw3QdLI+1ZgCl/Um9xNRXd0JbWP9TwXDpIFR6bxn1Xt+V6sTUmusCp2
 qA9sqC+S9Zux4KVIcsOzvnXyNT0KDLkQqg456kEYJzUjZeTpG4eBvCig+KLVoZHy05Q1
 SRgFL+DcKw52dlm61VUcvd4fuHVrq9MiSJE3vdKCeYEwbYLmt0k9sbXv/wxYnlsIz6U2
 yZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=41rZJ+AhTp2xiZ6fucMGsT4N4bwy6FKIkQPDtfFr5d4=;
 b=YgwfZV3jXBjnve18QvLexveE3we1hCgtWH2FsELnuNl5pglIgFCLBluaGaXy9dWnj9
 5O/4oLVgmhv4t/6V2qYxG9t62q8atTtgZrWulZxDSz6WJjeZ5feMskQADoa17Ev4gDT2
 KWC6NxXMNGzUtdTFOrhWUMI1QPQ30yymtGlku5CkdtidFGxR0JbT6zGk8GZFghgkanjQ
 e0dAz3783c463yaMk4xzQbjVyQq3GefZLuNl4n1SQxLTbqO49DBZ7HXBny9bWDJvjNuh
 g1kzQmerMlaHUZ3BTkhtWvWRxqGLsOXVkMDwQJyQRWdf4Yjrd0emgJcnmOux6FECC7sj
 AZEw==
X-Gm-Message-State: AOAM530C6hB1Y8VlHUC4XM2N7cEXbGBYKNMUtPmTnFp8Urwo1qN8Rr5K
 M36G498ru93+ashsgSnJbFfsPKr8rYSwclLL
X-Google-Smtp-Source: ABdhPJx9UTNmykAmf6XGIWObZ48QJn7ddJYmSK02N9xphzLtZfYZljPHqWL5i5tjdpjkjTzT0irgEQ==
X-Received: by 2002:a63:f955:: with SMTP id q21mr3953758pgk.448.1623314165232; 
 Thu, 10 Jun 2021 01:36:05 -0700 (PDT)
Received: from zamx.lan (119-18-22-20.771216.mel.static.aussiebb.net.
 [119.18.22.20])
 by smtp.gmail.com with ESMTPSA id z6sm1856447pfr.99.2021.06.10.01.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:36:04 -0700 (PDT)
From: Damien Zammit <damien@zamaudio.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/1 v2] usb-audio: Add support for Denon DN-X1600
Date: Thu, 10 Jun 2021 18:35:28 +1000
Message-Id: <20210610083528.603942-2-damien@zamaudio.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20210610083528.603942-1-damien@zamaudio.com>
References: <20210610083528.603942-1-damien@zamaudio.com>
Cc: Damien Zammit <damien@zamaudio.com>, tiwai@suse.com
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

This provides support for Denon DN-X1600 hardware mixer.

The device itself supports 44100, 48000 and 96000 (Hz)
sample rates, but switching rates via software is currently not working.
Therefore, this patch hardcodes the sample rate to 48000Hz which
enables all 8 channels to function correctly when the correct
sample rate is selected on the hardware itself.

MIDI also tested and works.

Signed-off-by: Damien Zammit <damien@zamaudio.com>
Tested-by: xalmoxis@gmail.com
---
 sound/usb/clock.c        |  7 +++++
 sound/usb/quirks-table.h | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 0afae839d..52de52288 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -534,6 +534,13 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 		 * rate.
 		 */
 		clock = snd_usb_clock_find_source(chip, fmt, false);
+
+		/* Denon DN-X1600 hardcoded
+		 * Sample rate seems to be set on the hardware itself
+		 */
+		if (chip->usb_id == USB_ID(0x154e, 0x500e))
+			return 0;
+
 		if (clock < 0)
 			return clock;
 	}
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index bdba37d0f..19bb499c1 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3044,6 +3044,76 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 	}
 },
 
+/* Denon DN-X1600 */
+{
+	USB_AUDIO_DEVICE(0x154e, 0x500e),
+	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
+		.vendor_name = "Denon",
+		.product_name = "DN-X1600",
+		.ifnum = QUIRK_ANY_INTERFACE,
+		.type = QUIRK_COMPOSITE,
+		.data = (const struct snd_usb_audio_quirk[]){
+			{
+				.ifnum = 0,
+				.type = QUIRK_IGNORE_INTERFACE,
+			},
+			{
+				.ifnum = 1,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0x0,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ADAPTIVE,
+					.maxpacksize = 0x138,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) {
+						48000
+					}
+				}
+			},
+			{
+				.ifnum = 2,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0x0,
+					.endpoint = 0x85,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						USB_ENDPOINT_SYNC_ADAPTIVE,
+					.maxpacksize = 0x138,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) {
+						48000
+					}
+				}
+			},
+			{
+				.ifnum = 4,
+				.type = QUIRK_MIDI_STANDARD_INTERFACE,
+			},
+			{
+				.ifnum = -1
+			}
+		}
+	}
+},
+
 /* Microsoft XboxLive Headset/Xbox Communicator */
 {
 	USB_DEVICE(0x045e, 0x0283),
-- 
2.13.1

