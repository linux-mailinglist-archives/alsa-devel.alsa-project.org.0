Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D3845312B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:48:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F961697;
	Tue, 16 Nov 2021 12:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F961697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063279;
	bh=bIyXoCYBNUorrAdF480VWAvyNk9ukmN1wAZimF7i2Nc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sk5JHDRZMwj88Zr17XrWSvsiyQUg5geGRYvQRyldbcl4XJnjcP9LFoz8ATyqcoUFh
	 R8nhd8GQqx33ZQA3qFKWqaHDAiwKzHSZhWlYSAga4ZLQnEfV2Q/RRtFA5kdb6jd2+t
	 0V5AFoS42Vx/u6prvicHOqEli/5bMUsEhBjudWuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC3E8F80272;
	Tue, 16 Nov 2021 12:46:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 312BBF802C4; Tue, 16 Nov 2021 12:46:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1192F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1192F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Op4DzHzL"
Received: by mail-wr1-x430.google.com with SMTP id r8so36904757wra.7
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOgjjFrTsTReyJ+ncLA3vp4lrNsqwZR5biwiOH5XTuU=;
 b=Op4DzHzLYAINx18qDZSvFuHVMwb3v5wRU/cOvtmFWfVEktLU/1n0NoKGj7rDyhSaFI
 l0qdkclgsFG6MsFXHZ9lOYqaZqSKGBsHt1FZ9bbObmnrEsOs1VkHdv3QZmM5zFZncRtr
 qhmlbjGMXWc7J9zW10yxM9brQtnJdl1SapU/KjKLalYX38Lrfewca2W9wLrlcrmyOQls
 goCX6OnvDLjnwWbKOwbhMuacvhtQ1A/yt3UKXZtE1E4MVUKqW8NDEAped9sG7VQDYi3G
 LH9w98trg6PhD1AVwSSHNU/ap0aS07p12yCZagZOopFxswU9zby2V7Ir88SHdAcl0I+D
 bXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jOgjjFrTsTReyJ+ncLA3vp4lrNsqwZR5biwiOH5XTuU=;
 b=Zf540dc2UkkvAhyj4LTey+C/N6Q9hlmc5/pmsG/72DiFc/XpOv7orzUHZ/8deGDxMM
 s3SOmo+hyxO5rrvgZlbt63awgCu+d7HyT0h6Lb76CY0GgCxi3I+Ct3y914B76nSy087q
 7wVSGgvnpojR+jP+lM9CoSxhcqLO9WynvezpKbsByMvw81sFw4jGmxV6lzMrd9IXGkq7
 GwOqS0S6nrfPP8tvvFQ0tPxAUKX8AeTt1uHB7GJjXphNEv+fyW0OOtxMyrCVVyNdxwFC
 LwSzpr6OugCcqYb3Q6r7quLzc2Sl3WyuTgUNnqRcVpBMX19BmEHqMI8UWoSzewms4lh6
 RnXA==
X-Gm-Message-State: AOAM530U6Np4oyH6onJPlcSX+lDszIeZQjNDaJqwRIeUQLU/uh7p0MEK
 d19c1UuM8AaRZBiJ3azsU6Haag==
X-Google-Smtp-Source: ABdhPJyBJc6M5rUpEMGkFpHGASmYZWIgaH4UakDKmfqy+mNoVmKxsqa9tHCHxDfsjhIJnTijJIJ9gg==
X-Received: by 2002:a5d:6510:: with SMTP id x16mr8579610wru.2.1637063196211;
 Tue, 16 Nov 2021 03:46:36 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id z11sm16934698wrt.58.2021.11.16.03.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:46:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/3] ASoC: codecs: Qualcomm codecs fixes
Date: Tue, 16 Nov 2021 11:46:20 +0000
Message-Id: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Hi Mark, 

We found few issues during runtime pm testing on this codecs.
These 3 patches for wcd938x, wcd934x and lpass-rx-macro should address them.

Thanks,
srini

Srinivas Kandagatla (3):
  ASoC: codecs: wcd938x: fix volatile register range
  ASoC: codecs: wcd934x: return error code correctly from hw_params
  ASoC: codecs: lpass-rx-macro: fix HPHR setting CLSH mask

 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 sound/soc/codecs/wcd934x.c        | 3 +--
 sound/soc/codecs/wcd938x.c        | 3 +++
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.21.0

