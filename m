Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331320A468
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 20:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5CA71928;
	Thu, 25 Jun 2020 20:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5CA71928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593108525;
	bh=UvgcDpLYxL/dNwCWuSK4GXdt+rjNDAHGNt88auEi1ig=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K0/HSXwB/87BX2FLdWa34t+BsjgC+IeZ3oYjYuSwBLLnmFzqZbYIe5WYUwrdos9H6
	 lnwCwgzxvwGcZqy5vVdW04/zxxp7LE4geqySGcZxrHx73KTG5HohUGkEt5DFUcx8AO
	 JAFtvr2CUNNzjx0GCTEflTHVoh4apmWxxeUAx33s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EABDCF80277;
	Thu, 25 Jun 2020 20:07:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB1EF8023E; Thu, 25 Jun 2020 20:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFEC1F800B2
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 20:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFEC1F800B2
IronPort-SDR: p3cdm8l1wN5p4XTG+W6MMS0W2xqnlyO5+VoKK/MFwIikZEJvIQIpkTX9dP1iVY5H64+rt6/C1N
 /krQseCS0UEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146506306"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="146506306"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:06:52 -0700
IronPort-SDR: 1+vMLQb3y/zxFhyOepMstT22yvyi6F/Znsg6/FKMtqDvwxUWOal5iegD1tGBGFx1XLitjl/xi8
 +6IdWeA15xng==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="453093122"
Received: from kpcavias-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.110.181])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 11:06:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/4] ASoC: Intel: fix missing .owner fields
Date: Thu, 25 Jun 2020 13:06:31 -0500
Message-Id: <20200625180635.3563-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
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

Fix omission of .owner = THIS_MODULE in Intel and SOF cards.
Thanks to Jaroslav and Takashi for reporting and suggesting a fix.

Pierre-Louis Bossart (4):
  ASoC: SOF: nocodec: add missing .owner field
  ASoC: Intel: cml_rt1011_rt5682: add missing .owner field
  ASoC: Intel: sof_sdw: add missing .owner field
  ASoC: Intel: bxt_rt298: add missing .owner field

 sound/soc/intel/boards/bxt_rt298.c         | 2 ++
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 1 +
 sound/soc/intel/boards/sof_sdw.c           | 2 +-
 sound/soc/sof/nocodec.c                    | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)


base-commit: 6f81e520b2906258a063f09b8d1dd9d0cc6a3172
-- 
2.20.1

