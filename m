Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E8E432EE2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 09:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A6A16A4;
	Tue, 19 Oct 2021 09:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A6A16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634627051;
	bh=G+t5LJI3IOxG+G65LhLQxfoYnJ2tziLbtjlgdiI9DCs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrwxkpGFLpr+sj6hEpnbNLP/GtdiPPyd+2M1iwNani99wr4wbeAfNEP9PUXFsbwqi
	 Qx4WtX3OGxfBKcHmlyG91TL6uQxFxxO1j2rJwf6gUwTRSQiqZtbxJmRgcfdezEM1Y6
	 olhYOHUj8GPSIsUznE0f5sd1PFB4tINMFkpqSjHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAAEF8026C;
	Tue, 19 Oct 2021 09:02:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53A2F80256; Tue, 19 Oct 2021 09:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218E5F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 09:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218E5F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aYFyxHGx"
Received: by mail-ed1-x52b.google.com with SMTP id d3so9086487edp.3
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dmx2xWrG7wnynHjLfu0nc2ewbuO5Nu0MgksocgpxxNs=;
 b=aYFyxHGxqajg95gU9KUtgpH51fJXVkbozqshqQ+oAsCCF0qybXvK2+9H8MVAhHwhU6
 qFTB3S6GbowN/7pegFn5a6/zIxN3I5nSzTFWMb6/hTmvnCXCpbgE+ojVEO0inLzBsQMq
 nmmARcU9tOjbcz9jFRFUVMR0soQ98LMeux1+idqZfY532JyoA0GarcnNcaiM5Mhf8Flc
 pqzT4dPzQ6RlVjFdkNK/edrKEyKbrso5I0Pp4BKYpsNlnm/jpFKOj3oRg6rwpoLpyt1J
 r4ebNIq9PhMi1RiBgIvkkUEFgn9DnoVCw2oCE1Jo7JVYeLwjIMwTritmAjoNOEnOeS35
 4RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dmx2xWrG7wnynHjLfu0nc2ewbuO5Nu0MgksocgpxxNs=;
 b=bcpTsR7Ac4ZXsXgDdukbgEJosEijq8kNi5g+Gs8qFlpdOuZi2mTmt5do+QdwOiUKF1
 Ac6ckWUoLsvso76br+NeQNWogfq+p9R1qc8EnAtfJHLBiba4m9iF81Y8z+DHbTD3hUB2
 8/Ta2gW4xaNVhj6NC8e7CiyDxj1iVVejcQVCq5eEoyK/ljv5pusvduQmD0/YNR9wPvkq
 5KwJmZ3smEnEIftbpYxGvWT9uvIZKcz3uiBL1CjCDJxDjl5GDqf/A0hbYkTfaOF475dr
 0JX1zk1Et7Pk2889G5KOjadIqb5Dm/G/tD7RHyH+skjP9IlJ0thLy81KKqijPWjipg0h
 Ro6g==
X-Gm-Message-State: AOAM530W8nRHrwubJ1FpzYXX7L6JExK8HwwadH+Z2UNN7eSa1YEN+dX2
 6S0bBsQiXHRX/6cQgH+JxlWKFCUIMNAhsg==
X-Google-Smtp-Source: ABdhPJwAZD+OXoncKSXUq/f838BXV6jU4UgT5+BSTcmhBMnnUyW+TOC9BLb1UMc62rYD3maKylLftQ==
X-Received: by 2002:a17:906:ce45:: with SMTP id
 se5mr35669778ejb.386.1634626961129; 
 Tue, 19 Oct 2021 00:02:41 -0700 (PDT)
Received: from fedtop.. ([2.234.154.208])
 by smtp.gmail.com with ESMTPSA id s12sm3372845edj.82.2021.10.19.00.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:02:40 -0700 (PDT)
From: Marco Giunta <giun7a@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: usb-audio: Fix microphone sound on Jieli webcam.
Date: Tue, 19 Oct 2021 09:02:33 +0200
Message-Id: <20211019070233.6539-1-giun7a@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <s5h4k9d4kds.wl-tiwai@suse.de>
References: <s5h4k9d4kds.wl-tiwai@suse.de>
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

Could you apply this patch also to the stable tree ?

Thanks,
  Marco


 sound/usb/mixer.c  | 7 +++++++
 sound/usb/quirks.c | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 9b713b4a5..20ef12dd8 100644
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
index 326d1b0ea..2263e43fd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1534,6 +1534,7 @@ bool snd_usb_get_sample_rate_quirk(struct snd_usb_audio *chip)
 	case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
 	case USB_ID(0x413c, 0xa506): /* Dell AE515 sound bar */
 	case USB_ID(0x046d, 0x084c): /* Logitech ConferenceCam Connect */
+	case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
 		return true;
 	}
 
@@ -1874,6 +1875,11 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
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
 
-- 
2.31.1

