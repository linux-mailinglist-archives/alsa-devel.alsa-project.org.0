Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452D79CB08
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 11:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5067F852;
	Tue, 12 Sep 2023 11:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5067F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694509484;
	bh=X9kXmBtJCxdri6wIDJc7D4FbiQfqsl2mU0uxDYqz7Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TrkYn5KComxloa+hoXddGOywAGwq6CCgSXOEUr6HkdcbllG2oKFs6uP/1mCc+RKHK
	 t1eGM0qtxwLAenA+kviS61Jd3u73eRl0e1Xz5ZaeWwkgGYfjy2mwSUPS0xFKNssNOE
	 nletS6pcZBBo0Id0kiHjmE61E5VugZVwgMHKx/DI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC0DDF80552; Tue, 12 Sep 2023 11:03:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FEF2F80246;
	Tue, 12 Sep 2023 11:03:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BB0BF80425; Tue, 12 Sep 2023 11:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FFAFF80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 11:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFAFF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZTFZyz6H
Received: by mail.gandi.net (Postfix) with ESMTPA id D33A5240061;
	Tue, 12 Sep 2023 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694509426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxyuVFnS14xfvlofWP1396X+QDpYh2tc32oijKr4Rok=;
	b=ZTFZyz6HcLMeHyZSapA4AyFJzqP6t9lwJsx6DsAQSxdbuftqRxiU/ArAZBDXy/Sb5oEiV/
	USPg9pjkgVpp5T0WOtVzNd9JRkFBEveeZQVQ9X0QxqdZc8B3ff6tmaGd2pCImbyl+5gXgm
	mmk0UivuRz9DLTvAhmMLIdcf8p8GYzvu/0uAV99F1hc7oncZ3Rz72btNoDHWYza8DqGgCF
	amf1SmU6xzefxQ0iAAJzS4hus7ACLZNvIk7pKwPML3LZJt32KFosTvr9hhWdgsvh4VBC7p
	PMul8VUHnAWJ0qKKjUnFAU14UGCgoq7EHqp3+MenBU3y4bDI/WkxEPxLVNFNdg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 03/31] soc: fsl: cpm1: qmc: Fix rx channel reset
Date: Tue, 12 Sep 2023 10:14:54 +0200
Message-ID: <20230912081527.208499-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: OQM2WGFDEZ52E5P47SOY4NIQB2E7RFVN
X-Message-ID-Hash: OQM2WGFDEZ52E5P47SOY4NIQB2E7RFVN
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQM2WGFDEZ52E5P47SOY4NIQB2E7RFVN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The qmc_chan_reset_rx() set the is_rx_stopped flag. This leads to an
inconsistent state in the following sequence.
    qmc_chan_stop()
    qmc_chan_reset()
Indeed, after the qmc_chan_reset() call, the channel must still be
stopped. Only a qmc_chan_start() call can move the channel from stopped
state to started state.

Fix the issue removing the is_rx_stopped flag setting from
qmc_chan_reset()

Fixes: 3178d58e0b97 ("soc: fsl: cpm1: Add support for QMC")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 7ad0d77f1740..8dc73cc1a83b 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -685,7 +685,6 @@ static void qmc_chan_reset_rx(struct qmc_chan *chan)
 		    qmc_read16(chan->s_param + QMC_SPE_RBASE));
 
 	chan->rx_pending = 0;
-	chan->is_rx_stopped = false;
 
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 }
-- 
2.41.0

