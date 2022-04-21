Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522750A5FD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FD3168E;
	Thu, 21 Apr 2022 18:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FD3168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650559211;
	bh=orBYkA+uyhkXLmYGjVPDgxx/6cnxOb0jXMaxOJi1Rg8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fw6WV3+982bgQ3d7Fj93psC/GT0hbFtbIsD9wJSPdvS6ROvrCl8z9ZPPrYJrdfRSv
	 9XhdIn9BeEyywIJXl+CsVp2VtlEk8GUVlu76SDih3aqcoGJd5mb19DuPXqv7vLRUXG
	 3Yla/tPUbxRhwtpREr+S42K4jCAyyAytE9Raz/5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 502A2F804F1;
	Thu, 21 Apr 2022 18:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03BFDF804DA; Thu, 21 Apr 2022 18:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C156F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C156F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="oDGgNyQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650559117; x=1682095117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=orBYkA+uyhkXLmYGjVPDgxx/6cnxOb0jXMaxOJi1Rg8=;
 b=oDGgNyQVISA2+zO7pWwcwIOnJLSS2yq/aJG6WhKpZky3+Mv0x1Boy3Mr
 YOp/FOkKDFbf66u30V3ny8gzGceDW5tBglFL9/7eCkTQ4+9PNpzi+NnIw
 aFgJ9edVfif+Cx9KoTaIBCBUKxh6HPXKFhxqfI2KTF6d0qV0gMHrmja9G
 ttjtmQ5OqcRLiysCPPlX+nH5PoBct9NqmYmcSj1YT4eEHiX2du0o6/J6N
 5gNWobCISajy3F5WEaNMOhL1gQQrbiZtCP6MeumPiJko8NzpBmBuZaW2U
 qIgPxC73Y75UqtvYcpvuxR+T7mjh6WahVNohumHwaL0d6co5bZoq9LPlp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="324858019"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="324858019"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:36:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="658604506"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:36:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_ssp_amp: remove 'set-but-not-used' warning
Date: Thu, 21 Apr 2022 11:36:45 -0500
Message-Id: <20220421163645.319686-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
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

Clang warning:
>> sound/soc/intel/boards/sof_ssp_amp.c:97:6: warning: variable 'i'
   set but not used [-Wunused-but-set-variable]
           int i = 0;
               ^

The device counter is not used when the quirk is not set, which static
analysis cannot know. Move its initialization before the loop to
remove this warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 02a27aaed92fb..8f5b9ebbe8287 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -94,7 +94,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	char jack_name[NAME_SIZE];
 	struct sof_hdmi_pcm *pcm;
 	int err;
-	int i = 0;
+	int i;
 
 	if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
 		return 0;
@@ -113,6 +113,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 		return hda_dsp_hdmi_build_controls(card, component);
 	}
 
+	i = 0;
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
-- 
2.30.2

