Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77798478064
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:17:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04742200D;
	Fri, 17 Dec 2021 00:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04742200D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639696678;
	bh=/THUlKZ4blyTccgDFdjhoOaB0ZLh4202cdjREd8wtqk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PhV/ILb93JwYSsVXDWqaznwSCmvPeewJcTY9Po6Y0lulDgm4RFVdd3mWOrtSlI9Qj
	 5+6WBMcu8PudzAYrSLvgoMBhvQuZGcyUoirkciHa7YJvPC5dVDACT0TgL/wtRCqKyc
	 fEqWw5Olg1h6idryJC2jbyRLgYwFEvMXBaD56Qxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F4B1F80116;
	Fri, 17 Dec 2021 00:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95C1FF800B0; Fri, 17 Dec 2021 00:16:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6479BF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6479BF800B0
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="219641672"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="219641672"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:16:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="756279918"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:16:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ASoC: SOF: remove suport for TRIGGER_RESUME
Date: Thu, 16 Dec 2021 17:16:25 -0600
Message-Id: <20211216231628.344687-1-pierre-louis.bossart@linux.intel.com>
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

None of the SOF platforms support INFO_RESUME, and rely on the
indirect path used by the ALSA core with the prepare and TRIGGER_START
steps.

Let's remove the left-over dead code.

Ranjani Sridharan (3):
  ASoC: SOF: pcm: remove support for RESUME trigger
  ASoC: SOF: Intel: hda: remove support for RESUME trigger
  ASoC: SOF: Intel: hda: remove support for RESUME in platform trigger

 sound/soc/sof/intel/hda-dai.c    | 10 ----------
 sound/soc/sof/intel/hda-stream.c |  1 -
 sound/soc/sof/pcm.c              | 20 --------------------
 3 files changed, 31 deletions(-)

-- 
2.25.1

