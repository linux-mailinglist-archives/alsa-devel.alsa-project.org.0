Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8875D7AE77B
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 10:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05D01DF;
	Tue, 26 Sep 2023 10:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05D01DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695715733;
	bh=NTFksEWG/dnCXLPogyuOcCE5XRJLKv/9wrG9/pbpt0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pb+xuq1FPyoTdGRWbs0A617cFpxTkXY0k0/poGqLtLhmeI6/fNFq1m4C64o2RxAGs
	 xtf6qg9wtOn1LUMcuFfeGKrjSVIkztbWj3xEff7Y5i9/dUZyF18Mlq98q3qHVjE1/x
	 v1c7mEqCC1DEmHjf42KmfCzprStRnmhTh09oYoA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1086BF8057D; Tue, 26 Sep 2023 10:07:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57551F80568;
	Tue, 26 Sep 2023 10:07:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E77FCF80563; Tue, 26 Sep 2023 10:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FFCAF801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 10:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFCAF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hhS1qpnA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695715616; x=1727251616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NTFksEWG/dnCXLPogyuOcCE5XRJLKv/9wrG9/pbpt0A=;
  b=hhS1qpnA3ITaVPTwaYzfnkvVtXGuRftD0nR5Lca0T1t3eZ157kjvRp2h
   I57cB9DxTUJ1DsHmkB9nDGrS7QeAILSMyuXTXwI7f7c2Vph45CmYvtev0
   Klqj9jF8o3yplc2y94iRTM2CnBvdCuDdGwrxQN0K+xrnQkb3U3aOAfhbZ
   A3n6p9PtOi7JGzAcY+ojg5CjZRaIGqmp/WHv8J/OLVHPf70yDf4PWcYzl
   UX+IlLB58KS2/ZvewXtc9UpB7Fb9Z4PuyoPGq794gaW06tNCNwna6eOBM
   YKzhr+Xwl370LLV8a+VE5XLJX6K83LVPeMQFtVnJpbp7mwVJ9wA3yNBQc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360891434"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="360891434"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:06:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="725357993"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200";
   d="scan'208";a="725357993"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga006.jf.intel.com with ESMTP; 26 Sep 2023 01:06:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 3/4] ASoC: Intel: avs: Use helper to setup HOST stream
Date: Tue, 26 Sep 2023 10:06:22 +0200
Message-Id: <20230926080623.43927-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230926080623.43927-1-cezary.rojewski@intel.com>
References: <20230926080623.43927-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ACPFR3PU6AETY5N5P7CKWTA6GMMGO7V
X-Message-ID-Hash: 7ACPFR3PU6AETY5N5P7CKWTA6GMMGO7V
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ACPFR3PU6AETY5N5P7CKWTA6GMMGO7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_hdac_ext_host_stream_setup() abstracts the procedure details away.
Simplify the code by using it.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8565a530706d..e628fdfdc018 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -625,7 +625,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = snd_hdac_stream_setup(hdac_stream(host_stream));
+	ret = snd_hdac_ext_host_stream_setup(host_stream);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1

