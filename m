Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940F827E7DA
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 13:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6371811;
	Wed, 30 Sep 2020 13:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6371811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601466370;
	bh=AtErgmQjcdChnbC+QsL/SVix+NMecXjPrdPiCa9WNn8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmmtV91AZJBKGKRJ7/OJ3DSvXNflFf/SNKBZXg5zu3VReTl+Q1ty/8tpQ/iy4Gq1F
	 5IW8bDOQ1w9A076b/590gcujV2sAEXkptMDHUYUCYyEZZ7v3LsT56cPCw/Rv0kjx96
	 5AVdpQOaobm8xnWyNzj1xUumhoXO0yJN3we6bFfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0B6F802C4;
	Wed, 30 Sep 2020 13:43:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7D09F802C3; Wed, 30 Sep 2020 13:43:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96013F80228
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 13:43:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96013F80228
IronPort-SDR: qvEN+W+i3OXK2PvHBSPCMZfRkAWN760dQpzns3zkd8+l2k6Vu2g0NA45k+YsCyQoccmaiSCws/
 qnrGqgRZ9ZTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="224022348"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="224022348"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 04:43:28 -0700
IronPort-SDR: 8q1IYmQV+5Dr8wftcpc/Oeo6fFjVwGtZ8gijtDH7tKjMLfj6Zyu2yU5qPrZPPGILXMgm5K0cSy
 +O7SWClq2Muw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="294583007"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 30 Sep 2020 04:43:26 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: hdac_hda: allow runtime pm at end of probe
Date: Wed, 30 Sep 2020 14:41:40 +0300
Message-Id: <20200930114140.3839617-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930114140.3839617-1-kai.vehmanen@linux.intel.com>
References: <20200930114140.3839617-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kailang@realtek.com,
 kai.vehmanen@linux.intel.com, harshapriya.n@intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 emmanuel.jillela@intel.com
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

Align with recent change to forbid runtime suspend during codec
init in snd_hda_codec_device_new(), with matching call to
allow suspend at end of hdac_hda_codec_probe().

In snd-hda-intel, call to snd_hda_set_power_save() at end of
controller probe does the same thing, but ASoC controller drivers
do not modify runtime settings for codecs, so this has to be done
in codec drivers, and in this case in hdac_hda.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 49e6f23fc766..390dd6c7f6a5 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -481,6 +481,9 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		snd_hdac_display_power(hdev->bus,
 				       HDA_CODEC_IDX_CONTROLLER, false);
 
+	/* match for forbid call in snd_hda_codec_device_new() */
+	pm_runtime_allow(&hdev->dev);
+
 	/*
 	 * hdac_device core already sets the state to active and calls
 	 * get_noresume. So enable runtime and set the device to suspend.
-- 
2.27.0

