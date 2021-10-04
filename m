Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3D4216DC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 20:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F76E1670;
	Mon,  4 Oct 2021 20:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F76E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633373788;
	bh=Xro8EZRsPJWkfAFHgppjCan6lTeo00G/IC90EP7t+0c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DdE5JckJ2HirZRBkPR18iuFxu8ymHtNd9B3CvFdDeNo+J1L2gtsTstctfYlrqPooJ
	 ruY7aFtWL3tGHPW6gBBw4c122HhIK2Pjd+u4VFgecUCgaB8d/EqCnB+Gt9kvZyIA3m
	 /GHhvKjVHe63QcuhErUpdbTzsQquWQgtAS4Mrzfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9585CF8010B;
	Mon,  4 Oct 2021 20:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B86E6F80249; Mon,  4 Oct 2021 20:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EFC7F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 20:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EFC7F8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206360920"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206360920"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="523435324"
Received: from mbrescia-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.4])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF: Intel: add flags to turn on SSP clocks early
Date: Mon,  4 Oct 2021 12:14:25 -0500
Message-Id: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With the chip shortage, some GeminiLake Intel-based designs were
respun and now rely on codecs that need the SSP bit clock turned on in
the hw_params stage, not the trigger stage. This patchset mirrors the
flags added in the SOF DAI_CONFIG IPC, and sets the flags when this
capability is indicated as necessary in the topology files where the
SSP configuration is stored.

We initially considered a more generic solution with an on-demand SSP
clock activation using the common clock framework. This would be a
more elegant solution indeed, but it would have required more
intrusive changes that would conflict with the SOF multi-client
support (in-development), and more backport hassles on product
branches. The on-demand activation of clocks is still a desired
feature that will be enabled at a later point.

Bard Liao (1):
  ASoC: SOF: dai-intel: add SOF_DAI_INTEL_SSP_CLKCTRL_MCLK/BCLK_ES bits

Pierre-Louis Bossart (4):
  ASoC: SOF: dai: mirror group_id definition added in firmware
  ASoC: SOF: dai: include new flags for DAI_CONFIG
  ASoC: SOF: Intel: hda: add new flags for DAI_CONFIG
  ASoC: SOF: Intel: hda-dai: improve SSP DAI handling for dynamic
    pipelines

 include/sound/sof/dai-intel.h |  4 ++
 include/sound/sof/dai.h       | 10 ++++-
 sound/soc/sof/intel/hda-dai.c | 82 ++++++++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda.c     |  6 +++
 sound/soc/sof/sof-audio.c     |  4 ++
 5 files changed, 103 insertions(+), 3 deletions(-)

-- 
2.25.1

