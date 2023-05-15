Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7414F702A8C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A25991EC;
	Mon, 15 May 2023 12:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A25991EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684146832;
	bh=R4qU0YTuTKM7FvQM5dGScjM6piR3BXm6sCMbjNBuabQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R/uc04u8pPUYOg0x16snMcvkqKIKIlV1LunYW4XCiNnCG1oQCu1E3b6lWfx1ISwdH
	 oBJLRxyjRHzxVA77GZQE9NuSiy/HvA1wmaOQ1glKaIGqtAUpE1ZldZWvfYHZCkhXj9
	 bKoRKdpHI4YdOzjXf1+qF/i0mnzjk48gsUxvEGVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 861CEF80542; Mon, 15 May 2023 12:33:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BC9F8053D;
	Mon, 15 May 2023 12:32:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FF22F8053D; Mon, 15 May 2023 12:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BEA7F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BEA7F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HZO9D7CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684146768; x=1715682768;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R4qU0YTuTKM7FvQM5dGScjM6piR3BXm6sCMbjNBuabQ=;
  b=HZO9D7CCUuVIRnbjnEkOyUzbkrqTfuxwfvKhPknNQsjxO3dnrWMdR2lK
   NuNouVUGoFqppbPZlF/adZH+cJ/8GHVkWfYBvZLCzVIg3Z5FEUj/yvlvw
   OVYdJvZ95iCU+Yd+1KZIx+q9+hZEZwmPF1ZKFyjZTqj5cGaZ9+yz9QAmS
   uh6OMC9U8f7ojsCDRaMnX3pKH4IB7+pN0VX4HVkuwDmzde2O3aRaAFoHb
   w4Oz7CEQGqDsqVBoAx6HuGsvHLyx3Ut8x4pBqtUstwda0jFuPAXC30ymL
   8ioi1fVzFskIEgQIqKxSVtB48lYP5MAXqlXY7E77HKx4cYPuBhXx/A+1P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="351200332"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="351200332"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694967626"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="694967626"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 03:32:41 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/9] ASoC: SOF: ipc4-topology: Improve the audio format
 selection logic
Date: Mon, 15 May 2023 13:33:27 +0300
Message-Id: <20230515103336.16132-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MNKKUQVL63BULM3SRWOCGYXJ7MBSCDAH
X-Message-ID-Hash: MNKKUQVL63BULM3SRWOCGYXJ7MBSCDAH
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MNKKUQVL63BULM3SRWOCGYXJ7MBSCDAH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Improve the logic to account for the current restrictions in topology while
making it extensible for future topology modifications.

The current topology definitions assume that input/output formats come in pairs.
For example even if there's only 1 output format for a module, we add 3 output
formats to match that of the input format count with the same parameters.
This is unnecessary but we have to deal with it until the topologies are
modified.

Additionally, choosing the input/output audio format should depend only on the
pipeline params or the runtime FE hw_params depending on where the module is in
the pipeline.
This PR modifies the logic for selection based on this and removes unnecessary
dependencies between the input and output formats.

Regards,
Peter
---
Ranjani Sridharan (9):
  ASoC: SOF: ipc4-topology: Handle input/output audio format special
    case
  ASoC: SOF: ipc4-topology: Add a helper function for output format
    selection
  ASoC: SOF: ipc4-topology: Move the call to init output format
  ASoC: SOF: ipc4-topology: Rename sof_ipc4_init_audio_fmt()
  ASoC: SOF: ipc4-topology: Handle output format special case
  ASoC: SOF: ipc4-topology: Add a new helper function to get the valid
    bits
  ASoC: SOF: ipc4-topology: Modify the output format selection logic
  ASoC: SOF: ipc4-topology: New helper to check if all output formats
    are the same
  ASoC: SOF: ipc4-topology: Modify input audio format selection logic

 sound/soc/sof/ipc4-topology.c | 358 ++++++++++++++++++++++------------
 1 file changed, 237 insertions(+), 121 deletions(-)

-- 
2.40.1

