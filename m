Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998233C71D2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 16:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17C6416D3;
	Tue, 13 Jul 2021 16:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17C6416D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626185168;
	bh=piXZV862GtolsNFRZgfu4EhZ6LLCPw8RvgJ+4RopueI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bK4+g51o2N+pS3JtfK2cvL4NZa/hkjcAzjQJlu2IZdJQVxQB0sHUnVD3sDd+OYcBC
	 984up2WIzHc20QH12QKikZCi2aNyQkEzd1si044VbnsZLaQyklzVjy7sSvT2Q7IkPM
	 /ehK8CNWjuwPFvSZsKU/HTF6K23LFQQgfd/2Ck9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE10F80229;
	Tue, 13 Jul 2021 16:04:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EDE0F80217; Tue, 13 Jul 2021 16:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3BE5F8016A
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 16:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3BE5F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rzozn0NM"
Received: by mail-wr1-x429.google.com with SMTP id f9so24975984wrq.11
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vOIUcGl6OP33Jqy69oCSIbVfIJAMACUPuFSgBT/mZq0=;
 b=rzozn0NMI7/ypYCD3LqzYeKGRY4hQQps8JSy49mzE9Qu45D1JYakCSLOXvA0veTpPI
 iP361IVy26u6qRpPMMzeT9t2kOtyVd9EXDLbhx1m4uDxgLYojmav9itvEBCFx9SI1U7l
 dnnVYe/MQd5a0j9vG4l3YJQduuoFuSEYwS2wZij7UpyZSHU749g0CfOLRIxuWHqCQCHp
 dk4+ldbEacv0Ul2FrOu7alqH2Nhjav7lXqwjkB4qitGNbv0NgEBGmdwYe+XfgS+Yy2sq
 TH4zFeBzK72qRQpZg4UM463isHBWpCaQ3eIEGGoV11oFHzxVg1C1TPsdJ+jwp5dRCQqM
 iwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vOIUcGl6OP33Jqy69oCSIbVfIJAMACUPuFSgBT/mZq0=;
 b=hhDLgfQ6y8/Z0n9/NkRw6Su4i0BSH2EFLfWv8ii5Gc5YKg9tv8eje1juJ1h2xTFbPT
 undbPg4diTn6YT6bd8ndNymeru4sOBXaEDBgpz7qYwaQJyBwvQJnM5I3iGaOComSVgk9
 1JktOT2yJBq9JQ971ssTCEl7A/g69JrOxJ5Lh7KolFyDNmPVadXVFASpZKtE1tp61Msg
 0KQ4CSGK3hQ216IDMuSBuI/PDbdpLCCIAoGh5PEWDulr0QsTG1xQ0dlZq6s4VPhu12xd
 DmNu8awQloVxRH054jIhYOCVMbxA8A+qnelzrf5s0Sq/aecO9O5tM1jZNSS8no/tbcEW
 MkCg==
X-Gm-Message-State: AOAM531Alm9cpKNGLAACCX3tQdfgj3ptg/fo5VPDXF10h5zQgyBlNBrN
 lKlR5NJD3IziudXUNiPZWWVWrg==
X-Google-Smtp-Source: ABdhPJwFeZ1fRJKzzL9MhDH5tR7drpblpFSuiq6qqLeTrory6p0I+Rm77YJ2fJuituCtWlrzpA7NKw==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr5943502wro.330.1626185072316; 
 Tue, 13 Jul 2021 07:04:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x1sm2958240wmc.0.2021.07.13.07.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:04:31 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wcd938x: make sdw dependency explicit in Kconfig
Date: Tue, 13 Jul 2021 15:04:17 +0100
Message-Id: <20210713140417.23693-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

currenlty wcd938x has only soundwire interface and depends on
symbols from wcd938x soundwire module, so make this dependency
explicit in Kconfig

Without this one of the randconfig endup setting
CONFIG_SND_SOC_WCD938X=y
CONFIG_SND_SOC_WCD938X_SDW=m
resulting in some undefined reference to wcd938x_sdw* symbols.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2d80836ef220..f47d46eb76bc 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1557,6 +1557,7 @@ config SND_SOC_WCD934X
 	  Qualcomm SoCs like SDM845.
 
 config SND_SOC_WCD938X
+	depends on SND_SOC_WCD938X_SDW
 	tristate
 
 config SND_SOC_WCD938X_SDW
-- 
2.21.0

