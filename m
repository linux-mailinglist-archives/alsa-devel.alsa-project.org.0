Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29E53F154
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:03:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B371B51;
	Mon,  6 Jun 2022 23:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B371B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654549415;
	bh=WkaKwjZEmp1nYM2JZK8va72VapjVrUzzQf+INTX/1DM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hojJ8WlDhwbKfkcSe8HOiKWgyhNcADSpLvE4k3i4hRxwEipf1pcvf8eNhZY8HQkr2
	 JdKrYIp7Z2JGcArcAj/U2qgO0Hr9oMLpxNTtt7zTKBwhZ7pcww/zDAkI6R8hkQriWX
	 f3RNl0ao4RIypZen+Y3Lfw7JHTXJq8H/NKpYU3bM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DB5EF804BC;
	Mon,  6 Jun 2022 23:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C78F80423; Mon,  6 Jun 2022 23:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDDC1F80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDDC1F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gJUNnPNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654549354; x=1686085354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WkaKwjZEmp1nYM2JZK8va72VapjVrUzzQf+INTX/1DM=;
 b=gJUNnPNE8wYJEZDZGIxykXpH5ZHluW5i7ixC64m/g3GVVBgoLeplONye
 FOnIGO1NUGhC+1GLL3Adyw1UdnDepst/Kqqy4zsRGCRRT917V03RjB0qu
 HENMrQMiB767QtP4qcvr7epJ00Klf0OON7AVWetmIeVqRWSdlWAH10THB
 QkJlaaYgV9v7bt62Ue0GIXYo8IFvyNJl5gdCA+y2V58hRDwJswUApCAnn
 HqhYHyiMGifM4lScltY97p0VRt30T7MH/TjqzCEzfygdxORhs8uQKa6XM
 RWAW9u8EgbJEO4Vt1iILdxOsCEy/0MEpqpHWBmudkZfwheMqGCtEcPX8T g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275467620"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275467620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="608914446"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: SOF: AMD/Mediatek updates for 5.20
Date: Mon,  6 Jun 2022 16:02:07 -0500
Message-Id: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

Small patches reviewed on SOF GitHub.

Ajit Kumar Pandey (1):
  ASoC: SOF: amd: Add SOF pm ops callback for Renoir

YC Hung (4):
  ASoC: SOF: mediatek: revise mt8195 clock sequence
  ASoC: SOF: mediatek: Add shared_size for mediatek common chip
    information
  ASoC: SOF: mediatek: mt8195 modify dram type as non-cache
  ASoC: SOF: mediatek: mt8195 suspend check dsp idle

 sound/soc/sof/amd/acp-dsp-offset.h         |  2 +
 sound/soc/sof/amd/acp.c                    | 36 ++++++++++++++++
 sound/soc/sof/amd/acp.h                    |  4 ++
 sound/soc/sof/amd/pci-rn.c                 |  4 ++
 sound/soc/sof/amd/renoir.c                 |  4 ++
 sound/soc/sof/mediatek/adsp_helper.h       |  1 +
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c |  7 +++
 sound/soc/sof/mediatek/mt8195/mt8195.c     | 50 +++++++++++++++-------
 sound/soc/sof/mediatek/mt8195/mt8195.h     |  5 +++
 9 files changed, 97 insertions(+), 16 deletions(-)

-- 
2.34.1

