Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E2F99A012
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 11:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E95E69;
	Fri, 11 Oct 2024 11:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E95E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728638569;
	bh=ScHtd03XmMsy/5ONHGpjp0TXFSfTz28aZMtUZmKPkuk=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=R9wXNzg/xWmix6MX6ttn2dSPOeCYpg3khMiPKjyLYN+SOmYN1loXF8SCF9R/ps2eK
	 MExiY726Fk0AG+iN1Kx089rjK8xloMN7pEyRX53ehxGRAQINGeF690L6H+CdEbWihH
	 iDxC8zoM3vWce+NEWZXaPd5jAAI6ll0yF+8g6IeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8850DF806CC; Fri, 11 Oct 2024 11:20:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B71FDF80621;
	Fri, 11 Oct 2024 11:20:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06FABF80528; Thu, 10 Oct 2024 22:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0775F80496
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 22:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0775F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=maxima.ru header.i=@maxima.ru header.a=rsa-sha256
 header.s=sl header.b=Ci5tsXV9
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 0E3ECC000E;
	Thu, 10 Oct 2024 23:09:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 0E3ECC000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
	t=1728590972; bh=9RjdrpvF0dpMEdfTvZGOFgbwSOlSJKtjDlVDRQCOgww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Ci5tsXV9C0MvPjO1ZFbV1GYX3s+rtX9DNZ76QfGQ+WCVW82HL7zy6cA7D3gVi794p
	 sOJkDF4iBzJYossBHD2L/rL0Sr4GJLiw1a0lZMcgYHcprHBVgiiS4FRqXH3xxmOFlT
	 YAQ8shdzYil74ZFVym/YirwyY0n5kSWj+iLYNNUJaRgnChLMt5bQlxhbxzYtH5b144
	 LqapO/eKC1zKdoRtgduzSCuiqFbO1PKNBmYTERXI58oudsKlqm4d7D8E2SAFbIg9y7
	 UPdtMCCZMxEtUfAJh4wBKtZGwu+E0BIVgRCSko154kSR62uNUK5pkP1u5FnlrrjNhh
	 iWpdftS2v95kg==
Received: from ksmg01.maxima.ru (autodiscover.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 23:09:31 +0300 (MSK)
Received: from localhost.maximatelecom.ru (10.0.247.250) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.4; Thu, 10 Oct 2024 23:09:30 +0300
From: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Vitaliy Shevtsov <v.shevtsov@maxima.ru>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 6.1] ASoC: Intel: sof_realtek_common: set ret = 0 as initial
 value
Date: Fri, 11 Oct 2024 01:08:50 +0500
Message-ID: <20241010200852.22365-2-v.shevtsov@maxima.ru>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.247.250]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188364 [Oct 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: v.shevtsov@maxima.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dmarc=none header.from=maxima.ru;spf=none
 smtp.mailfrom=maxima.ru;dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39
 e168d0b3ce73b485ab2648dd465313add1404cce, {rep_avail},
 {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to},
 maxima.ru:7.1.1;lore.kernel.org:7.1.1;ksmg01.maxima.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;81.200.124.61:7.1.2;127.0.0.199:7.1.2,
 FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/10/10 19:30:00
X-KSMG-LinksScanning: Clean, bases: 2024/10/10 19:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/10/10 18:55:00 #26733176
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: v.shevtsov@maxima.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NWAVTYSWDFVYR7TDKVGWXJMW3RXK77YM
X-Message-ID-Hash: NWAVTYSWDFVYR7TDKVGWXJMW3RXK77YM
X-Mailman-Approved-At: Fri, 11 Oct 2024 09:20:13 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NWAVTYSWDFVYR7TDKVGWXJMW3RXK77YM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

commit 47d2b66fec133cb27da3a551334686e465d19469 upstream.

'ret' will not be initialized if dai_fmt is not DSP_A or DSP_B.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20221206212507.359993-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
---
 sound/soc/intel/boards/sof_realtek_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index ff2851fc8930..6c12ca92f371 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -267,7 +267,8 @@ static int rt1015_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
-	int i, clk_freq, ret;
+	int i, clk_freq;
+	int ret = 0;
 
 	clk_freq = sof_dai_get_bclk(rtd);
 
-- 
2.46.2

