Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4720C8DB
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 17:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F0C1686;
	Sun, 28 Jun 2020 17:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F0C1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593359871;
	bh=ZraFJHy3ZCjxKcr+2WduGX1sqfL/9ptECE2M+zyDa6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDKfEz2nAwS69aIvm7p9YNLloTWkkv/BPtk4oRFS60YqhGhYgJBO/vPjvVvZOFcnx
	 NU2P8YHxFGRjDv9o93Zlu+UCfw5D+eAFBH6He0vY3VFj8esuPuAHbrqoO/+1vl9VBh
	 5yGKIurJdgkd8yUaEel4r3Rwxwaz1REEAiM3d+0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6CB5F802EC;
	Sun, 28 Jun 2020 17:53:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB7D8F802BE; Sun, 28 Jun 2020 17:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C75F80268
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 17:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C75F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="eAnrr9FD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593359569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9qZsppUPgw97OCS4BsOie8ionYebDhIakmy2gNmN7g=;
 b=eAnrr9FDiyB2tFzOG4+xg6cvMgz3q32MjQP63+8hb8RmBDtEzOSQV/YpaqzkLq26C5DP3h
 syV5BzbOVj5v63KYKMBfXNXt2Dv04mar7yGZFQUOaySRLJReV7tSbBN/iF2bwrU2MLQbc/
 7fpdywHnIGRQSDr5nXcAmXKB+DeshNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-ISPtT0HWPyiQmJlZi-bVRA-1; Sun, 28 Jun 2020 11:52:46 -0400
X-MC-Unique: ISPtT0HWPyiQmJlZi-bVRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8783918FE860;
 Sun, 28 Jun 2020 15:52:45 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BEBF1944D;
 Sun, 28 Jun 2020 15:52:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 6/6] ASoC: rt5670: Rename dev_gpio to gpio1_is_irq
Date: Sun, 28 Jun 2020 17:52:31 +0200
Message-Id: <20200628155231.71089-7-hdegoede@redhat.com>
In-Reply-To: <20200628155231.71089-1-hdegoede@redhat.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

Rename the not really descriptive dev_gpio quirk / setting to
gpio1_is_irq, which describes what it actually does.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5670.c | 24 ++++++++++++------------
 sound/soc/codecs/rt5670.h |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 515ab60bfe9c..a37601bfbfcc 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -30,7 +30,7 @@
 #include "rt5670.h"
 #include "rt5670-dsp.h"
 
-#define RT5670_DEV_GPIO			BIT(0)
+#define RT5670_GPIO1_IS_IRQ			BIT(0)
 #define RT5670_IN2_DIFF			BIT(1)
 #define RT5670_DMIC_EN			BIT(2)
 #define RT5670_DMIC1_IN2P		BIT(3)
@@ -2833,7 +2833,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC1_IN2P |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE1),
 	},
 	{
@@ -2845,7 +2845,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC1_IN2P |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE1),
 	},
 	{
@@ -2857,7 +2857,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC2_INR |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE1),
 	},
 	{
@@ -2869,7 +2869,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC1_IN2P |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE1),
 	},
 	{
@@ -2881,7 +2881,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC1_IN2P |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE1),
 	},
 	{
@@ -2905,7 +2905,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC2_INR |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE3),
 	},
 	{
@@ -2917,7 +2917,7 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC2_INR |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_IRQ |
 						 RT5670_JD_MODE3),
 	},
 	{}
@@ -2945,9 +2945,9 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 		rt5670_quirk = quirk_override;
 	}
 
-	if (rt5670_quirk & RT5670_DEV_GPIO) {
-		rt5670->dev_gpio = true;
-		dev_info(&i2c->dev, "quirk dev_gpio\n");
+	if (rt5670_quirk & RT5670_GPIO1_IS_IRQ) {
+		rt5670->gpio1_is_irq = true;
+		dev_info(&i2c->dev, "quirk GPIO1 is IRQ\n");
 	}
 	if (rt5670_quirk & RT5670_GPIO1_IS_EXT_SPK_EN) {
 		rt5670->gpio1_is_ext_spk_en = true;
@@ -3040,7 +3040,7 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 		regmap_update_bits(rt5670->regmap, RT5670_IN2,
 					RT5670_IN_DF2, RT5670_IN_DF2);
 
-	if (rt5670->dev_gpio) {
+	if (rt5670->gpio1_is_irq) {
 		/* for push button */
 		regmap_write(rt5670->regmap, RT5670_IL_CMD, 0x0000);
 		regmap_write(rt5670->regmap, RT5670_IL_CMD2, 0x0010);
diff --git a/sound/soc/codecs/rt5670.h b/sound/soc/codecs/rt5670.h
index 657420805918..56b13fe6bd3c 100644
--- a/sound/soc/codecs/rt5670.h
+++ b/sound/soc/codecs/rt5670.h
@@ -1992,7 +1992,7 @@ struct rt5670_priv {
 
 	int jd_mode;
 	bool in2_diff;
-	bool dev_gpio;
+	bool gpio1_is_irq;
 	bool gpio1_is_ext_spk_en;
 
 	bool dmic_en;
-- 
2.26.2

