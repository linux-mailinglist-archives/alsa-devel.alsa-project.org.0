Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB4336918
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 01:45:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A26691701;
	Thu, 11 Mar 2021 01:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A26691701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615423522;
	bh=p11VTys9mrD5UfwB/RYrId9Ng4S4HhEzR9YBwCbm4Hg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TB2ILR2LpnER9H64DTRyRqhh4fKnq8FLw4VN52uZASf5TIyKwdDd6lHkVRz5JbIdK
	 dpswzPBRnJ1gs/4lAYcY5fHFi+1eH1PatjoHV/pYxKeZ2qrW11xmWawHozKYGDjLVX
	 UbGykNTWijhQZIs3/tQsXENvNxGMqmd4Bacc5GM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28A41F80279;
	Thu, 11 Mar 2021 01:43:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67F38F8020D; Thu, 11 Mar 2021 01:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B40CF8012F
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 01:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B40CF8012F
IronPort-SDR: kOKiCQdNOR7qzLgn/VR/xulKTkC/VmxAkboU0jylc0H238xnCfsssCUlVEWXm6c4hdJ/cmsAIL
 HIEXBXBgs3LQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="176185732"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="176185732"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:40 -0800
IronPort-SDR: iylw3IqiM97Oh/jzIeTejeH6WC0wnLfsdc5aaK4CSpq8D0TFzYdTB/U6qALjYTdk4+A6WnZeec
 5A/OhPrWxBaA==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370385609"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:43:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/10] ASoC: codecs: wolfson: remove cppcheck warnings
Date: Wed, 10 Mar 2021 18:43:22 -0600
Message-Id: <20210311004332.120901-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, patches@opensource.cirrus.com, broonie@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
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

There should be no functionality change, just minor fixes to make
warnings go away.

Pierre-Louis Bossart (10):
  ASoC: arizona: fix function argument
  ASoC: madera: align function prototype
  ASoC: wm2200: remove unused structure
  ASoC: wm8903: remove useless assignments
  ASoC: wm8958-dsp2: rename local 'control' arrays
  ASoC: wm8978: clarify expression
  ASoC: wm8994: align function prototype
  ASoC: wm8996: clarify expression
  ASoC: wm_adsp: simplify return value
  ASoC: wm_hubs: align function prototype

 sound/soc/codecs/arizona.h     |  2 +-
 sound/soc/codecs/madera.h      |  2 +-
 sound/soc/codecs/wm2200.c      |  7 -------
 sound/soc/codecs/wm8903.c      |  2 --
 sound/soc/codecs/wm8958-dsp2.c | 16 ++++++++--------
 sound/soc/codecs/wm8978.c      |  2 +-
 sound/soc/codecs/wm8994.h      |  2 +-
 sound/soc/codecs/wm8996.c      |  2 +-
 sound/soc/codecs/wm_adsp.c     |  2 +-
 sound/soc/codecs/wm_hubs.h     |  2 +-
 10 files changed, 15 insertions(+), 24 deletions(-)

-- 
2.25.1

