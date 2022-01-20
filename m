Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1EB4956A1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:16:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A15E6D8;
	Fri, 21 Jan 2022 00:16:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A15E6D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642720616;
	bh=sYJTTViIxrStwsVLzbtRFy6Ua4t9VL51qaRzRiSPe4s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nxDyrP0S8H6FOqrx+uDy490RNo5fVBvD6O0rlMcig1ajIwC75PbiI4eX6LbM55YIE
	 wXvFh166imaJZOEDiFfvgWQFl2eFF3zb3Gd9okHflfLl4Uc9QPJj+2curTiHwPZuDd
	 2GYLsamxbXQ9iGT8Wo+SXpPdh31GWSjTslxiQNkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 185BCF804AA;
	Fri, 21 Jan 2022 00:15:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8756BF800F8; Fri, 21 Jan 2022 00:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA23FF800F8
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:15:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA23FF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AVio3ZNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642720548; x=1674256548;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sYJTTViIxrStwsVLzbtRFy6Ua4t9VL51qaRzRiSPe4s=;
 b=AVio3ZNUQ7GJbDCa55a2wgV8w2cZjSTXMR4flvkKAPW3z0uMYAKrx//D
 OmjWJGjxzNg84cnGhjYCNd8IdeSH1AJ3ePO8V52SA1XbE6qqZ73EZErL6
 Op6/B21+9s2RMfAbvddW8lHNeOrAU5W/ioPqLri6JGIFTvI2fx1iRoZWx
 FUqqulmojtUzXV3gAhwwyoQOACasA5In5NJLtTATdngz9eW6/SFNxY3EW
 J7v7fV4aaNwLZj5aG94IJ/Ynk+IbjuT88D9Us5SegivyVCenmLFFcJubQ
 0zfRWbag16chmpy8rRDhmAqC831xTHTdnw8/mUuD3J7znhW04RAqoApdf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245460643"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245460643"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="672741383"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:15:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF: Intel: don't download firmware at each resume
Date: Thu, 20 Jan 2022 17:15:27 -0600
Message-Id: <20220120231532.196926-1-pierre-louis.bossart@linux.intel.com>
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

After the first firmware boot, the firmware is capable of
saving/restoring its context to/from IMR (Isolated Memory Region, set
aside by BIOS on startup). This capability improves the resume speed.

Due to an unexplained issue on Up2 boards, this capability is disabled
on ApolloLake.

For backwards compatibility, the regular boot flow is used with older
firmware. For added peace of mind, a kernel module parameter is
provided to force the regular boot flow - this shouldn't be necessary
since we've been testing these patches for 6+ months.

Keyon Jie (4):
  ASoC: SOF: add _D3_PERSISTENT flag to fw_ready message
  ASoC: SOF: Intel: hda-loader: add SSP helper
  ASoC: SOF: Intel: hda-loader: add IMR restore support
  ASoC: SOF: add flag to disable IMR restore to sof_debug

Pierre-Louis Bossart (1):
  ASoC: SOF: Intel: use inclusive language for SSP clocks

 include/sound/sof/info.h         |  1 +
 include/uapi/sound/sof/abi.h     |  2 +-
 sound/soc/sof/intel/hda-loader.c | 68 +++++++++++++++++++++++++++-----
 sound/soc/sof/intel/hda.h        |  6 +--
 sound/soc/sof/sof-priv.h         |  3 ++
 5 files changed, 66 insertions(+), 14 deletions(-)

-- 
2.25.1

