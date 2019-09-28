Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADAAC1224
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Sep 2019 22:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E3A1607;
	Sat, 28 Sep 2019 22:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E3A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569703402;
	bh=iRb2z9C6tYAhXrRAv17w/vl3/yTHJ3A0nGVzqczPgQg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YX+wmLrY07laQzPQrYG7lT13xhK2K8hSKyTjeUiBQKxPYUi3Q26SUdcab2tQ+cy8h
	 /KsRbB8KNz/rNF1CYnztE+LUqkDneqZAm3AbHeXprUvAe+1pJYTig6Gc8RsuipA38W
	 +K0RtRYP6oXNDziNIOEO77xFTeV1dUOwGFKn53vY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E623F80306;
	Sat, 28 Sep 2019 22:41:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 243D9F803F4; Sat, 28 Sep 2019 22:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E13F80140
 for <alsa-devel@alsa-project.org>; Sat, 28 Sep 2019 22:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E13F80140
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Sep 2019 13:41:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,560,1559545200"; d="scan'208";a="197091671"
Received: from chrome-audio.sc.intel.com ([172.25.206.186])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2019 13:41:24 -0700
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
To: broonie@kernel.org
Date: Sat, 28 Sep 2019 13:22:30 -0700
Message-Id: <1569702150-11976-1-git-send-email-sathyanarayana.nujella@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 ryans.lee@maximintegrated.com, harshapriya.n@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Subject: [alsa-devel] [PATCH] ASoC: max98373: check for device node before
	parsing
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Below Oops is caused in a system which uses ACPI instead of device node:

of_get_named_gpiod_flags: can't parse 'maxim,reset-gpio' property of node '(null)[0]'
BUG: kernel NULL pointer dereference, address: 0000000000000010

This patch avoids NULL pointer deferencing by adding a check before parsing
and initializes to make reset-gpio pin as invalid.

Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
---
 sound/soc/codecs/max98373.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index e609abcf3220..eb709d528259 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -901,16 +901,20 @@ static void max98373_slot_config(struct i2c_client *i2c,
 		max98373->i_slot = value & 0xF;
 	else
 		max98373->i_slot = 1;
-
-	max98373->reset_gpio = of_get_named_gpio(dev->of_node,
+	if (dev->of_node) {
+		max98373->reset_gpio = of_get_named_gpio(dev->of_node,
 						"maxim,reset-gpio", 0);
-	if (!gpio_is_valid(max98373->reset_gpio)) {
-		dev_err(dev, "Looking up %s property in node %s failed %d\n",
-			"maxim,reset-gpio", dev->of_node->full_name,
-			max98373->reset_gpio);
+		if (!gpio_is_valid(max98373->reset_gpio)) {
+			dev_err(dev, "Looking up %s property in node %s failed %d\n",
+				"maxim,reset-gpio", dev->of_node->full_name,
+				max98373->reset_gpio);
+		} else {
+			dev_dbg(dev, "maxim,reset-gpio=%d",
+				max98373->reset_gpio);
+		}
 	} else {
-		dev_dbg(dev, "maxim,reset-gpio=%d",
-			max98373->reset_gpio);
+		/* this makes reset_gpio as invalid */
+		max98373->reset_gpio = -1;
 	}
 
 	if (!device_property_read_u32(dev, "maxim,spkfb-slot-no", &value))
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
