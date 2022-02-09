Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2674B012D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 00:26:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97353183E;
	Thu, 10 Feb 2022 00:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97353183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644449198;
	bh=2T0B/4+CWQcgElnw6q6vnMifPHkDU+HH1hBWkc7v/yY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rUcIRKwUF/fqpjfeX1OcZJPxqqZwFP/ZfRYiUFCQV4vzw4uRuI/EelMRk+KBdos5v
	 lXDLww7tLoOIgwR888dNb9U3yTcVX/KVVYPv/UPd/GnP3grcpGwDjP1n+uWXsFbZ7u
	 DsPaiHQDV51afBnXTuJ2wCumUzhjzwJzI+IQa5kI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C8ABF8016B;
	Thu, 10 Feb 2022 00:25:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E26E5F800A7; Thu, 10 Feb 2022 00:25:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 033E1F800F0
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 00:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033E1F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mJUGs196"
Received: by mail-pj1-x102d.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso5206030pjd.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Feb 2022 15:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuDyqJtQkOZWq7GCqSKtM5Nekpy0WS9Wr09B0b+ZHEk=;
 b=mJUGs196QE4e+93P3XrLjGhPpdg6y+RWphSnf3Fr4PTAuc+HnrZgbhtvd06SXDn+gS
 GCqMgHjSLUhtpWCMI8WWXfqRS5edno6KEmX84YaoGfeDhvuzbjw7RdE7vhZFdoNXuEmA
 NEk2vKgifQiIGBMIiEdCXmVq6VOHYD3mph42Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cuDyqJtQkOZWq7GCqSKtM5Nekpy0WS9Wr09B0b+ZHEk=;
 b=GRU2GMRMd0qNI/bGdil1RxDoIxA/GpAHkm9nsPtPD7fMDZzpBycsBdkkPbMus5cDpU
 YiIad4j1GMd7TKxwJUIIHhehrv4R4PBA26SmJdTojlEyb98XryuDFF9D48pUnISnhBc8
 vM5K3Ph6c/QD20aa8N1KVo0dBgdQb5SixPgsEytsVVCwfE6DukjxAsvBcLfsEuldwWvl
 sxeCAkbr+WR1tZaXBrbdxOj3LqKo6HH/Ftrefn9oDuVDyQ+I/rJ2B2pZ2J+t0vJCGpm8
 qDN5wFD+EL7Wad/U9jOpWIoGo93DKGoSeUGlRbcSfvTTfRg5cF+EkbuJsaD29+Fy0fh5
 Lh2Q==
X-Gm-Message-State: AOAM530rHrxtUy9Hpn/uUDQbT4bRjugfZFYuY/3u/agtKXidTRHEXCh8
 710mCo4Udn6zPcaMLL89ZZU+2w==
X-Google-Smtp-Source: ABdhPJyFlluWkTGxIDD8DAe+Rrtl/A4H7tmBZt3vNUZHOenuccFvdMBHj1zHh72rB0o4uWqYwAMcTw==
X-Received: by 2002:a17:90a:7083:: with SMTP id
 g3mr5220486pjk.209.1644449122551; 
 Wed, 09 Feb 2022 15:25:22 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:5193:6865:e38e:3a5b])
 by smtp.gmail.com with ESMTPSA id u12sm22067162pfk.220.2022.02.09.15.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 15:25:22 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: qcom: Actually clear DMA interrupt register for HDMI
Date: Wed,  9 Feb 2022 15:25:20 -0800
Message-Id: <20220209232520.4017634-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-kernel@vger.kernel.org
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

In commit da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg
overwriting") we changed regmap_write() to regmap_update_bits() so that
we can avoid overwriting bits that we didn't intend to modify.
Unfortunately this change breaks the case where a register is writable
but not readable, which is exactly how the HDMI irq clear register is
designed (grep around LPASS_HDMITX_APP_IRQCLEAR_REG to see how it's
write only). That's because regmap_update_bits() tries to read the
register from the hardware and if it isn't readable it looks in the
regmap cache to see what was written there last time to compare against
what we want to write there. Eventually, we're unable to modify this
register at all because the bits that we're trying to set are already
set in the cache.

This is doubly bad for the irq clear register because you have to write
the bit to clear an interrupt. Given the irq is level triggered, we see
an interrupt storm upon plugging in an HDMI cable and starting audio
playback. The irq storm is so great that performance degrades
significantly, leading to CPU soft lockups.

Fix it by using regmap_write_bits() so that we really do write the bits
in the clear register that we want to. This brings the number of irqs
handled by lpass_dma_interrupt_handler() down from ~150k/sec to ~10/sec.

Fixes: da0363f7bfd3 ("ASoC: qcom: Fix for DMA interrupt clear reg overwriting")
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 sound/soc/qcom/lpass-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index a59e9d20cb46..4b1773c1fb95 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -524,7 +524,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 
-		ret = regmap_update_bits(map, reg_irqclr, val_irqclr, val_irqclr);
+		ret = regmap_write_bits(map, reg_irqclr, val_irqclr, val_irqclr);
 		if (ret) {
 			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
 			return ret;
@@ -665,7 +665,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	return -EINVAL;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
-		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
+		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -676,7 +676,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
-		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
+		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_XRUN(chan) | val));
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -688,7 +688,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_ERR(chan)) {
-		rv = regmap_update_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
+		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_ERR(chan) | val));
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);

base-commit: dfd42facf1e4ada021b939b4e19c935dcdd55566
-- 
https://chromeos.dev

