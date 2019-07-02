Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9031C5C668
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 02:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E516168B;
	Tue,  2 Jul 2019 02:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E516168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562028449;
	bh=syhI+dS/GcJxlwlgxeiLm74gJwn44ro1YNAomE7fJlU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YoBH6mSNVHfqAS40uu7N3tujkH4x5D0BOWsxMU/lahYgrbLoJIOb7sCQfjfq0s4x6
	 KJ8O2no2uDVMlnKPrXaFUEHznS2JqSVWjPqWMhvGOnAkQv5wYv+nZTqSmMVJ0TyJ7o
	 tsarCT7tvQr+2tYGiEfKnewKMoUGT2ShU6ZpjQcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35BB8F80090;
	Tue,  2 Jul 2019 02:45:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 650DDF80096; Tue,  2 Jul 2019 02:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 345AAF80058
 for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2019 02:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 345AAF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CyahivUA"
Received: by mail-ed1-x544.google.com with SMTP id w13so25657815eds.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Jul 2019 17:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9XoDf2UqqqVQm4eFJ4Eg/g7JLrPNXPmegTV8b0b65c=;
 b=CyahivUA8ly8coHmyiKLvnegSPHmgWJ4cnXAJWYEWTWp1DomBmBPid5QNe434kTCP9
 54k+ymolVc/Swe523+LJJjmPKDK8PsUpW8kGdxgwOvVKraJ1hKZgPt2epINFImSRZcJG
 kmiLcQs+Td5++2Gif2HP3ohW55ZCSrQGHiimvLIbIg7Q34shUxX8lkDQBax7yki52p85
 ValukBaG5zNBarrQnU9BSVPSPa/xLJup9dCtNq+CkbduGw03xj8hTnSXRNmeIgZNaNpd
 YA3uMoMDqtLn7fvyDlu5PdXxlgjMZ74PFrot9pepql5VBZBLi1KKZK2rXsHlu9kQG8l8
 BduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9XoDf2UqqqVQm4eFJ4Eg/g7JLrPNXPmegTV8b0b65c=;
 b=RFl4LFTxa3BvgGlDxTyGvU5IKnTNYnEfhp3fSNr7d5a7FARxuZCloKZca9Z8+m9/2L
 mmtkf1o5uGDIUgXJXbVydhW+vNlf3YhHnilbbGnHTkVYUG9RxVi5GMtYJDs0LVZ0ULsS
 yeFDROLEC6etqUVO0lZ0kITHISOci6pORTYFVS2qXreNIUE/Kdr5w9RQaG+V7SgFqyoV
 I/xzB5sRGvmunppZm+clTe9HSi0thF8KoGMI8WRLw/8lsEJqj17d/7bu/mgSf8RRXuII
 Noy0BYZ28DeBkYq7lBN8AYhXxwniw3oBxRZLlk63FPPoYyW5yqNb4qxnlobMc7+UAwU6
 r8gQ==
X-Gm-Message-State: APjAAAU6EzU+PG3zhSPNGcGxb9yskFwuiqCjPRO5tWYUO2c/sDDwtfGU
 EJBJaQpT04VrWUI04Z0dvLmyrU3MxgQ=
X-Google-Smtp-Source: APXvYqyjNPdDcoNho/lEzrPtx9sDLllkBmP8SkzFS2xVXN06cJczrhuAw8oEMX4i3wlC+ewUvTuvdQ==
X-Received: by 2002:a17:906:3497:: with SMTP id
 g23mr26064074ejb.70.1562028338994; 
 Mon, 01 Jul 2019 17:45:38 -0700 (PDT)
Received: from localhost.localdomain ([89.100.119.28])
 by smtp.gmail.com with ESMTPSA id x4sm4256392eda.22.2019.07.01.17.45.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 17:45:38 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: alsa-devel@alsa-project.org
Date: Tue,  2 Jul 2019 01:43:14 +0100
Message-Id: <20190702004439.30131-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Jussi Laako <jussi@sonarnerd.net>, info@jensverwiebe.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Richard Fontana <rfontana@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Nicola Lunghi <nick83ola@gmail.com>,
 Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix Line6 Helix audio format
	rates
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Line6 Helix and HX stomp don't support retrieving
the number of clock sample rate.

Add a quirk to return the default value of 48Khz.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 sound/usb/format.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index c02b51a82775..05442f6ada62 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -313,10 +313,32 @@ static int parse_audio_format_rates_v2v3(struct snd_usb_audio *chip,
 			      tmp, sizeof(tmp));
 
 	if (ret < 0) {
-		dev_err(&dev->dev,
-			"%s(): unable to retrieve number of sample rates (clock %d)\n",
+		switch (chip->usb_id) {
+		/* LINE 6 HX pedals don't support getting the clock sample rate.
+		 * Set the framerate to 48khz by default
+		 */
+		case USB_ID(0x0E41, 0x4244): /* HELIX */
+		case USB_ID(0x0E41, 0x4246): /* HX STOMP */
+			dev_warn(&dev->dev,
+				"%s(): line6 helix: unable to retrieve number of sample rates. Set it to default value (clock %d).\n",
 				__func__, clock);
-		goto err;
+			fp->nr_rates = 1;
+			fp->rate_min = 48000;
+			fp->rate_max = 48000;
+			fp->rates = SNDRV_PCM_RATE_48000;
+			fp->rate_table = kmalloc(sizeof(int), GFP_KERNEL);
+			if (!fp->rate_table) {
+				ret = -ENOMEM;
+				goto err_free;
+			}
+			fp->rate_table[0] = 48000;
+			return 0;
+		default:
+			dev_err(&dev->dev,
+				"%s(): unable to retrieve number of sample rates (clock %d)\n",
+					__func__, clock);
+			goto err;
+		}
 	}
 
 	nr_triplets = (tmp[1] << 8) | tmp[0];
-- 
2.19.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
