Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D77640F475
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 11:00:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E6B817BE;
	Fri, 17 Sep 2021 10:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E6B817BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631869203;
	bh=hYLCtGT9a/4G4aYBMFvrMZLJ3/8jZWDzGklMFZrFrgE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T3dokf/JqCuMLyfZba1ikXK+O4/bkGF6bcboggpF6iPV93XebYPN5155GL3CCYpPX
	 mKltXndLppItMR66Ch5ZJnvv0naUYtVUlxQw/jppYQ3OJnHhPmbKbrRCRfcL8M/mV7
	 J7BCNfah9hqGJiD32+49oyBjIhkU6e6X2x9Xp4rA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C07CF804AB;
	Fri, 17 Sep 2021 10:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A279F800E3; Fri, 17 Sep 2021 10:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDEFFF800E3
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 10:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDEFFF800E3
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="308300238"
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="308300238"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 01:58:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="473064373"
Received: from akostadi-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.45])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 01:58:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc: Small cleanups for message handler
 functions
Date: Fri, 17 Sep 2021 11:58:21 +0300
Message-Id: <20210917085823.27222-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, bard.liao@intel.com
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

Hi,

Rename the parameter for ipc_trace_message() to match it's content and use
%#x" for hexadecimal prints in remaining places.

Regards,
Peter
---
Peter Ujfalusi (2):
  ASoC: SOF: ipc: Clarify the parameter name for ipc_trace_message()
  ASoC: SOF: ipc: Print 0x prefix for errors in
    ipc_trace/stream_message()

 sound/soc/sof/ipc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
2.33.0

