Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC47237433E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 19:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 658C5177C;
	Wed,  5 May 2021 19:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 658C5177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620234133;
	bh=z9oRFRtriPEjKMASoA4bCvuWghtcypJW7cpizTaQflA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CeXeMwuCi0xMYq86QfWfIB3TUsHAfkwSu9KVGxg+rlSB21sCgo8rU/zEpiqZ22SPe
	 1meATEKhJubJde22M8dDl/XrEys+N02gYDrjCg8/k9w0SWmT85lisNSKkH8vyvR1j9
	 D1mT9yMWM1rUiqLaTzhYmGmTLOPx2GNSrSOOm6sE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F9C3F80684;
	Wed,  5 May 2021 18:41:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF2ACF80689; Wed,  5 May 2021 18:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02285F80534
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02285F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="arzFYVQk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FF6761C20;
 Wed,  5 May 2021 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232880;
 bh=z9oRFRtriPEjKMASoA4bCvuWghtcypJW7cpizTaQflA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=arzFYVQkP1BDg/OwzYKVCPeot9XpNUh8BHCVpS34sPW0cLgMWtEKerElfseJhcdII
 bbL49sP1deGEi7WWJQWAc8vcPTD+cDPXedIeT9iGPJnJuM3iAo4xc22R6RcNTI/CMZ
 JVu6l0r53L68VqEbmS9she1DAfAbXJK0bqUbDMet+NiIq2KHQWlCQwFpwDeE8LsM7Y
 gS202LphGW69LXekrsDM3M2TMtXPqH1lgZx2uApAjzGbxs1uPnDuN+ijnBx7AK0vtB
 nCylbYlM/w7iak01lYTV8s9a+IpQ2BGya1B6NvqVL4MTSPQaqEYgzhS7h+v68yHfJN
 d4Td7TzwM8AwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 19/25] ASoC: rt286: Generalize support for
 ALC3263 codec
Date: Wed,  5 May 2021 12:40:45 -0400
Message-Id: <20210505164051.3464020-19-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505164051.3464020-1-sashal@kernel.org>
References: <20210505164051.3464020-1-sashal@kernel.org>
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
index af6325c78292..17a66b4a46a2 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1119,12 +1119,11 @@ static const struct dmi_system_id force_combo_jack_table[] = {
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
@@ -1135,7 +1134,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 {
 	struct rt286_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct rt286_priv *rt286;
-	int i, ret, val;
+	int i, ret, vendor_id;
 
 	rt286 = devm_kzalloc(&i2c->dev,	sizeof(*rt286),
 				GFP_KERNEL);
@@ -1151,14 +1150,15 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
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
 
@@ -1182,8 +1182,8 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	if (pdata)
 		rt286->pdata = *pdata;
 
-	if (dmi_check_system(force_combo_jack_table) ||
-		dmi_check_system(dmi_dell_dino))
+	if ((vendor_id == RT288_VENDOR_ID && dmi_check_system(dmi_dell)) ||
+		dmi_check_system(force_combo_jack_table))
 		rt286->pdata.cbj_en = true;
 
 	regmap_write(rt286->regmap, RT286_SET_AUDIO_POWER, AC_PWRST_D3);
@@ -1222,7 +1222,7 @@ static int rt286_i2c_probe(struct i2c_client *i2c,
 	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL3, 0xf777, 0x4737);
 	regmap_update_bits(rt286->regmap, RT286_DEPOP_CTRL4, 0x00ff, 0x003f);
 
-	if (dmi_check_system(dmi_dell_dino)) {
+	if (vendor_id == RT288_VENDOR_ID && dmi_check_system(dmi_dell)) {
 		regmap_update_bits(rt286->regmap,
 			RT286_SET_GPIO_MASK, 0x40, 0x40);
 		regmap_update_bits(rt286->regmap,
-- 
2.30.2

