Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5CC720AA1
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE4284B;
	Fri,  2 Jun 2023 22:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE4284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739505;
	bh=0M18SAN0WOJMus78yFNG1qQ3mJAUeJr/WzvJ8lyBkGw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=heM6DNd3gzmcyQ6SUIJE3t+reGhYSrHo4+4ejz77NWcI963flDM6TmFyGDNy6dIYZ
	 GONlw1HgnGIAVhDDbA8wv9r0rItsvD9QBSQmxYTnUWvCNebUgDl+4u9qSD/hQr+f9Z
	 BNd/Zw55ulS3DAacom5cox0INU7+dSsWN/vrmDg8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A234BF800C1; Fri,  2 Jun 2023 22:56:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDCCDF800C1;
	Fri,  2 Jun 2023 22:56:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FFD2F8016B; Fri,  2 Jun 2023 22:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7798EF800ED
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7798EF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XM9QM4yj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739398; x=1717275398;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0M18SAN0WOJMus78yFNG1qQ3mJAUeJr/WzvJ8lyBkGw=;
  b=XM9QM4yjX7866XBcNK3GD3c0Cj0oBn203N3w9G2CUIfrVj+oZCAIHwMO
   +JAdU2t1oXeMXAoUWDYxv9NVvJeTt/Vpp/hk+JE9Cw3Mqq/9Hb0SU4mho
   /doBsVsugdR5UVMSVjqRfW2t6qPNWYRHacuMQjzQjr2uwIDeyBCLX1yBR
   NcdwOIwtJRIdkAbVib6YYq/lttpOOqC0e+od7f1V4mpD1ipkft64sExnb
   EnJaSJCmdPknkpPgrXNPaElpcyBoSwDLwaphHm+D/Yi3OplU/YZJsqRLi
   ixmvrpOQ5iqQKXswgMtwK7daDS7SHlil0tyzLCyN3Cm3ETOnz/UJPfEvG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272074"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272074"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092674"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092674"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/9] ASoC: SOF: Intel: LunarLake preparation patches
Date: Fri,  2 Jun 2023 15:56:11 -0500
Message-Id: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A2ZPIAQS5BW4U76A5ZHPZM5TV4A5SOA2
X-Message-ID-Hash: A2ZPIAQS5BW4U76A5ZHPZM5TV4A5SOA2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2ZPIAQS5BW4U76A5ZHPZM5TV4A5SOA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds the changes required for the hda-dai extension to
deal with SSSP/DMIC/SoundWire starting with LunarLake, as well as the
new TLV IPC to provide the DMA stream_tag to the DSP firmware.

LunarLake support for SSP/DMIC is ready but is gated by the patch
"ASoC: SOF: Intel: shim: add enum for ACE 2.0 IP used in LunarLake"
currently only present in the SoundWire tree.

Pierre-Louis Bossart (9):
  ASoC: SOF: Intel: hda-dai: add error checks to prevent static analysis
    warnings
  ASoC: SOF: Intel: hda-dai: add codec_dai_set_stream callback
  ASoC: SOF: Intel: hda-dai: add calc_stream_format callback
  ASoC: SOF: Intel: hda-dai: add get_hlink callback
  ASoC: SOF: ipc4-topology: extend ALH-specific data structure
  ASoC: SOF: ipc4-topology: introduce DMA config TLV
  ASoC: SOF: ipc4-topology: add DMA config TLV to IPC data
  ASoC: SOF: Intel: mtl: prepare for code reuse
  ASoC: SOF: Intel: hda: add helper to extract SoundWire link count

 sound/soc/sof/intel/hda-dai-ops.c | 58 ++++++++++++++++++++++-
 sound/soc/sof/intel/hda-dai.c     | 64 +++++++++++---------------
 sound/soc/sof/intel/hda.c         | 25 ++++++++++
 sound/soc/sof/intel/hda.h         | 19 ++++++++
 sound/soc/sof/intel/mtl.c         | 12 ++---
 sound/soc/sof/intel/mtl.h         |  7 +++
 sound/soc/sof/ipc4-topology.c     | 44 ++++++++++++++----
 sound/soc/sof/ipc4-topology.h     | 76 +++++++++++++++++++++++++------
 8 files changed, 239 insertions(+), 66 deletions(-)

-- 
2.37.2

