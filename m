Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B57334B213
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:18:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C20C167E;
	Fri, 26 Mar 2021 23:17:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C20C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616797092;
	bh=S48WS8rj+SVxRLxjK5ocFNHXe4Bdp7glrvbfhTe6jSQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fTPBYfUc/VaSKhP6KfnWfdn7xKufr6hW37n77XCH6OQFmqQKjusiAz4WN4ow8o+Z8
	 Ax/I2GN0lVszvBdjvT0VUb3/hojoqcUezCLyocte9Ow3aPwAa5a+7S6RsjcfeJFWB9
	 2ITZUPsMw/qIwJdYdIZMvR6bojA60MY1lXxURtpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 683FFF801EB;
	Fri, 26 Mar 2021 23:16:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0967EF801EB; Fri, 26 Mar 2021 23:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E606F8016B
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E606F8016B
IronPort-SDR: c3fOHQ66tPj+kpNmKHw1BVKfR1PPru5wXN6VhlOL+7l1biBhxADAolS1AjD5Ao/ZCC+2MycUPp
 mfdad9AJW46g==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="276373848"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="276373848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:16:34 -0700
IronPort-SDR: VrBQ5RydJYa95h5hXNQ6W2fvs/JPydJ8TBEvDJmHisNAVp9algNDI/Lb8CPvPqVTuN1gEjyb7c
 IC5nm3Cvdwsg==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416713332"
Received: from schine-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.191.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:16:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 0/2] ASoC: remove cppchecks warnings on lm49453 and da732x
Date: Fri, 26 Mar 2021 17:16:17 -0500
Message-Id: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
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

There are the last two patches in the cleanups, this time I am not
sure what the code does and what the proper fix might be. Feedback
welcome.

Pierre-Louis Bossart (2):
  ASoC: lm49453: fix useless assignment before return
  ASoC: da732x: simplify code

 sound/soc/codecs/da732x.c  | 17 ++++++-----------
 sound/soc/codecs/da732x.h  | 12 ++++--------
 sound/soc/codecs/lm49453.c |  2 --
 3 files changed, 10 insertions(+), 21 deletions(-)

-- 
2.25.1

