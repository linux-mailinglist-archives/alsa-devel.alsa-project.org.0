Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DF62F72CA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 07:18:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5DBA17B0;
	Fri, 15 Jan 2021 07:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5DBA17B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610691512;
	bh=EBpqPwNEW3RS1wQc4TOxPgX2QjEVsxEHndSuYLZnLiI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xxlw62N31nDOv18BbacvB+kI/kuJGkrxi/vGh7de2NMEBpMvCVlbms5oCq3tkkcv2
	 HrqDeCxdxqB2R3R9v+sCDJ+sEoQ7zFqLSzeku0QY4qycJ2CGRpVg/ovJfrkl+yRJw3
	 brx75SS73Xlq+9Tyjv6EwaQr2JerW3KXX/CElm5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DC00F801ED;
	Fri, 15 Jan 2021 07:17:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67446F80113; Fri, 15 Jan 2021 07:16:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 338BFF80134
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 338BFF80134
IronPort-SDR: 3EcOqEiXs47vDPmjRlwNxxFSYax5pTq+aiE34LxLLwdnRRl63hauatx2axwiiv95srGAvc/oQ3
 ypYoAv7yJZHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166174457"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="166174457"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 22:16:48 -0800
IronPort-SDR: mnVgka02Sl1SnutUAJk+1wWr2oACyhES3UBR8sx5a+sh96oUIQtho+6nMIcVYvHCrQG+ksXjAT
 TKFLeZffMh8A==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382551858"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 22:16:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/2] ASoC/SoundWire: fix timeout values
Date: Fri, 15 Jan 2021 14:16:49 +0800
Message-Id: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

The timeout for an individual transaction w/ the Cadence IP is the same as
the entire resume operation for codecs.
This doesn't make sense, we need to have at least one order of magnitude
between individual transactions and the entire resume operation.

Set the timeout on the Cadence side to 500ms and 5s for the codec resume.

Both ASoC and SoundWire trees are fine for this series.

Pierre-Louis Bossart (2):
  ASoC: codecs: soundwire: increase resume timeout
  soundwire: cadence: reduce timeout on transactions

 drivers/soundwire/cadence_master.c | 2 +-
 sound/soc/codecs/max98373-sdw.c    | 4 +++-
 sound/soc/codecs/rt1308-sdw.c      | 2 +-
 sound/soc/codecs/rt5682.h          | 2 +-
 sound/soc/codecs/rt700-sdw.c       | 2 +-
 sound/soc/codecs/rt711-sdw.c       | 2 +-
 sound/soc/codecs/rt715-sdw.c       | 2 +-
 7 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.17.1

