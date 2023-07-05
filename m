Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAAA748694
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F47C3E7;
	Wed,  5 Jul 2023 16:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F47C3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568150;
	bh=wvD6bbrOokxfZPO0DaokGurW5X0rMNd0E3gL+SAwNDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YOESunzJGOFv4a+QRQewV/2eDmDClGm4J6kB2kgc4sYtJ4fA1yeFK/a8NsA3rB7aK
	 x1Ev6B6s6sT8ssaHkxfBDQa/DhiJ2LsL5FgMlr/Q7yYQ+Lu4JDfAt8Zm1ndQKUyhv1
	 ELG4NvAKbn6iZ1CIsiSHH/2SVqhqOl2dabT1dtyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E044F80272; Wed,  5 Jul 2023 16:41:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B492EF80104;
	Wed,  5 Jul 2023 16:41:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C8AAF80551; Wed,  5 Jul 2023 14:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3B46F80124
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 14:33:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B46F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OrzrAs3K
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21B3B614FB;
	Wed,  5 Jul 2023 12:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8159FC433C8;
	Wed,  5 Jul 2023 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688560389;
	bh=wvD6bbrOokxfZPO0DaokGurW5X0rMNd0E3gL+SAwNDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OrzrAs3Kf3NwkB6zPJMgq32SprJp3/GoftKi8agEkCoOfEhjQKP0Av4nA7LIClKjp
	 71dxk/K3PUdH7D6lRX+QH6zwbbJpjrQP170yTK+y/4bj9wKaeLuX7pMVRjhRiisRSc
	 SLkCpvjzO5D4lTIJ46WiwdD/ZYU3uC+tv1hZTf9o5/1MNqlDgciP897QSq3pPMwfK0
	 OResP1n/XRy2Q5dSSgR9wUwsKPPUpAr8BF2fUlRqHedDhpPQMQxl8jviYASKcv0sY8
	 JuzseHo230TbjSJGImzoAQSKFvumw1kwW2MLo7Vu5uKTi43q+QvZ6WpTIY2+0y1WGY
	 D6uGCn/oSzVSg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan+linaro@kernel.org>)
	id 1qH1hK-00084C-10;
	Wed, 05 Jul 2023 14:33:30 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/8] ASoC: codecs: wcd938x: fix missing clsh ctrl error
 handling
Date: Wed,  5 Jul 2023 14:30:13 +0200
Message-Id: <20230705123018.30903-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230705123018.30903-1-johan+linaro@kernel.org>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5XVQUVG2FDE6KGC3ZSWVIDCSB7OXDWE3
X-Message-ID-Hash: 5XVQUVG2FDE6KGC3ZSWVIDCSB7OXDWE3
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:41:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XVQUVG2FDE6KGC3ZSWVIDCSB7OXDWE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocation of the clash control structure may fail so add the missing
error handling to avoid dereferencing an error pointer.

Fixes: 8d78602aa87a ("ASoC: codecs: wcd938x: add basic driver")
Cc: stable@vger.kernel.org	# 5.14
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index faa15a5ed2c8..2e342398d027 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3106,6 +3106,10 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
 						 WCD938X_ID_MASK);
 
 	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
+	if (IS_ERR(wcd938x->clsh_info)) {
+		pm_runtime_put(dev);
+		return PTR_ERR(wcd938x->clsh_info);
+	}
 
 	wcd938x_io_init(wcd938x);
 	/* Set all interrupts as edge triggered */
-- 
2.39.3

