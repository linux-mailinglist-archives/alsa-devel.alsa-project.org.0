Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBBF21126A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 689E3168A;
	Wed,  1 Jul 2020 20:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 689E3168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593627346;
	bh=2ZmXUCPYkH/WjaFPBACltcJnlaAzKQMP3dX3qPfYXD4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TVxNNi7nijpQkgM2lviqCVeQxEizu+kSt4IO292h6K+pvaZJWxOB9+ZppJl/IsQ+1
	 ao5XWDfUoSMoCE88SFMpx6HfaHpz75c6d6jVG7lyizDCUQp4sG46Wz6ULq/XqSNRpT
	 fWFiSrFxbzFrDw8a3QT37LPQlsJiQrubRW9eogGQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74395F802BC;
	Wed,  1 Jul 2020 20:14:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCEFF80256; Wed,  1 Jul 2020 20:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87177F800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87177F800C1
IronPort-SDR: 3GPYOAJs5aAXFbPp3QGljK8OgFLobCfwj01tjaQffcRHHfsM9oFPqQwUhA5hHVgJNZVVbckYqc
 SILOrpyJNi7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145753217"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="145753217"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:52 -0700
IronPort-SDR: crDwR0Ev0uSjKkm5qx7i/Df6nrp29G/yJrnIQjzo3BpcDwWc70d/SdZnPzmnNWtHjX/VaDBNpd
 kg4tUKXzAhQw==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="481686320"
Received: from srnatla-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.76.199])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:13:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ASoC: codecs: wm/cs: fix kernel-doc and W=1 warnings
Date: Wed,  1 Jul 2020 13:13:13 -0500
Message-Id: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

I've been doing a lot of cleanups to get to zero warnings with W=1,
here's the first batch for Cirrus/Wolfson codecs.

Pierre-Louis Bossart (7):
  ASoC: codecs: cs4270: fix kernel-doc
  ASoC: codecs: cs42l42: remove always-true comparisons
  ASoC: codecs: wm8986: fix missing kernel-doc arguments
  ASoC: codecs: wm8960: fix kernel-doc
  ASoC: codecs: wm9713: remove spurious kernel-doc comment start
  ASoC: codecs: wm8994: fix kernel-doc
  ASoC: codecs: wm8400: add _maybe_unused as needed

 sound/soc/codecs/cs4270.c  | 4 ++--
 sound/soc/codecs/cs42l42.c | 9 +++------
 sound/soc/codecs/wm8400.c  | 6 +++---
 sound/soc/codecs/wm8960.c  | 2 +-
 sound/soc/codecs/wm8994.c  | 4 ++++
 sound/soc/codecs/wm8996.c  | 3 +++
 sound/soc/codecs/wm9713.c  | 2 +-
 7 files changed, 17 insertions(+), 13 deletions(-)


base-commit: a2b782d59c57cb6f673dbb4804ffc500336d7a54
-- 
2.25.1

