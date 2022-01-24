Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036DA4983A3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 16:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A421A28B8;
	Mon, 24 Jan 2022 16:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A421A28B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643038540;
	bh=H8CSXUKprkgwQSMfZvGKY0nOZEI/6JtPV3yXxnw+z/A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jurVtnpROOtO7StbYb8qDYhY4VpX2h8O/1eMKiPnKHUpr2eGdc8Qg13LwilVa6viD
	 WEkmI/rZH+sMqxP+Ryet+L31pN8zOXOp7JDRQDOJvfiFv5vsFoYA0kv509byx5ypWX
	 +Nk9aqJBALoFVLl1YAzDldLybeSRsKfa7CJ0edXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED28AF80310;
	Mon, 24 Jan 2022 16:34:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDE3F8032B; Mon, 24 Jan 2022 16:34:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62FADF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 16:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62FADF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SNFL9qB0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB3A96149A;
 Mon, 24 Jan 2022 15:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34897C340E7;
 Mon, 24 Jan 2022 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643038433;
 bh=H8CSXUKprkgwQSMfZvGKY0nOZEI/6JtPV3yXxnw+z/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNFL9qB0UJ1VQJXSuOKFEx3AGgLDouh+HU85gDA7yFg1aAwkWfND3fwqfW1zMVXpj
 +m1a69WFyyIGRRKaZEdZ4l+vgqByjAlqMI4VYUj/ubHpTSIXkYt4UEerfD5gyOQ0wc
 x6031ocCB1OF0njWJl3IzpzJnc4xOAMgXsrxWkH+sEjNduOCUC4eVCvs6FqvCQ//2a
 0jmFTkN+4mBzSaOwLqpxbS3/w3WqLdDgnJSHeTvGFARbxkb0u6z+bijla4Nb4+nnjI
 ezVm3CJk3ivxMo/QyXP9mPQd2xTcfuxAHRtlIWvME3MiYERKiMNUJ92pZgq+Qp2qou
 jrgF83b9ZevUQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 1/3] ASoC: ops: Reject out of bounds values in
 snd_soc_put_volsw()
Date: Mon, 24 Jan 2022 15:32:51 +0000
Message-Id: <20220124153253.3548853-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124153253.3548853-1-broonie@kernel.org>
References: <20220124153253.3548853-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; h=from:subject;
 bh=H8CSXUKprkgwQSMfZvGKY0nOZEI/6JtPV3yXxnw+z/A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh7saihjCo+ozwM+QwXv6Oo2x19ONjtnaIuHg+l+Hj
 ZU7ydiiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYe7GogAKCRAk1otyXVSH0CujB/
 92G0gzebzErS14s3OjhKS66JcFgczyXwFfuQ+g8KaCw4N6kuOym+f084lSn1Dnvb0KBZxOPQAvJOS2
 KaLxTSIn8Hsk8y9XDtxIzWF1HOnRfxhKUHiQ8fDlmTqhs+FehCW3ovLbYoYMmjdDdDF0KUJdUeFC4w
 LbP/hSYAWxu3oocFVzpHxo/N/agV7WXGynh8F7mFC7o5wLefg5a0K8RB8rKkJpSfz6QtANAymcS3Vl
 U4+NApoS25EGOQg70bmBTYDt2ys6yf+Bk/13XsskwtstZKV0tNdFwqZkj/y+ro7AT0oJpYjYlnUiJ5
 hdlIV3cKSmljqrmk79JFm8TNCjXiJ6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

We don't currently validate that the values being set are within the range
we advertised to userspace as being valid, do so and reject any values
that are out of range.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-ops.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 08eaa9ddf191..fbe5d326b0f2 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -316,13 +316,27 @@ int snd_soc_put_volsw(struct snd_kcontrol *kcontrol,
 	if (sign_bit)
 		mask = BIT(sign_bit + 1) - 1;
 
-	val = ((ucontrol->value.integer.value[0] + min) & mask);
+	val = ucontrol->value.integer.value[0];
+	if (mc->platform_max && val > mc->platform_max)
+		return -EINVAL;
+	if (val > max - min)
+		return -EINVAL;
+	if (val < 0)
+		return -EINVAL;
+	val = (val + min) & mask;
 	if (invert)
 		val = max - val;
 	val_mask = mask << shift;
 	val = val << shift;
 	if (snd_soc_volsw_is_stereo(mc)) {
-		val2 = ((ucontrol->value.integer.value[1] + min) & mask);
+		val2 = ucontrol->value.integer.value[1];
+		if (mc->platform_max && val2 > mc->platform_max)
+			return -EINVAL;
+		if (val2 > max - min)
+			return -EINVAL;
+		if (val2 < 0)
+			return -EINVAL;
+		val2 = (val2 + min) & mask;
 		if (invert)
 			val2 = max - val2;
 		if (reg == reg2) {
-- 
2.30.2

