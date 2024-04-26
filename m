Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B58B3B5E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92500BC0;
	Fri, 26 Apr 2024 17:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92500BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145253;
	bh=4wYpaW/veAtO2vwG8e0UooFeD5U0wu5kYAtQpfMg8eQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z9w+hbdNsOuzrNJ8nl/gvEa4ZAgiTqJD8fhBfdvSeFfBN40fR7ASxlu6It+U3WSVL
	 2kDMZ0gA7llVUOZ4J6L6EWR9nU1+UjhmOW0JPvZ7xMo6RSoGNbD3TRnMAzZ7P7XTCr
	 ROIx9lJpG1WZU/alTxN1dPxO7w6JAUEFrKYiNL0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE00F80673; Fri, 26 Apr 2024 17:26:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF6AF80654;
	Fri, 26 Apr 2024 17:26:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A707F805EF; Fri, 26 Apr 2024 17:25:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ADA8F8045D
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ADA8F8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j9+2oGat
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145146; x=1745681146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4wYpaW/veAtO2vwG8e0UooFeD5U0wu5kYAtQpfMg8eQ=;
  b=j9+2oGatmRX28OmvR7gCnjAzmlySKOYqYTzItLk+mTkJOyUYbew8JZqy
   EXRyWfqllz3yfnrLBSXy87vGEO7Sm6DFhhKiXomdnxkaiAviz0JDsK//J
   IBaJN9K8e6l21Lbo7ZKJopcvdsz9lO3IY+zDbfWiD/N2z1UmarkkhJGWb
   3mpG3oLjJXGHOn4pfgBuhkTd3EtwZUq4tXLjTtHEle/cEqKRTedIKpkUa
   PU0p96MfJtVwtz3d+m4t/PnzBpsyaXGVpNLMYdDPwbdVwH6YDTFtaio53
   Ir4dxcOBiAJ2mFxrz0dWCRH8WixK/SYTOkxJPX2gAglrsXseOL0dA8u9/
   Q==;
X-CSE-ConnectionGUID: /N88jGWoQ3uQ1ZpaV21cVw==
X-CSE-MsgGUID: Kv37tlmQRp+QC4zAx4ZJug==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291290"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291290"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:42 -0700
X-CSE-ConnectionGUID: Os5DUSiNSpKi7HJtCfW3yQ==
X-CSE-MsgGUID: cpzlOexZQH2Y5sy5QKMhEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259546"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/23] ASoC: Intel: sof_da7219: support MAX98390 on cml boards
Date: Fri, 26 Apr 2024 10:25:11 -0500
Message-Id: <20240426152529.38345-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5XVRTPQOSL7GCDTB7QSGAX6ORKWQTDNZ
X-Message-ID-Hash: 5XVRTPQOSL7GCDTB7QSGAX6ORKWQTDNZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XVRTPQOSL7GCDTB7QSGAX6ORKWQTDNZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

For cml boards, MAX98390 speaker amplifier is supported by machine
driver bxt_da7219_max98357a with sound card name cml_max98390_da7219.
Use same name for backward compatibility with existing devices on
market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 33 ++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 69555eee7c7a..0abb71a10a72 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -313,6 +313,7 @@ static int audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
+	char *card_name;
 	unsigned long board_quirk = 0;
 	int ret;
 
@@ -332,6 +333,21 @@ static int audio_probe(struct platform_device *pdev)
 	if (board_quirk & SOF_DA7219_CML_BOARD) {
 		/* overwrite the DAI link order for CML boards */
 		ctx->link_order_overwrite = CML_LINK_ORDER;
+
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_MAX98390:
+			card_name = devm_kstrdup(&pdev->dev,
+						 "cml_max98390_da7219",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
+			break;
+		default:
+			break;
+		}
 	} else if (board_quirk & SOF_DA7219_JSL_BOARD) {
 		ctx->da7219.is_jsl_board = true;
 
@@ -341,13 +357,20 @@ static int audio_probe(struct platform_device *pdev)
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
 		case CODEC_MAX98360A:
-			card_da7219.name = devm_kstrdup(&pdev->dev,
-							"da7219max98360a",
-							GFP_KERNEL);
+			card_name = devm_kstrdup(&pdev->dev, "da7219max98360a",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
 			break;
 		case CODEC_MAX98373:
-			card_da7219.name = devm_kstrdup(&pdev->dev, "da7219max",
-							GFP_KERNEL);
+			card_name = devm_kstrdup(&pdev->dev, "da7219max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
 			break;
 		default:
 			break;
-- 
2.40.1

