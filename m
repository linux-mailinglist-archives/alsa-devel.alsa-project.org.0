Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB767D00BA
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:36:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A56201;
	Thu, 19 Oct 2023 19:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A56201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697736982;
	bh=x718vvAoB7ipJ4dHZnjgsfUv5as7aZ/6AxxmRJN+rqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PywR++JZo0H4sGCwjE37ty1lFiiPHeXs46kKstfXRWzn+Q4CaoiMS8qZdtrocpPCk
	 LYjaFywwW7R1I97IQiPotf2jI6JjQ0svUMfrTxuGQDAHwN5FOTvj7ENWlmUyfoKwrr
	 Ci8B4v4cE12wlvvVIDfGWzYtbMDeVKjiExExGcIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30113F8057E; Thu, 19 Oct 2023 19:34:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE26FF80568;
	Thu, 19 Oct 2023 19:34:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59EEBF8055B; Thu, 19 Oct 2023 19:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9B8FF80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B8FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DXzXjJTv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736871; x=1729272871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x718vvAoB7ipJ4dHZnjgsfUv5as7aZ/6AxxmRJN+rqg=;
  b=DXzXjJTvgry64w/erBd76oRFy6arVAFagvZF/wE8A883NLkSKksNk9vi
   QHkAHyFfMzq8bJeAlXm3CdnNA+OERr+NVN8Gi5hhHaAzjPMjP+iWrnaJ0
   EkmtVez9b+54FtFqNReA6zvNoJh82fSQ5kKKxrDqgP6FfMxRIZkX6fjSv
   AE3FTBiiMsYidNYBEJzR39uWGxDuCrkEGu96Aw9wRsuXifoBqWXsc3zgN
   JKhTlkskcOvNLz6RE0o2u3w+v/jCMtYilG7lnbWQAaOnzSUTdM7/zYCp/
   eF6Z3/luDigcvgqlKLbOvBsq+tj9VgkS/zvdS3yTPNBpKcQqLORGIX1mg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884306"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884306"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090610"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090610"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/10] ASoC: intel: sof_sdw: Stop processing CODECs when
 enough are found
Date: Thu, 19 Oct 2023 12:34:02 -0500
Message-Id: <20231019173411.166759-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QCIP67QPXM3UQD4GREMPTKJFTMV3DR2V
X-Message-ID-Hash: QCIP67QPXM3UQD4GREMPTKJFTMV3DR2V
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCIP67QPXM3UQD4GREMPTKJFTMV3DR2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

When adding CODECs to a DAI link, the code should stop processing more
CODECs when the expected number of CODECs are discovered. This fixes a
small corner case issue introduced when support for different devices
on the same SoundWire link was added. In the case of aggregated
devices everything is fine, as all devices intended for the DAI link
will be marked with the same group and any not intended for that DAI
are skipped by the group check. However for non-aggregated devices the
group check is bypassed and the current code does not stop after it
has found the first device. Meaning if additional non-aggregated devices
are present on the same SoundWire link they will be erroneously added
into the DAI link.

Fix this issue, and provide a small optimisation by ceasing to process
devices once we have reached the required number of devices for the
current DAI link.

Fixes: 317dcdecaf7a ("ASoC: intel: sof_sdw: Allow different devices on the same link")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index c5d555cc6f8e..ad1d01ebbcd9 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1409,7 +1409,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			continue;
 
 		/* j reset after loop, adr_index only applies to first link */
-		for (; j < adr_link_next->num_adr; j++) {
+		for (; j < adr_link_next->num_adr && codec_dlc_index < codec_num; j++) {
 			const struct snd_soc_acpi_endpoint *endpoints;
 
 			endpoints = adr_link_next->adr_d[j].endpoints;
-- 
2.39.2

