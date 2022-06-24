Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAE9559A63
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 15:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FB901872;
	Fri, 24 Jun 2022 15:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FB901872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656077695;
	bh=jscgzgGSzznfzVydPseZSwRoTeJWlNqpyzNEFBKw79g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBDba4HujJBW2ZPaT/eu2SsmHhMgi6xAlYwDVzFyUkLQvsFAk/s6IzL8ezXZzbE/F
	 18l06EKrptk3UI0NZoJ07P/vgDJ7mxb4mVYKekAuNhLE3WFq7iQSYZB2NGlJBBlC2J
	 paJmSrQlTMBrwMwtENkOsYt585wm40DgSpJmXI5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1139CF80246;
	Fri, 24 Jun 2022 15:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 605C6F80165; Fri, 24 Jun 2022 15:33:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E427F80137
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 15:33:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E427F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XK57p0o4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656077596; x=1687613596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jscgzgGSzznfzVydPseZSwRoTeJWlNqpyzNEFBKw79g=;
 b=XK57p0o4qbrYZfsk0zVJmIpNd3A9+I4DPcFvBhJqoSz4LmQ41zBGMfZq
 8687UNaubf3kjDxv7sSHZ5gxsTBvMvutLZlqe0SkY1nyndCB9dTQDuUcE
 uQmFfHda2NfCytSxrA9+EsRPEasOBwGNmzXNRJHoZWT1+sAiRL5GTtrR0
 ciaK0VJUkIblrFQVnavbdIcbh25O2V2oaFYgvtCQ6pQbUhldMnbaIcTuP
 YwFtKsKal9Rvv9iGzRoVLFr3YEu1m5nywieaF6NTyDFHVw6OW5r+4BcM1
 2wRmhxtdKnTTdYkHV7D8yeWvJ1ny+e/9CwPys2+Yp6GEjq3FjRoO6ODCW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="344996178"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="344996178"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 06:33:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="835123882"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2022 06:33:06 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/4] ASoC: Intel: hsw_rt5640: Mark BE DAI as nonatomic
Date: Fri, 24 Jun 2022 15:43:14 +0200
Message-Id: <20220624134317.3656128-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624134317.3656128-1-cezary.rojewski@intel.com>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
with what is already done for FE DAIs.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/hsw_rt5640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index ad747363d112..050c53ebd6ba 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -121,6 +121,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		/* SSP0 - Codec */
 		.name = "Codec",
 		.id = 0,
+		.nonatomic = 1,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
-- 
2.25.1

