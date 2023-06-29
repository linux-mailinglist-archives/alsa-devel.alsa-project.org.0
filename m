Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5F7424BC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 13:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66679850;
	Thu, 29 Jun 2023 13:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66679850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688036947;
	bh=+1hh7z8Plma8y/dgqxPR9YkNABbNeFEjlIJEOrPHGc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YLGY0SKAmLWc/3DV1BnWAmNigSP/OQQysfhocGW0vET/cTKc5CRgtVtRLaWD1qZax
	 ADea2SQqKgm9ylVD99eAaU4eAsIhVs0IWjJNSa5EeCy14yf50cABVCsWVpVDAYmJHO
	 RmkCQJiioGIEhCxOOuHgrGVceka5tqrBDEq3insw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC460F80580; Thu, 29 Jun 2023 13:07:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E2E9F8056F;
	Thu, 29 Jun 2023 13:07:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7DB9F80551; Thu, 29 Jun 2023 13:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5E2DF80548
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 13:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E2DF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ETbM0791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688036827; x=1719572827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+1hh7z8Plma8y/dgqxPR9YkNABbNeFEjlIJEOrPHGc0=;
  b=ETbM07914brLxlw8k3a41ptyzzB/+atHTjRy6q29oY4/Sou4HH8JWl8w
   eLF5z7chvI7iApyO/zK65LV/CC9uHD+CVP7VrEp0B2gLCh/Nlf2POCOIj
   HVN3Ob0RzuXN9Y5/kwdy/LPC/c/AbFFTGttDBGmDgDc19FtvptjiuPjiO
   9NaHH/Yorq9j4RehdIfvABCe6Q51eEfCJ/zKBLNBzT6PwZXmYKLd8fj+j
   pDsJkIM6LylDGCxEBY8YsZc+GA5FgX7rPbvbidRXSnv2aNsKC/45+pqeR
   h5dtkEWUtsBYQeonuoxI3zsfjvD/NynQdt7rd4OF0c/A09X7OkU0UmPm5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365543628"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="365543628"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 04:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="1047732721"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="1047732721"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jun 2023 04:07:00 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	zhuning@everest-semi.com,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/8] ASoC: Intel: avs: Load es8336 board on KBL-based
 platforms
Date: Thu, 29 Jun 2023 13:24:45 +0200
Message-Id: <20230629112449.1755928-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230629112449.1755928-1-cezary.rojewski@intel.com>
References: <20230629112449.1755928-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7AR55C3KVSU7G3YO43XFYMPLUEENL2QL
X-Message-ID-Hash: 7AR55C3KVSU7G3YO43XFYMPLUEENL2QL
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AR55C3KVSU7G3YO43XFYMPLUEENL2QL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update board-selection tables to account for es8336 on KBL-based
platforms.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 60f8fb0bff95..5dc55f14b5a3 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -159,6 +159,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "da7219-tplg.bin",
 	},
+	{
+		.id = "ESSX8336",
+		.drv_name = "avs_es8336",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0),
+		},
+		.tplg_filename = "es8336-tplg.bin",
+	},
 	{},
 };
 
-- 
2.25.1

