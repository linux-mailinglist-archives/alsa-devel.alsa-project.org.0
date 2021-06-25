Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796A3B49DC
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 22:52:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2521683;
	Fri, 25 Jun 2021 22:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2521683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624654372;
	bh=5tqeg4cJRbX0yt/UsV5bhkiMZyuHaVroUg1iV/0NaZw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uvg4vVXsTIhVDH/ClNXIoW6gn3oiuZUyEH/BLuVbR9a3pzg4xhnOMEdODKtd5jxMO
	 hoW9c6F53o/uqeTiy7/pnk8JDui9m/UgaN2tBK20evpjK4maG9QaadsotXgzdxbsna
	 mA5oTb2qVn9jDrqSMmrFR0oH9SePetZR53XGv14I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86054F80245;
	Fri, 25 Jun 2021 22:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C9AFF80137; Fri, 25 Jun 2021 22:51:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22FFBF80137
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 22:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22FFBF80137
IronPort-SDR: w2d1hCESIo4MEDMJiRLIdBp5/k1bCpk5xdNNqbZxfSd4cuWUJgf9SsEs2fytHIt1o85sVovKoE
 Mze8S63b565g==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="188122673"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="188122673"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:51:07 -0700
IronPort-SDR: TeFhJ8FU2u4DfKLhJF2IHhx3Eu3kIigFI80OVYwAHmKX5tYL0JqTzjnrLnNSnkWayVB4xKbz6l
 bXclut4o8orw==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="640222929"
Received: from rlcervan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.127.151])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 13:50:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: Intel: machine driver corrections
Date: Fri, 25 Jun 2021 15:50:38 -0500
Message-Id: <20210625205042.65181-1-pierre-louis.bossart@linux.intel.com>
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

The first fix solves an underflow in SoundWire platforms using the
max98373 amplifier, the rest of the patches are minor corrections in
machine drivers.

The fix should be queued for the 5.14 cycle, the rest should be
harmless but can be deferred for 5.15 if it's too late already.

Brent Lu (2):
  ASoC: SOF: add a helper to get topology configured bclk
  ASoC: Intel: sof_cs42l42: use helper function to get bclk frequency

Gongjun Song (1):
  ASoC: Intel: soc-acpi: add support for SoundWire of TGL-H-RVP

Rander Wang (1):
  ASoC: Intel: boards: fix xrun issue on platform with max98373

 include/sound/sof.h                           |  1 +
 sound/soc/intel/boards/sof_cs42l42.c          |  8 +-
 sound/soc/intel/boards/sof_sdw_max98373.c     | 81 ++++++++++++-------
 .../intel/common/soc-acpi-intel-tgl-match.c   | 15 ++++
 sound/soc/sof/sof-audio.c                     | 42 ++++++++--
 5 files changed, 111 insertions(+), 36 deletions(-)

-- 
2.25.1

