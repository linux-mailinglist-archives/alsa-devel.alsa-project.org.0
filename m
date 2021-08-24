Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EF43F597D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 09:55:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523841676;
	Tue, 24 Aug 2021 09:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523841676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629791739;
	bh=pyvvAy7bSDMqcC2cSxTqZportt2NJjS2WA9IZ50RTVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EW+HRtpqMTE9WJ3dYr7xzxriKn44FsLgn/KE8becs3OkkGtqjsBz+F41hzvejYPX7
	 pHlta8bklCX2ky1BfHas3wdXRvUI2GxsKmjEc9ysOaCGgR71qQRZVY+3QDuYutm+04
	 lA/TJJitDCqw0wjVgbNBeleE+BdvnDbmSWQlwMpU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89338F804FB;
	Tue, 24 Aug 2021 09:53:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB7F6F804FA; Tue, 24 Aug 2021 09:53:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE
 autolearn=disabled version=3.4.0
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C44E3F804ED
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C44E3F804ED
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id F2F4DFB848;
 Tue, 24 Aug 2021 15:53:07 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P704T139881101649664S1629791566598648_; 
 Tue, 24 Aug 2021 15:53:08 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4025dcb5e337a48d686d05ddcf7526be>
X-RL-SENDER: sugar.zhang@rock-chips.com
X-SENDER: zxg@rock-chips.com
X-LOGIN-NAME: sugar.zhang@rock-chips.com
X-FST-TO: broonie@kernel.org
X-RCPT-COUNT: 6
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org,
	heiko@sntech.de
Subject: [PATCH v1 5/7] ASoC: rockchip: pdm: Add support for path map
Date: Tue, 24 Aug 2021 15:52:35 +0800
Message-Id: <1629791557-13614-5-git-send-email-sugar.zhang@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629791446-13528-1-git-send-email-sugar.zhang@rock-chips.com>
Cc: Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
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

This patch adds property 'rockchip,path-map' for path mapping.

e.g.

"rockchip,path-map = <3 2 1 0>" means the mapping as follows:

  path0 <-- sdi3
  path1 <-- sdi2
  path2 <-- sdi1
  path3 <-- sdi0

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

 sound/soc/rockchip/rockchip_pdm.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/rockchip/rockchip_pdm.h |  3 +++
 2 files changed, 37 insertions(+)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index f2bf023..64d9891 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -20,6 +20,7 @@
 
 #define PDM_DMA_BURST_SIZE	(8) /* size * width: 8*4 = 32 bytes */
 #define PDM_SIGNOFF_CLK_RATE	(100000000)
+#define PDM_PATH_MAX		(4)
 
 enum rk_pdm_version {
 	RK_PDM_RK3229,
@@ -539,8 +540,36 @@ static const struct of_device_id rockchip_pdm_match[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(of, rockchip_pdm_match);
 
+static int rockchip_pdm_path_parse(struct rk_pdm_dev *pdm, struct device_node *node)
+{
+	unsigned int path[PDM_PATH_MAX];
+	int cnt = 0, ret = 0, i = 0, val = 0, msk = 0;
+
+	cnt = of_count_phandle_with_args(node, "rockchip,path-map",
+					 NULL);
+	if (cnt != PDM_PATH_MAX)
+		return cnt;
+
+	ret = of_property_read_u32_array(node, "rockchip,path-map",
+					 path, cnt);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < cnt; i++) {
+		if (path[i] >= PDM_PATH_MAX)
+			return -EINVAL;
+		msk |= PDM_PATH_MASK(i);
+		val |= PDM_PATH(i, path[i]);
+	}
+
+	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, msk, val);
+
+	return 0;
+}
+
 static int rockchip_pdm_probe(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
 	const struct of_device_id *match;
 	struct rk_pdm_dev *pdm;
 	struct resource *res;
@@ -606,6 +635,11 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 	}
 
 	rockchip_pdm_rxctrl(pdm, 0);
+
+	ret = rockchip_pdm_path_parse(pdm, node);
+	if (ret != 0 && ret != -ENOENT)
+		goto err_suspend;
+
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register pcm: %d\n", ret);
diff --git a/sound/soc/rockchip/rockchip_pdm.h b/sound/soc/rockchip/rockchip_pdm.h
index 13bfbc2..cab9772 100644
--- a/sound/soc/rockchip/rockchip_pdm.h
+++ b/sound/soc/rockchip/rockchip_pdm.h
@@ -53,6 +53,9 @@
 #define PDM_FD_DENOMINATOR_MSK	GENMASK(15, 0)
 
 /* PDM CLK CTRL */
+#define PDM_PATH_SHIFT(x)	(8 + (x) * 2)
+#define PDM_PATH_MASK(x)	(0x3 << PDM_PATH_SHIFT(x))
+#define PDM_PATH(x, v)		((v) << PDM_PATH_SHIFT(x))
 #define PDM_CLK_FD_RATIO_MSK	BIT(6)
 #define PDM_CLK_FD_RATIO_40	(0X0 << 6)
 #define PDM_CLK_FD_RATIO_35	BIT(6)
-- 
2.7.4



