Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA54323D1
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 18:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333D017E1;
	Mon, 18 Oct 2021 18:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333D017E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634574455;
	bh=d3Xt4qVC6ibpEwuCFWwmnYfrL6qUh3OZIesWoCYhbRI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyWJ6QmCsAt6bXfxu29iuSSmbP0K901WldeXH/pPuj1QIKG7S68LSqsc//OCXyabC
	 bkeaNZ3SKKnxcRi9COw7/X/j+2soZzpWbQ8XRaRoFtw0CI6BBWYHUjJNL9OVjxVlZ0
	 FJ5By81nkDIS8TTi0NM0xKpxjualEKRkzKQgw/cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E07F80253;
	Mon, 18 Oct 2021 18:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DAF3F80224; Mon, 18 Oct 2021 18:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5625F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 18:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5625F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="J0d7sfrB"
Received: by mail-ed1-x533.google.com with SMTP id y12so1696883eda.4
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 09:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+GXMnl/f+l7VoWObM6F65h/sXbJpNsxC091FmXdtq0=;
 b=J0d7sfrBMZ+YIQByNGWLiissvGwaVdxaCHIiw415+QwIgFrMfk5BmypNU8SPidhpL7
 XtCNlkPLdfW3mCMEew2jViNkvTR470L1WIvlcxmemg55iapzs4v1asmUnGiZA+/q1uy4
 TpBgFK7I4eLPH5n328dz5VaFX5pI1fVSm4mFBChv+tYLmCv9lS/lA+I3wi1YPANrUxNg
 1bek+oHhsyEHKZREyXuzPQ2CUekHGxEmw6uFa+bkA1/fmxnNTnBIPs6CUQ0EgTL1JEkh
 9vGrVDD7MM97fvfRZitPiSW1iBt76/AZU6BqNHHKjifVmqcFGxemBF+GIwmiz4ZEMiIh
 47PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+GXMnl/f+l7VoWObM6F65h/sXbJpNsxC091FmXdtq0=;
 b=MjlzXJMpIc8Lv0e3cvkU93a/LOVNaBmxX96nYyNVdBNeTLi+5cvK25nC8UYkygeBtA
 zXnEo9cuwipYRsKYLFtEhSsDIlQGR2lPiTCPmAZfduPFVvTIbqe4AYOD9Ls0MgvVsxPi
 0AVIyydQtUZR2vybbqY7tjMf20qdRWHqg02p1hka6ZZgW1/18L+jO8gNmHZff+B34lTz
 6drv3eaTVioGBUlSM6Z0Zh6swI/Gni2Q3wl+680gP9mUHLNUeNosCDB5gIcqxPFijpaD
 4iGAp+9OeIy7zuj5p5QzTIUMbWLhxqwhlzsChQ7b+J7w1Q4/jQeHlCxdiHqiV4kuSHGH
 n7aA==
X-Gm-Message-State: AOAM531JC5dZToYIc5ysjTeYVQppF6Fj6GKL2GWiqsb1fkPtR6Q6BaYL
 hSal6HwOYHXvkXKaXLc7ZySc6y2HcAI0qg==
X-Google-Smtp-Source: ABdhPJzdsXtZgQGe2Xht99axsdzuNOQpSuSBmGb5tHq4nzt0QMh8API4DDN9hYRGaAqh5YIGYiH1dg==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr45994158edv.384.1634574362265; 
 Mon, 18 Oct 2021 09:26:02 -0700 (PDT)
Received: from fedtop.. ([2.234.154.208])
 by smtp.gmail.com with ESMTPSA id t6sm10320498edj.27.2021.10.18.09.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:26:01 -0700 (PDT)
From: Marco Giunta <giun7a@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ALSA: usb-audio: Fix microphone sound on Jieli webcam.
Date: Mon, 18 Oct 2021 18:25:52 +0200
Message-Id: <20211018162552.12082-1-giun7a@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <s5ha6j8t99c.wl-tiwai@suse.de>
References: <s5ha6j8t99c.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

When a Jieli Technology USB Webcam is connected, the video part works
well, but the mic sound is speeded up. On dmesg there are messages
about different rates from the runtime rates, warnings about volume
resolution and lastly, the log is filled, every 5 seconds, with
retire_capture_urb error messages.

The mic works only when ep packet size is set to wMaxPacketSize (normal
sound and no more retire_capture_urb error messages). Skipping reading
sample rate, fixes the messages about different rates and forcing a volume
resolution, fixes warnings about volume range. I have arbitrarily choosed
the value (16): I read in a comment that there should be no more than 255
levels, so 4096 (max volume) / 16 = 0-255.

Signed-off-by: Marco Giunta <giun7a@gmail.com>
---
 sound/usb/mixer.c  | 7 +++++++
 sound/usb/quirks.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index a2ce535..8e030b1 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1198,6 +1198,13 @@ static void volume_control_quirks(struct usb_mixer_elem_info *cval,
 			cval->res = 1;
 		}
 		break;
+	case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
+		if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
+			usb_audio_info(chip,
+				"set resolution quirk: cval->res = 16\n");
+			cval->res = 16;
+		}
+		break;
 	}
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 889c855..712b699 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1719,6 +1719,11 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
+	case USB_ID(0x1224, 0x2a25):  /* Jieli Technology USB PHY 2.0 */
+		/* mic works only when ep packet size is set to wMaxPacketSize */
+		fp->attributes |= UAC_EP_CS_ATTR_FILL_MAX;
+		break;
+
 	}
 }
 
@@ -1888,6 +1893,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x534d, 0x2109, /* MacroSilicon MS2109 */
 		   QUIRK_FLAG_ALIGN_TRANSFER),
+	DEVICE_FLG(0x1224, 0x2a25, /* Jieli Technology USB PHY 2.0 */
+		   QUIRK_FLAG_GET_SAMPLE_RATE),
 
 	/* Vendor matches */
 	VENDOR_FLG(0x045e, /* MS Lifecam */
-- 
2.31.1

