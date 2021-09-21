Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5E413C9A
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C361690;
	Tue, 21 Sep 2021 23:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C361690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260289;
	bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lz8zIoMHxdYH8XtpIsnK5aQli2I9I27I3g7SIG25ypDffCyOfgslprG/WZeN1m/zl
	 nwK7oBWxQfjxjcA1zX8Pg2yUBlpkj2kYGhZpKZ0te0F0CGrELfIVyXf9bMPNjEQw9g
	 Gl3svlRjePxyeqvSFZ9/L1YnbXf6oLw/BDgmt9Q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DD74F8026A;
	Tue, 21 Sep 2021 23:36:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56EE4F80268; Tue, 21 Sep 2021 23:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A88F8011F
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A88F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QE3tkfRq"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C86661019;
 Tue, 21 Sep 2021 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260204;
 bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
 h=From:To:Cc:Subject:Date:From;
 b=QE3tkfRqdrpvu4/J+U4l1kfFvGlrZ/TetTh61VdLQSpG/bqzQn7r7wtMOC7VQNoFT
 EC+iCQkUJhqvwi6VAwq2FgWxWu1c9IME0bamhsoLMpAFH3S9BMUbT7TZd5LMgXdw0V
 NPf9G5JEzU2S/VoX3b58IqqbffG6jbDWVAp2Pe3GhvrPGc7QkBNY4M+i4GYJOYaQP+
 3Bhu/elseJx688PjMhHncg9siEWW4Zdyi8II2QjyAe2OV88hwBn74pX8SxwCt9wnd9
 u8YEjqoQkTKJl00U570EoWqEMK/0mcKR8/2hpojmvx9DEs6FWjMeYzwqe5ltPFQG+Y
 sGkeZkfEx+BBQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 01/16] ASoC: eureka-tlv320: Update to modern clocking
 terminology
Date: Tue, 21 Sep 2021 22:35:27 +0100
Message-Id: <20210921213542.31688-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; h=from:subject;
 bh=zSHBaEge3vIffxUMJGRccMptS+Nr4Yr8WQuKISPrvVI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8Tj/RSRUcVVBm/LLpoHGroCue6wcCm71p7LgUe
 WE1IRW2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPEwAKCRAk1otyXVSH0PsDB/
 wPGrHwKlNnv8ILxr+P+yYJoKt3z0rK88YqhlaCIYMLIFd5i40Omj/VUnO5UBmZkd6hKQTNXi+PeXop
 fjCW0QgmA9l+MhpBBZwM6P+xzTqBb/5d7C3AzFnggdqi+0wnsBzI1UAbgnbByIZWqsoIBHFIzMqHSI
 7w6wKkvL47rMjLZoC9PbqRot3MeEkJX2G0I3OrPuj/Ux7HrbHeb4nLCYASAQaEKFHsdg1jx0pX8Sdv
 1yR5pJM+UbqeoYB277UVQlFTv6RQyxLUfNGAvGD+GQl5varbYXTDMfI9II+Iioy/8U0maNlkrnzUJR
 GM9qWKeHRqJ4YRxJmyRHwr4joGa+9b
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

As part of moving to remove the old style defines for the bus clocks update
the eureka-tlv320 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/eukrea-tlv320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/eukrea-tlv320.c b/sound/soc/fsl/eukrea-tlv320.c
index e13271ea84de..8b61582753c8 100644
--- a/sound/soc/fsl/eukrea-tlv320.c
+++ b/sound/soc/fsl/eukrea-tlv320.c
@@ -70,7 +70,7 @@ static struct snd_soc_dai_link eukrea_tlv320_dai = {
 	.name		= "tlv320aic23",
 	.stream_name	= "TLV320AIC23",
 	.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			  SND_SOC_DAIFMT_CBM_CFM,
+			  SND_SOC_DAIFMT_CBP_CFP,
 	.ops		= &eukrea_tlv320_snd_ops,
 	SND_SOC_DAILINK_REG(hifi),
 };
-- 
2.20.1

