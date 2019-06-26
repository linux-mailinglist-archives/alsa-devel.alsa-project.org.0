Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A1556259
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 08:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E81EC1607;
	Wed, 26 Jun 2019 08:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E81EC1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561530691;
	bh=dXvofGP3UV6Vm/8nAsnv+nomA2ccDWpr0KZxiarUg4A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OqJgeNLxUKczQ3txx0a0FpyKoc1ZOkNrXjOlrOGchgWRnWjD5fdpGAI1A2Ao9pCjs
	 92m1DvR7zvu2yT94V2YqoEX4Xvdob2UrG++rVzd0OQNPAgrpCNx+33XR3XONDGBEur
	 6qoIYKKQ7/73DNjNUzIXs+R2goZfF1XEG8X8Y4F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57669F896B9;
	Wed, 26 Jun 2019 08:29:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC83CF896B9; Wed, 26 Jun 2019 08:29:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A64DF806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 08:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A64DF806F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jun 2019 23:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; d="scan'208";a="172623212"
Received: from rlanex-mobl.amr.corp.intel.com (HELO
 ranjani-desktop.hsd1.ca.comcast.net) ([10.251.157.231])
 by orsmga002.jf.intel.com with ESMTP; 25 Jun 2019 23:29:35 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 25 Jun 2019 23:29:33 -0700
Message-Id: <20190626062935.5549-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, libin.yang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 0/2] Fixes for SOF module unload/reload
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

A recent commit "ALSA: hdac: fix memory release for SST and SOF drivers"
removed the kfree call for the hdac device in
snd_hdac_ext_bus_device_exit(). This requires that the SOF driver
also make the hdac_device and hdac_hda_priv device-managed so
that they can be freed when the SOF module in unloaded. The first
patch takes care of this change.

Additionally, because of the above change, the hda_codec is
device-managed and freeing it in snd_hda_codec_dev_release() leads
to kernel panic with module unload/reload stress tests. The second
patch includes the change to avoid freeing hda_codec for ASoC driver.

More details for the module unload/reload test failures can be found
here: https://github.com/thesofproject/linux/issues/966

Ranjani Sridharan (2):
  ASoC: SOF: Intel: hda: Make hdac_device device-managed
  ASoC: hda: don't free hda_codec for HDA_DEV_ASOC type

 sound/pci/hda/hda_codec.c       | 8 +++++++-
 sound/soc/sof/intel/hda-codec.c | 6 ++----
 2 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
