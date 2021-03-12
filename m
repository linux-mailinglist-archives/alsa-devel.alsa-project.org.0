Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F8339685
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:30:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13A717E9;
	Fri, 12 Mar 2021 19:29:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13A717E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573827;
	bh=P0MUVl+xmxIG/lWEk+EqsAuumBskddWeguY6dSxh+3E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiDlQfI5GfwcWuPIHoA6FLqAV11NXFeySYPGHiq87HXUr2VGLPU/HVx4AVKHstiVS
	 dL8sIwjsCBjSvMzhFcNPDedrHII+akn1+RkZybDaoNNZNQnPe0WqjSRTQQ//Bf6Pz1
	 qUKeAYWQa9nNBO+SCrD7gJqUxFbqbQcg+hzENWmM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A6FAF804E5;
	Fri, 12 Mar 2021 19:24:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D92AF8051B; Fri, 12 Mar 2021 19:23:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56D11F804E2
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D11F804E2
IronPort-SDR: xDA2JEX6MZnyqRvia2LU1flQl4rNpz8WwsY9iQiGXHHth038eKRfVR7RuOsIvLm+A5B/noAiKM
 waLfKV2tKlpw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236462"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236462"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:43 -0800
IronPort-SDR: btbVK3oHXYUzV0roY6nLMj4vHmzEGrzBPXFLXQPU/qTRw8vU/YvirN6Nm0eQpMwsnXBVM8Pj6I
 nGyEuzTn+CXA==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792043"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/23] ASoC: nau8825: remove useless assignment
Date: Fri, 12 Mar 2021 12:22:38 -0600
Message-Id: <20210312182246.5153-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org
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

cppcheck warning:

sound/soc/codecs/nau8825.c:2113:10: style: Variable 'ret' is assigned
a value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index e19db30c457b..67de0e49ccf4 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2111,7 +2111,7 @@ static int nau8825_set_pll(struct snd_soc_component *component, int pll_id, int
 
 static int nau8825_mclk_prepare(struct nau8825 *nau8825, unsigned int freq)
 {
-	int ret = 0;
+	int ret;
 
 	nau8825->mclk = devm_clk_get(nau8825->dev, "mclk");
 	if (IS_ERR(nau8825->mclk)) {
-- 
2.25.1

