Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0D32AC32
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:27:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23257192A;
	Tue,  2 Mar 2021 22:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23257192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614720438;
	bh=eHUD/BRDTBk8i4NvA5X8uoH2Ib9baUYYhKVJ1YEFN8w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PD2funArUvtyrzd/ihFUMjZ3JoQFXKujCFMMgT/YcyVlUFERa9euDg/jch1QRDVtt
	 7rhUN9Fj7vgPeKTmMcnOB+IRTJttsoDcHDgkHZmOU21VEHLLXuYW59grkhQ3ufy0A8
	 3EwQ9G82ev6CFaPrl4P8ScbsGFM2eEohBnYqfwMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D616F80271;
	Tue,  2 Mar 2021 22:25:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22395F80269; Tue,  2 Mar 2021 22:25:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A17F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:25:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A17F80088
IronPort-SDR: AUn/+WN8TT4mC3Naq/ZWenzYRFTLZOzTYa/w+qgRF4qBFUsqdaZ89jTQMXTcqEXyJVBkM7MHkN
 2aGZOUaE5Hzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166885447"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="166885447"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:39 -0800
IronPort-SDR: iPAxRYXFX4tARwzH60FN7VqSvV00Y7wW2yY9gt3z6o6jj+e3TffEx6DTDM4dYlGIVp3n4k1gYw
 zDa+vqCzHkIg==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="399223335"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:25:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/24] ASoC: realtek: fix cppcheck warnings
Date: Tue,  2 Mar 2021 15:25:03 -0600
Message-Id: <20210302212527.55158-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

Lots of trivial issues that make cppcheck too verbose. There shouldn't
be any functionality change with this patchset.

Pierre-Louis Bossart (24):
  ASoC: rt1011: use logical OR
  ASoC: rt1011: remove redundant test
  ASoC: rt1011: clarify expression
  ASoC: rt1015: clarify expression
  ASoC: rt1016: clarify expression
  ASoC: rt1305: clarify expression
  ASoC: rt1308: clarify expression
  ASoC: rt5640: clarify expression
  ASoC: rt5645: use logical OR
  ASoC: rt5645: clarify expression
  ASoC: rt5651: clarify expression
  ASoC: rt5651: remove useless assignment
  ASoC: rt5659: clarify expression
  ASoC: rt5660: clarify expression
  ASoC: rt5663: clarify expression
  ASoC: rt5665: clarify expression
  ASoC: rt5668: clarify expression
  ASoC: rt5668: remove useless assignments
  ASoC: rt5670: clarify expression
  ASoC: rt5677: clarify expression
  ASoC: rt5677: remove useless assignment
  ASoC: rt5682: clarify expression
  ASoC: rt5682: remove useless assignments
  ASoC: rt5682: remove useless initialization

 sound/soc/codecs/rt1011.c | 47 ++++++++++++++++++---------------------
 sound/soc/codecs/rt1015.c |  5 +++--
 sound/soc/codecs/rt1016.c |  7 +++---
 sound/soc/codecs/rt1305.c |  4 ++--
 sound/soc/codecs/rt1308.c |  8 +++----
 sound/soc/codecs/rt5640.c |  6 ++---
 sound/soc/codecs/rt5645.c |  6 ++---
 sound/soc/codecs/rt5651.c |  6 ++---
 sound/soc/codecs/rt5659.c |  4 ++--
 sound/soc/codecs/rt5660.c |  4 ++--
 sound/soc/codecs/rt5663.c |  4 ++--
 sound/soc/codecs/rt5665.c |  4 ++--
 sound/soc/codecs/rt5668.c |  8 +++----
 sound/soc/codecs/rt5670.c |  4 ++--
 sound/soc/codecs/rt5677.c |  6 ++---
 sound/soc/codecs/rt5682.c | 12 +++++-----
 16 files changed, 67 insertions(+), 68 deletions(-)

-- 
2.25.1

