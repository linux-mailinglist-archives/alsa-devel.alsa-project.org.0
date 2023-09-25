Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002377AD9F1
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 16:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49083DEB;
	Mon, 25 Sep 2023 16:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49083DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695651513;
	bh=NTFksEWG/dnCXLPogyuOcCE5XRJLKv/9wrG9/pbpt0A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fzN75BaaTGb+PrTYkiCnedaY2zstgWQbI41x64m//gQgJIRFsWKyu4Dti8nq3JFhl
	 HL63xhhtpuouzRbK1ju67csSmUozp5lVrmfJpv1Bgluh4O85ARK2l1PhswteMhReMO
	 IejIHB/5OWBvJFujW9fM6LFUopRf2tSu2F722tMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73AA1F805AB; Mon, 25 Sep 2023 16:16:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA78F80553;
	Mon, 25 Sep 2023 16:16:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 264D1F8059F; Mon, 25 Sep 2023 16:16:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FE9CF80290
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 16:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE9CF80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a2QUqfyT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651382; x=1727187382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NTFksEWG/dnCXLPogyuOcCE5XRJLKv/9wrG9/pbpt0A=;
  b=a2QUqfyTLjxFd///uUh42WLHfql4KbZyJWgSxIp87LJ9mjUaLxsFn8o0
   3vEzBHkvJ5zz8ffujdgYKLkShEGsHjxEN8gcjVCGXlMufa/tlhj1YetJ8
   2l3vkIKN7tX9ic2e9eXdzezml4oy6HIp87B+hiInkJQvZ0MmJDupRsD0y
   iYJ+K1lMoY3mj3eTovK1xM0YAu/RAJBS6x9J4Tzj1JPLWXJIY/WhHQVqh
   fd2iwMcaTQuucMtDiw/boqCtyfLHl1yR7jXQVqEGnZDh8MqCTijE83dH2
   amSz0BP2hdUX3v5QIYb3wd7mb+BAC+B19dglHNBw7wADv74DVhYD9IgzV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361514150"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="361514150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783508181"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="783508181"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 07:07:30 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 3/4] ASoC: Intel: avs: Use helper to setup HOST stream
Date: Mon, 25 Sep 2023 16:06:15 +0200
Message-Id: <20230925140616.26892-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230925140616.26892-1-cezary.rojewski@intel.com>
References: <20230925140616.26892-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZCJDWBYETKXP247GSAFIWUP6IU7IV6S7
X-Message-ID-Hash: ZCJDWBYETKXP247GSAFIWUP6IU7IV6S7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCJDWBYETKXP247GSAFIWUP6IU7IV6S7/>
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

