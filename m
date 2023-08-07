Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053BE7730FA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36880832;
	Mon,  7 Aug 2023 23:12:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36880832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442782;
	bh=cdEqb9O4vKPRDAh3d2RBk3KjX1nJYnHsSnOp3sS8W64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFt/dMvT8JDgjajohQsY9HC98N12eq42zpDOV0Zr72JQ5znv0QMi+mOrcCuBimBoO
	 /B+9FeWq0/xACikm0/fNz1mSePfOEUPDCJFWOLlscjdrdRLu8IBGVW6b3gfnLnwVnM
	 snD67SBVRdiakEwjRRXsVVadRN+zjiqxvIkoQspg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6E8EF80551; Mon,  7 Aug 2023 23:10:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FC05F80551;
	Mon,  7 Aug 2023 23:10:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3C61F80571; Mon,  7 Aug 2023 23:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC52DF80534
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC52DF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QqkSpuU0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442619; x=1722978619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cdEqb9O4vKPRDAh3d2RBk3KjX1nJYnHsSnOp3sS8W64=;
  b=QqkSpuU0LN2PUikVnqTRj0KRwc0z1nfi4gMcULbCmJI6I+JxWysnU48z
   Wi2gRia1KF/OEnmA8Hkq9MNkISKW3vLKZNdTsfThXrx24+AtxkewkFOP2
   wIuDk9xsvxp3TmMjleGaqG4W/E7bqykFmCS1TCEhOTZ/0ZZfx1xoleSEc
   vtyrHL9dED25MrDKkUhMUEm20vIz+dtNwov5J4eTsXV+GZyk0gvV1GrB7
   zYbchL8V024gg5yms/H+pDjeSdVP1KcO9HumUVjJHlWcZ4MimqssnTeHF
   GtKPSPvVofLIgEKb2zyw2JEsa/3zntwxK6NtqgLSOKMdsxwAKcAE6o0p9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244325"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244325"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465182"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465182"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 05/20] ASoC: SOF: Intel: hda: add interface definitions for
 ACE2.x
Date: Mon,  7 Aug 2023 16:09:44 -0500
Message-Id: <20230807210959.506849-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UIXFSTYZPBATURJGDRDHKS4SJ2FWTSAG
X-Message-ID-Hash: UIXFSTYZPBATURJGDRDHKS4SJ2FWTSAG
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All interfaces are accessible without the DSP and rely on the HDaudio
DMA only.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 64bebe1a72bb..6074b0ca13aa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -71,6 +71,11 @@ static u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
 				    BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
 		interface_mask[1] = BIT(SOF_DAI_INTEL_HDA);
 		break;
+	case SOF_INTEL_ACE_2_0:
+		interface_mask[0] = BIT(SOF_DAI_INTEL_SSP) | BIT(SOF_DAI_INTEL_DMIC) |
+				    BIT(SOF_DAI_INTEL_HDA) | BIT(SOF_DAI_INTEL_ALH);
+		interface_mask[1] = interface_mask[0]; /* all interfaces accessible without DSP */
+		break;
 	default:
 		break;
 	}
-- 
2.39.2

