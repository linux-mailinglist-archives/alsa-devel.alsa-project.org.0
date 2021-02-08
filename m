Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6173143AF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:25:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C395169C;
	Tue,  9 Feb 2021 00:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C395169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612826714;
	bh=yp3OPq/GAvstM5nunQJ8oq6+1aAOSsJJMvMI/DdIne4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P1GMti69jZZTCtbw3+5rb4PsxxjTgcqg47Ezt4/1/ny/DhBgCf/5RoXwuEzDJoV1G
	 AWp9pvPxM5PG+3AG5EysgD/TaGU98n5TiCKdXb3xHtbq5NLVcgb7idaBn0QhVjJ/ap
	 hbJ0usv0+Hon4kh26SMpIDjgFYy35UNtvVU16j0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95D37F8022D;
	Tue,  9 Feb 2021 00:23:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC9FAF8022B; Tue,  9 Feb 2021 00:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCFFBF80114
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCFFBF80114
IronPort-SDR: jrGc58ZTepx3q05NgBR51mAHyN4XbRdnsR8Qauqj7yfzG/qFx+N/u5MKIiUv7t/xTUtR2P/ZAV
 tUyvUr44xdFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="243295583"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="243295583"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:15 -0800
IronPort-SDR: TZeWPYbu0vzGUls6NhsSeKCXIBiOEnJe1g9zqTibM1SvQpBJI1doFEpwYaesJT3oTBeGRbbSVF
 5LB8eBVdwGsw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="585854671"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:22:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF: cleanups
Date: Mon,  8 Feb 2021 17:21:44 -0600
Message-Id: <20210208232149.58899-1-pierre-louis.bossart@linux.intel.com>
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

Minor cleanups for error formats, missing cases, useless functions and
simplifications.

Curtis Malainey (2):
  ASoC: SOF: add missing pm debug
  ASoC: SOF: fix string format for errors

Fred Oh (1):
  ASoC: SOF: ext_manifest: use explicit number for elem_type

Guennadi Liakhovetski (2):
  ASoC: SOF: remove unused functions
  ASoC: SOF: HDA: (cosmetic) simplify hda_dsp_d0i3_work()

 include/sound/sof/ext_manifest.h   |  6 ++--
 sound/soc/sof/intel/hda-compress.c |  2 +-
 sound/soc/sof/intel/hda-dsp.c      | 18 +++++------
 sound/soc/sof/intel/hda-loader.c   |  6 ++--
 sound/soc/sof/intel/hda-pcm.c      |  2 +-
 sound/soc/sof/intel/hda-trace.c    |  4 +--
 sound/soc/sof/intel/hda.c          | 50 ------------------------------
 sound/soc/sof/intel/hda.h          |  1 -
 sound/soc/sof/ipc.c                |  2 ++
 9 files changed, 19 insertions(+), 72 deletions(-)

-- 
2.25.1

