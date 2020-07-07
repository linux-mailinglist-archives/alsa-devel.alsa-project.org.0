Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8559B2177A5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26254167B;
	Tue,  7 Jul 2020 21:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26254167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149075;
	bh=gW5TFI+86jL3xae1D8uf42Sid1UcLQOFLcwwvAlKB4o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/zouYxGbUJ94mPYlPHFBMKzkl/eDH6O73ImfQP3zZxtGgL4J21EdbTr76W4ZnT+6
	 Q55vP+IqwgbT/vYAJjrHCYphZDx1cGHASvUSNWT5jyE1i4JZ4Canhs9Nu/FCH4vliH
	 TouZCevJCc4xNZSUG6LWXtGbwopTu6N7R2Gvjy00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76672F802FE;
	Tue,  7 Jul 2020 21:06:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5857F802E3; Tue,  7 Jul 2020 21:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B8C7F80264
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B8C7F80264
IronPort-SDR: 1q6YvYAYkPAo4nKugsFbnwdoKODxe7mUvb4oBSiop0VOGFHv0Zm94ZoICwN4mdT9/+GqQINMUB
 67Mn3QAKzdGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="149202914"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="149202914"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:42 -0700
IronPort-SDR: 4zJ6Irp7x3uElHFi5lQeT+sF12n55oX7ckDDOnDHshWPzMEP9F2zKlamncBnec09LroFwX66Os
 83gTM3acm4Jw==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="268278576"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:06:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 06/13] ASoC: codecs: da7210: fix kernel-doc
Date: Tue,  7 Jul 2020 14:06:05 -0500
Message-Id: <20200707190612.97799-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Support Opensource <support.opensource@diasemi.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>
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

Fix W=1 warning, the kernel-doc syntax was probably from Doxygen?

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/da7210.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 0c99dcf242e4..2bb727dd3a20 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -971,14 +971,16 @@ static int da7210_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 
 /**
  * da7210_set_dai_pll	:Configure the codec PLL
- * @param codec_dai	: pointer to codec DAI
- * @param pll_id	: da7210 has only one pll, so pll_id is always zero
- * @param fref		: MCLK frequency, should be < 20MHz
- * @param fout		: FsDM value, Refer page 44 & 45 of datasheet
- * @return int		: Zero for success, negative error code for error
+ * @codec_dai: pointer to codec DAI
+ * @pll_id: da7210 has only one pll, so pll_id is always zero
+ * @source: clock source
+ * @fref: MCLK frequency, should be < 20MHz
+ * @fout: FsDM value, Refer page 44 & 45 of datasheet
  *
  * Note: Supported PLL input frequencies are 12MHz, 13MHz, 13.5MHz, 14.4MHz,
  *       19.2MHz, 19.6MHz and 19.8MHz
+ *
+ * Return: Zero for success, negative error code for error
  */
 static int da7210_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 			      int source, unsigned int fref, unsigned int fout)
-- 
2.25.1

