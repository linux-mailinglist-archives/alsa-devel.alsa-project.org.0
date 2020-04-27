Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D2F1BAB87
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 19:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C582A16A5;
	Mon, 27 Apr 2020 19:42:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C582A16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588009390;
	bh=6tkcbpyBPGzJdJGUX0ZV12RAluHQ3xJYAVCl86rmzu8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YR+cZTQ3ytQRenWHgbxKUH+CszRBPt4ag4EQcD/RlCOTWtsJvBozzn1iF3g4C+Lb+
	 AqIWjcaori/TyL2QHQiD9TAAOD3GHtPuczSXtPgnPqq1FCI+ldq+w8SfT/So/SIvth
	 b/oLn+F0GRFZv77d2cNj7HAb8WQ1DhMzLelAwAUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C880F802E1;
	Mon, 27 Apr 2020 19:29:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A2AF802DB; Mon, 27 Apr 2020 19:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B70DF80247
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 19:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B70DF80247
IronPort-SDR: kwGZFomapaYZEw8Ka1mfsfgZ6fu1IRHyt2sLE+DcW3n6MEpPSuJn221JICJVqc87hHeGlj64BN
 QWMlD4I4mIpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 10:29:39 -0700
IronPort-SDR: AMq8eLszGw2hJ8uvdwqckXyKEk71pXEi0WAcvlp3UMXAWiuVxillX7Qrp2//SKCyD9EX9MKLnT
 UcLdPg9u5G5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="458935995"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 10:29:39 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] SOF topology parsing updates
Date: Mon, 27 Apr 2020 10:29:35 -0700
Message-Id: <20200427172939.25848-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

This series includes updates in the topology parser for DAIs
and their config.

The first three patches address the problem of sending the DAI
config to the DSP when there are multiple DAIs associated with
a DAI link.

The last patch deals with setting the default trigger order 
for all links. Exceptions needed for HDA links are moved to
the DAI link fixup() callback.

Bard Liao (3):
  ASoC: SOF: topology: send ipc for all found DAIs in sof_set_dai_config
  ASoC: topology: set component dai_index to ipc dai config dai_index
  ASoC: SOF: topology: replace sof_link_hda_process by
    sof_set_dai_config

randerwang (1):
  ASoC: SOF: Intel: change trigger sequence to fix pop noise when
    stopping playback on sdw platforms

 sound/soc/sof/pcm.c      |  12 ++-
 sound/soc/sof/topology.c | 167 ++++++++++-----------------------------
 2 files changed, 51 insertions(+), 128 deletions(-)

-- 
2.17.1

