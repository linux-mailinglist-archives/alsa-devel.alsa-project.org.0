Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE83854A469
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 04:09:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD5E186E;
	Tue, 14 Jun 2022 04:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD5E186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655172553;
	bh=QyA7bmOpgTHe++ypbwOYleAT8DYMiXUQDDhCe7vK3cc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qdoL8sFYZnWRDS3gvOZT35mOIMbFNPF90w29CxXsfPHBd02XP6SLel0oTGa3gbZdT
	 9AIdINEY38VfIOkLCeurRkANKsdL2mCZVwSUpp9IA2mwh1wMIFg0DnFyy/YDyN+Fn9
	 PKmFR2bfj6sjPzvWgctJQUosdlyUQ9a4h6mg3gIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B101F80588;
	Tue, 14 Jun 2022 04:05:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 388BDF8056F; Tue, 14 Jun 2022 04:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 099ACF8055C
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099ACF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PtLFDX+7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5A6DBB816A3;
 Tue, 14 Jun 2022 02:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8228C385A9;
 Tue, 14 Jun 2022 02:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172317;
 bh=QyA7bmOpgTHe++ypbwOYleAT8DYMiXUQDDhCe7vK3cc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PtLFDX+7HPbbntLl7n7Nolgzj8J78AggbWT3EyOccgFeen7/CgJpJ+hrw8xeltb/g
 b+iIChgVEryGbtPjMxPsz0ochFdgs2M9GscFq2xXi/izabq9iVRSLn8gUmDC97R6Xb
 piRQywPuvvx4ZpN7fRw8srPOtHrnE+s3/ahoEcTw2+9ye9RoNtycwirRH99IFw5+Q4
 M0NHEz7qAgRlgOqaTKIYFHA5bf6O0WRb+o71nDnn0gTPmtkglLU9YN/hVHc7JMvh25
 Zy4Zo7xH0cjDrwpBCm3z6JEdA60gAMXXC8RpApL0HWAwmBGougq3f3ZfCy+KNp/oYU
 F35Pup5JmyqCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 20/47] ASoC: wm_adsp: Fix event generation for
 wm_adsp_fw_put()
Date: Mon, 13 Jun 2022 22:04:13 -0400
Message-Id: <20220614020441.1098348-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020441.1098348-1-sashal@kernel.org>
References: <20220614020441.1098348-1-sashal@kernel.org>
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
index e32c8ded181d..9cfd4f18493f 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -333,7 +333,7 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
-	int ret = 0;
+	int ret = 1;
 
 	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
 		return 0;
-- 
2.35.1

