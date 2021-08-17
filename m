Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD28A3EF26C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 21:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F571688;
	Tue, 17 Aug 2021 21:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F571688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629227038;
	bh=uCQGeaBlBs/ROYwhgVF6hLlc6dQ0l/z831bMMjogEXk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bC6Rdtyy4XbBJnfe1jTwAlvpY/Hy0A3s3NLfxG5DxBqfXYkdcfCR79VBgTFDhSTdJ
	 A0A7eL/jVazczlreAtL9OKT15NEe1BKhx+XLN+9oIniutL4Ufs4cwmOZj40nuyRYaL
	 6x0veZxTK9wB0TFM6aLHk81D1Ml3giTwtV0khJuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8812DF804ED;
	Tue, 17 Aug 2021 21:01:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E183F804DA; Tue, 17 Aug 2021 21:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F34DF80134;
 Tue, 17 Aug 2021 21:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F34DF80134
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="215898776"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="215898776"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 12:01:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="488147352"
Received: from aaadelek-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.12.89])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 12:01:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/2] ASoC: SOF: trigger re-probing of deferred devices
 from workqueue
Date: Tue, 17 Aug 2021 14:00:57 -0500
Message-Id: <20210817190057.255264-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE SOF DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Audio drivers such as HDaudio legacy and SOF rely on a workqueue to
split the probe into two, with a first pass returning success
immediately, and the second pass taking a lot more time due to the use
of request_module() and the DSP initializations.

This workqueue-based solution helps deal with conflicting requirements
a) other drivers should not be blocked by a long probe
b) a PROBE_PREFER_ASYNCHRONOUS probe_type is explicitly not allowed
to avoid a deadlock when request_module() is used.

This patch makes sure the deferred probe framework is triggered when
the provider of resources successfully completes its initialization.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 3e4dd4a86363..cecc0e914807 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -251,6 +251,9 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 	sdev->probe_completed = true;
 
+	/* kick-off re-probing of deferred devices */
+	driver_deferred_probe_trigger();
+
 	return 0;
 
 fw_trace_err:
-- 
2.25.1

