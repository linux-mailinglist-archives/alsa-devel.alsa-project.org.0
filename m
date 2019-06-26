Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D27D95728B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 22:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FDE516AE;
	Wed, 26 Jun 2019 22:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FDE516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561580707;
	bh=XVwpj1F6AWl36S8nnIydKLhH+kJ6NZt116041Sjz4nQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J8Tij30iG7+hqYQkA5xzCyAfJvXndG8CPonO3Oiaz7fzwHxg0TzmRGVZBFvoxquJA
	 hPIobRmM1Zm8cA1Z+2MAhF7Xt6YZP2y6Mvl9z13TMp3lcodRT8AiNY+wSiRXlf6y0w
	 ijT/pbZR9RZUT4xnbcbd3JsfPgPxMlGc+EXUHzt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F18E1F8972F;
	Wed, 26 Jun 2019 22:22:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C9C6F896CC; Wed, 26 Jun 2019 22:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBC24F806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 22:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC24F806F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 13:22:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="155984481"
Received: from byang2-mobl1.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.252.140.110])
 by orsmga008.jf.intel.com with ESMTP; 26 Jun 2019 13:22:29 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 26 Jun 2019 13:22:26 -0700
Message-Id: <20190626202229.16312-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/3] SOF PM and jack detection fixes
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This set of patches addresses issues related to runtime
suspend and jack detection during runtime suspend.

The first 2 patches handle enabling WAKEEN in the SOF
driver to address issue with jack detection when the
SOF device is runtime suspended. More details about the
issue can be found here:
https://github.com/thesofproject/linux/issues/909

The third patch allows the SOF driver to suspend after
the autosuspend delay instead of suspending immediately
upon boot.

Pan Xiuli (1):
  ASoC: SOF: mark last_busy value at runtime PM init

Rander Wang (2):
  ASoC: SOF: Intel: hda: reduce ifdef usage for hda
  ASoC: SOF: Intel: hda: Enable jack detection in sof hda driver

 sound/soc/sof/intel/hda-codec.c | 45 +++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-dsp.c   | 51 +++++++++++++++++++++------------
 sound/soc/sof/intel/hda.h       |  4 +++
 sound/soc/sof/sof-pci-dev.c     |  3 ++
 4 files changed, 83 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
