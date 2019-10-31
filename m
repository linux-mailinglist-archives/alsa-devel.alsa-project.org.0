Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3268AEAFCA
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 13:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77F062098;
	Thu, 31 Oct 2019 13:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77F062098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572523701;
	bh=kfuu1Wu3+aPOy/A83nOhKRaaBbGhp6zzCkpzCWwuqGY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MF+728qKps9Y30yW2UbisTlYULLa6V38ZrWOovPiun22buF/DYFJJHtzw6wdElgge
	 egWMHGDSgRyInBKIxed95uL3jhXTXEq4dk4QggPKyVe3mY4l/XPLjn1p0HTRcAEwi/
	 kdGqtWLXnmy4/rpJJTYQYY64y9G0pHhCUmTlF+kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82FFFF805AE;
	Thu, 31 Oct 2019 13:06:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB6E1F80394; Thu, 31 Oct 2019 13:04:24 +0100 (CET)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC9AF802A0
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 12:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC9AF802A0
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9VBs8J9001950,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9VBs8J9001950
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 19:54:08 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server id
 14.3.468.0; Thu, 31 Oct 2019 19:54:07 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 31 Oct 2019 19:54:01 +0800
Message-ID: <20191031115401.20898-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, tzungbi@google.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
Subject: [alsa-devel] [PATCH 1/5] ASoC: rt1011: remove redundant code in
	kcontrol
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

The !component->card->instantiated statement should remove in kcontrol.
It is no need to check the card->instantiated in kcontrol.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index dcd397a83cb4..8a74f374d779 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1163,9 +1163,6 @@ static int rt1011_bq_drc_coeff_put(struct snd_kcontrol *kcontrol,
 		(struct rt1011_bq_drc_params *)ucontrol->value.integer.value;
 	unsigned int i, mode_idx = 0;
 
-	if (!component->card->instantiated)
-		return 0;
-
 	if (strstr(ucontrol->id.name, "AdvanceMode Initial Set"))
 		mode_idx = RT1011_ADVMODE_INITIAL_SET;
 	else if (strstr(ucontrol->id.name, "AdvanceMode SEP BQ Coeff"))
@@ -1236,9 +1233,6 @@ static int rt1011_r0_cali_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
-	if (!component->card->instantiated)
-		return 0;
-
 	rt1011->cali_done = 0;
 	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0])
@@ -1284,9 +1278,6 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] == rt1011->r0_reg)
 		return 0;
 
-	if (!component->card->instantiated)
-		return 0;
-
 	if (ucontrol->value.integer.value[0] == 0)
 		return -EINVAL;
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
