Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B200A374349
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 19:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5676C17DA;
	Wed,  5 May 2021 19:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5676C17DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620234308;
	bh=ZBymqGWVFeC6mz2Gi2Zf3T39esbhwQLJBbxSe594f6w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FFzVvcug6hByVUaC2WjBkl081oAaWnDwRAA5XbjSMeDQg/NzmqVulD3UMfrUgDQoB
	 e2VosEzhaSL3RtPZoRBg20ikYRdwuauso5TNX5hheu5E3lrdHl42TGBrd2kIcPXF5h
	 3ljOm3ai/G3x5Ts+2ZCc4yr7bNJ0Hi6+lSdpHn4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D29F8070C;
	Wed,  5 May 2021 18:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A988F8070C; Wed,  5 May 2021 18:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAC19F80709
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC19F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WSzFQ5yS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42C1B61C2D;
 Wed,  5 May 2021 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232945;
 bh=ZBymqGWVFeC6mz2Gi2Zf3T39esbhwQLJBbxSe594f6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WSzFQ5yST1kY5FP1t553JevT4l446q8A9VzXEOBDuTMW2DWhXnVVzDKusMoIITz39
 QXAFaI1U2OvQWlZ5JQ30AVuJeJnLpk1QQNhivTGl+xOx4avIQ6ng1rMBF7PgSKE6CI
 TDJY76UFhXxDT2sUViyDht4T+rNSHikzI2GKM4Dm5JvXNeo8qzzvGSGtYIbkV7662c
 Tn6YVY1BiJjBPl+tHSwghWN2Xh3ScEzv8EcIaVqh3+2LKvD1O9vi6DLMqwmkRYarHC
 TkNMti8WOw5cMpf6yfd9r3XqRIMXz5SYBjRrPUqNXpoxOJV8oPxScQDg1cUPHqgZGK
 H0g2Jb/yttHKQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 16/19] ASoC: rt286: Generalize support for ALC3263
 codec
Date: Wed,  5 May 2021 12:41:59 -0400
Message-Id: <20210505164203.3464510-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164203.3464510-1-sashal@kernel.org>
References: <20210505164203.3464510-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, David Ward <david.ward@gatech.edu>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: David Ward <david.ward@gatech.edu>

[ Upstream commit aa2f9c12821e6a4ba1df4fb34a3dbc6a2a1ee7fe ]

The ALC3263 codec on the XPS 13 9343 is also found on the Latitude 13 7350
and Venue 11 Pro 7140. They require the same handling for the combo jack to
work with a headset: GPIO pin 6 must be set.

The HDA driver always sets this pin on the ALC3263, which it distinguishes
by the codec vendor/device ID 0x10ec0288 and PCI subsystem vendor ID 0x1028
(Dell). The ASoC driver does not use PCI, so adapt this check to use DMI to
determine if Dell is the system vendor.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=150601
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205961
Signed-off-by: David Ward <david.ward@gatech.edu>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20210418134658.4333-6-david.ward@gatech.edu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt286.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index af2ed774b552..63ed5b38b11f 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1117,12 +1117,11 @@ static const struct dmi_system_id force_combo_jack_table[] = {
 	{ }
 };
 
-static const struct dmi_system_id dmi_dell_dino[] = {
+static const struct dmi_system_id dmi_dell[] = {
 	{
-		.ident = "Dell Dino",
+		.ident = "Dell",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9343")
 		}
 	},
 	{ }
@@ -1133,7 +1132,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 {
 	struct rt286_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct rt286_priv *rt286;
-	int i, ret, val;
+	int i, ret, vendor_id;
 
 	rt286 = devm_kzalloc(&i2c->dev,	sizeof(*rt286),
 				GFP_KERNEL);
@@ -1149,14 +1148,15 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	}
 
 	ret = regmap_read(rt286->regmap,
-		RT286_GET_PARAM(AC_NODE_ROOT, AC_PAR_VENDOR_ID), &val);
+		RT286_GET_PARAM(AC_NODE_ROOT, AC_PAR_VENDOR_ID), &vendor_id);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "I2C error %d\n", ret);
 		return ret;
 	}
-	if (val != RT286_VENDOR_ID && val != RT288_VENDOR_ID) {
+	if (vendor_id != RT286_VENDOR_ID && vendor_id != RT288_VENDOR_ID) {
 		dev_err(&i2c->dev,
-			"Device with ID register %#x is not rt286\n", val);
+			"Device with ID register %#x is not rt286\n",
+			vendor_id);
 		return -ENODEV;
 	}
 
@@ -1180,8 +1180,8 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	if (pdata)
 		rt286->pdata = *pdata;
 
-	if (dmi_check_system(force_combo_jack_table) ||
-		dmi_check_system(dmi_dell_dino))
+	if ((vendor_id == RT288_VENDOR_ID && dmi_check_system(dmi_dell)) ||
+		dmi_check_system(force_combo_jack_table))
 		rt286->pdata.cbj_en = true;
 
 	regmap_write(rt286->regmap, RT286_SET_AUDIO_POWER, AC_PWRST_D3);
@@ -1220,7 +1220,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL3, 0xf777, 0x4737);
 	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL4, 0x00ff, 0x003f);
 
-	if (dmi_check_system(dmi_dell_dino)) {
+	if (vendor_id == RT288_VENDOR_ID && dmi_check_system(dmi_dell)) {
 		regmap_update_bits(rt286->regmap,
 			RT286_SET_GPIO_MASK, 0x40, 0x40);
 		regmap_update_bits(rt286->regmap,
-- 
2.30.2

