Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE9571AF0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 15:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14DAD16AE;
	Tue, 12 Jul 2022 15:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14DAD16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657631806;
	bh=3JZeLvEqLA7HCay7Ye9tZnByF/msBgijiCPFkf2CVKA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hFeOYpRyTK6n4h1nLk00olpG/ZkAbklnchB5LG1xxg/UWrtLhi/Dx1rpmMF1t4Ks3
	 Lo5AGdW6HajggESbsaHKZvHCK5UcpDfnsaIQdKkXPFBTo8LVSwJKnoA8jyV80sUyZS
	 gIuDD3h0bhYJemPCrlkfHd5+Rt1JTIFITyJscrRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A141F80279;
	Tue, 12 Jul 2022 15:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6AFCF800E8; Tue, 12 Jul 2022 15:15:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 827D6F800E8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 15:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 827D6F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="i39v6meI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657631741; x=1689167741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3JZeLvEqLA7HCay7Ye9tZnByF/msBgijiCPFkf2CVKA=;
 b=i39v6meI+jhByWCCW4cQNc8J3aq9REMienE+hrAwmdZhtQsJrZGDSMF7
 srZSncCzr2rO5R+Ed4J3xvSmACDkGm2bKaRKpKn5mrD/EbToYRW4Gierz
 6UAhg5ioEil8cL5E9gymTVcEtS5hHvJSAKZVha1jCg8SAL/EL3epaAh32
 kt6gCSBqfVhnCR5ut9aLMaSzmiuiY3dTucI9lK/LrBTNmONuJX2wZgrXK
 r+yV9BBMGJzd+IK0scM3zy+K/nt02nBFS6Eme8xrByBB55lqR32WPZnRM
 Z+DJSLf66ly9Ier1T+m0Sm1sUV7bLufY2fXVbmT+B+ACxi/hDRLxN02N4 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285671084"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="285671084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:15:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545421024"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:15:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: Intel: hda-dai: No need to decouple host/link
 DMA twice
Date: Tue, 12 Jul 2022 16:16:18 +0300
Message-Id: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

There is no need to decouple a decoupled stream twice.
Keep the decoupling in hda_link_stream_assign() only as it is going to be
executed in all cases.

Drop the outdated comment from hda_link_dma_hw_params() as well since the code
has changed around it.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: Intel: hda-dai: Drop misleading comment regarding dma_data
  ASoC: SOF: Intel: hda-dai: Do snd_hdac_ext_stream_decouple() only once

 sound/soc/sof/intel/hda-dai.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

-- 
2.37.0

