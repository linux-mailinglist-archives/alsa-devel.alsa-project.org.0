Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A7252477
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:52:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 605D516DF;
	Wed, 26 Aug 2020 01:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 605D516DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399570;
	bh=5cfLNW/8cirTyF75hKmvs/ARUzLbv2xYlI9jWCBhzZI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rvo8qaF2slB5GeKkMQbQJZnAjcV/ecZ3JYUiGrH6O9dYx4PoACBb8KKryCvLdns/C
	 WO9hQyUNTAwsSEl5mLmOq/V0Yv5FzZCQOgukZ5mwxgaCiX5urp+sbTRl5DqTGkURBZ
	 5nw/Grha7TXVTMZQWp1fQsy2Q/FeiBcehnsVdOW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E0FF8025A;
	Wed, 26 Aug 2020 01:51:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEA09F8027B; Wed, 26 Aug 2020 01:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EC65F80245
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC65F80245
IronPort-SDR: 48ZQaQYYYA2P+KEe2vs/tIzBmu68xPvy38BCJ+2A8DixxnsJeOswPwB8i03qJPA+GISwNX7CvD
 unWjMoBmk/4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253455"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253455"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:53 -0700
IronPort-SDR: Tr6H+BWr/5HA/6YuY2IIxqT7nu3cYQi2wdp6xLkheGaB4jRf+gaPH8xmcHBPnExVJlfJZHorii
 RaYIwK5iaS8g==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443818976"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:50:53 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] SOF fixes and updates
Date: Tue, 25 Aug 2020 16:50:33 -0700
Message-Id: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

This series includes fixes for error reporting, topology parsing and
runtime PM issues along with updates for DMIC support and IMX platforms.

Iulian Olaru (2):
  ASoC: SOF: imx: Replace sdev->private with sdev->pdata->hw_pdata
  ASoC: SOF: sof-of-dev: Add .arch_ops field

Jaska Uimonen (1):
  ASoC: SOF: intel: hda: support also devices with 1 and 3 dmics

Keyon Jie (1):
  ASoC: SOF: topology: fix the ipc_size calculation for process
    component

Rander Wang (1):
  ASoC: SOF: fix a runtime pm issue in SOF when HDMI codec doesn't work

Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda: report error only for the last ROM init
    iteration
  ASoC: SOF: Intel: hda: add extended rom status dump to error log

 sound/soc/sof/imx/Kconfig        |  2 ++
 sound/soc/sof/imx/imx8.c         | 17 +++++++++----
 sound/soc/sof/imx/imx8m.c        | 10 +++++---
 sound/soc/sof/intel/hda-codec.c  |  4 +--
 sound/soc/sof/intel/hda-loader.c | 42 +++++++++++++++++++-------------
 sound/soc/sof/intel/hda.c        | 26 +++++++++++++++++++-
 sound/soc/sof/topology.c         |  4 +--
 7 files changed, 74 insertions(+), 31 deletions(-)

-- 
2.25.1

