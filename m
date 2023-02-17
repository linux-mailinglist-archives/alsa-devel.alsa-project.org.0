Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0689369ADBD
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 15:16:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3685BF3B;
	Fri, 17 Feb 2023 15:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3685BF3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676643374;
	bh=68R7vM2WSqKHQH6K9b4DPoGlc/nETcFl/uxkEbukG2k=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rgHYWjT5TST66EKsHjZkm70OfeBcu/xUxsxzT6XIB/4WVANoCUmJDHKqsbVGSMxUx
	 2NJK9uT/DnzHJmyjxQwfoWUJeKB26gxBf5+YurZaMTsMS0WznOsjxKUQ9c3nyJ/FUB
	 ridQ4pZoFtyi87+2mlO6TsPodyR1/TPEMywfU8Fs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CF1EF80525;
	Fri, 17 Feb 2023 15:14:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3DB1F801C0; Fri, 17 Feb 2023 14:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from exchange.fintech.ru (e10edge.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4E39F800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 14:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E39F800AA
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 17 Feb
 2023 16:15:33 +0300
Received: from KANASHIN1.fintech.ru (10.0.253.125) by Ex16-01.fintech.ru
 (10.0.10.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 17 Feb
 2023 16:15:33 +0300
From: Natalia Petrova <n.petrova@fintech.ru>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] skl-topology_3627: using sprintf changed to snprintf
Date: Fri, 17 Feb 2023 16:15:30 +0300
Message-ID: <20230217131530.486962-1-n.petrova@fintech.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.253.125]
X-ClientProxiedBy: Ex16-01.fintech.ru (10.0.10.18) To Ex16-01.fintech.ru
 (10.0.10.18)
X-MailFrom: n.petrova@fintech.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7PMZEBG73NIS52TML44MGJPEEJBQURBY
X-Message-ID-Hash: 7PMZEBG73NIS52TML44MGJPEEJBQURBY
X-Mailman-Approved-At: Fri, 17 Feb 2023 14:14:27 +0000
CC: Natalia Petrova <n.petrova@fintech.ru>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PMZEBG73NIS52TML44MGJPEEJBQURBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use snprintf instead of sprintf to avoid buffer overflow.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT")
Signed-off-by: Natalia Petrova <n.petrova@fintech.ru>
---
 sound/soc/intel/skylake/skl-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index e06eac592da1..ac06926e651d 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3660,7 +3660,7 @@ static int skl_tplg_complete(struct snd_soc_component *component)
 
 		se = (struct soc_enum *)kcontrol->private_value;
 		texts = dobj->control.dtexts;
-		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
+		snprintf(chan_text, sizeof(chan_text), "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
 			if (strstr(texts[i], chan_text)) {
-- 
2.34.1

