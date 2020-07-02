Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D115212AB8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B409D16E7;
	Thu,  2 Jul 2020 19:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B409D16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593709364;
	bh=0nMFhYk843gp7XnZfZL2qJkcHv2vLhBfd41ErHq1buk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E2BnefoOH5U3wwv2cpQj4L6jNFNA40RxYu/fKGokxj7gTSNn0yghZOG4t28Jkaemg
	 RkeYsL5aGCUYCOVuzd2VRkgOBqCaflGEIf8HYzTzal92hukDALxwVtCrZTn7r3/IU8
	 rFaIvZ1CF4mBVjNcHX215HCHlYkkJrboTUtWLFz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C98DF802DB;
	Thu,  2 Jul 2020 18:59:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91D56F802BC; Thu,  2 Jul 2020 18:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 045EAF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 045EAF800ED
IronPort-SDR: VpkidQykqTKnV9Guegu+BFlVxOmEY7UDhRTnKVRwpJHz28QNFXnfHmBbYdu+s9vNqLMMF6bLlN
 Sbs5xUq50TAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126583272"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126583272"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:17 -0700
IronPort-SDR: wEF9qJzaf6TeuPOOnpKKMcU4n9bk0ixvdpL11kIjIeWlshMqafM9F0rsp/gYA+SuGfS/YX1yiQ
 s/s5ybkY6u/Q==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426014861"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: samsung: pcm: fix kernel-doc
Date: Thu,  2 Jul 2020 11:58:56 -0500
Message-Id: <20200702165901.164100-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>, broonie@kernel.org
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

Fix W=1 warnings - missing fields in structure

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index a5b1a12b3496..86eefbc89e9e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -104,8 +104,13 @@
 
 /**
  * struct s3c_pcm_info - S3C PCM Controller information
+ * @lock: Spin lock
  * @dev: The parent device passed to use from the probe.
  * @regs: The pointer to the device register block.
+ * @sclk_per_fs: number of sclk per frame sync
+ * @idleclk: Whether to keep PCMSCLK enabled even when idle(no active xfer)
+ * @pclk: the pclk pointer
+ * @cclk: the clck pointer
  * @dma_playback: DMA information for playback channel.
  * @dma_capture: DMA information for capture channel.
  */
-- 
2.25.1

