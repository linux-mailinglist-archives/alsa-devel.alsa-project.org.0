Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED725D9A1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226D91B0C;
	Fri,  4 Sep 2020 15:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226D91B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226286;
	bh=CgxdTDWGKilWcGw61zOhfiyHmJH5Q3tGZrU0O0R6U5Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z2KkhqYAG16mCKzmiLjPchTMGfFL0UqKvlqkCefzmfSDIwOE7LP/tI4n0cRSS1GaO
	 0uYwCf9RrRmnl3P/myV5erliIsFrTm50RACkgZH+7ndo0mZorLkD0q3iaQ1Up0x9YN
	 LCvch7frpuC6fvOLtAhVeDP5AofJnKdxB54AbvUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48CEAF8024A;
	Fri,  4 Sep 2020 15:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A47E0F8024A; Fri,  4 Sep 2020 15:29:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DA7FF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA7FF800F0
IronPort-SDR: AsxdUlzQo49iextjitwlw0qfekzLRj1dJQx/wcP9RKMZlW+K409QQp6MwlZcxCdlRh+MwOrQ2t
 kAbTt0ipo21g==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137792153"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137792153"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:24 -0700
IronPort-SDR: twsGHtlcfL/CYO+uYOX30SdbRdCx76H5gridbjOBqfUNMA0uCZBRQkq3nRxT05EFviaCrGxBjE
 CilvUOX02G4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416680"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:22 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/16] ASoC: SOF: component UUID support for 5.10
Date: Fri,  4 Sep 2020 16:27:28 +0300
Message-Id: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

This series adds support for UUID based component identification
in SOF. UUIDs provide a more scalable alternative to the old
component type based approach to identify which DSP components
should be loaded.

More detailed description of UUID usage in SOF is available in:
https://thesofproject.github.io/latest/developer_guides/uuid/

UUID support is an incremental update to the SOF IPC interface. Driver
remains compatible with pre-UUID (ABI <3.17) firmware versions.

Keyon Jie (16):
  ASoC: SOF: tokens: add token for component UUID
  ASoC: SOF: add comp_ext to struct snd_sof_widget
  ASoC: SOF: topology: create component extended tokens
  ASoC: SOF: topology: parse comp_ext_tokens for all widgets
  ASoC: SOF: use the sof_ipc_comp reserved bytes for extended data
  ASoC: SOF: topology: add helper for setting up IPC component
  ASoC: SOF: append extended data to sof_ipc_comp_dai
  ASoC: SOF: append extended data to sof_ipc_comp_mixer
  ASoC: SOF: append extended data to sof_ipc_comp_volume
  ASoC: SOF: append extended data to sof_ipc_comp_host
  ASoC: SOF: append extended data to sof_ipc_comp_src
  ASoC: SOF: append extended data to sof_ipc_comp_asrc
  ASoC: SOF: append extended data to sof_ipc_comp_tone
  ASoC: SOF: append extended data to sof_ipc_comp_process
  ASoC: SOF: append extended data to sof_ipc_comp_mux
  ASoC: SOF: topology: make process type optional

 include/sound/sof/topology.h    |  12 +-
 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/sof-audio.c       |  23 +++-
 sound/soc/sof/sof-audio.h       |   3 +
 sound/soc/sof/topology.c        | 208 ++++++++++++++++++++------------
 5 files changed, 161 insertions(+), 86 deletions(-)

-- 
2.27.0

