Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC19638E55
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 17:39:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D7631774;
	Fri, 25 Nov 2022 17:38:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D7631774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669394361;
	bh=EihkDsY9Ib6gqyeSkSMuc1Q7vTVJdotcw5Z93Hq5LOw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OuZ9sQSWXXiR4qxS9XZN4qWBC7+/L6MXdCpqW7xLcvciVq6WMSELQyaP2u0pPq9cf
	 td8chT14R7PFhjmcybhj2kfOZU7FS4ndbzyWJtRC7S0tZ58JP/WqbIMw2/bWWPfJIi
	 uIa2xKchYOXZ8kX/vQUWOxb5HwlwK6Jm5dTHKCJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4C92F80559;
	Fri, 25 Nov 2022 17:38:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 660BAF80559; Fri, 25 Nov 2022 17:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60017F800F4
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 17:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60017F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="n0IEicZn"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2APEqcld007763; Fri, 25 Nov 2022 10:37:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=F4iBFZxWJ4G/hOJ26bG5bBMCr4F5oUEGMl5hmUwlSxo=;
 b=n0IEicZnfEe0G7US4VhBHGroDx7nx2V3jQVyd3pG2GVNC5kuqx57mJwprnszAhtM9VMz
 nyCbjhuPTJDFH8bky6BVMawIjk98TaPRZcb8RAxOGhIIzETxJ/aKsxVmdIfAvzZ9HTxx
 V3BcgjIaW56FnvKFmb4pwonr5P8+n9NRlsk3DbY4AHHJ/nEs+oGZdudRN+z+Mj465lZS
 mjJFAxjoQSiVhdSZn5Oo9/X7TpvKZv+vNNkzopWIu7F0/0TIU2XgR0LJeIOZUSagTHKK
 AeKXuRAb8na9CvpYWSIdr46KMqIfsIEusVchH8UTnU2VhMMWPWVKB93aiKEt0yOv4fF5 xQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6yhc4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Nov 2022 10:37:51 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 25 Nov
 2022 10:37:48 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 25 Nov 2022 10:37:48 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B63222BA;
 Fri, 25 Nov 2022 16:37:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 1/2] ASoC: ops: Correct bounds check for second channel on
 SX controls
Date: Fri, 25 Nov 2022 16:37:47 +0000
Message-ID: <20221125163748.1288942-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: zgWzVzq3Qt0BwAoGlHU2_xpv-QT8HRta
X-Proofpoint-GUID: zgWzVzq3Qt0BwAoGlHU2_xpv-QT8HRta
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, guille.rodriguez@gmail.com,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com,
 james.schulman@cirrus.com
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

Currently the check against the max value for the control is being
applied after the value has had the minimum applied and been masked. But
the max value simply indicates the number of volume levels on an SX
control, and as such should just be applied on the raw value.

Fixes: 97eea946b939 ("ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Correct fixes SHA.

 sound/soc/soc-ops.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1970bda074d8a..55b009d3c6815 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -464,16 +464,15 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	ret = err;
 
 	if (snd_soc_volsw_is_stereo(mc)) {
-		unsigned int val2;
-
-		val_mask = mask << rshift;
-		val2 = (ucontrol->value.integer.value[1] + min) & mask;
+		unsigned int val2 = ucontrol->value.integer.value[1];
 
 		if (mc->platform_max && val2 > mc->platform_max)
 			return -EINVAL;
 		if (val2 > max)
 			return -EINVAL;
 
+		val_mask = mask << rshift;
+		val2 = (val2 + min) & mask;
 		val2 = val2 << rshift;
 
 		err = snd_soc_component_update_bits(component, reg2, val_mask,
-- 
2.30.2

