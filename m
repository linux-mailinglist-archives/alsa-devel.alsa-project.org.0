Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F64D2F53
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 13:46:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885C617C5;
	Wed,  9 Mar 2022 13:45:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885C617C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646829977;
	bh=yAmmENbZ8IYmL6DocQXjAHsGtgdJ/s09ABkmacdvEr4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b1r8EV9biOmlzlYCwy4zG1L15UdC7Fb8pVjdUZvPvx0SqjFc3P7tBKywKBIx016aM
	 1Ga1actC2RUQVfijlW4ojPr2Ryo9xoXQwycoClOtGyo2t3rscLIzZh+R/KJbtsHCht
	 6QIB8V8LZN3UemBiyQnuEnUSmrSTTCpqip0l3xf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F8F0F80236;
	Wed,  9 Mar 2022 13:45:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 106AEF8016C; Wed,  9 Mar 2022 13:45:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B74EF80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 13:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B74EF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vVSZXrOP"
Received: by mail-wr1-x432.google.com with SMTP id k24so2834374wrd.7
 for <alsa-devel@alsa-project.org>; Wed, 09 Mar 2022 04:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgKY2Q6+QhjEsaicdqEnaC8ePiL0nSdZLDa1oY8ac70=;
 b=vVSZXrOPJfdfQlk3yTj0sWxYXjSZJJJkmhzOxE8T2zdhsyWzXcJymep2acmJW5EkAj
 tDRgXyY/uR+mP9F92Mto8Ua/ILvYDmGp64/LXYomkY+MK1rCMnk8u12j2VVPJahNUhS6
 +CsX2K1acavUCwQt7YsxEB0kw5Dd+RkwxFtZ0Fl15TTmgrVdO0kIXf8UNPjbmEHb54Wy
 rBdBlhr4PTMAYyRcjAH3JGSph2JPa0K8mfiYKGg49yc8LQoUMJJWCgYNgOTtO58extn8
 mchCuXE3HVN6NGKZVKmMxBCKSy+gODUHJwECYAwDSrwtUey2k5ZfdtG1VP2B15qGSVeJ
 Qfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgKY2Q6+QhjEsaicdqEnaC8ePiL0nSdZLDa1oY8ac70=;
 b=oWPNDgaiaSQDJsCjiMFTeftCiTI7OnzOJ5aDr9SP3kRK/7Xhe8jU6tF6CBaAzfKyrC
 aDRfUp9I8p0Vv/L0Ojzt5TaBIzSg24RMoF+/x3aBm7BpLxCIdWga4DBF9Yi5bxiW/8WL
 X2BbXmvkxR4MfkdKFfJ4tOw6vFFY813lOTpzifYDrE9kZUCWo0iyHzKoalxJDHw1eHPv
 lCpjj7VqfiWvsoOzYnBF+bF12nLFVjo36PzhwQqSJI2A02BXcMCtVo7wmSNdkDpr37D+
 audDsSdlUpP2jYwVhtGw56cN8EzZ5br1joZp7zIPuuY2umxAgzRqfxgKdcKqou0XkzXe
 XH2A==
X-Gm-Message-State: AOAM532LBBTbEjD5W9b5dBsqE7mcSJBHX3fmw1mTloyK35mB0rEVK6BT
 qUBb92tlfkuAxRFTmuPeTcw9Rw==
X-Google-Smtp-Source: ABdhPJwj7n2SG+ZJ5L+LFVYmeqokwoThVczi/zeuMIVWGe6Ti9GLdtc8xDYQ1inhbtePKDrv/qyzog==
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr15663343wrw.93.1646829901625; 
 Wed, 09 Mar 2022 04:45:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm5414414wmb.48.2022.03.09.04.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 04:45:01 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: fix Kconfig for SC7280
Date: Wed,  9 Mar 2022 12:44:53 +0000
Message-Id: <20220309124453.25841-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

select would force the symbol to value without checking the dependencies.
In this case selecting TX and RX MACROs directly without checking its
dependency on COMMON_CLK would break builds on platform which do no
set COMMON_CLK.
ex:
WARNING: unmet direct dependencies detected for SND_SOC_LPASS_RX_MACRO
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && COMMON_CLK [=n]
  Selected by [m]:
  - SND_SOC_SC7280 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] &&
	 SND_SOC_QCOM [=m] && I2C [=y] && SOUNDWIRE [=m]

move select to imply which should enforce symbol to be set to 'n' if any
dependencies are not resolved.

Fixes: 57350bd41c3a ("ASoC: qcom: SC7280: Add machine driver")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index ae99833b3fdb..593fd85e03ad 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -194,8 +194,8 @@ config SND_SOC_SC7280
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
 	select SND_SOC_WCD938X
-	select SND_SOC_LPASS_RX_MACRO
-	select SND_SOC_LPASS_TX_MACRO
+	imply SND_SOC_LPASS_RX_MACRO
+	imply SND_SOC_LPASS_TX_MACRO
 	help
 	  Add support for audio on Qualcomm Technologies Inc.
 	  SC7280 SoC-based systems.
-- 
2.21.0

