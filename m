Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D943B067
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:43:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F16E1704;
	Tue, 26 Oct 2021 12:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F16E1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635245033;
	bh=yh7/jBE/ugWh6oZWpDa5qP4ZeP0z0wdFRiu0hv2Seik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyiRgFKlLUqoS3lNrsAXBB9b2cY7u6mPX76pv7YGPVdFqMyRsJAzZZ4HnczTbgo9F
	 qio3+xnvf8xkS0UW6a3lz/9ZmeVcxwcXPC8vLqfqI/PbNk2TkyJjJnUGa47i0phwfK
	 o2EkeZwSrxooi1xeLJI0KpneZD068zc4lcfD23xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 247ABF8054A;
	Tue, 26 Oct 2021 12:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A09A9F8053A; Tue, 26 Oct 2021 12:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16058F804FF
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16058F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ytAUZS2r"
Received: by mail-wr1-x42c.google.com with SMTP id i9so2514104wrc.3
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VxZXnKS9YtNHxd0gj3h59SMAN46hPXrE6hl+KuwiZE=;
 b=ytAUZS2rRi8TI59g9qzGRiQ9UETFuIKKWl1+pq8NRUTW0PBskMSM502UzCWEHhJT0/
 ByWCV7It99BxCvYkU7ECP9fLEufTO4CGdyAwPY8bSx/KmT31RmaWo9uCanRLnlVG745P
 nfxQ4XGeySUuonzO6oLSmyP5pGPjjqJr6IVeqlKrUI4OQyyqTkdiYoKFSDjtvG8/voBm
 Wxrl/+Ejpizo55Z+rlUwxfF5rnGqsc7qU7juBrrSv279IuzZjuGQ2iUv9FiYwFFbJL2G
 V19xK74i/o1LvFZOG5P8CiPgUmNNDfKXzpnkJVcIk2zMfNCmP5K899/8Wu1vKfVv0OnD
 h8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VxZXnKS9YtNHxd0gj3h59SMAN46hPXrE6hl+KuwiZE=;
 b=nHVqniJbDIz7CCawEafpOw5wwIIe7tjaPkeoSkCKTtAB/HfhFY3KEYpbSuyXLxeY17
 ZggWFCslgmdRlANIt7KKa2ZYfnotDONHfBnhaAMLIB1SNVZ9l3Jlk+bOXl6si+TSLt7n
 twjv7FxxFtk26nVoMzq0Ik7f/u9u3YeSuOOSM4xnoksI5Kno7Vtq1bqk+dNO4eYqyzCq
 8rbCYfIRqD1afkR3JDXRS308/wlMazf0vesRJwbCvuZmEDWNJZHLfyPjEzTdHgMFh9bp
 mBeq1PiPvcUfrzD1yp2PsTwfsOInF2PqMcv6DwYzkH/2IAVFH3o76Ikp7NB8rRfCB4DL
 B2og==
X-Gm-Message-State: AOAM5314ygMXq7W+MMCRNvKs72QgXm9A2i2sEDNakNvghRF9m5pE5B7h
 VZzqYjylt4Xj2mQV0qapE0BflQ==
X-Google-Smtp-Source: ABdhPJwVY+XLnxnZn3sv5oy3fgNy0PzIq4VM2c9eDIoyL2/EFkpRE6LdjV9GJCCG5LeUls6QmDZMvg==
X-Received: by 2002:adf:e483:: with SMTP id i3mr22501743wrm.175.1635244723752; 
 Tue, 26 Oct 2021 03:38:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x21sm221397wmc.14.2021.10.26.03.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:38:43 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [RESEND PATCH v10 12/17] ASoC: qdsp6: audioreach: add Kconfig and
 Makefile
Date: Tue, 26 Oct 2021 11:38:10 +0100
Message-Id: <20211026103815.19468-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Now that all the code for audioreach and q6apm are in at this point to be
able to compile, start adding Kconfig and Makefile changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/Kconfig        | 4 ++++
 sound/soc/qcom/qdsp6/Makefile | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cc7c1de2f1d9..5a693f83fd6c 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -84,6 +84,9 @@ config SND_SOC_QDSP6_ASM_DAI
 	select SND_SOC_COMPRESS
 	tristate
 
+config SND_SOC_QDSP6_APM
+	tristate
+
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
 	depends on QCOM_APR
@@ -97,6 +100,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_QDSP6_ROUTING
 	select SND_SOC_QDSP6_ASM
 	select SND_SOC_QDSP6_ASM_DAI
+	select SND_SOC_QDSP6_APM
 	help
 	 To add support for MSM QDSP6 Soc Audio.
 	 This will enable sound soc platform specific
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index a4191d395557..1a0803d97eec 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
+snd-q6apm-objs := q6apm.o audioreach.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += snd-q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
@@ -10,3 +11,5 @@ obj-$(CONFIG_SND_SOC_QDSP6_ADM) += q6adm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ROUTING) += q6routing.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM) += q6asm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
+
+obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
-- 
2.21.0

