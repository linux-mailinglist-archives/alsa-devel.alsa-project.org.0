Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF37522BAD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 07:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE8418B7;
	Wed, 11 May 2022 07:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE8418B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652246940;
	bh=+Kx52d97Z/dqGnLQl9g7RRQF7KwtVSMYN8w0WAJKPJQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IqaZS2bi+p+cSQN1rDVotrZCKS1pqwYLHumd0u3rT1IwxHu8J3VxhL7LEA8AFjCth
	 0cBgxdPgDnjTOwQ1FWv1EcYNg/6kH/46PDmKZp4WWz8IGLdbnscAcI56/FThFJMvlw
	 4KhGBFGik4RczgoauzQueCBaFDlupZEzGyTFsCtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75E43F80212;
	Wed, 11 May 2022 07:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FA08F8015B; Wed, 11 May 2022 07:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D67EEF80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 07:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D67EEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pZ7INeRK"
Received: by mail-pj1-x102e.google.com with SMTP id o69so1198525pjo.3
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 22:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhdm254L1jYhgvQgbJzDhHX/1k7BNUYa5TibU3+NCCw=;
 b=pZ7INeRKE7ikbL0Wp1J2nkeg5H+ixeNlVyt8PYCddh2qShvjPh+hek64IhQ72pjYiI
 7emBeRFo+ZBiSd6HXcaXOmhC+lL3WiJqfw6jXaPXvYjcjTJk8+EAcrW7nBNknBW8MamG
 y3IM79TAD97U/nTxtEo9yvf5XYzIF4gzw+u7IgzhoT3ceHSuOUOwpuYMb/KzCmOlru5l
 9aNHlqiUqt3TaR84XMjujDYI71Svp937IGTCm9Oiuv+bXoeSRUiGHWiNMlWtcPUtFmKD
 BYh9nNVtPT2zfyA8wsUHIo3lHKyxQV33wgLC9Voh85/bQ8qPt9QSI43AUrUeQuBnwwSu
 gbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xhdm254L1jYhgvQgbJzDhHX/1k7BNUYa5TibU3+NCCw=;
 b=JgKRZFQMpK8Cfl+hbIzDbMxWKRfaa5fo6hLUvQbvy49wJIXZL7pO+50s3ZPMQjwhfS
 xLNfNOhrFMuPvAg0kpsrI+zkbUhz6yYK3LWd0SazBZrINCDiu/Dc7AKMFcBBQWem0zhF
 2BGmej5RWjhV9SpJheL41yAgFNQkMTN2OiNwToIQ5Fh9ZpaC6jUwqZ/IBDkhE6WIl5Lu
 i7WbaE1oy8NXlWiD1KhkkMn5XChqNsGiqrVYRx4Eze5X+Zx+gWFDDgwtv8IbJgiB7NmF
 D+0VV9NaHLoqBiEM/DAu4DlWQJp1DmhS32c/F0pIWsKhoSK+90ZqHFgLF2A0wL0nwgH+
 /wmg==
X-Gm-Message-State: AOAM533RGpLT9ZKFrPUhaFiZe4imVHFoKhzqRt7Fyg4XUzl0LAwD35g2
 q+RrZ6N2E4IjJHM24M3RuLM=
X-Google-Smtp-Source: ABdhPJxp27enUzauf894HfT9NP3kw4axhqglDt0NeLn5w5FytMmzOkolsl2i+qdZja+aIx6uEVmDBQ==
X-Received: by 2002:a17:902:7fc2:b0:153:3c90:17b9 with SMTP id
 t2-20020a1709027fc200b001533c9017b9mr24081383plb.61.1652246872324; 
 Tue, 10 May 2022 22:27:52 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 s12-20020a170902c64c00b0015e8d4eb2e6sm588632pls.304.2022.05.10.22.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 22:27:51 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Ye Guojin <ye.guojin@zte.com.cn>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: imx-hdmi: Fix refcount leak in imx_hdmi_probe
Date: Wed, 11 May 2022 09:27:40 +0400
Message-Id: <20220511052740.46903-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linmq006@gmail.com
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

of_find_device_by_node() takes reference, we should use put_device()
to release it. when devm_kzalloc() fails, it doesn't have a
put_device(), it will cause refcount leak.
Add missing put_device() to fix this.

Fixes: 6a5f850aa83a ("ASoC: fsl: Add imx-hdmi machine driver")
Fixes: f670b274f7f6 ("ASoC: imx-hdmi: add put_device() after of_find_device_by_node()")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/fsl/imx-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index 929f69b758af..ec149dc73938 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -126,6 +126,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
+		put_device(&cpu_pdev->dev);
 		goto fail;
 	}
 
-- 
2.25.1

