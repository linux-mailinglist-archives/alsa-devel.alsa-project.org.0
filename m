Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8F8366A72
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 14:08:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BAA41688;
	Wed, 21 Apr 2021 14:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BAA41688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619006901;
	bh=d2cOFm6R4HaftzjlQdRMddk2v/Dr/6ssdSxaorlYogw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JmhBIjiYnVnGNAbKEOyI0xCxIlnOEWuQGy1li3IU6/lUJOTWITfxBgZofmznZGoLl
	 xiOvExCyB6Y72jGa+IAy6xQhDyjZ0K0X1wmSw7u+UHWHACjULXzL8RrQiVzvDnsjEY
	 8qXTeHEHyOuLAg+59ECa5XPXzcJYEyUZZAicKF7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8E1F80430;
	Wed, 21 Apr 2021 14:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 717CBF80274; Wed, 21 Apr 2021 14:06:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6194EF80274
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 14:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6194EF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="qOhB6Bn4"
Received: by mail-ed1-x529.google.com with SMTP id cq11so5423155edb.0
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mjz+dO0g52LTTWXvSkIafdv3wxVfZ3PM2K0TUZQe8w8=;
 b=qOhB6Bn4fdio6Oa+hCIyEtIzF/fPU1n900yfQN1KRUOmt0VxoAXNItjh4iktYz1nFF
 txn7A0NZdiBTN/SeMc+MDLdsvD0dTlB9+bVCvSjWVm9JTiKHTqOLQRM4X60LqC6QfgDu
 gCD6ek/S3BQCAozMyvXPVavOf0CNfgcn5b++PicQrqh6Q0nBwkEIfF8GF1ssNiYrIAbV
 PYUbypf1GVSjexslHQOaf3gRO73TPzn6PY0qIYX1IbLGDYcqY7uYmvr5JXPdZnx0DfZP
 kXqVGpArZJub0qyfEZkrpe89DBxVvFNegS0bci4vYbotJ+IO9cSymdI4ojNR28q3l/J/
 uOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mjz+dO0g52LTTWXvSkIafdv3wxVfZ3PM2K0TUZQe8w8=;
 b=EXUWzc/Z7DxFLdmn4iCdY3eMzw1USdz4HN4Scx8/syVIpFLMz8naAJYMBWH1HcMbLB
 f+vCatEtnh3CbPXeGz3/KVmOGkUQAuxDYg1VABlXcHMRuPG/vDzRjWNeyY4r7R7w5Juo
 JyUIRxPZhsICB6qgqp/Vj0JCUrYQ8ohxNrO1+LPeRfUahKOFwjXfEXlV8CQARt8EGw0Q
 jtHELP9WuzdSPXBIi5CadaN03y8rhqnNO3sK86Mbc4uGUwKUMd169bDrzBOWNFj9RRuU
 np9RmwHXZJAGh3gNvKYPeLn+mOnoGWdARNahrUp/tDMbKhMXN6tpV7ZfKCPAsnH1L7iw
 2Dpw==
X-Gm-Message-State: AOAM532u1QmMhxMwSOHj4AF2Nyia2ifIyjIHCixtvtBr1nmUbq+hPJV1
 NF0LHCYgM/JCc7F5BPqp3MEIsw==
X-Google-Smtp-Source: ABdhPJxxLKeeLIx0fL7Nswahk3sJ8ZZX4hGBA1vUHi5Y9fX7pUBLtrsEO39L5a3O2YsxRJ32QemvTA==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr37696169edv.373.1619006740670; 
 Wed, 21 Apr 2021 05:05:40 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id n2sm3151431edi.32.2021.04.21.05.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 05:05:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
Date: Wed, 21 Apr 2021 14:05:12 +0200
Message-Id: <20210421120512.413057-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421120512.413057-1-jbrunet@baylibre.com>
References: <20210421120512.413057-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Instead of using the clk embedded in the clk_hw (which is meant to go
away), a clock provider which need to interact with its own clock should
request clk reference through the clock provider API.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/da7219.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 13009d08b09a..bd3c523a8617 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2181,7 +2181,10 @@ static int da7219_register_dai_clks(struct snd_soc_component *component)
 				 ret);
 			goto err;
 		}
-		da7219->dai_clks[i] = dai_clk_hw->clk;
+
+		da7219->dai_clks[i] = devm_clk_hw_get_clk(dev, dai_clk_hw, NULL);
+		if (IS_ERR(da7219->dai_clks[i]))
+			return PTR_ERR(da7219->dai_clks[i]);
 
 		/* For DT setup onecell data, otherwise create lookup */
 		if (np) {
-- 
2.31.1

