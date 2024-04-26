Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5268B3B65
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9A014E9;
	Fri, 26 Apr 2024 17:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9A014E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145290;
	bh=F46Iv1zuto1wmnP8krweutl1d2vtjDUnvjUVa+cEXyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lSk2u/TSBlAO+1CrjlYn0EiEtLYKrYDlCjqP28KWtd3hxEqfGtOVF1AEUPk5eo2Fj
	 deXA6wox1udklx60rqqkoILuTFx0H76GbpOGRjUszDXetLUTsh7GEc8Ugvhp43UGMg
	 +UikF+jKdN8msVAYzf+PmdZFleHAD+IRl0jUYWb4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 025A6F806AF; Fri, 26 Apr 2024 17:26:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEE8F806AA;
	Fri, 26 Apr 2024 17:26:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 899F5F805F9; Fri, 26 Apr 2024 17:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6800DF805BA
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6800DF805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KZWVdRSh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145149; x=1745681149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F46Iv1zuto1wmnP8krweutl1d2vtjDUnvjUVa+cEXyk=;
  b=KZWVdRShSF/UEQjIWFM+llZPBRvdEYfsQ9Zj9d5/QU2kWGTpx8sDx9Fv
   zJtUORzXUu84s1Jyn9pbXLFmziEujzBh00rqlQE6I/9muqccT4WPGO2bU
   xZvNtFENCRugsvfTBXOp4DYlLSjHaSiH6xHjCF20yBRGhuAqi7LGRsSGk
   lgyPDj491DMfhlnhTxwjXTnBqy0GZRPq/oxTbe3PO/LyXqziw4VntijZl
   DkFprJzs0aykVPIDkD6wdr+X9QFh9hurQPN2VK/kOA3o45zuGcRfxRRdQ
   Ro6ABXFobJc4/s5fPBAGmI110SFRadBei5vwPU77gGuKwX0qilFZA/P/y
   Q==;
X-CSE-ConnectionGUID: r3VMwgLpQ7+rqb76raMELg==
X-CSE-MsgGUID: tKUJDUjgTour2bKSlDLOVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291312"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:45 -0700
X-CSE-ConnectionGUID: KT5Ik3KkQZ2dSsk+SMsOGA==
X-CSE-MsgGUID: 8R787wyDQZib8uuBli9Xbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259563"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/23] ASoC: Intel: sof_da7219: support MAX98357A on cml
 boards
Date: Fri, 26 Apr 2024 10:25:15 -0500
Message-Id: <20240426152529.38345-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D7ULXQMBIAPVV7JTND5ZPIX7KUHFIQYV
X-Message-ID-Hash: D7ULXQMBIAPVV7JTND5ZPIX7KUHFIQYV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7ULXQMBIAPVV7JTND5ZPIX7KUHFIQYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

For cml boards, MAX98357A speaker amplifier is supported by machine
driver bxt_da7219_max98357a with sound card name cmlda7219max. Use
same name for backward compatibility with existing devices on market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 610b5a8e0860..ecb1d4b25ea6 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -339,6 +339,14 @@ static int audio_probe(struct platform_device *pdev)
 
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
+		case CODEC_MAX98357A:
+			card_name = devm_kstrdup(&pdev->dev, "cmlda7219max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
+			break;
 		case CODEC_MAX98390:
 			card_name = devm_kstrdup(&pdev->dev,
 						 "cml_max98390_da7219",
-- 
2.40.1

