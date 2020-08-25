Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7F252492
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 02:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCF161683;
	Wed, 26 Aug 2020 02:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCF161683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598400100;
	bh=1wcaUOJJoKz2m6/uHfPfN75XCW4jqoF43KohD8lKT0g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Isk9GsCq2TEbjE5jFX93pA06OlAyzX/35qm18rZk6G64Q28N2kgWMf1nzsPFR7szm
	 r+No960jIksMpfA12lDRPJ0ArdAJd8LLR/pqX/akJrUm9CSkDFs6Yk5l36aCDKBER8
	 fyUXU0VENyUZaKYA9qsg8zt3iIDioB6CmPwpmTfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D62F8027B;
	Wed, 26 Aug 2020 01:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C50EF800D1; Wed, 26 Aug 2020 01:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3844BF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3844BF800EB
IronPort-SDR: Uy38xjTGAhA/GdHFVFRFXQKtmyGahEgNbGy7/r65s5VNaoi+RwPty6eDEtK4e1C+Y+02EWB69+
 pa15Jxjny+sA==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="135764548"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="135764548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:02 -0700
IronPort-SDR: lTjVCbFPV53dwmHd6GP1n8DEhMTrA6aCk4W17OQUOFPkrPG5H7HvkEqgxvzM0dbYpnai8d0EsW
 PWn9wPqDoFSg==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="474558899"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:59:01 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] SOF FW loader fixes and updates
Date: Tue, 25 Aug 2020 16:58:50 -0700
Message-Id: <20200825235854.1588034-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This series includes fixes and updates to the SOF firmware loader.

Iulian Olaru (1):
  ASoC: SOF: loader: Add debug box region

Karol Trzcinski (2):
  ASoC: SOF: IPC: make sof_ipc_window monosized
  ASoC: SOF: ext_manifest: Parse debug ABI version

Pierre-Louis Bossart (1):
  ASoC: SOF: loader: fix memory leak in get_ext_windows

 include/sound/sof/ext_manifest.h |  7 +++++++
 include/sound/sof/info.h         |  2 +-
 include/uapi/sound/sof/abi.h     |  2 +-
 sound/soc/sof/loader.c           | 34 +++++++++++++++++++++++++++++---
 sound/soc/sof/sof-priv.h         |  1 +
 5 files changed, 41 insertions(+), 5 deletions(-)

-- 
2.25.1

