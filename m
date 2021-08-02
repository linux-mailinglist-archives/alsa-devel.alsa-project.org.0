Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310603DDC4C
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37821746;
	Mon,  2 Aug 2021 17:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37821746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627917818;
	bh=WCvZKkrK81OO04z7az8fYVXvQRagOk3saZ6+RGidKmY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BQcR8GAzCmE9dvkyqHw3QOot0t9FkxBLz7tkXN6pJx2ZL8kaWWs8m16Ty1wECDDVs
	 19+Fa83XDKESmhuvz/3AAoGAVUlKgS/oHaF56sBRqkAlP0QCMjoxf7OrNUxnAEPogE
	 JEmyrmY1EeEjVFrvWwKE1vM5toVmRmlIBJCNON1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F73F804BB;
	Mon,  2 Aug 2021 17:22:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82D3BF80271; Mon,  2 Aug 2021 17:22:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 361D7F8026A
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 361D7F8026A
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="299065238"
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="299065238"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 08:22:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,289,1620716400"; d="scan'208";a="457974784"
Received: from skarumur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.72.192])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2021 08:22:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: SOF/Intel: machine driver updates
Date: Mon,  2 Aug 2021 10:21:47 -0500
Message-Id: <20210802152151.15832-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Two quirks added for Dell XPS 9710 and Intel reference boards, and two
minor cleanups.

Pierre-Louis Bossart (3):
  ASoC: Intel: sof_sdw: add quirk for Dell XPS 9710
  ASoC: Intel: update sof_pcm512x quirks
  ASoC: Intel: sof_sdw_max98373: remove useless inits

jairaj arava (1):
  ASoC: SOF: Intel: Use DMI string to search for adl_mx98373_rt5682
    variant

 sound/soc/intel/boards/sof_pcm512x.c      | 13 +++++++++++--
 sound/soc/intel/boards/sof_rt5682.c       | 14 ++++++++++++++
 sound/soc/intel/boards/sof_sdw.c          | 12 ++++++++++++
 sound/soc/intel/boards/sof_sdw_max98373.c |  4 ++--
 sound/soc/sof/sof-pci-dev.c               |  9 +++++++++
 5 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.25.1

