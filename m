Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352D14903F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 22:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECB591696;
	Fri, 24 Jan 2020 22:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECB591696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579901952;
	bh=/8d6NxoMi5wKJhKk+Kw1mKIIlysqDrcX0AUB6ROfYNE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h5TKgsH7LyGz4xgEqFhtL1XmG+s+n8EqCgUMwQZO1fGNcTx4U63n/8qxw4hlOcGec
	 ZqrxI8uQCpi+20HHRNSkVCxt66W/a4d4mmUV/+YHWx0BJPGeWvzs+foakQmbUy+ca8
	 YEsFbjCh+dZkOl9uLXHhfbO3ROcFMASZN158xHjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5377F80229;
	Fri, 24 Jan 2020 22:36:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97392F8022D; Fri, 24 Jan 2020 22:36:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D90C9F800DE
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 22:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D90C9F800DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 13:36:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,359,1574150400"; d="scan'208";a="294313383"
Received: from sascates-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.4.164])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jan 2020 13:36:29 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 Jan 2020 15:36:18 -0600
Message-Id: <20200124213625.30186-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/7] ASoC: SOF: fixes for 5.6
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

I know this is cutting it close to the merge window, but since Takashi
suggested I provide the suspend bug he, Kai and I were working on, I
decided to send a small batch of fixes.

Bard Liao (1):
  ASoC: intel: soc-acpi-intel-icl-match: fix rt715 ADR

Guennadi Liakhovetski (2):
  ASoC: SOF: fix an Oops, caused by invalid topology
  ASoC: Intel: consistent HDMI codec probing code

Kai Vehmanen (1):
  ASoC: SOF: trace: fix unconditional free in trace release

Pan Xiuli (1):
  ASoC: SOF: pci: add missing default_fw_name of JasperLake

Pierre-Louis Bossart (2):
  ASoC: SOF: core: free trace on errors
  ASoC: SOF: core: release resources on errors in probe_continue

 sound/soc/intel/boards/bxt_da7219_max98357a.c | 14 +++----
 sound/soc/intel/boards/bxt_rt298.c            | 14 +++----
 sound/soc/intel/boards/cml_rt1011_rt5682.c    | 13 ++++---
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 16 ++++----
 sound/soc/intel/boards/sof_rt5682.c           | 15 ++++----
 .../intel/common/soc-acpi-intel-icl-match.c   |  2 +-
 sound/soc/sof/core.c                          | 38 ++++++++-----------
 sound/soc/sof/pcm.c                           | 10 +++++
 sound/soc/sof/pm.c                            |  4 ++
 sound/soc/sof/sof-pci-dev.c                   |  1 +
 sound/soc/sof/trace.c                         |  7 +++-
 11 files changed, 74 insertions(+), 60 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
