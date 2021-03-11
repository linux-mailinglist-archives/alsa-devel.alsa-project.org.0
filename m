Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1133693B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:51:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC1B1700;
	Thu, 11 Mar 2021 01:50:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC1B1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423860;
	bh=2ecOAVFcrUjJwIr0E0Uu5srCuEUvIY/ZwIS3LRzlZ6U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YANK921cVNoKPy5sY5WkGws7b0uOd4R8lyX0qnqtA9tqriQVCduTXUnz2L7tZvPSR
	 9rIf81H5dxSN7qRtD3NVZD+VzhDb06QxP7oMH6DbLsA9u2TLmhFssh+CXNRxyMccoe
	 ybUtxOnKy5KRWt4xu+2I/U331/pMVbPlpGPYXUHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3560AF80279;
	Thu, 11 Mar 2021 01:49:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E318CF801D8; Thu, 11 Mar 2021 01:49:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35247F8012F
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35247F8012F
IronPort-SDR: 83Xb8SUwNStPZ6Z96qib19wNg4zFwPpdlztuoLL5TAKqKcDKKPYWAJcfeNWHnsj6ETGJ3a1KAc
 C/8A3KR46/cQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865529"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865529"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:14 -0800
IronPort-SDR: hDjsuncF8llssoUHAl8uU/QMI4xyFcq7TAK8JfSQYqi+YH2A1WFKueuFGF3ERBxayd/b+aD6Ze
 W/XcEmU17a3A==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386779"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: mediatek: remove cppcheck warnings
Date: Wed, 10 Mar 2021 18:49:00 -0600
Message-Id: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

There should be no functionality change, this patchset only fixes
shadowed variables, prototypes and removes a useless assignment.

Pierre-Louis Bossart (4):
  ASoC: mediatek: mtk-btcvsd: remove useless assignment
  ASoC: mediatek: mt2701: align function prototype
  ASoC: mediatek: mt2701: rename shadowed array
  ASoC: mediatek: mt8173: rename local irq variable

 sound/soc/mediatek/common/mtk-btcvsd.c            | 2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h | 4 ++--
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c        | 4 ++--
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c        | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.25.1

