Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C9716640C
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 18:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CAB16D7;
	Thu, 20 Feb 2020 18:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CAB16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582218764;
	bh=Z/rvUrLQfqTxsUqzQBgEvOQyOlIfcEfwguufZAMrGHQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PrlVeQMCNKCBk1971Xvqj4epjFzfgDdZsXOPjF6i+47WSDmXQ/f0bUA4vVMP55pWe
	 h9pM3PqqpTwn08wvpT8tizEx8atpauA9gLHrydVeF87wACqGntxxwmNo1nZvknwZsv
	 a21TnB8j2UHHZDHpZJGJg7l91loHowA7Ev/nrTlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B33F8014A;
	Thu, 20 Feb 2020 18:11:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4D82F80114; Thu, 20 Feb 2020 18:10:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72124F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 18:10:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72124F80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="408849928"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 20 Feb 2020 09:10:32 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] SOF: Intel: hda: allow operation without i915 gfx
Date: Thu, 20 Feb 2020 19:10:26 +0200
Message-Id: <20200220171028.22023-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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
here's a pair of patches that fixes SOF HDA driver load
on devices that have:
 - digital mics connected to Intel HDA (so that SOF needs to
   be used instead of the legacy HDA driver), and
 - external GPU (internal i915 graphics not enabled)

Kai Vehmanen (2):
  ASoC: intel/skl/hda - add no-HDMI cases to generic HDA driver
  ASoC: SOF: Intel: hda: allow operation without i915 gfx

 sound/soc/intel/boards/skl_hda_dsp_common.h  |  4 ++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 25 ++++++++++++++++----
 sound/soc/sof/intel/hda-codec.c              | 11 ++++++++-
 sound/soc/sof/intel/hda.c                    | 22 +++++++----------
 4 files changed, 42 insertions(+), 20 deletions(-)

-- 
2.17.1

