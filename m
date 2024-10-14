Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8C99C4C0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 11:07:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 328BCEF2;
	Mon, 14 Oct 2024 11:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 328BCEF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728896845;
	bh=8QXd52PSDByTuMxAbtMLnunnTIIo8yWGgJnINtcoo5k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aZ/I+N15S3P8TRUwaVx+AcWLCbqCKa6ivjSzKs3XOm7cG6AlJ9nko3xd1lxGfmOZb
	 f39aBiRZHuJtLGUOG9O4zlizsLshZyq2UvrQGBoA+tKz10A4ZLoEUsEA6qgyANRR/v
	 dzzGhxA5Pep9KE0MXxz4vWvHw3ozXg87w4zPrHG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C05B3F8061D; Mon, 14 Oct 2024 11:06:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40C62F8060E;
	Mon, 14 Oct 2024 11:06:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD4AF80448; Mon, 14 Oct 2024 10:01:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ksmg01.maxima.ru (ksmg01.maxima.ru [81.200.124.38])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AFAAF80149
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 10:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFAAF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=maxima.ru header.i=@maxima.ru header.a=rsa-sha256
 header.s=sl header.b=NnVkluPT
Received: from ksmg01.maxima.ru (localhost [127.0.0.1])
	by ksmg01.maxima.ru (Postfix) with ESMTP id 0581AC0005;
	Mon, 14 Oct 2024 11:01:51 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 ksmg01.maxima.ru 0581AC0005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxima.ru; s=sl;
	t=1728892911; bh=nruzw+jdQvZ8QxnnUXsNHIRBRz7OhS6CrLOVWXYhdNU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=NnVkluPTRVpHyt3x+41XDnPVVIQ0B4tzdg5WxH0gwZU9nlieb56Vd7DaUFEbwwEb0
	 eXlTqxp0T3XnAleJE2FGeJJs2QOWeZDFhCq/G29UQxFq8TuUvn0WJj9hpv/djsJkeV
	 NKa0BYBO3KxlT9Hgyag4MLki/ndJLP/vUasvA6r9T3q0wfferWDvqpn2nuEXxS5Z9N
	 cJmIAiWpcvgGrucZzRIxGdU/5/TcsVODIm7uKqc+iYFnUaAV38PXiovVNgAqs03g8B
	 svr+a5PlN5lmLycmSgC83KGh667GtMUT/TLJdjii6gq5Z2z/do1HsxMg0gAw9bkZts
	 /61Zhb4CwSZyw==
Received: from ksmg01.maxima.ru (mail.maxima.ru [81.200.124.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.maxima.ru",
 Issuer "GlobalSign GCC R3 DV TLS CA 2020" (verified OK))
	by ksmg01.maxima.ru (Postfix) with ESMTPS;
	Mon, 14 Oct 2024 11:01:50 +0300 (MSK)
Received: from localhost.maximatelecom.ru (10.0.246.155) by
 mmail-p-exch01.mt.ru (81.200.124.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.4; Mon, 14 Oct 2024 11:01:49 +0300
From: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Vitaliy Shevtsov <v.shevtsov@maxima.ru>, Ma Ke <make24@iscas.ac.cn>, Mark
 Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, <derek.fang@realtek.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH 6.1] ASoC: rt5682s: Return devm_of_clk_add_hw_provider to
 transfer the error
Date: Mon, 14 Oct 2024 13:01:25 +0500
Message-ID: <20241014080125.28298-2-v.shevtsov@maxima.ru>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.246.155]
X-ClientProxiedBy: mt-exch-01.mt.ru (91.220.120.210) To mmail-p-exch01.mt.ru
 (81.200.124.61)
X-KSMG-Rule-ID: 7
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188410 [Oct 14 2024]
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
 81.200.124.61:7.1.2;maxima.ru:7.1.1;patch.msgid.link:7.1.1;127.0.0.199:7.1.2;ksmg01.maxima.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1,
 FromAlignment: s, ApMailHostAddress: 81.200.124.61
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/10/14 07:21:00
X-KSMG-LinksScanning: Clean, bases: 2024/10/14 07:18:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/10/14 05:57:00 #26750521
X-KSMG-AntiVirus-Status: Clean, skipped
X-MailFrom: v.shevtsov@maxima.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4X5UCE6WO5ZBJC35SL6SI3T4CJJ22LPE
X-Message-ID-Hash: 4X5UCE6WO5ZBJC35SL6SI3T4CJJ22LPE
X-Mailman-Approved-At: Mon, 14 Oct 2024 09:05:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4X5UCE6WO5ZBJC35SL6SI3T4CJJ22LPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ma Ke <make24@iscas.ac.cn>

commit 3ff810b9bebe5578a245cfa97c252ab602e703f1 upstream.

Return devm_of_clk_add_hw_provider() in order to transfer the error, if it
fails due to resource allocation failure or device tree clock provider
registration failure.

Fixes: bdd229ab26be ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
Link: https://patch.msgid.link/20240717115436.3449492-1-make24@iscas.ac.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Vitaliy Shevtsov <v.shevtsov@maxima.ru>
---
 sound/soc/codecs/rt5682s.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 80c673aa14db..07d514b4ce70 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2828,7 +2828,9 @@ static int rt5682s_register_dai_clks(struct snd_soc_component *component)
 		}
 
 		if (dev->of_node) {
-			devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, dai_clk_hw);
+			ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, dai_clk_hw);
+			if (ret)
+				return ret;
 		} else {
 			ret = devm_clk_hw_register_clkdev(dev, dai_clk_hw,
 							  init.name, dev_name(dev));
-- 
2.46.2

