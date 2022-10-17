Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B346601A96
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 22:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7AAE8AB9;
	Mon, 17 Oct 2022 22:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7AAE8AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666039855;
	bh=iebYlCjxf/hqyAWqZVYXguKr6E9UzKSoFuDqR+lmxWU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r64nLUjYvEH4DBWhnCazvP/PP2/PlG3H8IYRTjBTaruuFRUApyLgb6V2NyQ229Uzh
	 inizJnWb6oN0asLPSR9RoIVeY75nPhEbhe3psHiS8e6P9YfduFZlE7UJ4EIom3Bxhu
	 6sGc+O7lJAVvOwWh8gn+O/lyI4cJUeXbMILY7ePI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F808F804AD;
	Mon, 17 Oct 2022 22:50:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58E39F804AD; Mon, 17 Oct 2022 22:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 431FCF80149
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 22:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 431FCF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dJMhX646"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666039796; x=1697575796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iebYlCjxf/hqyAWqZVYXguKr6E9UzKSoFuDqR+lmxWU=;
 b=dJMhX646WnDX/KiMNpqmK0F4IJXEe4R5dk1uXGQhW6a+Xf1ltuXYf97M
 cAGJ1E0C2YVWVd/5uODG4Vl/FfIIQYMbddbffPftQdIZ5lFnprEMNkpXl
 +6YiQ2373d0pdYNfsugudYjssfir71m57lVCr/OuS/xNVLKJfcQmyV4dB
 Yy2A0G2VUvdktE3UN146ILhRjN7fECCAkUZjpnY3JiwmRSTOKTe40ox3d
 qwgK5YfHHxLBDjH2aKiPB1nEwzPQ8sgq0rqR0enQqNFoPlxoU9V1gpQUO
 bjAwTc97rHt9AXwBhLFZdkWSZjVMvObNHm7XF7tUkCbnBSfVZFORAwWTE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293286371"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="293286371"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:49:52 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="717633045"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; d="scan'208";a="717633045"
Received: from cmontgom-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.140])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 13:49:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: Intel/SOF: simplify S3 resume flows
Date: Mon, 17 Oct 2022 15:49:43 -0500
Message-Id: <20221017204946.207986-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

All Intel drivers for cAVS platforms contain a sequence for S3 resume
which doesn't seem justified nor necessary. Forensic Git investigation
in internal repositories did not provide any rationale for the
implementation, and tests show no impact when those sequences are
removed.

This sequence was identified as problematic during a large HDaudio
cleanup where all programming sequences were revisited before
extensions are added.

Pierre-Louis Bossart (3):
  ASoC: Intel: Skylake: simplify S3 resume flows
  ASoC: Intel: avs: simplify S3 resume flows
  ASoC: SOF: Intel: hda-dsp: simplify S3 resume flows

 sound/soc/intel/avs/core.c    | 11 -----------
 sound/soc/intel/skylake/skl.c |  9 ---------
 sound/soc/sof/intel/hda-dsp.c | 14 --------------
 3 files changed, 34 deletions(-)

-- 
2.34.1

