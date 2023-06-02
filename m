Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5109720AA0
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25F09839;
	Fri,  2 Jun 2023 22:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25F09839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739481;
	bh=eFeidUUmhnXKYS0uKMSaUrsDc7iSwQ0ELiLt27l+OeU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JPR5WcQmIfVVCWOoz2rdReEIYsNpDqekvpE8SNnnOMVq4J99/NH7EBuswFY6eYEwO
	 gCvdC3pWqK4Xmocm2ViU4TtDlqJBmHzz4ACx6RDRXE1vCh+86pymwb0nTgJM38Jje4
	 Vr4qFKUTsY95J0MeLMz/gdzDYbUqgMfAWft2EvXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13D5BF800ED; Fri,  2 Jun 2023 22:56:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00422F8047D;
	Fri,  2 Jun 2023 22:56:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0204BF8016B; Fri,  2 Jun 2023 22:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4C40F800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C40F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UXtdOjFr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739398; x=1717275398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFeidUUmhnXKYS0uKMSaUrsDc7iSwQ0ELiLt27l+OeU=;
  b=UXtdOjFrZ379kqGcgb/pB99TdIaCnKlk8uV6YHP0ls0zCH/Ski649uTM
   HyxGKLRncYWOPJy1U9I5bnBH1Mk2PalbHY7WZz0nHMZGrM5z67dSwcx9F
   LfLh3/UQQcEb4scAtux4ju7iXnkEkwev210TqqDe7sIFQVpcqGjGS/ugg
   qTHiQRL8lsiSSkiywBA3KtENTJwyIof5Qiw9L1p82j+EZ4pgUdIvbT8ip
   e/aACNFhQnP9fyHFyaAS7WlWSDBdsz3IPBG9JcMSXUKbFykOvWOJe8ZPE
   BUNnJDk+FBI2e+wX/VAN9NtM3BGcQpsICbuiBzIubjZkVUJq4hwfp+ZnR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272078"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272078"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092681"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092681"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/9] ASoC: SOF: Intel: hda-dai: add error checks to prevent
 static analysis warnings
Date: Fri,  2 Jun 2023 15:56:12 -0500
Message-Id: <20230602205620.310879-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NAE6ZWS7RSTL77GTEEF2UZFCF72GGH7X
X-Message-ID-Hash: NAE6ZWS7RSTL77GTEEF2UZFCF72GGH7X
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAE6ZWS7RSTL77GTEEF2UZFCF72GGH7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

make KCFLAGS='-fanalyzer' sound/soc/sof/intel/ reports several NULL
pointer dereference paths.

Example log:
ops = hda_dai_get_ops(substream, cpu_dai);
  |      |                          ^~~~~
  |      |                          |
  |      |               (14) return of NULL to ‘non_hda_dai_hw_params’ from ‘hda_dai_get_ops’
  |  353 |         sdev = widget_to_sdev(w);
  |  354 |         hext_stream = ops->get_hext_stream(sdev, cpu_dai, substream);
  |      |                       ~~~~~~~~~~~~~~~~~~~~
  |      |                          |
  |      |                          (15) dereference of NULL ‘ops’

The function hda_dai_get_ops() can return NULL, but the return value
is not checked across the board. It's not a problem today, since we do
check in the first use of the function, but static analysis tools are
not aware of the different ALSA stages. Rather than argue forever,
let's just add the error checks consistently and make sure this tool
can be added to the CI checks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 09d8ee98581d..3d89c1923b03 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -120,6 +120,11 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 	struct snd_sof_dev *sdev;
 	int stream_tag;
 
+	if (!ops) {
+		dev_err(cpu_dai->dev, "DAI widget ops not set\n");
+		return -EINVAL;
+	}
+
 	sdev = dai_to_sdev(substream, cpu_dai);
 
 	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
@@ -158,6 +163,11 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	unsigned int link_bps;
 	int stream_tag;
 
+	if (!ops) {
+		dev_err(cpu_dai->dev, "DAI widget ops not set\n");
+		return -EINVAL;
+	}
+
 	sdev = dai_to_sdev(substream, cpu_dai);
 	bus = sof_to_bus(sdev);
 
@@ -216,7 +226,7 @@ static int __maybe_unused hda_dai_hw_free(struct snd_pcm_substream *substream,
 	struct snd_sof_dev *sdev = dai_to_sdev(substream, cpu_dai);
 
 	if (!ops) {
-		dev_err(sdev->dev, "DAI widget ops not set\n");
+		dev_err(cpu_dai->dev, "DAI widget ops not set\n");
 		return -EINVAL;
 	}
 
@@ -274,6 +284,11 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 	struct snd_sof_dev *sdev;
 	int ret;
 
+	if (!ops) {
+		dev_err(dai->dev, "DAI widget ops not set\n");
+		return -EINVAL;
+	}
+
 	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
-- 
2.37.2

