Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD408B3B6F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A75192E;
	Fri, 26 Apr 2024 17:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A75192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145356;
	bh=PRGg5luhnmqlK1tlFztMwBxbOIOGfJoQrFyKkJT+oSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HjhIcCq4FIRT0Ia91TW9k5/V7YuzpxzRgxT07cf4Ujc1GWgOGndkOC7pyxLcXV038
	 qVcwJSO6dzrPuPfX9ksaPQwBdYnwtuCf15/c8JQlESSkVgPP3x/l4a6Lcn3EkrIW5x
	 w2CVlc3mlH395xmP3QWvvEXI8OETlwEq2jc/lf1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8420F8074C; Fri, 26 Apr 2024 17:26:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75166F80764;
	Fri, 26 Apr 2024 17:26:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D300F8057B; Fri, 26 Apr 2024 17:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C9FEF805C2
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C9FEF805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WtL9KiYd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145151; x=1745681151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRGg5luhnmqlK1tlFztMwBxbOIOGfJoQrFyKkJT+oSU=;
  b=WtL9KiYd2uYkj2lYqrwEHICxsQjJXP0D8VtNGCwWKwi0xnhNf0Z0yql9
   FjxbK8kWP4Ni3pXJMe3yCj/sGP3rHoreT7fmQUfco8KoXwgOYdhJqQec2
   H6X/tDGj1zoeXarUJBe0vO24yqe7OsMDwGA2mOPtg/Thm4Q28rmJfJu6E
   GZ+147GMrsz6VhQPPgMbsbcx6SsEfOrvI2fsuu/QY9/EU61XQEoRQXbMk
   TVKjkYTgKc2hV7eMPouq1na2Mh1LWXAecdaC6wq1gslZJLmhCEw/Nc8i9
   CvHGRJNaYHI2BVICCayIq5aAuBsb+9QFWShXv8HMHiNS//f7Atw66YCWc
   Q==;
X-CSE-ConnectionGUID: zS1HUbrZTdOxGek8De38nA==
X-CSE-MsgGUID: 6Vk5PeLxQLulQ10wLXnjsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291325"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291325"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:46 -0700
X-CSE-ConnectionGUID: sSsRKk1mTS6RwqTBSCr/Kg==
X-CSE-MsgGUID: /lUoq8JtQeG5Imf4hnWuhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259579"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/23] ASoC: Intel: sof_da7219: support MAX98357A on glk
 boards
Date: Fri, 26 Apr 2024 10:25:18 -0500
Message-Id: <20240426152529.38345-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QFLGHQDUSIJPZOHAFN3VUZDTNZPI2MXU
X-Message-ID-Hash: QFLGHQDUSIJPZOHAFN3VUZDTNZPI2MXU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFLGHQDUSIJPZOHAFN3VUZDTNZPI2MXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

For glk boards, MAX98357A speaker amplifier is supported by machine
driver bxt_da7219_max98357a with sound card name glkda7219max. Use
same name for backward compatibility with existing devices on market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index cc5e99b21456..d7b605896f89 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -348,6 +348,20 @@ static int audio_probe(struct platform_device *pdev)
 
 		/* overwrite the DAI link order for GLK boards */
 		ctx->link_order_overwrite = GLK_LINK_ORDER;
+
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_MAX98357A:
+			card_name = devm_kstrdup(&pdev->dev, "glkda7219max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
+			break;
+		default:
+			break;
+		}
 	} else if (board_quirk & SOF_DA7219_CML_BOARD) {
 		/* overwrite the DAI link order for CML boards */
 		ctx->link_order_overwrite = CML_LINK_ORDER;
-- 
2.40.1

