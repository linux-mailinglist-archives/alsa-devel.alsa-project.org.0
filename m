Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE2203A7A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 17:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EA6A1708;
	Mon, 22 Jun 2020 17:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EA6A1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592838973;
	bh=Z3mGR7/aAC3nNuBilnPdrPJKchrkB0pJk3sf9tDvVdk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s9heYs7Am0+Jdk7eM374UcuxKop3bqFPonqf1IjYgZkJtfONtcSJGx7JaOccMdcXl
	 7ZEBbMKdsmL1jC/6MRAZGb8g0NG/jNP8VFq+kH5Pl5bitjUeoTXZEFIqWxddkG+XbZ
	 61xi++2oRsX1awcl14yvELs0nxSODyACqVydObbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D809F80246;
	Mon, 22 Jun 2020 17:14:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5CCDF801F2; Mon, 22 Jun 2020 17:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33893F80162
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 17:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33893F80162
IronPort-SDR: /JiSnmv/mHQJfOen5PQmQKfBtSN+ysc5zP6DBO7+MmvdY8FI4n4QyCNaPgHBRfyyfkX2lGef9R
 2iPUwFdXWg/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="124062037"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="124062037"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 08:13:52 -0700
IronPort-SDR: I29bynVg76OD/AWPFTnUXMAH3UO5mL/ttgmpUR2ZxZvXMNqebxl20/lsYInLMyjdjEX0hQ4uEs
 YFkdODYhNgdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="310141762"
Received: from somsubhr-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.74.194])
 by orsmga008.jf.intel.com with ESMTP; 22 Jun 2020 08:13:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: rt1011: fix KASAN out-of-bounds bug in find_next_bit()
Date: Mon, 22 Jun 2020 10:13:48 -0500
Message-Id: <20200622151348.28063-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>
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

From: Fred Oh <fred.oh@linux.intel.com>

KASAN throws the following warning in rt1011.c:
[ 170.777603] BUG: KASAN: stack-out-of-bounds in _find_next_bit.constprop.0+0x3e/0xf0

find_next_bit() relies on unsigned long pointer arguments, but this driver
uses a type cast that generates the KASAN warning. Replace find_next_bit()
and find_last_bit() with __ffs() and __fls() to pass the value and avoid
casting pointers to make the warning go away.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1011.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index dec5638060c3..098ecf13814d 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1849,13 +1849,13 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 
 	/* Rx slot configuration */
 	rx_slotnum = hweight_long(rx_mask);
-	first_bit = find_next_bit((unsigned long *)&rx_mask, 32, 0);
-	if (rx_slotnum > 1 || rx_slotnum == 0) {
+	if (rx_slotnum > 1 || !rx_slotnum) {
 		ret = -EINVAL;
-		dev_dbg(component->dev, "too many rx slots or zero slot\n");
+		dev_err(component->dev, "too many rx slots or zero slot\n");
 		goto _set_tdm_err_;
 	}
 
+	first_bit = __ffs(rx_mask);
 	switch (first_bit) {
 	case 0:
 	case 2:
@@ -1892,11 +1892,17 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 
 	/* Tx slot configuration */
 	tx_slotnum = hweight_long(tx_mask);
-	first_bit = find_next_bit((unsigned long *)&tx_mask, 32, 0);
-	last_bit = find_last_bit((unsigned long *)&tx_mask, 32);
-	if (tx_slotnum > 2 || (last_bit-first_bit) > 1) {
+	if (tx_slotnum > 2 || !tx_slotnum) {
 		ret = -EINVAL;
-		dev_dbg(component->dev, "too many tx slots or tx slot location error\n");
+		dev_err(component->dev, "too many tx slots or zero slot\n");
+		goto _set_tdm_err_;
+	}
+
+	first_bit = __ffs(tx_mask);
+	last_bit = __fls(tx_mask);
+	if (last_bit - first_bit > 1) {
+		ret = -EINVAL;
+		dev_err(component->dev, "tx slot location error\n");
 		goto _set_tdm_err_;
 	}
 

base-commit: 39853b1438bf9b07349c8c44b48f6c2eda6f8840
-- 
2.20.1

