Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493064DCCEC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:52:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D46B518A5;
	Thu, 17 Mar 2022 18:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D46B518A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539573;
	bh=P/lzESzr2NqhkLIo16KPLJAjz8LvdBrbwwKy5cIJhg8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g3oBCqbmajnXSreNqFW9IGmYRdwiExKXze9OgQ3ja+uFUt7wPMn6FaQBGe5SdrZ4d
	 3Q8vBlHbFUN8c8Wlabovk4Rx9gr679B4cYpX2my5zhMOOo8ZTBFpnM97Osxs0l4m7m
	 8+BgH5+BYcgrkjaE1O2y4ewO6+FFwWoWBubc+I5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F20EF80125;
	Thu, 17 Mar 2022 18:51:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B2C5F80125; Thu, 17 Mar 2022 18:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D77F80125
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12D77F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FBqtfV6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539502; x=1679075502;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P/lzESzr2NqhkLIo16KPLJAjz8LvdBrbwwKy5cIJhg8=;
 b=FBqtfV6Tsug6tqo3Mk32tqaIWmQ9wh+smC9v8Z3BUdvlND3vJVhbdtLm
 mChgLfLE3QBZECeu6f+isbilFcysO81mlA8pjAhuvEoc7bljxHozOZme9
 Js4qto9yQ0Hi3O2wilyfIRT479Y0C49swYsJnrhqRhh8KIEkyHBeiW8PJ
 tyGl5I6zuo/UJTX+kSWNRt8lJUIuFiVgDhhXBRdEiabaZmdkOdBRNZCMI
 XQGyToD4lOgmWvQioG7AWXT75mZHGHFrA0E5i2NiP1YiZFWiNj8dNY7Fo
 Mqy2kt6/gfc0qh3KERWnOvk9MEc0KKKzaPHCJyXM3er5Y6NbRTn3TuwpF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492895"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492895"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431102"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/19] Make the SOF control, PCM and PM code IPC agnostic
Date: Thu, 17 Mar 2022 10:50:25 -0700
Message-Id: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series is a continuation to the SOF IPC abstraction work to support
the new IPC version introduced in the SOF firmware. It makes the top-level
control IO, PCM and PM code IPC-agnostic. Other than the first patch,
the rest are purely for abstraction and include no changes in
functionality.

Ranjani Sridharan (19):
  ASoC: SOF: set up scheduler widget before all other widgets in the
    pipeline
  ASoC: SOF: Make sof_widget_setup/free IPC agnostic
  ASoC: SOF: Make sof_suspend/resume IPC agnostic
  ASoC: SOF: Introduce IPC ops for kcontrol IO
  ASoC: SOF: Add IPC3 topology control ops
  ASoC: SOF: Add volume_get/put IPC3 ops
  ASoC: SOF: Add switch get/put IPC3 ops
  ASoC: SOF: Add enum_get/put control ops for IPC3
  ASoC: SOF: Add bytes_get/put control IPC ops for IPC3
  ASoC: SOF: Add bytes_ext control IPC ops for IPC3
  ASoC: SOF: Introduce IPC-specific PCM ops
  ASoC: SOF: pcm: expose the sof_pcm_setup_connected_widgets() function
  ASoC: SOF: Introduce IPC3 PCM hw_free op
  ASoC: SOF: Define hw_params PCM op for IPC3
  ASoC: SOF: Add trigger PCM op for IPC3
  ASoC: SOF: Add dai_link_fixup PCM op for IPC3
  ASoC: SOF: expose sof_route_setup()
  ASoC: SOF: topology: Add ops for setting up and tearing down pipelines
  ASoC: SOF: Add a new dai_get_clk topology IPC op

 sound/soc/sof/Makefile        |   2 +-
 sound/soc/sof/control.c       | 545 ++++---------------------------
 sound/soc/sof/intel/hda-dai.c |  97 +-----
 sound/soc/sof/intel/hda.c     | 169 +++-------
 sound/soc/sof/intel/hda.h     |   7 +-
 sound/soc/sof/ipc.c           |  10 +-
 sound/soc/sof/ipc3-control.c  | 594 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc3-ops.h      |  21 ++
 sound/soc/sof/ipc3-pcm.c      | 372 +++++++++++++++++++++
 sound/soc/sof/ipc3-topology.c | 384 +++++++++++++++++++++-
 sound/soc/sof/ipc3.c          |  45 +++
 sound/soc/sof/pcm.c           | 354 +++-----------------
 sound/soc/sof/pm.c            |  80 ++---
 sound/soc/sof/sof-audio.c     | 442 +++++--------------------
 sound/soc/sof/sof-audio.h     |  70 +++-
 sound/soc/sof/sof-priv.h      |  17 +-
 sound/soc/sof/topology.c      |  55 ++--
 17 files changed, 1805 insertions(+), 1459 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-control.c
 create mode 100644 sound/soc/sof/ipc3-ops.h
 create mode 100644 sound/soc/sof/ipc3-pcm.c
 create mode 100644 sound/soc/sof/ipc3.c

-- 
2.25.1

