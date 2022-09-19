Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD25BCB84
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:12:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C2F84B;
	Mon, 19 Sep 2022 14:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C2F84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663589525;
	bh=tp3TUc50P8B9/0sC5PAlY7PCPNzixzm8U4voe5MUAyc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Poso9xHKdrudKpJHPqwddDxBNoOdaLnCGTHuX52L0j+aJDpBvXvc/de7ipqJnNCD6
	 9OphtyReLU1NGthbyWnru2d4Ii+IuKR/bbJWhSR8xzZoboL69fCOy8VSV+Ei7nAfsG
	 vgmDYXtZ/r2q+S1o/LwEYcZwGTSqNR0RUbxL2JII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3F2F800C9;
	Mon, 19 Sep 2022 14:11:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA03F8023A; Mon, 19 Sep 2022 14:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 667FCF800C9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 667FCF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aLhkn1yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663589464; x=1695125464;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tp3TUc50P8B9/0sC5PAlY7PCPNzixzm8U4voe5MUAyc=;
 b=aLhkn1yvVDTwm29b3UCoIokf4Ev4yFhNCiNxRXH5bnib572p925r8gTm
 y0pNzUWMeuquVILU3hhr1L7VZwTb7zQs4pnmQ9F5P92+V1nsV6DloihYg
 g3Q8tJeQAXyigusy+JTayWBZadvL2mwpr88d7eBOqg5u/75k1takxJ/dH
 H33SybgrCGA30Hxbqsl8cu7qk+BclYWahZpktXWgi7+3OSgcMYCsjbQ+p
 fbcpKqhzRO6Mn9y7ppKUkUyf+1h724HBM0K9LVXOFyLttUV1bk/gbPJGY
 G2EA3kZgHxc2aKycrhyFye7dSBZIEy+EA3SswdhWmzkJbU7748eUPCg5c A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="325673427"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325673427"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:11:01 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680826045"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:10:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ALSA: hda: document/simplify hdac_ext handling
Date: Mon, 19 Sep 2022 14:10:33 +0200
Message-Id: <20220919121041.43463-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
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

This sound/hda/ext library is a confusing magic black box that very
few understand. It needn't be that way, we can document/simplify and
make the code clearer.

Pierre-Louis Bossart (8):
  ALSA: hda: make snd_hdac_stream_clear() static
  ALSA: hda: document state machine for hdac_streams
  ALSA: hda: ext: make snd_hdac_ext_stream_init() static
  ALSA: hda: Use hdac_ext prefix in snd_hdac_stream_free_all() for
    clarity
  ALSA: hda: add snd_hdac_stop_streams() helper
  ALSA: hda: ext: simplify logic for stream assignment
  ALSA: hda: ext: fix locking in stream_release
  ALSA: hda: ext: remove always-true conditions on host and link release

 include/sound/hdaudio.h         |  3 +-
 include/sound/hdaudio_ext.h     |  5 +--
 sound/hda/ext/hdac_ext_stream.c | 34 +++++++--------
 sound/hda/hdac_stream.c         | 74 +++++++++++++++++++++++++++++----
 sound/pci/hda/hda_controller.c  |  4 +-
 sound/soc/intel/avs/core.c      |  4 +-
 sound/soc/intel/skylake/skl.c   |  2 +-
 7 files changed, 87 insertions(+), 39 deletions(-)

-- 
2.34.1

