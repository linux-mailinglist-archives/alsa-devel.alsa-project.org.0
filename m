Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7B253B960
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7151743;
	Thu,  2 Jun 2022 15:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7151743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654175273;
	bh=BaIJRnZcgiZxycDzpLZEdZv7mSvYbDLGzSjaGh+brso=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KRA/4vcQz1cSDo0tOMJo135rhj7AXJAlmbBEM+TKyH63OmzdIiQW9vfoz8K77lBAQ
	 iHYV3F1HqXY/VRDsjdc4TaFb3+FcEEnK5dT1h0/gwQuqq7ZrVXmUXVD2E1mYkmfQET
	 CHxT6243pxm9bIkwTroF+M6zZsHBwnZ/n/5OnJ0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B1DF80272;
	Thu,  2 Jun 2022 15:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836A6F80236; Thu,  2 Jun 2022 15:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 440EDF80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440EDF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BliCki6+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B2AB06164A;
 Thu,  2 Jun 2022 13:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B532C36AE5;
 Thu,  2 Jun 2022 13:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654175210;
 bh=BaIJRnZcgiZxycDzpLZEdZv7mSvYbDLGzSjaGh+brso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BliCki6+kno2DcyDDrjfkRDaWK7S2ImHPd74NTy8GAqn3nyN/eGmO3k7fDX7GeVtz
 00AgDXipElQWfKfiDOCoN+t5IXZ4nZxovFGmcngFXOUNS6RjJIyzJO63gYrboERtgf
 0kvl6PNXCuxsdAMpfsTgEh09scVWUleXhx6zWfMcUp5er+wvXP7S3dizN7D9ZvRIw3
 juAU1pvRs0G2wj6hAZAi/06dF83f/zkJGn12Nx4GAMWueCSAtdUJl1quUQTyFzDUw9
 wVwTs5BYgpspCStQPpgCGptNKDG+K4o8Zpv/8JPxGAdyDNrqupkpBRMxb4z+auMcuF
 R/fzdFKSumVxQ==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/3] ASoC: ssm2602: Use modern ASoC DAI format terminology
Date: Thu,  2 Jun 2022 15:05:30 +0200
Message-Id: <20220602130531.3552275-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602130531.3552275-1-broonie@kernel.org>
References: <20220602130531.3552275-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; h=from:subject;
 bh=BaIJRnZcgiZxycDzpLZEdZv7mSvYbDLGzSjaGh+brso=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBimLVVu1rKL6rQi2dUiOFL1oopKaxvJKNyRBMDlRlg
 pKMWui6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYpi1VQAKCRAk1otyXVSH0C1oB/
 9VOFf9RSkCrVJJQPcEnKuOFvMlSyHc3Vf5NcvRBT9IvS0NBqeNcBoZxKeVDUyv/iUh5ZqSVhSekL0V
 aHKO4Tq5VsuzdEmogQ8bBgrSPIYfkXTERak5oFEXTI6X2dHE8LrRMBuatyWiBOxQ/ecn0efeglUVVM
 10CImNywcNMaiPNnWvHfcTwX2bIf4BfCbYwtN0ikAKMObXaeF746Gl1YJ7oXnwacy/nOa5+8fzVDNh
 rVPjXsHalzsFMAVVeT7A69ssqF6tRo1JNRvfeU0aMmI4w8SKhYtYcP54vwTQ+zVcsyC6BGnP8vZuYe
 4wRfagKWly1GeQz7hxAF1jB4mnLx4L
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

As part of moving to remove the old style defines for the bus clocks update
the ssm2602 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ssm2602.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
index 7964e922b07f..1821854ca0f3 100644
--- a/sound/soc/codecs/ssm2602.c
+++ b/sound/soc/codecs/ssm2602.c
@@ -411,11 +411,11 @@ static int ssm2602_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	unsigned int iface = 0;
 
 	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface |= 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

