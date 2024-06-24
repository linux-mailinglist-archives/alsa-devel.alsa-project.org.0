Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F8391496C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA36B6A;
	Mon, 24 Jun 2024 14:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA36B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231149;
	bh=eKR4UMvmeTLd+anS9f6YYfklV3EDalMCO5Nwb3ZoiP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j4CCLkrhNQUUjH6lS13r6oqKZ8iGek3CrShH9pHoGF35wA8ko9z8wjjnNxFEx0Fn0
	 fwZaTSszswSORyz4WW6r98msIVNlXkLZXeYEYwO9Gk5ZaXR8+tzPqLH6ydi3AY/6gE
	 nj3XonU03+Sj+WGBwZrs+pb3zovbK/2ULkW6OFYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4068F805E1; Mon, 24 Jun 2024 14:11:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8E1AF805C9;
	Mon, 24 Jun 2024 14:11:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFEBAF8049C; Mon, 24 Jun 2024 14:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7077CF800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7077CF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NeYlOgu1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231099; x=1750767099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eKR4UMvmeTLd+anS9f6YYfklV3EDalMCO5Nwb3ZoiP8=;
  b=NeYlOgu1QfSDIJ778V1xDrWkSpzrQzhLaqnJKl3DY0vzjBb7E58vtXfZ
   +bqahd3LOyWcikKabbnYgjcmAqMji58L6KizqlB/sKzbTGaAaxDHLnRF3
   q5hWAVWRll8JpdW8Fz3eJ2M62i6cR8rzO/FOxrhhwm5gxKpbaN3jfx+DF
   XG4lkw8IG6+pS6iYj7yeRMxVaD6EoHqJ27xbdVjgvUERBfBTLZbPXLra1
   F+NkzWcpbK2VdfbZgAvitA+JYwCeMZTzYeIpEJQSuwpzXGCwjunWKfzG5
   zbhKzW4ATbFp2fWYP6LtNyYagIuMEu0k5jOz8a/b5kflXMi22lzgmAyrH
   Q==;
X-CSE-ConnectionGUID: oT9l4uyMQ6uJpbHP8dN9cw==
X-CSE-MsgGUID: KOriH+jES/SoPDQvrjZkfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15887537"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15887537"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:35 -0700
X-CSE-ConnectionGUID: emiwiWU7R6+8Vwj9YUQlFQ==
X-CSE-MsgGUID: qbks1TvfTx6vbjaMDC8leg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43091208"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:11:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/4] ASoC: Intel: sof_sdw: fix jack detection on ADL-N variant
 RVP
Date: Mon, 24 Jun 2024 14:11:16 +0200
Message-ID: <20240624121119.91552-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OORXQVCK25EYDTMT3TVV4H77XOE6AWMD
X-Message-ID-Hash: OORXQVCK25EYDTMT3TVV4H77XOE6AWMD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OORXQVCK25EYDTMT3TVV4H77XOE6AWMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Experimental tests show that JD2_100K is required, otherwise the jack
is detected always even with nothing plugged-in.

To avoid matching with other known quirks the SKU information is used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b646b32dd311..89b92a061489 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -277,6 +277,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0000000000070000"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2_100K),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

