Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975555241E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 20:39:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755B01861;
	Mon, 20 Jun 2022 20:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755B01861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655750341;
	bh=DIN/U7I59/tgUs36bBGL6/3mVT2Hx3Ne+0T5eiJ+Qf0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kqxKh+Kape16wchUseNUMfBmAPytqkNKQzYnsIsU9nHgYp40VdsIuTzeYcEzZty17
	 yiRdU3mlFh8xcWTpj6B4Kxk6vXRSe+vJk3wQnURROOXhJMcSm6hrw5CuEkLhMqfWxu
	 bt9IU0cydpoj5Th9qG/vjDyjqr+3dEVakyVglYF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C299F804DA;
	Mon, 20 Jun 2022 20:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C94FF804D8; Mon, 20 Jun 2022 20:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 180F4F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 20:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180F4F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K8c8ZPs4"
Received: by mail-io1-xd2c.google.com with SMTP id s17so5681763iob.7
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oH+TPeRhTKU3xFkxsat+dvsRM7MxvHpnqcOtBFJGWE=;
 b=K8c8ZPs4V2dyjx7nJQ3tzGLI8rSprOWvjkiKUGMerOx3lpPm+2zDQg4t7im7qK2gTG
 gFCEHQ/AuvmTg5ZTZtpzafQt2KM7nFVzZpKbc0kh34DER0jNKMPGloQnKGwp6RX+d4NI
 nvf3Ua6f+zz9uzPnp3FhF1O64iw5Elk44BdF0oc1OaCOomK6bviRs1PgzvG/819XGzCw
 30XEQ3dPTsXciUh2uOu53+JytdUlCoUD1VfjiXbFNoDcqZHZA4XQADxZhYkuTC+Hydx5
 YJovyd/LilKxHqXgCAu7n/o04ghnK/CBvP3+yB1JX3jWySIYHYV6yoAdQ5D1GnHPhvRt
 2xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oH+TPeRhTKU3xFkxsat+dvsRM7MxvHpnqcOtBFJGWE=;
 b=kXHUffaz2/oKeSH7WuYMgzhCWF3We6nQJzQuRFYqkX8swQ8fwx6RKYLEtysxtEBIGW
 W5UjfWQR6Pm7skK87byNffGqzVlML9z1zp08/rQR4VM5DA3A0wcLI0OaSWeXtp7k5eX1
 9IP/AI1D32LehwDa8BRMSvNv23+F5v9n2gdNJe7ixhFm/DQ1Y/jqj4FQMPG3twY7ErDD
 COsNoMLEIaOFzxuzvVKczSlVVLvUNr6f/nz0xP72/adsYd249ywWjAQyRVyF39R/+CWn
 qGdwHEPedcfJuy3st+BxTS8e+BsL7mMs0mToplbntiLMDZ5JPcDzRywUipKdvyFXzNAI
 hRwQ==
X-Gm-Message-State: AJIora8PKy2QQdZ4ZPF3tYvrrlH/yKXtlCraRBfODAp9zDBqp789m0w7
 oMXVvuuPcsmRzbwU32erjC8=
X-Google-Smtp-Source: AGRyM1t5U1hn+TO2QIcNsREgogNYuCoKr0CzZQnzLWSzRcBlsTk9/uFcgmidlislKg1ykuUSuL8woQ==
X-Received: by 2002:a02:6d2b:0:b0:332:1027:a2dc with SMTP id
 m43-20020a026d2b000000b003321027a2dcmr13722194jac.65.1655750271681; 
 Mon, 20 Jun 2022 11:37:51 -0700 (PDT)
Received: from tremont-lap.lan ([2604:2d80:d289:7400:db6b:f24e:bef:c8f8])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a056e020d0400b002d90c9077a2sm2142588ilj.57.2022.06.20.11.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 11:37:50 -0700 (PDT)
From: David Owens <daowens01@gmail.com>
X-Google-Original-From: David Owens <dowens@precisionplanting.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4] ASoC: ti: omap-mcbsp: duplicate sysfs error
Date: Mon, 20 Jun 2022 13:37:43 -0500
Message-Id: <20220620183744.3176557-1-dowens@precisionplanting.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Owens <dowens@precisionplanting.com>, linux-omap@vger.kernel.org,
 David Owens <daowens01@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: David Owens <daowens01@gmail.com>

