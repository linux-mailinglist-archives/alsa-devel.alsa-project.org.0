Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1C17E560
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:09:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D511A168A;
	Mon,  9 Mar 2020 18:08:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D511A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583773785;
	bh=VIvtGrdUEz/Zc4u55LcCB9bQzpnCU+rZcLJv8/zrrjI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vYPi26B7clLDnrPrqfSRvmoEOrS3H3sBTxAWrAMsz5FMHskl3B7k0qp1OmVheEtqi
	 DzMI6+n93k8+IZW4euq24Qwc30Xc40033vLdduilqmdEThPSXDLfLE1Pj/0Df3mIsm
	 5Xxen3gj2ihLLJSdTo4welpHonRzyIoVFnKZBXWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED25F8021D;
	Mon,  9 Mar 2020 18:08:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3740AF800DA; Mon,  9 Mar 2020 18:08:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F5B7F800DA;
 Mon,  9 Mar 2020 18:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F5B7F800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="353408506"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2020 10:07:51 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] [RESEND] ASoC: SOF: preparatory patches
Date: Mon,  9 Mar 2020 18:07:46 +0100
Message-Id: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

This is the first set of patches for the SOF virtualisation work. We
send these patches first because they touch the ASoC core. 2 of them
are mostly cosmetic with no functional changes, but patch 2/3 might
cause some discussions. Please review and comment.

Thanks
Guennadi

Guennadi Liakhovetski (3):
  ASoC: (cosmetic) simplify dpcm_prune_paths()
  ASoC: add function parameters to enable forced path pruning
  ASoC: export DPCM runtime update functions

 include/sound/soc-dpcm.h |  30 ++++++++---
 sound/soc/soc-compress.c |   2 +-
 sound/soc/soc-dapm.c     |   8 +--
 sound/soc/soc-pcm.c      | 130 +++++++++++++++++++++++++++++------------------
 4 files changed, 109 insertions(+), 61 deletions(-)

-- 
1.9.3

