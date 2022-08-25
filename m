Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F765A12F4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C4915C2;
	Thu, 25 Aug 2022 16:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C4915C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661436317;
	bh=sxdOmuulLJpJw8I5+ILr7Ak6NE/zg8TSZukaNeU2Ook=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oocumVH2U5fea2ArJaEKtRNrvqf62/FSH35fUI5ncMsZTd4o3vqh/JgnjXp2JxoYz
	 pRBIci97t1+IucPKVojTe3d3ihLEhuJbxvekbTXrbxwwLSiD7HOst39v4TG88MoREx
	 ziV69xoZ6JF1ZjKspL1Pz7+v3VjDZV0+2R2DmbUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1CDF80552;
	Thu, 25 Aug 2022 16:03:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24628F8053B; Thu, 25 Aug 2022 16:03:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A730F8025A
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A730F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="kX0d3xmS"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661436172; bh=PCDuP/emdbOrjDqBGMDvA3MxPbkFeQu07VmM0kChmGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kX0d3xmSOxwdAWkd8HaT8AyTqnbip/ZMAXN0kert+xkt4DX9cgtL7rP4bb4me81rF
 gZmH4ypxdZwEMJYMIAa6+k3pVbQtNgKIC8MDbrXuZlT3AWzTrC92N+doQOAMaCzuNh
 xa68nQhKtVAfgLZ3v1ulN+7AxmoClwTNvwBZXx5c=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: tas2764: Add IRQ handling
Date: Thu, 25 Aug 2022 16:02:40 +0200
Message-Id: <20220825140241.53963-5-povik+lin@cutebit.org>
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 navada@ti.com, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asyrus@ti.com, shenghao-ding@ti.com, raphael-xu@ti.com,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Stephen Kitt <steve@sk2.org>, Dan Murphy <dmurphy@ti.com>
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

Add an IRQ handler which logs detected faults (but doesn't do anything
else).

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 93 ++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 19 ++++++++
 2 files changed, 112 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 39902f77a2e0..e99a46fb503f 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -31,6 +31,7 @@ struct tas2764_priv {
 	struct gpio_desc *sdz_gpio;
 	struct regmap *regmap;
 	struct device *dev;
+	int irq;
 	
 	int v_sense_slot;
 	int i_sense_slot;
@@ -39,6 +40,57 @@ struct tas2764_priv {
 	bool unmuted;
 };
 
+static const char *tas2764_int_ltch0_msgs[8] = {
+	"fault: over temperature", /* INT_LTCH0 & BIT(0) */
+	"fault: over current",
+	"fault: bad TDM clock",
+	"limiter active",
+	"fault: PVDD below limiter inflection point",
+	"fault: limiter max attenuation",
+	"fault: BOP infinite hold",
+	"fault: BOP mute", /* INT_LTCH0 & BIT(7) */
+};
+
+static const unsigned int tas2764_int_readout_regs[6] = {
+	TAS2764_INT_LTCH0,
+	TAS2764_INT_LTCH1,
+	TAS2764_INT_LTCH1_0,
+	TAS2764_INT_LTCH2,
+	TAS2764_INT_LTCH3,
+	TAS2764_INT_LTCH4,
+};
+
+static irqreturn_t tas2764_irq(int irq, void *data)
+{
+	struct tas2764_priv *tas2764 = data;
+	u8 latched[6] = {0, 0, 0, 0, 0, 0};
+	int ret = IRQ_NONE;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(latched); i++)
+		latched[i] = snd_soc_component_read(tas2764->component,
+						    tas2764_int_readout_regs[i]);
+
+	for (i = 0; i < 8; i++) {
+		if (latched[0] & BIT(i)) {
+			dev_crit_ratelimited(tas2764->dev, "%s\n",
+					     tas2764_int_ltch0_msgs[i]);
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	if (latched[0]) {
+		dev_err_ratelimited(tas2764->dev, "other context to the fault: %02x,%02x,%02x,%02x,%02x",
+				    latched[1], latched[2], latched[3], latched[4], latched[5]);
+		snd_soc_component_update_bits(tas2764->component,
+					      TAS2764_INT_CLK_CFG,
+					      TAS2764_INT_CLK_CFG_IRQZ_CLR,
+					      TAS2764_INT_CLK_CFG_IRQZ_CLR);
+	}
+
+	return ret;
+}
+
 static void tas2764_reset(struct tas2764_priv *tas2764)
 {
 	if (tas2764->reset_gpio) {
@@ -497,6 +549,34 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 
 	tas2764_reset(tas2764);
 
+	if (tas2764->irq) {
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK1, 0xff);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK2, 0xff);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK3, 0xff);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK4, 0xff);
+		if (ret < 0)
+			return ret;
+
+		ret = devm_request_threaded_irq(tas2764->dev, tas2764->irq, NULL, tas2764_irq,
+						IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_LOW,
+						"tas2764", tas2764);
+		if (ret)
+			dev_warn(tas2764->dev, "failed to request IRQ: %d\n", ret);
+	}
+
 	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_TDM_CFG5,
 					    TAS2764_TDM_CFG5_VSNS_ENABLE, 0);
 	if (ret < 0)
@@ -559,9 +639,21 @@ static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	},
 };
 
+static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
+	case TAS2764_INT_CLK_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config tas2764_i2c_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
+	.volatile_reg = tas2764_volatile_register,
 	.reg_defaults = tas2764_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tas2764_reg_defaults),
 	.cache_type = REGCACHE_RBTREE,
@@ -615,6 +707,7 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	tas2764->dev = &client->dev;
+	tas2764->irq = client->irq;
 	i2c_set_clientdata(client, tas2764);
 	dev_set_drvdata(&client->dev, tas2764);
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index f015f22a083b..960b337ed0fc 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -87,4 +87,23 @@
 #define TAS2764_TDM_CFG6_ISNS_ENABLE	BIT(6)
 #define TAS2764_TDM_CFG6_50_MASK	GENMASK(5, 0)
 
+/* Interrupt Masks */
+#define TAS2764_INT_MASK0               TAS2764_REG(0x0, 0x3b)
+#define TAS2764_INT_MASK1               TAS2764_REG(0x0, 0x3c)
+#define TAS2764_INT_MASK2               TAS2764_REG(0x0, 0x40)
+#define TAS2764_INT_MASK3               TAS2764_REG(0x0, 0x41)
+#define TAS2764_INT_MASK4               TAS2764_REG(0x0, 0x3d)
+
+/* Latched Fault Registers */
+#define TAS2764_INT_LTCH0               TAS2764_REG(0x0, 0x49)
+#define TAS2764_INT_LTCH1               TAS2764_REG(0x0, 0x4a)
+#define TAS2764_INT_LTCH1_0             TAS2764_REG(0x0, 0x4b)
+#define TAS2764_INT_LTCH2               TAS2764_REG(0x0, 0x4f)
+#define TAS2764_INT_LTCH3               TAS2764_REG(0x0, 0x50)
+#define TAS2764_INT_LTCH4               TAS2764_REG(0x0, 0x51)
+
+/* Clock/IRQ Settings */
+#define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
+#define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)
+
 #endif /* __TAS2764__ */
-- 
2.33.0

