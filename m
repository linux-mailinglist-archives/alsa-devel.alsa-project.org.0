Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE77259C7B6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 21:01:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F4235844;
	Mon, 22 Aug 2022 21:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F4235844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661194863;
	bh=N6+L3N9i6HXrTzQ/s9qun83fPZWOQJ6IUgqBX6w88+s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SIi7AvJPe+2tTi2UtHW3/gqJuDGbxGy5hUaWKCnHPoh83/HIqYCouFs1p+ydNnQ2Y
	 CQ829Vw8GMmjxMeS5ZSrpoEv9JOyvn9qi/kKPpcqJqRD0xwSgK2rwetCQpUS2bhdXa
	 8StdlMFdkgo3MfUeNdvfx0otA7vIxKYewlm06kIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55CCF80525;
	Mon, 22 Aug 2022 20:59:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1983FF80152; Mon, 22 Aug 2022 20:59:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C004CF80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C004CF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NCE/hUHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661194777; x=1692730777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N6+L3N9i6HXrTzQ/s9qun83fPZWOQJ6IUgqBX6w88+s=;
 b=NCE/hUHL8wV0SzviNGNxMZ9TWQvaxIO8bWYiu+2ZxtmHGOFXuZdJ41oH
 G0GKEcOBPIWNnLJYn2VPPLSFV99AjPQUN14YKjUYYHpi43u9bPiLCrwa5
 8NN3CEPhhZ+p4nQesl5wlvIKEKEgyfCBY28ly8a/tYOd7siRmIZT5Dm04
 6fnkwTHSGcum2vWalzCcDq5zjbMSnyuu6AeGmAHsMaF8YCJRI7RRBDhZ2
 7F/zaw+gCLnp4RTTIZzX1YdyllxciNUSc0m5NdK9lyGc/Ra+7OTwDkT+U
 u/b5L/fTI4jSubS4Hi65gP8eDcTiMiR43wrsqP+SFyleL4lemt/G3tVwM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379786490"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="379786490"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="669676468"
Received: from apascali-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.252.42.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 11:59:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF: Intel: override mclk_id for ES8336 support
Date: Mon, 22 Aug 2022 20:59:07 +0200
Message-Id: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
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

This patchset solves a known issue with ES8336 platforms wrt MCLK
selection. Most of the devices use the MCLK0 signal, but some devices
do use the MCLK1 signal.

The MCLK is defined in the topology, it would be a nightmare to
generate more topology files just for one MCLK difference. With a
minor extension to the intel-nhlt library, the MCLK information can be
found by parsing the NHLT table, and we can override the mclk_id at
boot time.

The only known issues for this platform remain the detection of GPIO
and microphone connections, currently only possible with manual
quirks.

Thanks to Eugene J. Markow for testing this patchset.

Pierre-Louis Bossart (4):
  ASoC: SOF: add quirk to override topology mclk_id
  ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
  ASoC: SOF: Intel: hda: override mclk_id after parsing NHLT SSP blob
  ASoC: SOF: Intel: hda: refine SSP count support

 include/sound/intel-nhlt.h    |  7 ++++
 sound/hda/intel-nhlt.c        | 61 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c     | 34 +++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  2 ++
 sound/soc/sof/intel/mtl.c     |  2 +-
 sound/soc/sof/intel/tgl.c     |  8 ++---
 sound/soc/sof/ipc3-topology.c |  7 ++++
 sound/soc/sof/sof-priv.h      |  4 +++
 8 files changed, 120 insertions(+), 5 deletions(-)

-- 
2.34.1

