Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44B3008D8
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 17:44:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C6121EFA;
	Fri, 22 Jan 2021 17:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C6121EFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611333846;
	bh=S5MjPvAqnQsMQrNxFxRkamajQtt8VeVHXPojJUoPfc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TGsYM2/EomafS2MkDJIkYuTel7yWIIqxXxU8efz8tzpe7IBmkfc4MLsPm8cdoDRll
	 +XQiAso3dRS40UtfCBZezECBYSmy6hEeOiIvXBX3Bu8DA8h1n5n3veIO21DOkn34st
	 2MyuNDHT7EW3JuMt/tSWdC4ijsm6bkxIOn0Bt2bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74269F804E5;
	Fri, 22 Jan 2021 17:41:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09C31F804E5; Fri, 22 Jan 2021 17:41:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 707FBF804CB
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 17:41:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 707FBF804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="GF96gdLB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611333683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4IPvmJ7NDAIhhcWdSSNDV0Nl4JGvTfe0EqE+Qj6CHE=;
 b=GF96gdLBqGRlcjxucYonWbmpzFEzsLvG/ztMY/HH6lpsCi3Jf1u11aZuxtUN2BFQaAC398
 yQSLFMsyHNfdsoLIGIxVcfqftcN1h/IeDT5OA0x7l85EZeYrVL+EZPqxWvMarwN0wYUGfm
 MegwtbGgr+DsGWOHmk+ysCjZQGuNIM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-uhbGG3n2P3SQ8pDMCmo2iw-1; Fri, 22 Jan 2021 11:41:21 -0500
X-MC-Unique: uhbGG3n2P3SQ8pDMCmo2iw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7541559;
 Fri, 22 Jan 2021 16:41:19 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35F686EF46;
 Fri, 22 Jan 2021 16:41:17 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 03/13] extcon: arizona: Fix various races on driver unbind
Date: Fri, 22 Jan 2021 17:40:57 +0100
Message-Id: <20210122164107.361939-4-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-1-hdegoede@redhat.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

We must free/disable all interrupts and cancel all pending works
before doing further cleanup.

Before this commit arizona_extcon_remove() was doing several
register writes to shut things down before disabling the IRQs
and it was cancelling only 1 of the 3 different works used.

Move all the register-writes shutting things down to after
the disabling of the IRQs and add the 2 missing
cancel_delayed_work_sync() calls.

This fixes various possible races on driver unbind. One of which
would always trigger on devices using the mic-clamp feature for
jack detection. The ARIZONA_MICD_CLAMP_MODE_MASK update was
done before disabling the IRQs, causing:
1. arizona_jackdet() to run
2. detect a jack being inserted (clamp disabled means jack inserted)
3. call arizona_start_mic() which:
3.1 Enables the MICVDD regulator
3.2 takes a pm_runtime_reference

And this was all happening after the ARIZONA_MICD_ENA bit clearing,
which would undo 3.1 and 3.2 because the ARIZONA_MICD_CLAMP_MODE_MASK
update was being done after the ARIZONA_MICD_ENA bit clearing.

So this means that arizona_extcon_remove() would exit with
1. MICVDD enabled and 2. The pm_runtime_reference being unbalanced.

MICVDD still being enabled caused the following oops when the
regulator is released by the devm framework:

[ 2850.745757] ------------[ cut here ]------------
[ 2850.745827] WARNING: CPU: 2 PID: 2098 at drivers/regulator/core.c:2123 _regulator_put.part.0+0x19f/0x1b0
[ 2850.745835] Modules linked in: extcon_arizona ...
...
[ 2850.746909] Call Trace:
[ 2850.746932]  regulator_put+0x2d/0x40
[ 2850.746946]  release_nodes+0x22a/0x260
[ 2850.746984]  __device_release_driver+0x190/0x240
[ 2850.747002]  driver_detach+0xd4/0x120
...
[ 2850.747337] ---[ end trace f455dfd7abd9781f ]---

Note this oops is just one of various theoretically possible races caused
by the wrong ordering inside arizona_extcon_remove(), this fixes the
ordering fixing all possible races, including the reported oops.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/extcon/extcon-arizona.c | 40 +++++++++++++++++----------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index f7ef247de46a..76aacbac5869 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1760,25 +1760,6 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 	bool change;
 	int ret;
 
-	ret = regmap_update_bits_check(arizona->regmap, ARIZONA_MIC_DETECT_1,
-				       ARIZONA_MICD_ENA, 0,
-				       &change);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to disable micd on remove: %d\n",
-			ret);
-	} else if (change) {
-		regulator_disable(info->micvdd);
-		pm_runtime_put(info->dev);
-	}
-
-	gpiod_put(info->micd_pol_gpio);
-
-	pm_runtime_disable(&pdev->dev);
-
-	regmap_update_bits(arizona->regmap,
-			   ARIZONA_MICD_CLAMP_CONTROL,
-			   ARIZONA_MICD_CLAMP_MODE_MASK, 0);
-
 	if (info->micd_clamp) {
 		jack_irq_rise = ARIZONA_IRQ_MICD_CLAMP_RISE;
 		jack_irq_fall = ARIZONA_IRQ_MICD_CLAMP_FALL;
@@ -1794,10 +1775,31 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 	arizona_free_irq(arizona, jack_irq_rise, info);
 	arizona_free_irq(arizona, jack_irq_fall, info);
 	cancel_delayed_work_sync(&info->hpdet_work);
+	cancel_delayed_work_sync(&info->micd_detect_work);
+	cancel_delayed_work_sync(&info->micd_timeout_work);
+
+	ret = regmap_update_bits_check(arizona->regmap, ARIZONA_MIC_DETECT_1,
+				       ARIZONA_MICD_ENA, 0,
+				       &change);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to disable micd on remove: %d\n",
+			ret);
+	} else if (change) {
+		regulator_disable(info->micvdd);
+		pm_runtime_put(info->dev);
+	}
+
+	regmap_update_bits(arizona->regmap,
+			   ARIZONA_MICD_CLAMP_CONTROL,
+			   ARIZONA_MICD_CLAMP_MODE_MASK, 0);
 	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE,
 			   ARIZONA_JD1_ENA, 0);
 	arizona_clk32k_disable(arizona);
 
+	gpiod_put(info->micd_pol_gpio);
+
+	pm_runtime_disable(&pdev->dev);
+
 	return 0;
 }
 
-- 
2.28.0

