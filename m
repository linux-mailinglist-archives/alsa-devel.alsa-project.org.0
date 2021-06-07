Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA83C39E97D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:25:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B3C51692;
	Tue,  8 Jun 2021 00:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B3C51692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104700;
	bh=B021C91F7DqjyomQeMI/D0UcTiR2ERgN8a9qi379ERU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=APJFL24Mcmi5kyjCOXSRbIYDjnQFYLpE1ZQmUid0AagbN2om2YV18547OQby0xcsq
	 cQRaZx72t4tsvOYHc6Ki64YlBkY5kPdFuQhKXgkNo9hSmZjeXRKv5M8EurwqyC9RXg
	 EEO/efHQn92B/KpvclizFhFpJgUgcFFBnlAkv/W0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13754F804CA;
	Tue,  8 Jun 2021 00:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F2FCF804CA; Tue,  8 Jun 2021 00:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 107FDF800AF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 107FDF800AF
IronPort-SDR: 7eNxSrKN3J+3Xb7mWiBEkFzjnmQGlqOeOCESydMuZyg6+RzAdXsY60QY8ghJNb3Rx/orlj4+NA
 XEKrZSi5AWsw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202867352"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="202867352"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:02 -0700
IronPort-SDR: NthgOvJkc/8PwznCfc0d5ZNMzDQ1krx3CHjoc1Ks/VQUY9nD1xSkmUrttZ90bb2RcTXdSLt+oP
 R2zhB7nraBHQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449270952"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/15] ASoC: max98373-sdw: add missing memory allocation check
Date: Mon,  7 Jun 2021 17:22:25 -0500
Message-Id: <20210607222239.582139-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

We forgot to test that devm_kcalloc doesn't return NULL.

Fixes: 349dd23931d1 ('ASoC: max98373: don't access volatile registers in bias level off')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/codecs/max98373-sdw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index f3a12205cd48..c7a3506046db 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -787,6 +787,8 @@ static int max98373_init(struct sdw_slave *slave, struct regmap *regmap)
 	max98373->cache = devm_kcalloc(dev, max98373->cache_num,
 				       sizeof(*max98373->cache),
 				       GFP_KERNEL);
+	if (!max98373->cache)
+		return -ENOMEM;
 
 	for (i = 0; i < max98373->cache_num; i++)
 		max98373->cache[i].reg = max98373_sdw_cache_reg[i];
-- 
2.25.1

