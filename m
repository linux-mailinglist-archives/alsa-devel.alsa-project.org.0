Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515631F25D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:34:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FBFA1664;
	Thu, 18 Feb 2021 23:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FBFA1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687660;
	bh=+Ojq/Qo1NrGn/mo5KLow4PD6yO8BkB5SAOM+fuNKJMQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GCn4X3UBNHbZkB3csdZ2xZLsLO/qjPnfrAfPDgDleOWMD0/fXBhZVITHzLmOXSXB4
	 JOCMuuJdpFnyvJVz+H8zG9uSjTc8+gO6EHvG1goKGne3wkm3dP4AitpiCD/QLSTmq6
	 HlUGaaBsKdHBrLsFtfI6TEifHz3rF1O57gpo5KZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0975EF80482;
	Thu, 18 Feb 2021 23:30:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5E4DF80155; Thu, 18 Feb 2021 23:30:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 205D1F8015A
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205D1F8015A
IronPort-SDR: /joLsKoCKVN5/9IuSVazuDuZ4AwO0tO5LIdGI7yxRvFcTpmgFN696/jW2SkgHHHYtHwbMC2iQr
 7tqxW2W7Wk3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875672"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875672"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:46 -0800
IronPort-SDR: z40UAuyGbO7e+712kZJJch1pFj+nEzamQP4TepVLNHRT5J+9HZA8Nu9EqmJDUCY4T0dKame0Bj
 9LgrkxEfJXKw==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990864"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/10] ASoC: lpass-wsa-macro: add missing test
Date: Thu, 18 Feb 2021 16:29:16 -0600
Message-Id: <20210218222916.89809-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/lpass-wsa-macro.c:958:6: style: Variable 'ret' is
reassigned a value before the old one has been
used. [redundantAssignment]
 ret = wsa_macro_set_prim_interpolator_rate(dai, (u8) rate_val, sample_rate);
     ^
sound/soc/codecs/lpass-wsa-macro.c:946:6: note: ret is assigned
 ret = wsa_macro_set_mix_interpolator_rate(dai, (u8) rate_val, sample_rate);
     ^
sound/soc/codecs/lpass-wsa-macro.c:958:6: note: ret is overwritten
 ret = wsa_macro_set_prim_interpolator_rate(dai, (u8) rate_val, sample_rate);
     ^

set_mix_interpolator_rate can return -EINVAL, add a test and bail on error.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5ebcd935ba89..0be5d25e2a29 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -944,6 +944,8 @@ static int wsa_macro_set_interpolator_rate(struct snd_soc_dai *dai,
 		goto prim_rate;
 
 	ret = wsa_macro_set_mix_interpolator_rate(dai, (u8) rate_val, sample_rate);
+	if (ret < 0)
+		return ret;
 prim_rate:
 	/* set primary path sample rate */
 	for (i = 0; i < ARRAY_SIZE(int_prim_sample_rate_val); i++) {
-- 
2.25.1

