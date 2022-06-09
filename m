Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A65446D4
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 11:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F23BB1F70;
	Thu,  9 Jun 2022 10:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F23BB1F70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654765233;
	bh=ff4FTka19j0mGy1Hw+hg20umL4w8F2vxucCX/SXKec4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SeLg2b8nTtZ+Luugox5pbh4AUGbpS5rQ9B2zO4bTlyzkhtzG2X7eNpWoCjWiDegsH
	 SjP49hu0geFi1E7043HOnbdpC7SaEIitEtMZsQtBxVwJnP4wIgGm40Oozpgf+j9DwL
	 LnSwujLNSbPyL8J/+gK4EtA84D433ICr6Z5EuLzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62CFFF804B4;
	Thu,  9 Jun 2022 10:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 022FFF800C7; Thu,  9 Jun 2022 10:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 002D8F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 10:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 002D8F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CmnrB7FF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654765166; x=1686301166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ff4FTka19j0mGy1Hw+hg20umL4w8F2vxucCX/SXKec4=;
 b=CmnrB7FFdAxKHPULtbOBlcp4Qe9D2lpfha7AdCzK/81226vox2vvnZaq
 wUCVjOV2OKNt1NXx05mwf/hXfU5LRZ5r2J1NRHwZkxKC5n8iyB4gygIKW
 8fhdglnp/MEryz1bn4NwcBgxAUYVuJd6JUg0wtYn3vmGEuMLYzQ/v364h
 a0PvlFsFPUP631KGEwwcOSppvT1wzog1HghfY4rYAgn1o8IfJmljadkuF
 2lTlntqrbzIIYf3BgAJeTmwtBGZnyyFdRPUUXgojYzSytBYlFtywPBrU7
 ilJFKGOsg9vB44YrJBNs596zhqpaXV4Y9q3CisFm1LPeufxgcsXtR3CeF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="274732369"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="274732369"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:59:16 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="637369158"
Received: from ekoledex-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.94])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 01:59:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: Intel: Fix IMR boot race caused by early core
 booting
Date: Thu,  9 Jun 2022 11:59:46 +0300
Message-Id: <20220609085949.29062-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

After the revisited IMR sequence patch
2a68ff846164 ("ASoC: SOF: Intel: hda: Revisit IMR boot sequence")

we have started to see random boot issues manifesting in ghost reply messages from
the DSP for a never sent message.
It turned out that an earlier commit:
d416519982cb ("ASoC: SOF: hda: don't use the core op for power up/power down")

replaced the core power up step with a full blown core power up + enable call.
The result was that we have booted the core before we would place the message
to the ROM code and based on luck and timing it got received by the (IMR) booted
firmware or in between ROM and firmware boot.

Mark, can you queue this series for 5.19 as the 2a68ff846164 is in rc1 to make
sure that we fix this random issue?

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: Intel: hda-dsp: Expose hda_dsp_core_power_up()
  ASoC: SOF: Intel: hda-loader: Make sure that the fw load sequence is
    followed
  ASoC: SOF: Intel: hda-loader: Clarify the cl_dsp_init() flow

 sound/soc/sof/intel/hda-dsp.c    | 10 +++++++++-
 sound/soc/sof/intel/hda-loader.c | 10 +++++-----
 sound/soc/sof/intel/hda.h        |  1 +
 3 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.36.1

