Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 073E2A71361
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Mar 2025 10:12:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DE9A60202;
	Wed, 26 Mar 2025 10:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DE9A60202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742980328;
	bh=kYCJ1vNNmu4cnX3Zv4N65BeeWCJFNxqzoBhji8GJHME=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D7lQeSs9GV291uYMX9IhfLrBO5P/0+Fjf/j6HgP/rzy/rmPNtcSVt2vuMWPDLacMx
	 AK15Tpfc+9TgjSrd/1HgbrGFv+nwo6HL96a5rrDQCEWZkHYTOIe6iXzyVljjvbQ552
	 d5jii/W9pLjDiC1B8/hlKP28rdlNMIwYmYKqfcK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 498B7F805DA; Wed, 26 Mar 2025 10:11:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2E0F805DA;
	Wed, 26 Mar 2025 10:11:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACC42F80424; Tue, 25 Mar 2025 22:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDFD4F800B6
	for <alsa-devel@alsa-project.org>; Tue, 25 Mar 2025 22:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDFD4F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eV2y2OIW
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7c547932d2eso364993385a.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Mar 2025 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742937493; x=1743542293;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YORNRy4OTXMv3Yhi6ofZ1+35f+Xdz3ifIja4azR4a6Q=;
        b=eV2y2OIWTDs0WBUS7Eo7h38+72uG2j80LFzHKz/BfBqc3L8V6KYHaFMClYp6fYVRJ8
         i7TWiJ2MUUgu/kodgILCX3Z/zJe7AbK5hT0+oNdB51wB9eHc3nJmv13LafX3iaTwoStE
         9z94wG8QnwLunPVHSTL57Zd1JzwKMZmto+lgCMlse8klrU1ZMvJoDhvfLFDf0IBp73aU
         z+dIHTvr4oor7DWRMPckhrZfq8jkenPJD9f9ZVjJWmsNDwvgjFnU8S8GiJ2d0kMCH8SX
         GNCbI4v/bkxLbHxPTCOJtD7dc48haXmdV/t5YXN3elUU8TCNPlTTN78BMkVcHjzU6Thj
         kZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742937493; x=1743542293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YORNRy4OTXMv3Yhi6ofZ1+35f+Xdz3ifIja4azR4a6Q=;
        b=HCnOJm+/UdxFC14Dvly9F6uHi0Nykm2S+48bYTndQs4Lxg340UEVwgCZlPBp3gRtKj
         zwp3I9vwHlbcsjnxcAEPuqTeo1ZqW2I6XdpMeu3nY7Ue9MvF3Oil31YFPAHe7mVciOYt
         MaSNyR1JjniQSLJefOgxvOb70qq0fosdW8Wx9emSam5f7Lk3LU/5JAJFQXvaqzeCkf1P
         avmndmLqs/x+kaMWz3h0VY8C/w3riLVjjSZJ5diHiPlLp/NZ5X/qCsIwtXwbdaaX5J7p
         gdcqTacCPgOOG1laVNkF26cnzZs06p27oBsIPnRRz4RJsKOTe4AdGpQNj3SF458RCeOH
         2ggA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfcSOW4HX7wuXpP2o/xDy1xLlUjVVpAK443bdA/BrE8MPrryxHOYnHDYpmgeP9+Di8NPspP5XO1aBT@alsa-project.org
X-Gm-Message-State: AOJu0YykyU9ouGA8pCTNj5nff86wLuvYOfQx/4/uV97T79vqbDEpxoWV
	+iFBYjTTcptwrGJ4Pw6tP+jSnudAzScJF7trQof5aBGrra9+yGCS
