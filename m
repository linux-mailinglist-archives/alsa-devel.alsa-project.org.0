Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314F1742EA
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6FBB16F2;
	Sat, 29 Feb 2020 00:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6FBB16F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582931998;
	bh=PL2A75qbINYgID2XuTsKmzi3js+zfY9mLClnGXuzktI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cUhbvVB8lbPZhe5r07hrVjup9RL11dXieTShvIuny/H5A+oZssXvaNISOof3Qiqlz
	 TIlAHB9CdcSJaBjEkBA+d9HiMBvSHcLuXdroJX6UT+VcVNVaNBFrpCRBLCRSUaPWrx
	 Cp7DJylKjIC8rOtqCfJQ5H9Acx238le41JYczypk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C918F801F2;
	Sat, 29 Feb 2020 00:19:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5DCAF8016F; Sat, 29 Feb 2020 00:18:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38073F80086
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38073F80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="272826517"
Received: from billycla-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2020 15:18:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: updates for 5.7
Date: Fri, 28 Feb 2020 17:18:46 -0600
Message-Id: <20200228231850.9226-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

4 unrelated improvements grouped in one bundle.

Jaska Uimonen (1):
  ASoC: SOF: ipc: check ipc return value before data copy

Keyon Jie (2):
  ASoC: SOF: pcm: skip DMA buffer pre-allocation
  ASoC: SOF: Intel: hda-loader: clear the IPC ack bit after FW_PURGE
    done

Tomasz Lauda (1):
  ASoC: SOF: add core id to sof_ipc_comp

 include/sound/sof/topology.h     |  3 ++-
 include/uapi/sound/sof/abi.h     |  2 +-
 sound/soc/sof/intel/hda-loader.c |  6 ++++++
 sound/soc/sof/ipc.c              | 12 +++++++-----
 sound/soc/sof/pcm.c              |  6 ++----
 5 files changed, 18 insertions(+), 11 deletions(-)


base-commit: 6941b0b5f919e9839e8c25efaeb53854efee14e5
-- 
2.20.1

