Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACC6694F2
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:03:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC79A706;
	Fri, 13 Jan 2023 12:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC79A706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673607800;
	bh=wnkkKmvfCsJyTJzr7CXn/P5H4NR6N1WzmQcgVrV6FRg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Z8bCSe5SDeJw+/fzI5Ur0NtHtfEWiaN7bh4A5UBc2U3ZX/gQ06aHapZLc0P711+0q
	 AX8L+B/nDlObeeQw94Bg6bE7MgjQBR/fIdYraRR6BNBEZ2N7XE8Ys/rEv+1MteXSzd
	 LxmomL45JqWT8SlBJ7lEgsWpSOR+SEQsHkd5pZB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA79F8026D;
	Fri, 13 Jan 2023 12:02:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 699DCF8030F; Fri, 13 Jan 2023 12:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAB66F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAB66F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B3wnYle1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673607739; x=1705143739;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wnkkKmvfCsJyTJzr7CXn/P5H4NR6N1WzmQcgVrV6FRg=;
 b=B3wnYle1Ytcy0alddD7N4pDEM4xrg3vZRQ8aabnuGuQ/l9qvpDuOfLAn
 JYPMve8aOL+wJ6hoymnAyMpVsPeMziBOYt+fs7HAParGRNrna5VZsLDbQ
 bOr72VAlxIId9xji3xxdpUPR3UcNZqDO5CUfaAPmGd5s+lw9l0z24xR2W
 IUFQZmi+MvxGxcddCqiPl+lwyl7xsXH35qvCNYsyKNCAKcICzMQGEj5Po
 Jt9QZvMusc0K/IoaoN45zbd6FRz059zwgV4lOGOKnpHvhzOj3CgcXdbJt
 Rsf/GCV9Bh/sKV/s3Mri8OGdiBuWM5mbROuUvObEchACp37+eemsF80oq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="325228470"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="325228470"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="832039876"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="832039876"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2023 03:02:12 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] Fixes for avs driver
Date: Fri, 13 Jan 2023 20:03:07 +0100
Message-Id: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

First patch fixes problems reported when performing shutdown. Second one
is for a problem reported by LKP. Last one fixes problem reported by
checkpatch.

Amadeusz Sławiński (3):
  ASoC: Intel: avs: Implement PCI shutdown
  ASoC: Intel: avs: Correctly access topology fiels
  ASoC: Intel: avs: Use min_t instead of min with cast

 sound/soc/intel/avs/core.c     | 24 ++++++++++++++++++++++++
 sound/soc/intel/avs/topology.c |  2 +-
 sound/soc/intel/avs/trace.c    |  2 +-
 3 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.25.1

