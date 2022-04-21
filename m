Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A32450AA1E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2CFC16D1;
	Thu, 21 Apr 2022 22:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2CFC16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573443;
	bh=WhYCf83jd/lzbia38c48Dw9ejmtlxGqIb5pzmmKur1g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4cx0YsRLeGzOjKoeRP/YdtE2wq02KMD+VLaYSIJ/pIAZ9VkN4dwZSvrfNOEXlhI5
	 BbNDTMV+Tqg3iANsIebGQ6RRTOMsEovBQjSSn9HR7NjFjtQrFCKkjzxQTLNwbpp7XO
	 azFH+6CavWyirHI6qHPdz9UmLzWN2/lcDgTPbx0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8417F80587;
	Thu, 21 Apr 2022 22:33:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 866E5F80519; Thu, 21 Apr 2022 22:33:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A6ADF80533
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A6ADF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b22m0oJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573170; x=1682109170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhYCf83jd/lzbia38c48Dw9ejmtlxGqIb5pzmmKur1g=;
 b=b22m0oJHGHzhvyy2eLrE+KTKi6FJBEpFmIShO18C3hX/V9BL2NxW0vTt
 CnXfJC8mp4dyT1uPr3YzLubQ200Zq4QBuu3g38NsE8A0dmP+JzCZP9u/f
 wbxfjqBS9E00pPqcbKqjLxJvK/D8ZRLb8zjFYL4nYuXtjFXxHI647i3qv
 aTCb++sn39xpqEZ7b3WYPhklNQVA22D6VQ965uCCX+M5245FFe0M31fly
 EFawwyWCvvFbAh6IjY7JMmSsW2rKDo5085iXvxdSZDx1oUghM3HIdzk0x
 pATiz1Ul5rVoJoFeyGav9YBqxpBooeoXg4y1pIX6zvXCk2TzfP3qdAJWR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047646"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047646"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455825"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/14] ASoC: SOF: Intel: hda-dai: protect hw_params against
 successive calls
Date: Thu, 21 Apr 2022 15:32:01 -0500
Message-Id: <20220421203201.1550328-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Once we've set-up the HDA stream and its format, we currently don't
support additional format changes. We already have a protection in the
.prepare case, but this needs to be added in the hw_params too.

In mixing use cases where two DPCM FEs are connected to the same BE,
if can happen that there are multiple calls to the BE hw_params when
the two FEs are configured simultaneously.

This could alternatively be fixed at the DPCM level but that's a more
intrusive change requiring infrastructure changes: this would need to
be paired with the definition of fixed hw_params at the mixer level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 53600c6c29116..9823230d2ef4a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -336,8 +336,13 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
 			     struct snd_soc_dai *dai)
 {
+	struct hdac_ext_stream *hext_stream =
+				snd_soc_dai_get_dma_data(dai, substream);
 	int ret;
 
+	if (hext_stream && hext_stream->link_prepared)
+		return 0;
+
 	ret = hda_link_dma_hw_params(substream, params);
 	if (ret < 0)
 		return ret;
-- 
2.30.2

