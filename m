Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 568FD1D4FD6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 16:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F78166B;
	Fri, 15 May 2020 16:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F78166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589551333;
	bh=s8bMPlVCeVdZNyq2lNRMj0HzGNkZFHOn87U0v3j6l54=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dkP4A4pOB3Pp/DVayepQfBREdTKQG2SYdr7lSe4u9U7mG3xyCc0433Mc46Gk3NMKj
	 k+zHqgFoy9NNCgEHodBX2FCHKxILPKLt28/tOALK1Y/tnaHLVxFK0UelSkQ2bsk8jg
	 AGASGgQyXrcneP/chlOwFFa9aM7cXSl0Tj2QznQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA322F80247;
	Fri, 15 May 2020 16:00:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB4C6F80247; Fri, 15 May 2020 16:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 084BDF800E3
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 16:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 084BDF800E3
IronPort-SDR: LlEusUsGIuOzVCSMcbtD2oACkUuZA9pcXhh/pCbPG2abmm1A61Yq4K5Pm3+LrsRNzVSilrlDha
 uSRTGQWNplJA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:00:14 -0700
IronPort-SDR: jXAmpiLneVNbRWfoh5aK+IfiJ2ZMbL4hi4lH1YLbt0zaR59E0CAZIYCc3mUy3uXr/6FWjxpAtQ
 Bll+4w4fFMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="266610930"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 15 May 2020 07:00:13 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/8] ASoC: SOF: Intel and IMX updates for 5.8
Date: Fri, 15 May 2020 16:59:50 +0300
Message-Id: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
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

here's a series of minor fixes and improvements to SOF. Add support
for smart amplifier component type. Cover more systems by relaxing
match rules for the generic Soundwire machine driver. Fix issues with
driver unload and address a few compiler warnings.

Daniel Baluta (2):
  ASoC: SOF: Do nothing when DSP PM callbacks are not set
  ASoC: SOF: define INFO_ flags in dsp_ops

Keyon Jie (1):
  ASoC: SOF: topology: add support to smart amplifier

Marcin Rajwa (2):
  ASoC: SOF: add a power_down_notify method
  ASoC: SOF: inform DSP that driver is going to be removed

Pierre-Louis Bossart (2):
  ASoC: SOF: imx: make dsp_ops static
  ASoC: SOF: imx: make imx8m_dsp_ops static

randerwang (1):
  ASoC: SOF: Intel: sdw: relax sdw machine select constraints

 include/sound/sof/topology.h |  2 ++
 sound/soc/sof/core.c         |  6 ++++++
 sound/soc/sof/imx/imx8.c     |  2 +-
 sound/soc/sof/imx/imx8m.c    |  8 +++++++-
 sound/soc/sof/intel/hda.c    | 10 +++++++++-
 sound/soc/sof/pm.c           | 19 +++++++++++++++++--
 sound/soc/sof/sof-priv.h     |  1 +
 sound/soc/sof/topology.c     |  1 +
 8 files changed, 44 insertions(+), 5 deletions(-)

-- 
2.26.0

