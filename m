Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA13CEEDF7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 23:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B5216E5;
	Mon,  4 Nov 2019 23:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B5216E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572905527;
	bh=w4NKrUieTHypAPOxGtl0Z1Rg3o9R/qEriZvI5gEVJ6c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c4StN+JDmQwiDTli8puiGbyhc3+JrJKB7GuurhEcd7fkMsONat1/dHxfhPvw2wyYe
	 A4rmdv28JGBykEaMmEbOPTip0rSvjP5B2MLJdZzQzcl0fXIHV6F2rHhCrwp6kYuq7n
	 249ip07CeqSgLJgHGcYf9SGUfeteFqkFEoUmMTVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D03ADF8045F;
	Mon,  4 Nov 2019 23:10:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04AE7F8048D; Mon,  4 Nov 2019 23:10:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 976F0F80321
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 23:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 976F0F80321
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 14:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,268,1569308400"; d="scan'208";a="212397807"
Received: from okcoulte-mobl1.amr.corp.intel.com (HELO
 yzhi-desktop.amr.corp.intel.com) ([10.255.35.122])
 by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 14:10:09 -0800
From: Yong Zhi <yong.zhi@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Mon,  4 Nov 2019 16:09:59 -0600
Message-Id: <1572905399-22402-1-git-send-email-yong.zhi@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: kai.vehmanen@linux.intel.com, ryans.lee@maximintegrated.com,
 pierre-louis.bossart@linux.intel.com, sathyanarayana.nujella@intel.com,
 daniel.baluta@nxp.com, Yong Zhi <yong.zhi@intel.com>
Subject: [alsa-devel] [PATCH v2] ASoC: max98373: replace gpio_request with
	devm_gpio_request
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

Use devm_gpio_request() to automatic unroll when fails and avoid
resource leaks at error paths.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
---
v2 change:
- use devm_gpio_request to avoid the goto statement based on review comments.

 sound/soc/codecs/max98373.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index eb709d528259..cae1def8902d 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -960,11 +960,11 @@ static int max98373_i2c_probe(struct i2c_client *i2c,
 
 	/* Power on device */
 	if (gpio_is_valid(max98373->reset_gpio)) {
-		ret = gpio_request(max98373->reset_gpio, "MAX98373_RESET");
+		ret = devm_gpio_request(&i2c->dev, max98373->reset_gpio,
+					"MAX98373_RESET");
 		if (ret) {
 			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
 				__func__, max98373->reset_gpio);
-			gpio_free(max98373->reset_gpio);
 			return -EINVAL;
 		}
 		gpio_direction_output(max98373->reset_gpio, 0);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
