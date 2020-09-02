Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A8525AC9A
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 16:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD77F185A;
	Wed,  2 Sep 2020 16:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD77F185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599055878;
	bh=Y1Y66BmL8sudyGQvk/wLDkAAk40h0xIdnUgajvXdA3o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nWgnE2WRA6vQHmq9lNjMaWrKsq/rz2RWZoU8fMNwkj69C9ZU7XfSxskdYQaBU21WC
	 Z9UUDqg62etxWnh2kyrGbXTSq+rFi3v4Su2Bp35bVjoVX9+3DynOPOtVChxzFXpK9S
	 2E5DkvLejwl4zArIwqMz92P+ekS66C630ggxj9tU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A937F8026F;
	Wed,  2 Sep 2020 16:09:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81FE5F8026F; Wed,  2 Sep 2020 16:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FEAEF801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 16:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FEAEF801DA
IronPort-SDR: NxVP1P8ve9j4njyjSla7xMo+WHoOeQ4A3cqN3KPyxr6mmSzE6A4WL0NvTtV8wmn6VPnWJ8HqZW
 lqfmQgqVKewA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156649984"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="156649984"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 07:09:17 -0700
IronPort-SDR: lyMQyuFjVAtNpiuI+XMFe28fNE2tQTPgeGdhokvim7Xtxj+AIA1DFyxd6ZDrUGodWwaLVYPtrR
 ZMBaRAjW9zkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="338934357"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2020 07:09:16 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 0/3] ASoC: SOF: multi core support for 5.10
Date: Wed,  2 Sep 2020 17:07:53 +0300
Message-Id: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

This series extends the multi-core support in SOF. Capability
to specify which core to use, on a per component basis, is added
to topology. The topology load functionality in SOF is modified to
power up/down host controlled cores based on the topology
description.

Guennadi Liakhovetski (2):
  ASoC: SOF: add a "core" parameter to widget loading functions
  ASoC: SOF: support topology components on secondary cores

Ranjani Sridharan (1):
  ASoC: SOF: topology: fix core enable sequence

 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/pm.c              |   1 +
 sound/soc/sof/sof-audio.c       |  25 ++++
 sound/soc/sof/sof-audio.h       |   5 +
 sound/soc/sof/sof-priv.h        |   3 +
 sound/soc/sof/topology.c        | 210 ++++++++++++++++++++++----------
 6 files changed, 184 insertions(+), 61 deletions(-)

-- 
2.27.0

