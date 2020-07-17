Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD222392B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 12:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4626B10E;
	Fri, 17 Jul 2020 12:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4626B10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594981421;
	bh=2rp8JZIQsj447PRl623rhJ7W/xG2L4eRvURNOC/hGRU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDPHkNEItkISMq6EnqS4NqK0qi2Y3IqNVKJEYCyIoZPZJkZHfHlKUoEew0dXyBt/w
	 kBrfcGjPiVhNtko2EdkZLDroMmW3bl7I4T0hRfM3fuGOw7Kmx6mGxf9PwwPpOXvdd/
	 wNaK48w46w46ej7+vkRuDM/jTxNljXlOz/Cl1NB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2BF3F802BD;
	Fri, 17 Jul 2020 12:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5063FF802BC; Fri, 17 Jul 2020 12:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C73B8F80229
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 12:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C73B8F80229
IronPort-SDR: cmKJ2Z/CbUwkkYmSvNysvyQ7BqrAH6Y9C0Zl5aymtilYfzcstXT64jLcp9Xibzsx0FbqC+hm9p
 i1Ebpzty2WQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="137682726"
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="137682726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 03:20:49 -0700
IronPort-SDR: M1R/fTri/KfRNkghPlwRBjLxhQahb67rygJoTHwOBknnDeD/PKn1aadRWPM8yEpi+2w5bVOjL+
 /MCrJTIL2/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; d="scan'208";a="282744428"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003.jf.intel.com with ESMTP; 17 Jul 2020 03:20:47 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: hdac_hda: fix deadlock after PCM open error
Date: Fri, 17 Jul 2020 13:19:50 +0300
Message-Id: <20200717101950.3885187-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717101950.3885187-1-kai.vehmanen@linux.intel.com>
References: <20200717101950.3885187-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rander Wang <rander.wang@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Commit 5bd70440cb0a ("ASoC: soc-dai: revert all changes to DAI
startup/shutdown sequence"), introduced a slight change of semantics
to DAI startup/shutdown. If startup() returns an error, shutdown()
is now called for the DAI.

This causes a deadlock in hdac_hda which issues a call to
snd_hda_codec_pcm_put() in case open fails. Upon error, soc_pcm_open()
will call shutdown(), and pcm_put() ends up getting called twice. Result
is a deadlock on pcm->open_mutex, as snd_device_free() gets called from
within snd_pcm_open(). Typical task backtrace looks like this:

[  334.244627]  snd_pcm_dev_disconnect+0x49/0x340 [snd_pcm]
[  334.244634]  __snd_device_disconnect.part.0+0x2c/0x50 [snd]
[  334.244640]  __snd_device_free+0x7f/0xc0 [snd]
[  334.244650]  snd_hda_codec_pcm_put+0x87/0x120 [snd_hda_codec]
[  334.244660]  soc_pcm_open+0x6a0/0xbe0 [snd_soc_core]
[  334.244676]  ? dpcm_add_paths.isra.0+0x491/0x590 [snd_soc_core]
[  334.244679]  ? kfree+0x9a/0x230
[  334.244686]  dpcm_be_dai_startup+0x255/0x300 [snd_soc_core]
[  334.244695]  dpcm_fe_dai_open+0x20e/0xf30 [snd_soc_core]
[  334.244701]  ? snd_pcm_hw_rule_muldivk+0x110/0x110 [snd_pcm]
[  334.244709]  ? dpcm_be_dai_startup+0x300/0x300 [snd_soc_core]
[  334.244714]  ? snd_pcm_attach_substream+0x3c4/0x540 [snd_pcm]
[  334.244719]  snd_pcm_open_substream+0x69a/0xb60 [snd_pcm]
[  334.244729]  ? snd_pcm_release_substream+0x30/0x30 [snd_pcm]
[  334.244732]  ? __mutex_lock_slowpath+0x10/0x10
[  334.244736]  snd_pcm_open+0x1b3/0x3c0 [snd_pcm]

Fixes: 5bd70440cb0a ("ASoC: soc-dai: revert all changes to DAI startup/shutdown sequence")
BugLink: https://github.com/thesofproject/linux/issues/2159
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 74574b9180a5..49e6f23fc766 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -289,7 +289,6 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 	struct hdac_hda_priv *hda_pvt;
 	struct hda_pcm_stream *hda_stream;
 	struct hda_pcm *pcm;
-	int ret;
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
 	pcm = snd_soc_find_pcm_from_dai(hda_pvt, dai);
@@ -300,11 +299,7 @@ static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 
 	hda_stream = &pcm->stream[substream->stream];
 
-	ret = hda_stream->ops.open(hda_stream, &hda_pvt->codec, substream);
-	if (ret < 0)
-		snd_hda_codec_pcm_put(pcm);
-
-	return ret;
+	return hda_stream->ops.open(hda_stream, &hda_pvt->codec, substream);
 }
 
 static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
-- 
2.27.0

