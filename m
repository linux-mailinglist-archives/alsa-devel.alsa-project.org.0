Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3977CDF2C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 16:17:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B2BE8F;
	Wed, 18 Oct 2023 16:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B2BE8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697638666;
	bh=mfNwd8a18pGzt/476le4pukhmP7xf/WAildRBkKKafA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RhbMi5FDerXfmW+gKtimMYvWEBljuM4i6pRmqok4YVOoGRBkkmE59QjezTr8plEH1
	 8I7sJQxB2bs0xxe1k+JZHrEGDAIRQ2QwkFKwXd3Z6Z0G6B1JAu0Vpde2T5KZFdPhPk
	 chk1NPIuziZB7DBRA5n2yoGi4xAvzPbRX6BX7hTY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16EEBF8019B; Wed, 18 Oct 2023 16:16:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE0EEF80564;
	Wed, 18 Oct 2023 16:16:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 461DFF80564; Wed, 18 Oct 2023 16:16:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73497F8027B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 16:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73497F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=loM5Ep0B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 60004617EF;
	Wed, 18 Oct 2023 14:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E840C433C9;
	Wed, 18 Oct 2023 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697638577;
	bh=mfNwd8a18pGzt/476le4pukhmP7xf/WAildRBkKKafA=;
	h=From:To:Cc:Subject:Date:From;
	b=loM5Ep0BKd1itNamwAUkp0Jqptl05SFilNLMZuRvU5H3mgbCEBDfwDLNqE7r/ReAd
	 NVv+YVn6KCgaJSDySUbRimuON8yBydsNn4Y9R6AgPWI11eeVZwvmlF0wvEA5yrP+Ay
	 9XEuzjYtMmwy/QcEBetCEdNQCpk9Djri8oRy1SGEv3dMq0GlNr/JCa1aFCnlWYK6Kc
	 IVhwMPz47KkCCDGnAp4/mVxx7w+CHN9FW3UN13/cnY5eh6OldmuuESr4SmqljDedHP
	 28bEn/cLVOkADYnBIcqWThi73+1tCiTUw2hjGPxF8qAb+x9WurnXaDZumJerL/2lJL
	 5+8v/F/THh07w==
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
	astrid.rost@axis.com,
	christophe.leroy@csgroup.eu,
	aidanmacdonald.0x0@gmail.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 4.14 1/7] ASoC: simple-card: fixup asoc_simple_probe()
 error handling
Date: Wed, 18 Oct 2023 10:16:06 -0400
Message-Id: <20231018141613.1335848-1-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.327
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBUFLK4NHZCHLDZP27RF2E5TFCMWLG7P
X-Message-ID-Hash: IBUFLK4NHZCHLDZP27RF2E5TFCMWLG7P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBUFLK4NHZCHLDZP27RF2E5TFCMWLG7P/>
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
index 6959a74a6f491..c5db2d9d44edd 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -441,10 +441,12 @@ static int asoc_simple_card_probe(struct platform_device *pdev)
 	} else {
 		struct asoc_simple_card_info *cinfo;
 
+		ret = -EINVAL;
+
 		cinfo = dev->platform_data;
 		if (!cinfo) {
 			dev_err(dev, "no info for asoc-simple-card\n");
-			return -EINVAL;
+			goto err;
 		}
 
 		if (!cinfo->name ||
@@ -453,7 +455,7 @@ static int asoc_simple_card_probe(struct platform_device *pdev)
 		    !cinfo->platform ||
 		    !cinfo->cpu_dai.name) {
 			dev_err(dev, "insufficient asoc_simple_card_info settings\n");
-			return -EINVAL;
+			goto err;
 		}
 
 		card->name		= (cinfo->card) ? cinfo->card : cinfo->name;
-- 
2.40.1

