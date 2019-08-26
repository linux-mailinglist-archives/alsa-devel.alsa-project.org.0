Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A289A1C95
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 144081687;
	Thu, 29 Aug 2019 16:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 144081687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088501;
	bh=MeZqswxY8Xh/ilhOjXukyTlwc/GQRTKA4ibRRSrOAtM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e039CyewzM/1rJ115fZWJWBF2M336rXcvVuU9a1xyNuMCqCiB9RIcNvDrdmib9F/1
	 muMo63KYobzwa+8nozxejzJKQzz3+bqySOPsmKOSjnl00atoYqTLcIssbvUYfyjQp1
	 9wX7P/4b9O+3HTh2jo1kOn8LovgcMizZkCQ/KC6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94E08F896C7;
	Wed, 28 Aug 2019 07:58:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48574F80362; Mon, 26 Aug 2019 18:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C63F8F8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 18:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63F8F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=netforce.ua header.i=@netforce.ua
 header.b="FNGfQGkz"
Received: by mail-lj1-x244.google.com with SMTP id x4so15616784ljj.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netforce.ua; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlZtTdio1Y6VVz0EfywAkxBeMP9JChkSpHZKD+louec=;
 b=FNGfQGkzzUQS1d1t0+p6lBcGEh/BEgDQpEU/6aO5W2NUJ6rKeUb9ErEUoQ6Eb2gjjb
 2HMc/gN68B0VMh1ZT08BkF6lumorqI5v6RZZpVEDkSOj5jxTpxAUxGwyQMGHlm0/qYm5
 4EPVTbWYaJCh+l4yvT3m6u1g0+OD2v2dges2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SlZtTdio1Y6VVz0EfywAkxBeMP9JChkSpHZKD+louec=;
 b=MyI+ufq81LsrXHK60cTdwg+8LnJG8Mt3VVilBTXhqj50R5KbE0mjuXwTmNgJJSrUVk
 amkZWMpmX4A9qoYSGV8sz9I1NsX2n7sNydKdnbZ2Hf+s3pBGJEeYNOMw6BAbvqnRKtN9
 nnHj838O9QOTNbai4yVtx/ty1AQ7erzZfmQAVrh+7eDfIVYXPR5hLVSR2Z+uS19wlNiq
 riY9LcGSjEm+6JSiFnMU0Cd6BlPRnNFBp4XMopE8FvlhK/tifKCwIzzQlWG6Q3VE994a
 0xN6dvQqMUgUF1Ap4996JLXJ38+sUtA3R1vOQ/EMjPAZ5iP9YAwVR5oUC0yYnc2Csati
 Y5xA==
X-Gm-Message-State: APjAAAXDAqp2wNp9DOfpnWJP6tBPTM4/780hbz7jEnNMqtjHiXT9jLi7
 og9jC9F8XLJW4XG54dTq6ER8Vw==
X-Google-Smtp-Source: APXvYqxlTonBs8rkrpFa1ptcl0dgRDel7sYOE1vswwwW/SGZR/d/6ozTyUsG0N9t9ONO6p4fPlQXNg==
X-Received: by 2002:a2e:8455:: with SMTP id u21mr10702408ljh.20.1566835799242; 
 Mon, 26 Aug 2019 09:09:59 -0700 (PDT)
Received: from rhea.localdomain ([37.46.255.109])
 by smtp.gmail.com with ESMTPSA id s4sm1327826lfd.77.2019.08.26.09.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 09:09:58 -0700 (PDT)
From: ilya.pshonkin@netforce.ua
To: ilya.pshonkin@netforce.ua
Date: Mon, 26 Aug 2019 19:09:52 +0300
Message-Id: <20190826160953.19402-1-ilya.pshonkin@netforce.ua>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:24 +0200
Cc: Jussi Laako <jussi@sonarnerd.net>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manuel Reinhardt <manuel.rhdt@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>,
 Sudokamikaze <sudokamikaze@protonmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Add Hiby R3 to quirks for
	native DSD support
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

From: Sudokamikaze <sudokamikaze@protonmail.com>

This patch adds quirk VID/PID IDs for Hiby R3 portable DSD player DSD support

Signed-off-by: Sudokamikaze <sudokamikaze@protonmail.com>
---
 sound/usb/quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 78858918cbc1..f90418149e4e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1588,6 +1588,12 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 		if (fp->altsetting == 2)
 			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
 		break;
+	
+	/* ESS Sabre based USB DACs */
+	case USB_ID(0xc502, 0x0051): /* Hiby R3 */
+		if (fp->altsetting == 4)
+			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
+		break;
 
 	case USB_ID(0x0d8c, 0x0316): /* Hegel HD12 DSD */
 	case USB_ID(0x10cb, 0x0103): /* The Bit Opus #3; with fp->dsd_raw */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
