Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED053334E8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9124B168C;
	Mon,  3 Jun 2019 18:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9124B168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579218;
	bh=sq2SbQN5gokHLc/htioUjTUlY5P4CoVBC05rOUpnzjw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iA9+kRyZwbU1cJgQiigqMF8FFNkKidp7R9CtcIgH43Zf7E1bzVscxCYf7gdwC6ci0
	 GqFblWQpe9TNx3LI64V6A92cS0rzSmiNRRNp/PzHL0PYOZW6Z98clrxC8BRokwcDGe
	 UNryiSF+EB7Kzzj/yNAwowIsBZBDcbpevt5qDwg4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 283D0F89760;
	Mon,  3 Jun 2019 18:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE26F896ED; Mon,  3 Jun 2019 18:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61753F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61753F80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,547,1549958400"; d="scan'208";a="181219119"
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 09:20:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:20:24 -0500
Message-Id: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/8] ASoC: SOF: IPC updates
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Align the Intel IPC code with the recommended hardware sequences
instead of confusing ones, remove useless command and clean-up
interface definition.

Daniel Baluta (1):
  ASoC: SOF: Do not send cmd via SHIM register

Pierre-Louis Bossart (6):
  ASoC: SOF: Intel: cnl-ipc: read all IPC registers first
  ASoC: SOF: Intel: cnl-ipc: move code around for clarity
  ASoC: SOF: Intel: cnl-ipc: re-enable IPC IRQ at end of handler
  ASoC: SOF: Intel: hda-ipc: read all IPC registers first
  ASoC: SOF: Intel: hda-ipc: re-enable IPC IRQ at end of handler
  ASoC: SOF: Intel: ipc: don't check for HIPCCTL register value

Slawomir Blauciak (1):
  ASoC: SOF: ipc: replace fw ready bitfield with explicit bit ordering

 include/sound/sof/info.h      | 20 ++++++-------
 sound/soc/sof/intel/byt.c     |  5 +---
 sound/soc/sof/intel/cnl.c     | 56 +++++++++++++++++------------------
 sound/soc/sof/intel/hda-ipc.c | 43 +++++++++++++--------------
 sound/soc/sof/ipc.c           | 11 ++++---
 5 files changed, 67 insertions(+), 68 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
