Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066788ED09
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 18:48:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E4A2C55;
	Wed, 27 Mar 2024 18:48:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E4A2C55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711561729;
	bh=NDmHxG5b5KxThAPS+rY6aKTae4LKNxv8bQXfWMyo10M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m82gfPd2V2fIdWcsm8miHjFSe9ka2AnRuJwQ4t9aZGRMcAOZlp5gL+fV4WCeaUrvq
	 UlyMpkufQJ65+C3TxhCOWJkNd8XHp3crqIFlxQDuEXW9vmNcXL5KbBthzsh2tynzy0
	 YLuT7/jgkwb7mNuhPgFqxJxiGsLAIcoaMNHsRvlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F902F80766; Wed, 27 Mar 2024 18:45:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02600F80760;
	Wed, 27 Mar 2024 18:45:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B644EF805B6; Wed, 27 Mar 2024 18:45:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF2AEF805AF
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 18:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF2AEF805AF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24871615E0;
	Wed, 27 Mar 2024 17:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD83C433C7;
	Wed, 27 Mar 2024 17:45:43 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 18:44:46 +0100
Subject: [PATCH 11/18] ASoC: rt711-sdca-sdw: drop driver owner assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-module-owner-var-v1-11-86d5002ba6dc@linaro.org>
References: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
In-Reply-To: <20240327-module-owner-var-v1-0-86d5002ba6dc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NDmHxG5b5KxThAPS+rY6aKTae4LKNxv8bQXfWMyo10M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBFsVEuaANX7OOE6yNelav1DDbB9Usx5baI4gi
 tuQ3EI2tpOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgRbFQAKCRDBN2bmhouD
 1zc1D/4hIBVss3C1dAsJMgxBFDXLHbe9ObAYm0ibRJNg/1wGneGH/3L9Y75Yi4hEmqNiDpUDNes
 KmuiJ3ALQtxfk1JdmcjBghhnCyiFYQJvSDMM6TAx/sHxithkUqxMyWQD7SYBfzVPYcJtnGZC3rN
 2thjj5TP6YINQcYnqAnxmTqYMIA6iSKh8g8vUgijQHhSF65IMyxbs1/gfNQUbfCYmQ1aL/Z5fXM
 uzUfRQ2OI8hiOO8CepBPFaze9IukblOMNUc6sEUsDBM0yeDudN5j/Z6af7Z73RqvLp8R9lo37TV
 SPvM0h6tZipsEk9z8me8PTWEGbn71R8BDJUfiw/ssYCmPtJZIopFlpkYXVcNM5KLEoS8impp/M1
 0PIkNAtQmsJjawq/eETUewiiBLJwzEPCg6RRzmeqxI7EFFJ3fTgCqJ2SL8hYlJ+saBCUqvKjd7D
 iUnoDGyo1MCw8/R5y4UgXshqQdfjvnf8IMOf/QT4+RW43YMULF+K2kwm4wia8Zu+KJ7NGMJlN8i
 sryYhKgSuoAs5cJzZd5BoRbOf/cIzTD6dKanj6d9l50ZtuqluDmCMQkUYnMWfSMQ/xjYI3HvlVp
 5lzR8I+N2xLTmHtn6UFu44x37JUbryT/57fv4eiVNodxTFYqmAno1Dpgv2/1hqA6FZaeUOlskao
 4bmZycZ4Fd9TaPg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 7LV5LGLEFV7LQGBZHMUSITYYEGXCQPHF
X-Message-ID-Hash: 7LV5LGLEFV7LQGBZHMUSITYYEGXCQPHF
X-MailFrom: SRS0=G+Mr=LB=linaro.org=krzysztof.kozlowski@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LV5LGLEFV7LQGBZHMUSITYYEGXCQPHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Core in sdw_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 935e597022d3..a7aa69495a7b 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -474,7 +474,6 @@ static const struct dev_pm_ops rt711_sdca_pm = {
 static struct sdw_driver rt711_sdca_sdw_driver = {
 	.driver = {
 		.name = "rt711-sdca",
-		.owner = THIS_MODULE,
 		.pm = &rt711_sdca_pm,
 	},
 	.probe = rt711_sdca_sdw_probe,

-- 
2.34.1

