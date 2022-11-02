Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A58616BFE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 19:22:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F401697;
	Wed,  2 Nov 2022 19:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F401697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667413345;
	bh=OfMwEPRyzP69cf0RbqYMeq7wYptVsG5Ag1i1BjFEAS4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vd9VXJt2LIbJaRPCrT2QC3Q0fA8XBfYVPJ3ceyh9TfWm4sVMC2/tcRgLXiGa6idp2
	 gaQpkJzR+LZEd8IHsfLQnBxbsIGm20dMrOL3ty9sxonEbVuy3qoEIuQXBJQQvrVVvq
	 bb7ctX1Y3XFFI1yFR0VskVBjpFfTSMr9kDN+Njok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0957F80567;
	Wed,  2 Nov 2022 19:20:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27B7BF8055B; Wed,  2 Nov 2022 19:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11848F80254
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 19:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11848F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="T8GiEKHc"
Received: from notapiano.myfiosgateway.com (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E344E6602948;
 Wed,  2 Nov 2022 18:20:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667413216;
 bh=OfMwEPRyzP69cf0RbqYMeq7wYptVsG5Ag1i1BjFEAS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8GiEKHc8UtFOYUTrPUOVTnAL1fBOP0leZVHpAvJGznyzxuomjwzC3xFcrlqgcaZc
 NH9gSfQTB9k1f8OysAGYkJ1DakMgh5w2EA9ZxzAx/3ryKYPQB7RBMefBi6dvDuHkLY
 H919o8MLhJMWZcghrXV0ISVX8ePMgHnBUbjBXSpl8GWUdvqbYuT8ZQAn7TpMMaJGLH
 5IoTZBAQm/H5616oyeO4wl9DmQCCQrT/CVSXHFmquP5cc/KCe4Ai1OeGrQYhcs0Xqy
 X3VHib7o3BtzrR0Fup7JIMtXosIlpWL+RsME7YyYkpXgRJKOWs3LFVNrhxREIdRDW7
 pZ16b9a1UcSfw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH v2 5/8] ASoC: rt5682s: Support DBVDD and LDO1-IN supplies
Date: Wed,  2 Nov 2022 14:19:59 -0400
Message-Id: <20221102182002.255282-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102182002.255282-1-nfraprado@collabora.com>
References: <20221102182002.255282-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Add support for the DBVDD and LDO1-IN supplies.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Made names uppercase

 sound/soc/codecs/rt5682s.c | 22 ++++++++++++++++++++++
 sound/soc/codecs/rt5682s.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 80c673aa14db..f5e5dbc3b0f0 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -44,6 +44,8 @@ static const struct rt5682s_platform_data i2s_default_platform_data = {
 static const char *rt5682s_supply_names[RT5682S_NUM_SUPPLIES] = {
 	[RT5682S_SUPPLY_AVDD] = "AVDD",
 	[RT5682S_SUPPLY_MICVDD] = "MICVDD",
+	[RT5682S_SUPPLY_DBVDD] = "DBVDD",
+	[RT5682S_SUPPLY_LDO1_IN] = "LDO1-IN",
 };
 
 static const struct reg_sequence patch_list[] = {
@@ -3089,6 +3091,14 @@ static void rt5682s_i2c_disable_regulators(void *data)
 	if (ret)
 		dev_err(dev, "Failed to disable supply AVDD: %d\n", ret);
 
+	ret = regulator_disable(rt5682s->supplies[RT5682S_SUPPLY_DBVDD].consumer);
+	if (ret)
+		dev_err(dev, "Failed to disable supply DBVDD: %d\n", ret);
+
+	ret = regulator_disable(rt5682s->supplies[RT5682S_SUPPLY_LDO1_IN].consumer);
+	if (ret)
+		dev_err(dev, "Failed to disable supply LDO1-IN: %d\n", ret);
+
 	usleep_range(1000, 1500);
 
 	ret = regulator_disable(rt5682s->supplies[RT5682S_SUPPLY_MICVDD].consumer);
@@ -3150,6 +3160,18 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
+	ret = regulator_enable(rt5682s->supplies[RT5682S_SUPPLY_DBVDD].consumer);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to enable supply DBVDD: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(rt5682s->supplies[RT5682S_SUPPLY_LDO1_IN].consumer);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to enable supply LDO1-IN: %d\n", ret);
+		return ret;
+	}
+
 	if (gpio_is_valid(rt5682s->pdata.ldo1_en)) {
 		if (devm_gpio_request_one(&i2c->dev, rt5682s->pdata.ldo1_en,
 					  GPIOF_OUT_INIT_HIGH, "rt5682s"))
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 45464a041765..67f86a38a1cc 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1438,6 +1438,8 @@ struct pll_calc_map {
 enum {
 	RT5682S_SUPPLY_AVDD,
 	RT5682S_SUPPLY_MICVDD,
+	RT5682S_SUPPLY_DBVDD,
+	RT5682S_SUPPLY_LDO1_IN,
 	RT5682S_NUM_SUPPLIES,
 };
 
-- 
2.38.1

