Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72549212D12
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:23:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B1516D4;
	Thu,  2 Jul 2020 21:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B1516D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593717824;
	bh=xqL6nqxBiiqP1MqfhqUDCMLGQTKSto4ASteck2q4MOI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kC3V9qgVfMis4IKIBHancuaas0u2YqdIKkLiHUnW/YIUgNBt4KDxTeV8++IAxzDsP
	 6xlDRO0UbseyaxsUq3wT0j0jiA+TPGAnQe3SrSEGbe+hCp0VxmU7tW223gQgD4o87t
	 oZLE7f6o+GxwjEkK19KuMJD1/1Olxw7vdWwLZ43o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B75F80253;
	Thu,  2 Jul 2020 21:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A500F80134; Thu,  2 Jul 2020 21:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01445F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01445F80134
IronPort-SDR: VIewkbD4xwB23wgTPCPK+n+sD4UNt3UUm19F8DecDq09KIUoxLjTXQq48iMI4xmvvKcvBZSpPE
 +COpXJANLfLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="165059422"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="165059422"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:21:52 -0700
IronPort-SDR: p8HwCWMO7jTvnVzsH4ZCm1GevgpaXqePFvbd2FlMTPjwtW+F6qfU32tyP8CWKTtJZFPMQMQsgn
 piWk7ban/Qpg==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="304345249"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:21:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/6] ASoC: fsl: fix kernel-doc
Date: Thu,  2 Jul 2020 14:21:35 -0500
Message-Id: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
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

This cleanup patchset is only about kernel-doc, mostly trivial edits
and format correction.

v2: added Nicolin Chen's Acked-by tags and included the three
suggested edits.

Pierre-Louis Bossart (6):
  ASoC: fsl: fsl_ssi_dbg: remove spurious kernel-doc comment start
  ASoC: fsl: fsl_ssi: fix kernel-doc
  ASoC: fsl: fsl-asoc-card: fix kernel-doc
  ASoC: fsl: fsl_spdif: fix kernel-doc
  ASoC: fsl: fsl_asrc: fix kernel-doc
  ASoC: fsl: fsl_esai: fix kernel-doc

 sound/soc/fsl/fsl-asoc-card.c | 21 +++++------
 sound/soc/fsl/fsl_asrc.c      | 57 +++++++++++++++++++---------
 sound/soc/fsl/fsl_esai.c      | 32 +++++++++-------
 sound/soc/fsl/fsl_spdif.c     |  5 ++-
 sound/soc/fsl/fsl_ssi.c       | 70 ++++++++++++++++++++++-------------
 sound/soc/fsl/fsl_ssi_dbg.c   |  4 +-
 6 files changed, 115 insertions(+), 74 deletions(-)

-- 
2.25.1