X-Gm-Gg: ASbGncsuPKf4YEdPjdISvLB7hEBiDsHitfHXY8XYg6lDkhCHqN/zcxmc8AQRM95oMrX
	xEp/u0ZHNzfjX9quTygaNzma1cBAzZDFJF539SCEO+HmSf/PDLJjQYcpOkH6iYmb/7DxKLzFqCp
	ovBFEpvpJG+UDASHs8gJljYFsjTgDRic8NchqEfPfSLk7ImQ2tVB1tPyZSL1RP/zc3aKs1pIEVv
	o3bK0N8bxhEO5wF1dGanPDca/n8qFCfQ/Y8HF0xZZYdV6ZDqMe2Viyg/QMtAXdiluOtyu4mDo6P
	5L+SNHv0N03rVCeTiQ1+XRwpbgPEq7in/FCHZb8dw7ng+3Jg/RIb/pyJKL6+QgaLqbOtrj5AF/Q
	ykocTIg8YQgqeSyPO6Ao=
X-Google-Smtp-Source: 
 AGHT+IHr7MEJqWj2AbT6Erl+Fujw+8uJX4cGimN+hCDY0WysNw8kbTVhRB2c+75HV6llOMRnBSRRgg==
X-Received: by 2002:a05:620a:19a3:b0:7c5:4278:d151 with SMTP id
 af79cd13be357-7c5ba211387mr2958874585a.43.1742937492920;
        Tue, 25 Mar 2025 14:18:12 -0700 (PDT)
Received: from localhost.localdomain (c-68-55-107-1.hsd1.mi.comcast.net.
 [68.55.107.1])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c5b9348308sm680685485a.89.2025.03.25.14.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:18:12 -0700 (PDT)
From: Brady Norander <bradynorander@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	u.kleine-koenig@baylibre.com,
	Wu Bo <bo.wu@vivo.com>,
	Brady Norander <bradynorander@gmail.com>
Subject: [PATCH 3/3] ASoC: dwc: always enable/disable i2s irqs
Date: Tue, 25 Mar 2025 17:18:05 -0400
Message-ID: <20250325211805.2099278-1-bradynorander@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bradynorander@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZU4GXR747LM5ZXNPIR3KSJ2XJHIQCBJ4
X-Message-ID-Hash: ZU4GXR747LM5ZXNPIR3KSJ2XJHIQCBJ4
X-Mailman-Approved-At: Wed, 26 Mar 2025 09:11:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZU4GXR747LM5ZXNPIR3KSJ2XJHIQCBJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit a42e988 ("ASoC: dwc: add DMA handshake control") changed the
behavior of the driver to not enable or disable i2s irqs if using DMA. This
breaks platforms such as AMD ACP. Revert to the old behavior by always
enabling and disabling i2s irqs while keeping DMA handshake control.

Fixes: a42e988 ("ASoC: dwc: add DMA handshake control")
Signed-off-by: Brady Norander <bradynorander@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 57b789d7fbed..5b4f20dbf7bb 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -199,12 +199,10 @@ static void i2s_start(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 1);
 
-	/* I2S needs to enable IRQ to make a handshake with DMAC on the JH7110 SoC */
-	if (dev->use_pio || dev->is_jh7110)
-		i2s_enable_irqs(dev, substream->stream, config->chan_nr);
-	else
+	if (!(dev->use_pio || dev->is_jh7110))
 		i2s_enable_dma(dev, substream->stream);
 
+	i2s_enable_irqs(dev, substream->stream, config->chan_nr);
 	i2s_write_reg(dev->i2s_base, CER, 1);
 }
 
@@ -218,11 +216,12 @@ static void i2s_stop(struct dw_i2s_dev *dev,
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 0);
 
-	if (dev->use_pio || dev->is_jh7110)
-		i2s_disable_irqs(dev, substream->stream, 8);
-	else
+	if (!(dev->use_pio || dev->is_jh7110))
 		i2s_disable_dma(dev, substream->stream);
 
+	i2s_disable_irqs(dev, substream->stream, 8);
+
+
 	if (!dev->active) {
 		i2s_write_reg(dev->i2s_base, CER, 0);
 		i2s_write_reg(dev->i2s_base, IER, 0);
-- 
2.49.0

