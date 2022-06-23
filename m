Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7834E557839
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 12:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD6F1ED6;
	Thu, 23 Jun 2022 12:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD6F1ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655981625;
	bh=SuD2U0kxfd9xCcUwxyoLMkdaO+/NNUOZeQdMjS+TH3s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bGLO3WxO+Ezmcqe2/4CW0Trap+Vx7dhMGLvNGi+4dUX09+Cl6xmVVKiOzSsOLufpf
	 R1aeKfI19sN6RzjlLvfuIZUim36cJ+PdKCeyZh5qSjNnp4FJIYL8fmqCHxAPj4WeUn
	 N3E3aXRBNFjwNlEt39HYgKCB4Ei77oLSjcDfFtBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55744F80542;
	Thu, 23 Jun 2022 12:51:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27E7CF804C1; Thu, 23 Jun 2022 12:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B633F800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B633F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YWTCg5gw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25NAKUqF006859;
 Thu, 23 Jun 2022 05:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=spwI6sAhpzo+8xV2qTuPti6l56+juOG2iCl+GRXgx6Y=;
 b=YWTCg5gwM6HNsL65S8x+ByDROJzBjEfDXslKcVsKpC68nrFMzeAHWHMwaXfQKtH+awqK
 Uv3IRazjoT8cu0EcFOdMh6h9IEvtK+o9pLpggDOHIbAYdzyZvnBusfPcrBH6Vc5MXrTC
 Bc1ANrSAIMvpbcvRpSXGq9zNHg4ITTNlW5wl3tS38LU/Pj1BC6dFfF7OECLEykd/lpnA
 /uME74/99UrDGT2/NGn/2FM4e4htX154qZMbSIq56mb3UAuylf0/SmROFdvd0bnpkWoJ
 DogLwUE5fb9/Ia4CxHm+tPtHQnWSk3uSuGq56O3rakggs30Z7WfpejcQu4JudaG/MOL5 jw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41f17q-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 23 Jun 2022 05:51:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 23 Jun
 2022 11:51:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 23 Jun 2022 11:51:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 60B1A475;
 Thu, 23 Jun 2022 10:51:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 6/6] ASoC: dapm: Move stereo autodisable check
Date: Thu, 23 Jun 2022 11:51:20 +0100
Message-ID: <20220623105120.1981154-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
References: <20220623105120.1981154-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JgCLQNmst0Kq0Pq3_XSo28iJj41Qufod
X-Proofpoint-ORIG-GUID: JgCLQNmst0Kq0Pq3_XSo28iJj41Qufod
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, james.schulman@cirrus.com,
 linux-kernel@vger.kernel.org
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

Tidy up the code a little, rather than repeating the check of
mc->autodisable move the stereo error check to be under the
existing if for mc->autodisable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/soc-dapm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index a8e842e02cdc2..b05231414c1d0 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -370,14 +370,14 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 	case snd_soc_dapm_mixer_named_ctl:
 		mc = (struct soc_mixer_control *)kcontrol->private_value;
 
-		if (mc->autodisable && snd_soc_volsw_is_stereo(mc))
-			dev_warn(widget->dapm->dev,
-				 "ASoC: Unsupported stereo autodisable control '%s'\n",
-				 ctrl_name);
-
 		if (mc->autodisable) {
 			struct snd_soc_dapm_widget template;
 
+			if (snd_soc_volsw_is_stereo(mc))
+				dev_warn(widget->dapm->dev,
+					 "ASoC: Unsupported stereo autodisable control '%s'\n",
+					 ctrl_name);
+
 			name = kasprintf(GFP_KERNEL, "%s %s", ctrl_name,
 					 "Autodisable");
 			if (!name) {
-- 
2.30.2

