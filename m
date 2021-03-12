Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46539339690
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:32:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D76D71816;
	Fri, 12 Mar 2021 19:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D76D71816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573963;
	bh=6Q6GRsm1shk1g/GpiX25XBKkdYMj9g+7ab7YHgGZbwc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QLKYYhGxWGSuXBnRjWuiHaxl7BZGQdU77/NzRW/VIwVnA+gLGtAhGi+nXu1qAXLWp
	 4yL2vbDSRh0997MA7Un9hAJFA9WFTfadXw48XuG2xmhl4s+hQIkmyUawqK81z9Mno7
	 3Pc80GFHKdPzmcgATTEzCyhqVO+3TmEPUx+zw34c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD0C6F8053D;
	Fri, 12 Mar 2021 19:24:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A6B4F80533; Fri, 12 Mar 2021 19:24:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10D09F80520
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10D09F80520
IronPort-SDR: lrisl8HMTDZU6uZYuvXqItdGfjcMm3umwu9NkA8uc8gZ1enomUJMRAJTu/zWs2LBDAtZTO/7jl
 zwoe1Tu8Q1+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236521"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236521"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:55 -0800
IronPort-SDR: cb+1+bNNeKKmvFm81wcWOjv/cH+gGygnh4UXRZbh1T9j2xErmsG0AsXXlVl3UEskXuawC8/QII
 OsLRmqz+weRQ==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792078"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 22/23] ASoC: tlv320dac33: clarify expression
Date: Fri, 12 Mar 2021 12:22:45 -0600
Message-Id: <20210312182246.5153-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

sound/soc/codecs/tlv320dac33.c:1074:43: style: Clarify calculation
precedence for '%' and '?'. [clarifyCalculation]
    (dac33->alarm_threshold % period_size ?
                                          ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tlv320dac33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index d905e03aaec7..48572d66cb3b 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1071,7 +1071,7 @@ static void dac33_calculate_times(struct snd_pcm_substream *substream,
 			 */
 			dac33->nsample = period_size *
 				((dac33->alarm_threshold / period_size) +
-				(dac33->alarm_threshold % period_size ?
+				 ((dac33->alarm_threshold % period_size) ?
 				1 : 0));
 		else if (period_size > nsample_limit)
 			dac33->nsample = nsample_limit;
-- 
2.25.1

