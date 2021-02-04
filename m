Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C1E30FDF8
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:19:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FF91662;
	Thu,  4 Feb 2021 21:18:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FF91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612469978;
	bh=bQzS2Vt4mUgMD9F9OzoeLekam34qyfUm5woXicV/TQ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jYoSh5qt+LE7LeSDdijLYJJF9izC552fLkt4tGSL+0Ol6Q19c58Tg3ZM/yiSDSr8H
	 SzqJFOtgFmrBzcX841xzlqpGgGo3UhofbE9bSHdmdqSr7iF53kYWsSWdI8sRIMmzUZ
	 K5xHVgGoX0/GezfAM7a3ogCj8BgD+BFU9TkUPzG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 642C0F80152;
	Thu,  4 Feb 2021 21:18:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26162F8023E; Thu,  4 Feb 2021 21:18:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF70F80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:17:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF70F80155
IronPort-SDR: ovMABy+1sFPJHRnBPnKWcmopRAoFtEWDy44SJB1zY0fmWU4uZwGxrJuiEAaN0r78tw+xj/wo8V
 s31WCMGnHUCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="177817697"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="177817697"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:53 -0800
IronPort-SDR: 3uLAJzm6SrQvhPCfatIM0mYtAHMWyT5X8z4n8s2+PiaH4z8GPJjHAE/7mI1Jaku3Yv/WIecPcg
 Fo+MUDs+DErw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="373011113"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:17:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 0/4] ASoC: codecs: Realtek/SoundWire: fix remove/suspend issues
Date: Thu,  4 Feb 2021 14:17:35 -0600
Message-Id: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

These issues and fixes were identified during our module load/unload
and suspend/resume stress tests.

Bard Liao (1):
  ASoC: rt5682: do nothing in rt5682_suspend/resume in sdw mode

Pierre-Louis Bossart (3):
  ASoC: rt700-sdw: use cancel_work_sync() in .remove as well as .suspend
  ASoC: rt711-sdw: use cancel_work_sync() for .remove
  ASoC: rt5682-sdw: cancel_work_sync() in .remove and .suspend

 sound/soc/codecs/rt5682-sdw.c | 4 +++-
 sound/soc/codecs/rt5682.c     | 6 ++++++
 sound/soc/codecs/rt700-sdw.c  | 4 ++--
 sound/soc/codecs/rt711-sdw.c  | 4 ++--
 4 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.25.1

