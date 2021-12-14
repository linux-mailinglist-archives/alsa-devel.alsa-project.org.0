Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D94473AA2
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F3B1AA3;
	Tue, 14 Dec 2021 03:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F3B1AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448029;
	bh=x3GpHzJKyLfWmrZWAhIYdN3g2g7IbRADz1p+3n2SizE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I60xjkIu23voC/b6a9dMuyCrqLHubnVfrSz3F1pum3L+x7YfMslkIWfok9I0ilPUZ
	 oc9NCKTu4bZGf0neVbVGqSWtkA2eiciDRfb3pLU3QQGJTfvaGvlTVELNXwS48WHshA
	 Kp94nO1b8MEG7AHIh+FLqu2v9+MT6LBiNtdQqYgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09D63F80563;
	Tue, 14 Dec 2021 03:09:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83051F80533; Tue, 14 Dec 2021 03:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F4DDF8051B
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F4DDF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MUv3GKtO"
Received: by mail-pj1-x1032.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so14852196pjb.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tfKuPEirzmZovO9zaScDKVcFMWzL838W0ZG9woUWLZQ=;
 b=MUv3GKtOZNpJN96bc+FA2PI2SpZhbtDDABt0pysYIB5qpsG9CEP7zuEzmkG8zVgYb0
 QHmWV4GJcXE5zWX5Ae4sEKexBPwZX7VnFrAYbAAivbaAWOGWlGHY81IwAwbTpBQsqtPb
 JYnJlUmb10tbgyrjhjObBRvcGLYPp9evteySFZTPGfDEtBb8721nSH2aFY96vCjsHGp0
 vo3OoHJywwy6RAVs8l4H9iVqq4PphyGJcwBpTiwYDqFfEpvtG3HPeRIFd1E70JQe0vcD
 fdXgiOOPoBgRO9gzSIUOz1582v40m4bC26zbQdjN43VjYSwkwsrAJB3v1+QNJMNgceJ6
 acAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tfKuPEirzmZovO9zaScDKVcFMWzL838W0ZG9woUWLZQ=;
 b=uNVD/CNoYXhxXubfMT/7X1RjgadS19HVMeBPoD1wMBXLa4zSMdlsc9DFdVXWdgmQAW
 I3zKUtn2NlRYR4FnJpO1eawCBe1J4tgKkEpMez4KxJBq4+sj2MX4uVgBRN3o/1/M5YYR
 qebVlN+vwEaV/c4LWwXi/BUQbejD3tc3Rso7othAtYsf/EK7kmMP0kNy2kO0T3ag+ixE
 gaTI46o+K0ZMdnkns/ai4GWLCb05XKHxgQKLoT3ka157xsGeEUsCfe3kJjQmrnIGq1Qt
 wUj0DdRU1fEvuGJy4e3xNG2hTgyyd0UFBGJZraMWU2mLL5GCk6FZREHeh/tvgWYWfRdf
 ibOQ==
X-Gm-Message-State: AOAM532kSpnoH5ldI1ymPTYRvNdU/ksNdmsnIrwQzJUdz/cQ3u2Vrun1
 yA8rLsvzxHxeyGzg1L+8lb7XfXuAhWc=
X-Google-Smtp-Source: ABdhPJx+hA6LEDSxYyg4LcgjuJskm933iXfUKfi1bsyp6N1+rvqUP4Vu7EDIiuoRibmMy14dgF5WAg==
X-Received: by 2002:a17:902:e5c9:b0:142:53c4:478d with SMTP id
 u9-20020a170902e5c900b0014253c4478dmr2103918plf.33.1639447779591; 
 Mon, 13 Dec 2021 18:09:39 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:39 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 12/22] ASoC: ti: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:33 +0900
Message-Id: <20211214020843.2225831-13-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/davinci-mcasp.c | 10 +++-------
 sound/soc/ti/j721e-evm.c     | 10 +++-------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 3e105caac95e..2c146b91fca3 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2024,13 +2024,9 @@ static int davinci_mcasp_get_dma_type(struct davinci_mcasp *mcasp)
 
 	tmp = mcasp->dma_data[SNDRV_PCM_STREAM_PLAYBACK].filter_data;
 	chan = dma_request_chan(mcasp->dev, tmp);
-	if (IS_ERR(chan)) {
-		if (PTR_ERR(chan) != -EPROBE_DEFER)
-			dev_err(mcasp->dev,
-				"Can't verify DMA configuration (%ld)\n",
-				PTR_ERR(chan));
-		return PTR_ERR(chan);
-	}
+	if (IS_ERR(chan))
+		return dev_err_probe(mcasp->dev, PTR_ERR(chan),
+				     "Can't verify DMA configuration\n");
 	if (WARN_ON(!chan->device || !chan->device->dev)) {
 		dma_release_channel(chan);
 		return -EINVAL;
diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 9347f982c3e1..4077e15ec48b 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -464,13 +464,9 @@ static int j721e_get_clocks(struct device *dev,
 	int ret;
 
 	clocks->target = devm_clk_get(dev, prefix);
-	if (IS_ERR(clocks->target)) {
-		ret = PTR_ERR(clocks->target);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to acquire %s: %d\n",
-				prefix, ret);
-		return ret;
-	}
+	if (IS_ERR(clocks->target))
+		return dev_err_probe(dev, PTR_ERR(clocks->target),
+				     "failed to acquire %s\n", prefix);
 
 	clk_name = kasprintf(GFP_KERNEL, "%s-48000", prefix);
 	if (clk_name) {
-- 
2.25.1

