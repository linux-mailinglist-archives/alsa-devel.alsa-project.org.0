Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5853353C940
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 13:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDB1D184D;
	Fri,  3 Jun 2022 13:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDB1D184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654255579;
	bh=PtFx4CP7Dbct9j0ZbHft1wgWykXSFo4tAyTm8pMLPuA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oo6E02siaBVxNlDf+5yd7FKyFzXovS5LIQ9w6AwIVChIIxa+RwBwOYwFjHHfvf73V
	 doiCuMuLHEjCmoFlJ5mvL594GpjaLFpJInuyBbvJT0f4pcI38HkYdryjvGVDvArTWN
	 vCiNC1DDcBxMZXPXsdV6pLQ4i21Kefz2gF+ge4qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F22FF80089;
	Fri,  3 Jun 2022 13:25:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4C20F804CC; Fri,  3 Jun 2022 13:25:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8CC4F80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 13:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8CC4F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gSsffAIl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C37DEB815D8;
 Fri,  3 Jun 2022 11:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7448C385A9;
 Fri,  3 Jun 2022 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654255513;
 bh=PtFx4CP7Dbct9j0ZbHft1wgWykXSFo4tAyTm8pMLPuA=;
 h=From:To:Cc:Subject:Date:From;
 b=gSsffAIlRk7+NcvYqDlcrPXRLeWQVlIL5fXX/NC7izvYAZkCEF1nd/hfHtB2GWh4b
 xMzBFUzB9Ql8NGT1Py7V2zFZlIn2q4MdruK0WB966FLouh7sQmgLjMylnak6tuShf2
 rX1oc4XjSRluTNVQmi2PgayBiWQZ7OyznOwAaAYGcRU7UceguIiPhugvcRBqYIkeup
 uPA+X9+7zYZ4W7PTyKgCNI49D23uLE4n/v4JUQI6+ulMvvDY+v3aM8Ua94vX36C+Nz
 CmyktLWHDn7+noH4MKd60zOcXlzxNPjRiaqrg1sDjzbNJ3hkIw6AaKt2jnlRvG0Kpj
 Gwu+Sx1sDaLdg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: ops: Don't modify the driver's plaform_max when reading
 state
Date: Fri,  3 Jun 2022 13:25:08 +0200
Message-Id: <20220603112508.3856519-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026; h=from:subject;
 bh=PtFx4CP7Dbct9j0ZbHft1wgWykXSFo4tAyTm8pMLPuA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBime+A1LXRX6JzF5rxf4o3Cn801gb8E873pNrsJo7N
 F+0KbbaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpnvgAAKCRAk1otyXVSH0EVjB/
 kBf4X2hPYefIK7PP9+LMxDa6Xxx/QKJuvp550B3ZEreS533SFNj1HiNrEIeOarGSdks24Q0XTXUHYq
 5tJwIbbM8bt/3KHo2JU5kVXE+UhS2x8KeQVeZPdAqWK2pEEY0BSsHZmovC0r10ubS5ZDrVTBug+RlO
 eihCwcEa3sOGNWCglW2pd/qa6tjIHvl5RFnxaOQ8aRGhxxJvyI+l5nPSuwU0IOfR6UOXuRV+anGWDC
 wnIOGfY/fDH7wE9hrNf//pvVrUm4vmOw6U7n1PHUzZV75Qd/UD/zaTKNbTmMR6YQ+VJohNZ7Wj1iLM
 YbLRLmkG8dFGiagFvhFb5TZtNmuCvF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

Currently snd_soc_info_volsw() will set a platform_max based on the limit
the control has if one is not already set. This isn't really great, we
shouldn't be modifying the passed in driver data especially in a path like
this which may not ever be executed or where we may execute other callbacks
before this one. Instead make this function leave the data unchanged, and
clarify things a bit by referring to max rather than platform_max within
the function. platform_max is now applied as a limit after working out the
natural maximum value for the control.

This means that platform_max is no longer treated as a direct register
value for controls were min is non-zero. The put() callbacks already
validate on this basis, and there do not appear to be any in tree users
that would be affected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 2d39370ddeca..93e72a016b4d 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -176,20 +176,21 @@ int snd_soc_info_volsw(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	int platform_max;
+	int max;
 
-	if (!mc->platform_max)
-		mc->platform_max = mc->max;
-	platform_max = mc->platform_max;
+	max = uinfo->value.integer.max = mc->max - mc->min;
+	if (mc->platform_max && mc->platform_max < max)
+		max = mc->platform_max;
 
-	if (platform_max == 1 && !strstr(kcontrol->id.name, " Volume"))
+	if (max == 1 && !strstr(kcontrol->id.name, " Volume"))
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
 	else
 		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 
 	uinfo->count = snd_soc_volsw_is_stereo(mc) ? 2 : 1;
 	uinfo->value.integer.min = 0;
-	uinfo->value.integer.max = platform_max - mc->min;
+	uinfo->value.integer.max = max;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_soc_info_volsw);
-- 
2.30.2

