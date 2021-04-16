Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07B36286A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 21:13:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7139A16E7;
	Fri, 16 Apr 2021 21:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7139A16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618600418;
	bh=g/udS0t0IGqpe3XpHAA2Jct99OJY0pSFngSdA39t08c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nff48MsdimOT5cMATMrSlWZ0ryVSpk7WA4pAFpSN93TUruHvUji1/NO8B8GrzTR9Q
	 TlOTNGndxLzeeprG6IElUxEP2ZYhS+fnvZNSujEkzL2pPrfmcm8TpSyxV2w99um4Dh
	 cYW3RUDkWE8c7kX7QL+GuzxanI5xhtgFrLA2bNTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2ED5F80290;
	Fri, 16 Apr 2021 21:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31DFBF800B9; Fri, 16 Apr 2021 21:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DAD0F800B9
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 21:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAD0F800B9
IronPort-SDR: b7zS5V0rung0jGOFCm3KX6FC/wO0PPou4EzU7VNdPM7tUt/Eib7PnOJ9XdUN2pdPTniy1emNEl
 3Tn9PuNM8tPA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="256407093"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="256407093"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:11:56 -0700
IronPort-SDR: VZ3VIgZbjTMWNYaCbCXBEXhFC5FNt1vcElPyRdq81llU+GySLcQAMNq5nVQNcMa5xdufC9WnJ8
 tkDM9rjPV2Xw==
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="612838738"
Received: from paulsoum-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.66.118])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 12:11:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ASoC: remove more cppcheck warnings
Date: Fri, 16 Apr 2021 14:11:39 -0500
Message-Id: <20210416191144.27006-1-pierre-louis.bossart@linux.intel.com>
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

I missed those warnings in the previous rounds, they are mostly
trivial and shouldn't change the behavior.

Pierre-Louis Bossart (5):
  ASoC: soc-acpi: remove useless initialization
  ASoC: soc-core: fix signed/unsigned issue
  ASoC: soc-core: fix always-false condition
  ASoC: codecs: lpass-rx-macro: remove useless return
  ASoC: codecs: rt5682: clarify expression

 sound/soc/codecs/lpass-rx-macro.c | 2 --
 sound/soc/codecs/rt5682.c         | 2 +-
 sound/soc/soc-acpi.c              | 2 +-
 sound/soc/soc-core.c              | 7 +------
 4 files changed, 3 insertions(+), 10 deletions(-)

-- 
2.25.1

