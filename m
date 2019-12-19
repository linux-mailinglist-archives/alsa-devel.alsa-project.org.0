Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75648125E7B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 11:05:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DC41615;
	Thu, 19 Dec 2019 11:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DC41615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576749922;
	bh=EKE2/sw2k69qK1CSM7jl0LEy53czt1pI48/ZiBXiF3I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QtZw/LT25XPGrweN6VGdmYqPsZlqdeiJ19bjlxYPMelelyxhUy65pRnf/Fx+A6Gbk
	 lGxDK6M9r0uhjGFtDYbXmAYRE2EASJNbVmdMAD/83IUGlCIY5eQn8yEKUxelDIfvH8
	 sMpCXjoSBDgMdLxhOLh2JKGJIGJFOe+1ggikusug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F1BF80059;
	Thu, 19 Dec 2019 11:03:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD4CF80234; Thu, 19 Dec 2019 11:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06803F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:03:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06803F8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PDlkd57j"
Received: by mail-wr1-x443.google.com with SMTP id w15so5345507wru.4
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UUd9ifefua306V+RYm1MQyXrGKuSycBlD0MHvsu4j4c=;
 b=PDlkd57jg3jxDt0UaNwJFUWRi5FW5wsvcP/visGDc9lK7rW7ccRvaIkU5p8Ub8rxTI
 yxBoeFHC9MIWkUdMgGPRbELmiu+qwUPmcvxvCp5aJW2LH9e3KpBCunUlfU8fHjtF4WlZ
 wrwttfoAxc9kLFVs0m9IBd+t5L9FBfjZ+RkDRmyjm5QRMEtHLsAmdPX71VW/Y2CMzzOE
 6gqrmdfaJqigusob/+DeN90DU84QCb4c6F2bKYrMcsdAUa906WeGX+AQZX+Y8aLz82Jq
 EtesWSJmidckcnoWy5paVGc2OQ8X7XSX3VBU4quB9kIn36k7ok1t53YIOXEYL7yoMzJS
 fpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UUd9ifefua306V+RYm1MQyXrGKuSycBlD0MHvsu4j4c=;
 b=XU0f0/HQCBQ/EqaFYF0Z8k7mE1cs3KlmbirOc1yLIyRq+xJdmG+I2sYcWYAPmZHwyA
 z/h8ukycFQRXIoMPKSLUOmWvKa+NkM/VjoPGUrRBxCRMZYcBkOwQI8ei4hWV1sdFd8ES
 R6eTV2F75A0tyX0wPHvQYclL0oZzdw27+pZkIlLeV8AryBABrI+ZeQX2if91vnNeZ8kM
 8yP9BheIYFp/xyfL1/w9cLHaMrx8TBITap70q4UGIFVEXZcDYVTWEVE+nDOAJqz+ZBuL
 v3dcz+SjDcuKys7qI/mqK1Hn1DgjM4vTs2rfHtKnipwK2TWg/olIpvBOSZL5qNlmbmf9
 2uzg==
X-Gm-Message-State: APjAAAWdShyuqXRxfFIeQoehRamSXWuliUOTMoR7JLFT1Z/j00smh7K2
 N+ou0zKmYNbVBuyhHQ299/DmFA==
X-Google-Smtp-Source: APXvYqw8JrNyzVDcAB1p3rwH+vUK4jULrR04F5JdaN6CruY5FMC2ZsX4hJIaGsbeqlrjn7jHMed8NQ==
X-Received: by 2002:adf:ef8b:: with SMTP id d11mr8112150wro.45.1576749812903; 
 Thu, 19 Dec 2019 02:03:32 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q15sm6041164wrr.11.2019.12.19.02.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:03:32 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Thu, 19 Dec 2019 10:03:26 +0000
Message-Id: <20191219100328.14850-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v9 0/2] ASoC: codecs: Add WSA881x Smart Speaker
	amplifier support
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

This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
Amplifier which is SoundWire interfaced.

This patchset along with DB845c machine driver and WCD934x codec driver
has been tested on SDM845 SoC based DragonBoard DB845c with two
WSA8810 and Lenovo YOGA C630 Laptop based on SDM850 with WSA8815
speaker amplifiers.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
        Add thermal sensor support in WSA881x.

Thanks,
srini

Changes since v8:
	- Moved soundwire stream handling into this codec as there is
 strong requirements on sequence of PA and soundwire port enables from hw side.

Srinivas Kandagatla (2):
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   68 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1206 +++++++++++++++++
 4 files changed, 1286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