Convert to managed versions of sysfs and clk allocation to simplify
unbinding and error handling in probe.  Managed sysfs node
creation specifically addresses the following error seen the second time
probe is attempted after sdma_pcm_platform_register() previously requsted
probe deferral:

sysfs: cannot create duplicate filename '/devices/platform/68000000.ocp/49022000.mcbsp/max_tx_thres'

Signed-off-by: David Owens <dowens@precisionplanting.com>
---

Changes in v4:
 * Reverted change that added use ATTRIBUTE_GROUP and left the attribute
   structs as-is to fix compilation error and lessen the area of impact.

Changes in v3:
 * Whitespace changes only to allow clean apply

Changes in v2:
 * Improved error handling

---
 sound/soc/ti/omap-mcbsp-priv.h |  2 --
 sound/soc/ti/omap-mcbsp-st.c   | 14 ++------------
 sound/soc/ti/omap-mcbsp.c      | 19 ++-----------------
 3 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-priv.h b/sound/soc/ti/omap-mcbsp-priv.h
index 7865cda4bf0a..da519ea1f303 100644
--- a/sound/soc/ti/omap-mcbsp-priv.h
+++ b/sound/soc/ti/omap-mcbsp-priv.h
@@ -316,8 +316,6 @@ static inline int omap_mcbsp_read(struct omap_mcbsp *mcbsp, u16 reg,
 
 /* Sidetone specific API */
 int omap_mcbsp_st_init(struct platform_device *pdev);
-void omap_mcbsp_st_cleanup(struct platform_device *pdev);
-
 int omap_mcbsp_st_start(struct omap_mcbsp *mcbsp);
 int omap_mcbsp_st_stop(struct omap_mcbsp *mcbsp);
 
diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 0bc7d26c660a..7e8179cae92e 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -347,7 +347,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	if (!st_data)
 		return -ENOMEM;
 
-	st_data->mcbsp_iclk = clk_get(mcbsp->dev, "ick");
+	st_data->mcbsp_iclk = devm_clk_get(mcbsp->dev, "ick");
 	if (IS_ERR(st_data->mcbsp_iclk)) {
 		dev_warn(mcbsp->dev,
 			 "Failed to get ick, sidetone might be broken\n");
@@ -359,7 +359,7 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	if (!st_data->io_base_st)
 		return -ENOMEM;
 
-	ret = sysfs_create_group(&mcbsp->dev->kobj, &sidetone_attr_group);
+	ret = devm_device_add_group(mcbsp->dev, &sidetone_attr_group);
 	if (ret)
 		return ret;
 
@@ -368,16 +368,6 @@ int omap_mcbsp_st_init(struct platform_device *pdev)
 	return 0;
 }
 
-void omap_mcbsp_st_cleanup(struct platform_device *pdev)
-{
-	struct omap_mcbsp *mcbsp = platform_get_drvdata(pdev);
-
-	if (mcbsp->st_data) {
-		sysfs_remove_group(&mcbsp->dev->kobj, &sidetone_attr_group);
-		clk_put(mcbsp->st_data->mcbsp_iclk);
-	}
-}
-
 static int omap_mcbsp_st_info_volsw(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_info *uinfo)
 {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 58d8e200a7b9..9fb7cf0c9f88 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -702,8 +702,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 		mcbsp->max_tx_thres = max_thres(mcbsp) - 0x10;
 		mcbsp->max_rx_thres = max_thres(mcbsp) - 0x10;
 
-		ret = sysfs_create_group(&mcbsp->dev->kobj,
-					 &additional_attr_group);
+		ret = devm_device_add_group(mcbsp->dev, &additional_attr_group);
 		if (ret) {
 			dev_err(mcbsp->dev,
 				"Unable to create additional controls\n");
@@ -711,16 +710,7 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 		}
 	}
 
-	ret = omap_mcbsp_st_init(pdev);
-	if (ret)
-		goto err_st;
-
-	return 0;
-
-err_st:
-	if (mcbsp->pdata->buffer_size)
-		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
-	return ret;
+	return omap_mcbsp_st_init(pdev);
 }
 
 /*
@@ -1431,11 +1421,6 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
 	if (cpu_latency_qos_request_active(&mcbsp->pm_qos_req))
 		cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
 
-	if (mcbsp->pdata->buffer_size)
-		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
-
-	omap_mcbsp_st_cleanup(pdev);
-
 	return 0;
 }
 
-- 
2.34.1

