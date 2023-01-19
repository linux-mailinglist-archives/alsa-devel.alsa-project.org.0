Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F25A673F02
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 17:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 901A31891;
	Thu, 19 Jan 2023 17:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 901A31891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674146308;
	bh=BLxUwvcbJNE16lGVkyQ5NUwMXEUCuzke2hSZzqzQH+M=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=uYEB+eC2toieEbHVFv7HiF+pih0E4Q/B7pB3RHPlKey8nmzX1hxEX0WsF4gznIwXH
	 dme3otWdNnlJbpKfTMj5kKpK19TF9NCwKNLXX8BjSE8o0+v+QHOVimwOXipmCtdyaI
	 /AQx0RE6oApORPN92SIK939X+yxYfk20ntXEThk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DA63F80564;
	Thu, 19 Jan 2023 17:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9345F80542; Thu, 19 Jan 2023 17:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E975F8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 17:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E975F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bNo4PIfW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674146164; x=1705682164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BLxUwvcbJNE16lGVkyQ5NUwMXEUCuzke2hSZzqzQH+M=;
 b=bNo4PIfW3HJeQ83w/xPq8SxZFrojHZPKzdSwOkSeMWgGX7i9GwV1rJ5l
 GeMioZhPhM2TbyEynGzbCha05eDykZXuaU9QbqymxYtMacw96NlQ/79Kb
 EaTACizxnktgzcw4eodqlOTtKkM/4q6P+lQQjRV2bg4MCrhSggQw2tu/H
 gASyU0gHanNifXhJ5zjYXjjmgnwiULmAGpt5iVNBXeIZiPFRIs1RoloXy
 IPOMzPpfDuj6KcsmmLAh3sg1sJ/a/z6qZ6HC42BntCYXIIQWqdUBFFjn9
 pwXOdbAUs+y1zCukavyYUCKiG69QmQP/6C2hZq3nnFOyI9qInaZTjTKqg A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323029582"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="323029582"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="662162951"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="662162951"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 08:35:56 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/4] ASoC: Intel: set dpcm_capture for amps
Date: Thu, 19 Jan 2023 18:34:55 +0200
Message-Id: <20230119163459.2235843-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This series addresses problems with echo reference devices
reported in:
"[BUG][ADL-N] Kernel panic when echo reference stream is opened"
https://github.com/thesofproject/linux/issues/4083

Pierre-Louis Bossart (4):
  ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers
  ASoC: Intel: sof_cs42l42: always set dpcm_capture for amplifiers
  ASoC: Intel: sof_nau8825: always set dpcm_capture for amplifiers
  ASoC: Intel: sof_ssp_amp: always set dpcm_capture for amplifiers

 sound/soc/intel/boards/sof_cs42l42.c | 3 +++
 sound/soc/intel/boards/sof_nau8825.c | 5 +++--
 sound/soc/intel/boards/sof_rt5682.c  | 5 +++--
 sound/soc/intel/boards/sof_ssp_amp.c | 5 ++---
 4 files changed, 11 insertions(+), 7 deletions(-)


base-commit: 8dc08c82afbf00e3cbe8944f7e33fa133c01858f
-- 
2.39.0

