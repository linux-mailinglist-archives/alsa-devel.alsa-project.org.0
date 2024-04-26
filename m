Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC418B3BAE
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005A515FB;
	Fri, 26 Apr 2024 17:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005A515FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145711;
	bh=afNPpg7IcB0U1xO1E01+CCTCyRfcQ0s3E68EgzwcE7s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IKCwO9XEo6XUrNbrpzzv0yPFBXVY4HWM1SvIaCon/8EfMyZt8fY0BkUeCSzUStK/r
	 8RmFlF4QocjCZ3Ou8EZCpcqvNIqMBsl64adc99HhK42cqzvBuyI+0VZ5ENJGf9awB+
	 W7rWTGz5pq5UgzDAzC2x1KxNi8R6ovIABMMM4JqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6155DF8072C; Fri, 26 Apr 2024 17:30:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB20FF80743;
	Fri, 26 Apr 2024 17:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A83E1F80608; Fri, 26 Apr 2024 17:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A62C4F802E8
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A62C4F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ETfFTxzF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145447; x=1745681447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=afNPpg7IcB0U1xO1E01+CCTCyRfcQ0s3E68EgzwcE7s=;
  b=ETfFTxzFsAGSw+7DE4AFXku92DuiuorUJ7RYFwA7zx7olg9wcZP27ZNK
   FavrzVnAMkR9bkhgap69UM7Cyir/SHFHwDmMS+kvphcWFY7F6j8qHyqvO
   iQTmeiPzRk1Yy1PaT+AyfyTatu6HxHpreQysPZeNudxGFU/NVJSbNtMVd
   NRy1NM73dlX8JKqZis8PVb9OFGNcU3OTe7KdqA3ee3zCBdAIziXM69cte
   jK1ITEu5F4lMBxiHrZJYjxKHhV9r6jKv3Ko+DJWCw/mkUzGsk8sXai4S5
   2NhrSCSBlz+vqIU5M+QAbpAhgh+0xhIkV2ykgXNaUNGBOkrPQ97L6XdnB
   A==;
X-CSE-ConnectionGUID: Qs4YfzmQRMWSEqXW25CVGw==
X-CSE-MsgGUID: 2kTj+Tn/R5eJo7yBsbHfsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9735874"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="9735874"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:30:43 -0700
X-CSE-ConnectionGUID: 365IZgBqSfui7v+Dvgp/fw==
X-CSE-MsgGUID: DiKeK3Q4SxCGFfjESkzewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="62929466"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:30:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: da7219-aad: fix usage of device_get_named_child_node()
Date: Fri, 26 Apr 2024 10:30:33 -0500
Message-Id: <20240426153033.38500-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QMRB7ZDJ2DQH6YERCP7EH3XDFXWIL5BI
X-Message-ID-Hash: QMRB7ZDJ2DQH6YERCP7EH3XDFXWIL5BI
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMRB7ZDJ2DQH6YERCP7EH3XDFXWIL5BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The documentation for device_get_named_child_node() mentions this
important point:

"
The caller is responsible for calling fwnode_handle_put() on the
returned fwnode pointer.
"

Add fwnode_handle_put() to avoid a leaked reference.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/da7219-aad.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 6bc068cdcbe2..15e5e3eb592b 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -671,8 +671,10 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct device *dev)
 		return NULL;
 
 	aad_pdata = devm_kzalloc(dev, sizeof(*aad_pdata), GFP_KERNEL);
-	if (!aad_pdata)
+	if (!aad_pdata) {
+		fwnode_handle_put(aad_np);
 		return NULL;
+	}
 
 	aad_pdata->irq = i2c->irq;
 
@@ -753,6 +755,8 @@ static struct da7219_aad_pdata *da7219_aad_fw_to_pdata(struct device *dev)
 	else
 		aad_pdata->adc_1bit_rpt = DA7219_AAD_ADC_1BIT_RPT_1;
 
+	fwnode_handle_put(aad_np);
+
 	return aad_pdata;
 }
 
-- 
2.40.1

