Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8917714EBE8
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 12:45:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA29167C;
	Fri, 31 Jan 2020 12:45:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA29167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580471154;
	bh=hp+34qgwH9cBHW2yhlRuIN6dx4uYZU142eiM383qPBU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RFxfFp5z8X94KiEVsVGNqN2MyORxW9soD/4ec1m/RXWg2b7/aFaVvC7SWPHjDQm9+
	 GqHVGDXZ91q3xP63nh5qN4NvQfl4EeML1mj1sy3YO/2XB1HLeqKI2J2GDeSYSvU3ob
	 13wdrMNXPnaZxIZO8sSkSGM5cMmW3nMhTqsCzHxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 037BCF80229;
	Fri, 31 Jan 2020 12:44:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C7D3F80234; Fri, 31 Jan 2020 12:44:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB5DEF80116;
 Fri, 31 Jan 2020 12:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB5DEF80116
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 03:43:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="430343380"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.38.16])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2020 03:43:57 -0800
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 12:43:52 +0100
Message-Id: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: sound-open-firmware@alsa-project.org
Subject: [alsa-devel] [PATCH 0/3] ASoC: SOF: VirtIO: preparatory patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is the first set of patches for the SOF virtualisation work. We
send these patches first because they touch the ASoC core. 2 of them
are mostly cosmetic with no functional changes, but patch 2/3 might
cause some discussions. Please review and comment.

Thanks
Guennadi

Guennadi Liakhovetski (3):
  ASoC: (cosmetic) simplify dpcm_prune_paths()
  ASoC: add function parameters to enable forced path pruning
  ASoC: export DPCM runtime update functions

 include/sound/soc-dpcm.h |  30 +++++++++--
 sound/soc/soc-compress.c |   2 +-
 sound/soc/soc-dapm.c     |   8 +--
 sound/soc/soc-pcm.c      | 126 ++++++++++++++++++++++++++++++-----------------
 4 files changed, 112 insertions(+), 54 deletions(-)

-- 
1.9.3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
