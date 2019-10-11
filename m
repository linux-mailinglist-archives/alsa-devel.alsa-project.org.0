Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2CD45AA
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 18:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868F31664;
	Fri, 11 Oct 2019 18:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868F31664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570812313;
	bh=YUn/fRyYS1NlC+SSgvo0udhe+OZLDDw6HHSQeBJq+Qo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UsHoZ94vxKa/5KTBNeZLMqdgjiQKoCc8HoJbs8TDbNpNCMob+/osTqSs2yLBUPbsm
	 e/0Xda1C1LDgxdC57HDNpIJHiOUExgzOyXgUGZzlWbEG6OHr8rU2J9/QZHqTZmQ9+I
	 2+6JnT13Fg820oYrXoo21rCUnXn3wV/wqOoTpiTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A50D3F80539;
	Fri, 11 Oct 2019 18:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FD33F8026F; Fri, 11 Oct 2019 18:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DC62F800E3
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 18:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC62F800E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 09:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="224387815"
Received: from askelkar-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.181.148])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2019 09:43:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 11 Oct 2019 11:43:08 -0500
Message-Id: <20191011164312.7988-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/4] ASoC: SOF: fix static analysis warnings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Recent SOF commits generate warnings reported e.g. by
cppcheck. Unfortunately those tools are too verbose to be used by our
CI, so there's always a delay in detecting such issues.

Pierre-Louis Bossart (4):
  ASoC: SOF: Intel: byt: fix operator precedence warnings
  ASoC: SOF: Intel: bdw: fix operator precedence warnings
  ASoC: SOF: topology: remove always-true redundant test
  ASoC: SOF: topology: check errors when parsing LED tokens

 sound/soc/sof/intel/bdw.c | 16 ++++++++--------
 sound/soc/sof/intel/byt.c | 16 ++++++++--------
 sound/soc/sof/topology.c  | 12 ++++++++----
 3 files changed, 24 insertions(+), 20 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
