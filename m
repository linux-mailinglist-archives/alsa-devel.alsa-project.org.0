Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8B22427F0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 11:55:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80ABE1675;
	Wed, 12 Aug 2020 11:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80ABE1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597226114;
	bh=g3ekBbUhiMDzM+cP5wVQ9XbOMYMunRDQNJw6S4jP864=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cPDh/KvGTIikrb7amhjGmvOC3Z+phoXyoOwCUIBxwTSd7a0++qyiPo1nujoxDhGIq
	 UJP5hR3RJB6MJOlLcC11rchbZektgzQQHiVfw2sal0gAdsoJ7ZH/V+0swo/nBQSf7m
	 EUN/XWql/Uyd0mMGp5jRky2LJyKncgaq2TARdvDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B4AF802D2;
	Wed, 12 Aug 2020 11:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1B4DF80259; Wed, 12 Aug 2020 11:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B62EF80247
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 11:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B62EF80247
IronPort-SDR: XK+QUet7rax91Jx5u3o22ILYXFFy5Cd0AcItY6A/nQcnNJHLA5i+zfB4mIYgSOa8iF2/QCh2xp
 /XsyKj400y9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="215446655"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="215446655"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 02:52:22 -0700
IronPort-SDR: S4v2ucu1z/jJ110vyivnk03RA5zK9w+O8XOkjKbcIoyzF07cX9sGS0GmVhbuG9QRauQKykf6ek
 ybRTKpyxHNSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="290983647"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2020 02:52:19 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/3] ASoC: codec: tlv3204: Increased maximum supported
 channels
Date: Wed, 12 Aug 2020 17:46:30 +0800
Message-Id: <20200812094631.4698-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
References: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, a-estrada@ti.com, andriy.shevchenko@intel.com,
 zakkaye@ti.com, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, dmurphy@ti.com
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

Increased maximum supported channel to 8 channels for audio capture
running in TDM mode.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index e3d12a7ea07a..6c2338ea5d8d 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -888,7 +888,7 @@ static struct snd_soc_dai_driver aic32x4_dai = {
 	.capture = {
 			.stream_name = "Capture",
 			.channels_min = 1,
-			.channels_max = 2,
+			.channels_max = 8,
 			.rates = AIC32X4_RATES,
 			.formats = AIC32X4_FORMATS,},
 	.ops = &aic32x4_ops,
-- 
2.17.1

