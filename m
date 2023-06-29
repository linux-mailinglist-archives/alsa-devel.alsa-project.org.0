Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A274242E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:48:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362911E4;
	Thu, 29 Jun 2023 12:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362911E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688035692;
	bh=fwk5ABF4qGgGMZxv66u4XmVNCk/M9YuiuP7nMBK9Mn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jM2dDekDJ2ewRGCNGxOsBPSrwDOgIv1RLdBFKzYQ+XQE/TpfT38BtQQMBK8QKQAlJ
	 Q6qTMhAzbUCm9Q993lOcQwn7DOI2K3BmaTN1itqeyUJ+0v+35Kr4UFnmW8kCfPVaOD
	 unHVsH8J/xmhUy6J476uZ3YBg/fwoJJxQ4f7Fx6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5572F8055B; Thu, 29 Jun 2023 12:46:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38072F80551;
	Thu, 29 Jun 2023 12:46:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE65F8027B; Thu, 29 Jun 2023 12:46:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFE9DF80212
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFE9DF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LT0NQUWu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688035573; x=1719571573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fwk5ABF4qGgGMZxv66u4XmVNCk/M9YuiuP7nMBK9Mn8=;
  b=LT0NQUWuE2d9LB+7lted9WSoyEnx49em9e21y2USRlBCEagp8mDN8VP/
   3H+K88uLzAXHBRutxjtx1sOfQRtIufE7yDjqzP4fIWMSDBUk7JVPraujg
   FF4fU8W/XlpL6C+u6YEJqFSuHNTCCEwcRj+lpKsIhtkfLG/7Ji9T7T1kN
   t4pC4+nDunCIveGBRmvTtcNL5gTCOdxWAm+FS0w9RqzE76uQMYg9qDvWr
   AKeTiAN4n086gFg3uOMh+RjbApldb9BSIv08PV1xNRHBFlSEAL3U7AqUd
   DF/ia5osZ3yoKDvcE3GNw8zb6l6+dbqwSZRUvQaQliOkYw5BDjP2tLZT3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362115073"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="362115073"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963948380"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="963948380"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 03:46:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B8F06204; Thu, 29 Jun 2023 13:46:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 1/3] ASoC: rt5677: Use agnostic irq_domain_create_linear()
Date: Thu, 29 Jun 2023 13:46:01 +0300
Message-Id: <20230629104603.88612-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
References: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WWLYSHGSBWDXGMLBVZNZVRRHM4GHYHNK
X-Message-ID-Hash: WWLYSHGSBWDXGMLBVZNZVRRHM4GHYHNK
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWLYSHGSBWDXGMLBVZNZVRRHM4GHYHNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of irq_domain_add_linear() that requires of_node,
use irq_domain_create_linear() that works outside of OF world.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt5677.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ad14d18860fc..4ef9c88cb20a 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5539,7 +5539,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
 	/* Ready to listen for interrupts */
-	rt5677->domain = irq_domain_add_linear(i2c->dev.of_node,
+	rt5677->domain = irq_domain_create_linear(dev_fwnode(i2c->dev),
 			RT5677_IRQ_NUM, &rt5677_domain_ops, rt5677);
 	if (!rt5677->domain) {
 		dev_err(&i2c->dev, "Failed to create IRQ domain\n");
-- 
2.40.0.1.gaa8946217a0b

