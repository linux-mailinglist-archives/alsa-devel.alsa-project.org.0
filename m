Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD93525DDA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 May 2022 11:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35C41ACF;
	Fri, 13 May 2022 11:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35C41ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652432837;
	bh=cSv0nXCNyLQR0IhqBfgQeQCGGLzNAnZHuAw+LtiMJJI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqaXdiM69yyBNVPfnnI4VnzqWuEfHlr95UtGUWlMk6GK9tnJmQW9OE8pVwu59Ddjv
	 QT6cPpCbzHlwn4goXFA1tQFw+xbsKxO2mRNM1qIO22Z0nTDiLICA/Skioz7Nuh9XaV
	 QHQd1mQ5N1ZF0TKGG1CYHlomZuWMaul9iXEnBp4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D17DEF804FF;
	Fri, 13 May 2022 11:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15365F804AB; Fri, 13 May 2022 11:05:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F023AF8025E
 for <alsa-devel@alsa-project.org>; Fri, 13 May 2022 11:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F023AF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="eKKWN1fG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24D6NLuj024569;
 Fri, 13 May 2022 04:05:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/jCByvbLs+br1BUbiL1G0ewDJD8IsSMZCnvY0w3xHW8=;
 b=eKKWN1fG++rChq+WjBGH0iFRAyAzrOG98hZfROCewiEheBe4NV1mrnQenIDvbSMkbTG/
 V8S4VU/3IB94wfkkMzsb3ygUz/oR9IeJ4ROGziMueJwm65OgD31G7eQ5kGJwnGYba08b
 P5kp9OKELWl6jKUQbvGT+4A2s2EsnvqmZrKL0Fa3EtPiDQCRy0EMJ5urlEonutTdbcAy
 pGwATqR2EFEAE29qC2Tu+slQqwdEkrb4Zd7BN8bhYkl5WfBOz0ohsOjr/PwYlqSOA6aP
 nM/oZG/8ZyZ9+mhGOeG3Olda+U8siPEa0vQQotGDezTah/PuSOXTDZFEbPGWmyJiMu0G 0Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp619dhq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 13 May 2022 04:05:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 13 May
 2022 10:05:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 13 May 2022 10:05:32 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D5503468;
 Fri, 13 May 2022 09:05:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: soc-component: Update handling to component delays
Date: Fri, 13 May 2022 10:05:32 +0100
Message-ID: <20220513090532.1450944-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
References: <20220513090532.1450944-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Qq9mhvJVGyQt8aqIJvUIdWH88rlHMdB6
X-Proofpoint-ORIG-GUID: Qq9mhvJVGyQt8aqIJvUIdWH88rlHMdB6
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

Currently the checking for if a component sits on the CPU or CODEC side
of the DAI link is done with a helper function that checks if the
component defines legacy_dai_naming. However, there are already a couple
of CPU side components that explicitly opt in to non-legacy DAI naming
and it doesn't seem like a very robust solution. Rather than looking for
the flag check if the component is attached to any of the CODEC DAIs on
the DAI link. This is more robust and helps to bring the core further in
the direction of a component being a generic block rather than being
classified as platform or CODEC drivers.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-component.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index c0664f94990c8..e12f8244242b9 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -932,6 +932,20 @@ int snd_soc_pcm_component_pointer(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static bool snd_soc_component_is_codec_on_rtd(struct snd_soc_pcm_runtime *rtd,
+					      struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, dai) {
+		if (dai->component == component)
+			return true;
+	}
+
+	return false;
+}
+
 void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 				 snd_pcm_sframes_t *cpu_delay,
 				 snd_pcm_sframes_t *codec_delay)
@@ -953,7 +967,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substream *substream,
 
 		delay = component->driver->delay(component, substream);
 
-		if (snd_soc_component_is_codec(component))
+		if (snd_soc_component_is_codec_on_rtd(rtd, component))
 			*codec_delay = max(*codec_delay, delay);
 		else
 			*cpu_delay = max(*cpu_delay, delay);
-- 
2.30.2

