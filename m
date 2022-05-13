Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9E525DDB
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 11:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D051AED;
	Fri, 13 May 2022 11:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D051AED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652432850;
	bh=bLhHgrFqotuFuVS8jS4dwSmhv38xDX9CkE4XGKKhVvI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXuZnJCpypZNc+Wna/Bz8Jkuvq5uRw23HgmKGX+VCMpOiLf8x60B/exCbMUo42+Q5
	 HIbWnEyeJbF3iW3QUrEFftyaVmniGe+RbQCM5/KByF8j/NZ5BaP2sX1YoKxDO6w7S7
	 iHZswiTXln+RYWtPa9xZVoKNfvPSO/38fzbCWd8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43193F80510;
	Fri, 13 May 2022 11:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70FECF8025E; Fri, 13 May 2022 11:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 314DDF80272
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 11:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 314DDF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="kZ8sxWOz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D6NLui024569;
 Fri, 13 May 2022 04:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Jy8nJVtBMWQumc0Kj6jEHKGQ1qM+Jo14jQwTbfDQqx0=;
 b=kZ8sxWOzpHEZeM91WDcN5nVfmqZCfOI6nVK3I2Qsfk4x5P+eN0ksT4JaDcCSbFhS7l0z
 iq32il9eDPQnGHVbwVVpj9JMq4FkWfTPnDDoC62u06us2gOpHHlokcqr5CQi9iTdPmKo
 Kqt32ndtj1axnEd1DqVyLPsITzVSeW6ExzPPYCLu29y0Ycz/Ti/ht6/kduBZ7JdSg6vr
 /K2TSKFimg8eKdn3M6RQlRWJhlAqiyO6S8Nal4g6AlLcvNdMPXvWaHx5DniltuRpZY7q
 ugtEuKiFqAb4XHGNAOaLolhjG2BV4zZ/ZcHGMT07bqsqr34nbxNGiH4ONP8Fni0qGa6N LA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp619dhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 May 2022 04:05:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 10:05:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 13 May 2022 10:05:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C77FA11D1;
 Fri, 13 May 2022 09:05:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: core: Pass legacy_dai_naming flag directly
Date: Fri, 13 May 2022 10:05:31 +0100
Message-ID: <20220513090532.1450944-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
References: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TMQR3vI69rj98lfyxnOWiPAirNUUaR2s
X-Proofpoint-ORIG-GUID: TMQR3vI69rj98lfyxnOWiPAirNUUaR2s
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
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

Passing the result of the helper function snd_soc_component_is_codec
to snd_soc_register_dai is less clear than just passing the DAI
naming flag directly. snd_soc_register_dai wants to know if it
should use the legacy DAI naming. The CODEC distinction is more
of a historical thing and not obviously directly related, and there
are already a couple of CPU side components that explicitly opt in
to non-legacy DAI naming.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 32267a38130b3..9574f86dd4de2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2497,7 +2497,7 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
 
 	for (i = 0; i < count; i++) {
 		dai = snd_soc_register_dai(component, dai_drv + i, count == 1 &&
-					   !snd_soc_component_is_codec(component));
+					   !component->driver->non_legacy_dai_naming);
 		if (dai == NULL) {
 			ret = -ENOMEM;
 			goto err;
-- 
2.30.2

