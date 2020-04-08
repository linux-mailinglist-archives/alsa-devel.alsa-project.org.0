Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7F1A28ED
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 20:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD3981663;
	Wed,  8 Apr 2020 20:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD3981663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586372255;
	bh=gqW/Hz2ckDAETLJ13g+seTEXfKmRuqqqEmg90oygsgg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=etJzioL80vLwwCdiDICuugb4WCn4HC5VxsZ3VLyOotHW+crFRXYF2d3D4NaD2/65d
	 naC6jVkIH5n9+BTZ41OpNP9O96KcXMLbhnRxpUOaIqnY5ZoPlO18nINZ1ZP3oTnr2c
	 Pi5rjUDpXFPK0Ra0g28Bs4sR95le7I6WVSvcqBgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC491F80150;
	Wed,  8 Apr 2020 20:55:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B39F80143; Wed,  8 Apr 2020 20:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 683E2F80107
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 20:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 683E2F80107
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MwxRN-1j6lFQ1JAh-00ySED; Wed, 08 Apr 2020 20:55:31 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: rt5682: fix building without I2C
Date: Wed,  8 Apr 2020 20:55:18 +0200
Message-Id: <20200408185527.308213-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4AoJDCXVBq/rxRcJ104peoQYrzLDNcb3p1vOQ7Y937Nq+mHuurc
 mPlJhXivK+4f42v46kcfEnrMJRG5r7Kg1E11iAC1mT8ndXQcRJ/JgROVMhddj6HJ0f5p945
 QZ0AA8Lwne9UnABWVM4cRmiqzcMXmdiTLU/0vD+vcv3ZS6WapO13Bk7ccWW3jrGmOBCn0wy
 mL1AMEBlueU/zYwcFhylQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:29YYqW2EZs8=:TYqEai8QnFj5T50xeEt3TC
 0eDWr8s6Y96tKufknGNLHrTGNVcUoADmJ42LvoZXlHCcHqE14lsxa8rZDJLNOAegH6UHETfqX
 2MccJQ9/v2QV14PSEDFB7pXlxyqMDHT+C4dIQNqPYg6Jt4Jt/KGYnIUjJa+iiwXgM03rRc7BN
 4WwJZgOFVZKfOvfpSEuMivmdbo/z4nuvqXPdi2zidkGnu601FNvB6gqWY+6S+EoF9SROZUdDp
 G99v7sJ9pPlXa91hVpyGA98KBHi4HcjBmL7gfz1zq9PiCi6hbB05ZsdcWQolvAkwhGkV+jsGw
 M3tKV26GK6+5pOCrHAoV9A0ymf+qP9QHFF6I5t75syoPG3hT4O7vQDKdwKzIAHXofi3dPV7cr
 ti1quVNknN6FhoC4o1RuaDJzKzcyK8r79n89cq2JoIRzXmmNVqsF1tkQ0DGsl/4y/VYkY3doU
 S1kqkOYLfM7q8735C4c+rIRPf/q3qZ5bCXMudUxaGa5qmDpVId1DNnnh4vuedmushCnt9AjMD
 OTl7HTcmRJwh72dVSxUZISZ7Yd94IMIvWegrPrIiv7ARxJ3geEza3tWzVhxl+XKDmTQx8twF9
 Rl4fDpb68SxVf744Zyo6Oz2Cq6D38NeTvLi+Th1bhby1ZfCUjjlJQ81o5Yyo+ydMO2UGlvSCy
 8jC4WBg62+9/VNHkjHxmGwOfE6IHzv/1u6yrVydOA9j4c5HoeELs5mtHEgAljbGad35dR4I/c
 qXXrPHp0vPJ46gmUmkovehQ7UTvQRjB09oad4/icz5+HvY0OZceoHGJE/J4RKz59yQx2IHBUW
 ReNJEMSjW0l+VQrj3Vs5mvTeh+sQFbcA/jmb2Q0Pp82RdEnetc=
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Derek Fang <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
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

When I2C is disabled, building rt5682 produces a compile-time error:

sound/soc/codecs/rt5682.c:3716:1: warning: data definition has no type or storage class
 3716 | module_i2c_driver(rt5682_i2c_driver);
      | ^~~~~~~~~~~~~~~~~
sound/soc/codecs/rt5682.c:3716:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
sound/soc/codecs/rt5682.c:3716:1: warning: parameter names (without types) in function declaration
sound/soc/codecs/rt5682.c:3706:26: error: 'rt5682_i2c_driver' defined but not used [-Werror=unused-variable]
 3706 | static struct i2c_driver rt5682_i2c_driver = {
      |                          ^~~~~~~~~~~~~~~~~

Move the i2c specific entry points into an #ifdef section so
it can actually be built standalone.

Fixes: 5549ea647997 ("ASoC: rt5682: fix unmet dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/rt5682.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index c9268a230daa..a6548f870807 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3224,12 +3224,6 @@ static const struct regmap_config rt5682_regmap = {
 	.use_single_write = true,
 };
 
-static const struct i2c_device_id rt5682_i2c_id[] = {
-	{"rt5682", 0},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
-
 static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 {
 
@@ -3526,7 +3520,7 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 EXPORT_SYMBOL_GPL(rt5682_io_init);
 #endif
 
-static int rt5682_i2c_probe(struct i2c_client *i2c,
+static int __maybe_unused rt5682_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
 	struct rt5682_platform_data *pdata = dev_get_platdata(&i2c->dev);
@@ -3680,13 +3674,14 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 					rt5682_dai, ARRAY_SIZE(rt5682_dai));
 }
 
-static void rt5682_i2c_shutdown(struct i2c_client *client)
+static void __maybe_unused rt5682_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
 
 	rt5682_reset(rt5682);
 }
 
+#ifdef CONFIG_I2C
 #ifdef CONFIG_OF
 static const struct of_device_id rt5682_of_match[] = {
 	{.compatible = "realtek,rt5682i"},
@@ -3703,6 +3698,12 @@ static const struct acpi_device_id rt5682_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
 #endif
 
+static const struct i2c_device_id rt5682_i2c_id[] = {
+	{"rt5682", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
+
 static struct i2c_driver rt5682_i2c_driver = {
 	.driver = {
 		.name = "rt5682",
@@ -3714,6 +3715,7 @@ static struct i2c_driver rt5682_i2c_driver = {
 	.id_table = rt5682_i2c_id,
 };
 module_i2c_driver(rt5682_i2c_driver);
+#endif
 
 MODULE_DESCRIPTION("ASoC RT5682 driver");
 MODULE_AUTHOR("Bard Liao <bardliao@realtek.com>");
-- 
2.26.0

