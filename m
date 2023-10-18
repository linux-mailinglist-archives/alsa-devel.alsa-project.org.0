Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0062C7CDF13
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD53E82;
	Wed, 18 Oct 2023 16:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD53E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638592;
	bh=o+7gCIMFWumcttxAXJYyOmrU3M5hjNZke0ch/ryC5EI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WnwQTSjZEQc9wzhXWbgLrY4XvD1PrGYUSaDJlL3zp2di3JOaKvMCluTkS65ofshl4
	 2ITZzySGl7+exDU7OeshMtYMCAwF+2U28mnh8U6rcjo4boX3fT7aQ1pCdLHmBIUMuU
	 513wtkXamJQ8YPBTDM2e78J+BelQmhK0gcrenqUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6040FF8059F; Wed, 18 Oct 2023 16:14:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB722F8024E;
	Wed, 18 Oct 2023 16:14:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53ED4F8059F; Wed, 18 Oct 2023 16:14:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82C40F80558
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C40F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VPjsCjAd
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0613BB823D7;
	Wed, 18 Oct 2023 14:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740A5C433CD;
	Wed, 18 Oct 2023 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638460;
	bh=o+7gCIMFWumcttxAXJYyOmrU3M5hjNZke0ch/ryC5EI=;
	h=From:To:Cc:Subject:Date:From;
	b=VPjsCjAdDVn8Mlxzqs28RVQatmCPs0I12BvYmIHefJxcgHg113VGypM37Ykf39EO9
	 QWEXqKv47Ml6eic0IraoACJkZ/Mt99Cm9GxslfRJnySTN/+ls0vLBOO4AQxm3Pf2QD
	 3T/WqzLvacxjBwJ91WN77+f1rhopMfAGYbeT4dekv6nOU38LlS6E1AwG/bwtLVN6bu
	 q2Bfz9MiBEoMF4meLhSWubY4UpJrFWsLs/cmhwJdhrrXYBIyQI1OoTbKP9aMmRNIZS
	 qlma2etsO77gFn293fZx0RbrBSfqKbGELv4ZMYtj15JNA9v7U5Bao3u/pOAXLjADtC
	 3kyGZNoLqEHUg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	herve.codina@bootlin.com,
	spujar@nvidia.com,
	aidanmacdonald.0x0@gmail.com,
	astrid.rost@axis.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 01/14] ASoC: simple-card: fixup
 asoc_simple_probe() error handling
Date: Wed, 18 Oct 2023 10:14:01 -0400
Message-Id: <20231018141416.1335165-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.135
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LRGHSZEW7NNBHJEAIWBBVPSAP3ID4CNT
X-Message-ID-Hash: LRGHSZEW7NNBHJEAIWBBVPSAP3ID4CNT
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LRGHSZEW7NNBHJEAIWBBVPSAP3ID4CNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit 41bae58df411f9accf01ea660730649b2fab1dab ]

asoc_simple_probe() is used for both "DT probe" (A) and "platform probe"
(B). It uses "goto err" when error case, but it is not needed for
"platform probe" case (B). Thus it is using "return" directly there.

	static int asoc_simple_probe(...)
	{
 ^		if (...) {
 |			...
(A)			if (ret < 0)
 |				goto err;
 v		} else {
 ^			...
 |			if (ret < 0)
(B)				return -Exxx;
 v		}

		...
 ^		if (ret < 0)
(C)			goto err;
 v		...

	err:
(D)		simple_util_clean_reference(card);

		return ret;
	}

Both case are using (C) part, and it calls (D) when err case.
But (D) will do nothing for (B) case.
Because of these behavior, current code itself is not wrong,
but is confusable, and more, static analyzing tool will warning on
(B) part (should use goto err).

To avoid static analyzing tool warning, this patch uses "goto err"
on (B) part.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87o7hy7mlh.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/generic/simple-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 283aa21879aa5..95e4c53cd90c7 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -680,10 +680,12 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		struct snd_soc_dai_link *dai_link = priv->dai_link;
 		struct simple_dai_props *dai_props = priv->dai_props;
 
+		ret = -EINVAL;
+
 		cinfo = dev->platform_data;
 		if (!cinfo) {
 			dev_err(dev, "no info for asoc-simple-card\n");
-			return -EINVAL;
+			goto err;
 		}
 
 		if (!cinfo->name ||
@@ -692,7 +694,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		    !cinfo->platform ||
 		    !cinfo->cpu_dai.name) {
 			dev_err(dev, "insufficient asoc_simple_card_info settings\n");
-			return -EINVAL;
+			goto err;
 		}
 
 		cpus			= dai_link->cpus;
-- 
2.40.1

