Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F8523485
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 15:42:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185EC1A9E;
	Wed, 11 May 2022 15:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185EC1A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652276573;
	bh=xCLq4P62dOmCH/gliIQuPnOEc//g8IiuXtbDqw2c+TY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNwxup6izq94zNR3h9tzWhlpmLb1/duxBYCEydZFi6EU1N/ctCgmonQWzJjaLtUow
	 fHqEOOByErmfg9telRO1GO/2jlcRwB56C/Z4WyQ4DNaHID4P+HrbYuQcAlX2mHgcpd
	 e5skulRKaoU/13YmWjK208/Mjiwh93cfpNDqSLqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B58C5F800BB;
	Wed, 11 May 2022 15:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F06EBF8050F; Wed, 11 May 2022 15:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BA1BF800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 15:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA1BF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ALHSHLFW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBC2461CCE;
 Wed, 11 May 2022 13:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65904C34115;
 Wed, 11 May 2022 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652276511;
 bh=xCLq4P62dOmCH/gliIQuPnOEc//g8IiuXtbDqw2c+TY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ALHSHLFW6yf/TIwgli2FvLjDSzjMv/o2myVyRYMGB+fhNHOmh0glljcaB2Van+dXK
 NB+lK3jG8pLPuQytTmWbgQ5Yc/tfz1T3/rSJnfH8Mm45VRStGbVfO5jTKz9eUd2GWz
 qXOhH5XNfthMOMqgsowbcbHthOw9R04jaLeG0f/+gflRGmywHg1reuZUarAkRk4Sz3
 vArqIoOFZMcHxTNrO/Cz/RwDJZb+d8EOS6XmrAbRcw1V/Wl4xPyHBjcca5i1sW9vf7
 1XGubLDktKMYdKu7OWLZPVKwW6MOBTUicdyCbHZAxJAvtuI17kcbjjC4sh9X7AiZ4X
 BdZ7iu+u7aiAA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: ops: Check bounds for second channel in
 snd_soc_put_volsw_sx()
Date: Wed, 11 May 2022 14:41:37 +0100
Message-Id: <20220511134137.169575-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511134137.169575-1-broonie@kernel.org>
References: <20220511134137.169575-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; h=from:subject;
 bh=xCLq4P62dOmCH/gliIQuPnOEc//g8IiuXtbDqw2c+TY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBie7uHXMN8+vS3NpVjll+sw5qrycOLn+SpdcaCuEaR
 zQQoWiOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnu7hwAKCRAk1otyXVSH0CloCA
 CEBm6pAIsMpuJLWBR2qyLLYF3gR/d+/LP4o9S3jVv+aZU3o9AWAelait6Eh/qJV5PIXP8yDeYAApON
 PT+hH4je7tDqXt+qm6shcva7ZbxYmAOWo/D+bOxOYkW3TmrbqH0KOUgY2l52i8qvA+7tPYjrQq/8HP
 1ErV5CFhg2K/GCKOMyE/UnlRFWAfrhTvWOvA9vdyDjGf6pm3+nwIWO5skDP6rga3Sqx+aZ6sCsfC/H
 Ejfpov072HdVlfIpO8h/p7l+jfSpo1D2JwIsqnLj3nbTZbg19sgpw9bZjbLVL2YPKeGqRF4UXe16dt
 vZhzvgngMUghl5sYONOi8LtvWyM2Ku
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

The bounds checks in snd_soc_put_volsw_sx() are only being applied to the
first channel, meaning it is possible to write out of bounds values to the
second channel in stereo controls. Add appropriate checks.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1ac7e2ce31a1..7cac26a64e0c 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -451,6 +451,12 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 
 		val_mask = mask << rshift;
 		val2 = (ucontrol->value.integer.value[1] + min) & mask;
+
+		if (mc->platform_max && val2 > mc->platform_max)
+			return -EINVAL;
+		if (val2 > max)
+			return -EINVAL;
+
 		val2 = val2 << rshift;
 
 		err = snd_soc_component_update_bits(component, reg2, val_mask,
-- 
2.30.2

