Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9297054A525
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:15:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2667E18E4;
	Tue, 14 Jun 2022 04:14:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2667E18E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655172927;
	bh=Wb9zf+MdbLEL6269vRZQ5BnfGJNFA8u3ASZMRlx1A2o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rvh9K9CSso8khcltAldcQGXf+WYF4+5W2TNHYUk0TgKXiyFVLkzfPp03kvaDwND8c
	 Qp101dpO5xQ4UJ0v7/x0KgjvroNnqdsuyjqPZBBiv233gvzeKr2Z+qMZFvT0OArtle
	 lN1DMi43l78+qP5ZxcP05D1/UqOB/6J5smoeDglY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD6AF80604;
	Tue, 14 Jun 2022 04:07:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F0F5F805FE; Tue, 14 Jun 2022 04:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C8DF80548
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C8DF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aRZ9vPQY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B286260EF0;
 Tue, 14 Jun 2022 02:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AECC385A2;
 Tue, 14 Jun 2022 02:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172459;
 bh=Wb9zf+MdbLEL6269vRZQ5BnfGJNFA8u3ASZMRlx1A2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aRZ9vPQYGGojsa6O3Z0EPaWAGrqpkkF4xZ49bwMYgew9BEqv5BU7MpSBQP7TG8pBl
 0ihtS4tnNLU35bhfVdWoLwW7hfkEj9lzsnrTg4VIpC+n1rVDKNd3pvg/IFM+i6+dMd
 1pGkqBSABEHLFv/Q9ee8D1k5V2l6kgvdLIyNsHRspcrQy37TT59T5wxcDuxEWUo6dm
 SUJW4SOHNYAEy0zJ9UJYjbeUNEQZBZ7+IwHkax3JHqvhVVaQPMifCts8c7WVgAQpoO
 SpozCCuYX5FXmryXSbUknkg1J9A0z3vPMtOVXcawDzBNJ/6Xs3xQMhhp6sWCauemlu
 rEneP9rrJGi5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 18/41] ASoC: wm_adsp: Fix event generation for
 wm_adsp_fw_put()
Date: Mon, 13 Jun 2022 22:06:43 -0400
Message-Id: <20220614020707.1099487-18-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020707.1099487-1-sashal@kernel.org>
References: <20220614020707.1099487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 patches@opensource.wolfsonmicro.com, tiwai@suse.com, lgirdwood@gmail.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 2abdf9f80019e8244d3806ed0e1c9f725e50b452 ]

Currently wm_adsp_fw_put() returns 0 rather than 1 when updating the value
of the control, meaning that no event is generated to userspace. Fix this
by setting the default return value to 1, the code already exits early with
a return value of 0 if the value is unchanged.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20220603115003.3865834-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index f7c800927cb2..08fc1a025b1a 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -794,7 +794,7 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
-	int ret = 0;
+	int ret = 1;
 
 	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
 		return 0;
-- 
2.35.1

