Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717E353CA7B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 15:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184531754;
	Fri,  3 Jun 2022 15:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184531754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654261917;
	bh=cYnCd3MVntEZkSZGHy+44qHAVZGKVBub4HnjNbFZsGs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AjYe01Nh0iMaBjnZYvbNifAViZqyjKCCswzHNQYZ8OIHw67nTA8MnPa7o+7/oy36L
	 aUJKUqBycD2pOHX3tWLGsvA0LMR+dvyWL6gbYLoTeO+Ml3r0RCF8pbL0nCk0sVuAn8
	 ynHoJapynnf8OL8qIGQH0mHjxyJyKF0EOH6Q2jIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 534FEF800F5;
	Fri,  3 Jun 2022 15:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B031AF804CC; Fri,  3 Jun 2022 15:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C14FF800F5
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 15:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C14FF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ujk00q4G"
Received: by mail-pf1-x42b.google.com with SMTP id w21so7207632pfc.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODbT0QmWB07HWQTaFHLu0hivC2LQ/JBbuZ19CEiGVKM=;
 b=Ujk00q4GB9oPPURMhFVVwAwk0dUMGhQ76fKMOl94E00NDlBzmec8WnG80cYUoPQxDa
 uyHoSvt7Nv0t7hBT8kV61CzcV9zBn7zHIhctmnhq9VW7SgOApql44cEt9RIyDxd7T7gJ
 QH71bCiTFsi/K+KKjS9ut10gaB/rQyQklxU4wSxS6jWKjeEswiYC9AvYH28+8tg/wtjm
 ku2Kc6DdXUkTTtAeOcUJ+0673SS3oIRr7EkHdHOE9A/GFlsT/CqAzSW7hm1Qez17K87g
 NXkJtFHGc5FF+Rvbicrt5BTGlscw3ZACG5834nzQSkCim2qiCYfjGK3usCH9EjyTwJX3
 JTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODbT0QmWB07HWQTaFHLu0hivC2LQ/JBbuZ19CEiGVKM=;
 b=kA60gZy/IXqLUl/CDU8/IctXRfozFTWMM2ntXLGLjVTPc2wrap/jjmnC0bs3Zb2GNz
 VGnTDjD8wcgFqTAN+FmDDMm7/3ZkntYckLBP8MSKAZUTfe4uyTTxDi0O7PSHssMGHa8l
 Ou7rVHJ+22WPqJWGTa6Bin1JqnN25Mcb5MAVWHNf6kjYbC05Q4QTusROLMri6G0DCdbA
 gopVLyElyUueB6g/L+rxhyaFAbDgnVuHvjWiIAu44gEiM1wBnImNwRg9VQqzizZUDDaN
 82GWK6Ralmfq4wzC/pvDPOt0tb4B7o3SzNN14tKAOUW5aWIjuljrWfH+fOtkStuCf6C3
 qktg==
X-Gm-Message-State: AOAM533SCboZG9dMiQqgzBewFypISMTzFFVHKmE/ElKXl8GVEjDf07f5
 CXeqlji3YkRJetJ0CI6w06I=
X-Google-Smtp-Source: ABdhPJyncMHC8GX1hRGNfDO4RAiZqdv/DEEl//mlI7eR6BEaT34FyQYkwf35dD33khPIgmRlk33AkQ==
X-Received: by 2002:aa7:8e44:0:b0:50c:fc0e:8d25 with SMTP id
 d4-20020aa78e44000000b0050cfc0e8d25mr10473724pfr.81.1654261853775; 
 Fri, 03 Jun 2022 06:10:53 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 a3-20020a170903100300b0015ea4173bd6sm5279133plb.195.2022.06.03.06.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 06:10:53 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Cheng-Yi Chiang <cychiang@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Guenter Roeck <groeck@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Benson Leung <bleung@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: cros_ec_codec: Fix refcount leak in
 cros_ec_codec_platform_probe
Date: Fri,  3 Jun 2022 17:10:43 +0400
Message-Id: <20220603131043.38907-1-linmq006@gmail.com>
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: b6bc07d4360d ("ASoC: cros_ec_codec: support WoV")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag
v1 Link: https://lore.kernel.org/r/20220602114529.6303-1-linmq006@gmail.com
---
 sound/soc/codecs/cros_ec_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 8b0a9c788a26..11e7b3f6d410 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -995,6 +995,7 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 			dev_dbg(dev, "ap_shm_phys_addr=%#llx len=%#x\n",
 				priv->ap_shm_phys_addr, priv->ap_shm_len);
 		}
+		of_node_put(node);
 	}
 #endif
 
-- 
2.25.1

