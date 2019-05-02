Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008D140DF
	for <lists+alsa-devel@lfdr.de>; Sun,  5 May 2019 17:55:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCDE18BB;
	Sun,  5 May 2019 17:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCDE18BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557071749;
	bh=N9ymxSe2dCrsv79+nns4xpGMvobWvcbJm20X+rf6wtw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uRGfi99uGxVbmrQz/2dtmi4fLCcT0Am29ST1lLe10OhoV2ger+eIT4IGDJbysfMTj
	 NmyzoSqr83JXuClzNWkAp0WuFhJJP7+Tgt+FqvyyOFBADUOc4jnFG6MNy+jT3AbN6P
	 HU+SZPtmd7M5W2gDDEcuSxsWcnsETV2vPYvGPMFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9085F89682;
	Sun,  5 May 2019 17:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 744E2F896E3; Thu,  2 May 2019 14:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6C98F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 14:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6C98F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Zsm0Hc1N"
Received: by mail-wm1-x342.google.com with SMTP id y5so2323033wma.2
 for <alsa-devel@alsa-project.org>; Thu, 02 May 2019 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+VXnkCeQD9CSagUVthpKhe513V9cyFde6oB8Eo2RI2s=;
 b=Zsm0Hc1NNbj1/+fIZ/BsybgMhuG/oOzaKqUFCEk8LgEfDc9hJT7dxy7GpIFI4JNnhr
 PGXOVN0dZ2kiiDCJr85WYiICSRRDNKkpe9/jAqTZ0mlOf4j9RPB5r8PVl56U8lkocgJt
 KVdNAV3h/Q4NNidtPUvEOB5GFV63HNMfuVMbxEYXAw8YMLy6Bo9teYIc13Np49yXKlwq
 LQCqrOMBFHnxdcMlWFEn+Qdo9/UEjBCRLz1uBbVaYkoOK6RT4sZIoQrWpp47OZmXVBAM
 gMtQ6gLO+p739fPYzxm6NGDSulCjzNZ3MzKZcsUl38RoxfjTeBjxesm9h78AeVzhytaX
 ID/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+VXnkCeQD9CSagUVthpKhe513V9cyFde6oB8Eo2RI2s=;
 b=Zj7Ibl+IKoLH47Izk1/MMXGche+mNEgZ8kiWcsaAI2zkyhn6HJOUGT+qqfRiB7HV+j
 relOd+Ar6wLNNrbJsH4zA5ri2kZ45Z27IQIoRKmKTd1Xf4z7EaYvdgf8c56zm+G+0j92
 uybLki3rP6pvY7uAcj7UtZWNjc00t15HVxfWsHM1azgNQ1D791GyxUD4StQcxtayMjBs
 MSCdcJPErCrjhxw9CFvqVW9F/10+X7DcV4KlSp9kC6R6qVfIOZtPF/1KMLl0M3+yYPvK
 nto3dvigNbAOoyWJo2XPXKQj2svymg3KzjwIWvqLufZDQPviS4Sn7jC4grQnchYtik2q
 EfZg==
X-Gm-Message-State: APjAAAWH+yChVHfvIpAh4rsleLbZAhm5r5u43ku5YKMJQGuoV7bZECjd
 GnB2w2pK+axeDvMZeXKzSV8P+A==
X-Google-Smtp-Source: APXvYqzRKOlOevXDDSWksfUTYabZbVoMJ/6J96gC1hBjVY9RvSugrai1mEmZuwx2m1GH4e4XuKgfFw==
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr2265512wmh.32.1556799052888; 
 Thu, 02 May 2019 05:10:52 -0700 (PDT)
Received: from localhost.localdomain
 (aputeaux-684-1-8-187.w90-86.abo.wanadoo.fr. [90.86.125.187])
 by smtp.gmail.com with ESMTPSA id u9sm3648348wmd.14.2019.05.02.05.10.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 05:10:51 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, matthias.bgg@gmail.com, perex@perex.cz,
 tiwai@suse.com, kaichieh.chuang@mediatek.com, shunli.wang@mediatek.com
Date: Thu,  2 May 2019 14:10:36 +0200
Message-Id: <20190502121041.8045-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 17:54:01 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 0/5] ASoC: mediatek: Add basic PCM driver for
	MT8516
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

This patch series add a basic PCM driver for MediaTek MT8516 with only
support for ADDA Playback & Recording for now.

Fabien Parent (5):
  ASoC: mediatek: make agent_disable, msb & hd fields optional
  dt-bindings: sound: Add MT8516 AFE PCM bindings
  ASoC: mediatek: Add MT8516 PCM driver
  ASoC: mediatek: mt8516: Add ADDA DAI driver
  ASoC: mediatek: mt8516: register ADDA DAI

 .../bindings/sound/mt8516-afe-pcm.txt         |  28 +
 sound/soc/mediatek/Kconfig                    |  10 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  23 +-
 sound/soc/mediatek/mt8516/Makefile            |   7 +
 sound/soc/mediatek/mt8516/mt8516-afe-common.h |  18 +
 sound/soc/mediatek/mt8516/mt8516-afe-pcm.c    | 794 ++++++++++++++++++
 sound/soc/mediatek/mt8516/mt8516-afe-regs.h   | 218 +++++
 sound/soc/mediatek/mt8516/mt8516-dai-adda.c   | 316 +++++++
 9 files changed, 1406 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8516-afe-pcm.txt
 create mode 100644 sound/soc/mediatek/mt8516/Makefile
 create mode 100644 sound/soc/mediatek/mt8516/mt8516-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8516/mt8516-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8516/mt8516-afe-regs.h
 create mode 100644 sound/soc/mediatek/mt8516/mt8516-dai-adda.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
