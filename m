Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5BD53BA55
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 15:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2023F1758;
	Thu,  2 Jun 2022 15:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2023F1758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654178391;
	bh=uPk8icP4bARsrrVE4s+cg0Z/KWet4VBYf1FxuTnTIJU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iiJiiH7kebFxBPVPqIE5yDzy78WPZOO9VyrANYoUOWkrGkXbGnaHLaUuDUI0vZuvf
	 F8umidYtezitPqbh/4jDDCsu7MwFjaDxeHB7mjAD55r6ZEHujuCRo8srGeVbwj/K4l
	 CxxMET3KQxmZ9nNWDcY/adNfqcOLfR+lsMfqDXhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42EFF805CA;
	Thu,  2 Jun 2022 15:53:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 595ADF805C2; Thu,  2 Jun 2022 15:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFC6BF8057C
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 15:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFC6BF8057C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SUHt5n4J"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76B82617D7;
 Thu,  2 Jun 2022 13:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330F1C3411E;
 Thu,  2 Jun 2022 13:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654178024;
 bh=uPk8icP4bARsrrVE4s+cg0Z/KWet4VBYf1FxuTnTIJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SUHt5n4JcGJFbTGbZDOL9oH3T5ngvwSipyLhJUbcfJy2MAG/Hhala3zsRMlhzAu8h
 1oWucn/AOGaUb7gOluZGIYIlC8VMw+VPcYXlpoxeZsDUUM9UBmCOOEZhokmL0vU0of
 +IfxWEXb90L4faiwkdd8TDda2l3rrRbeqwzcGgEG++2lrrnM3ljIphQwBSQl2FznN6
 mXJsmgla8h8LJLPpa8jBvb2rRNfxBCM6PEObDCgZJb+Df6eKAhINwvVPm7GkZm/jo1
 DO6yYSUTobl14tqD76GVhr6+ioVMa0knmHmorxyIZAiG4kcJnMO1bvJvXmnhIk82oE
 MBUQADJQ1v9LQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 20/20] ASoC: tlv320dac3x: Use modern ASoC DAI format
 terminology
Date: Thu,  2 Jun 2022 15:53:16 +0200
Message-Id: <20220602135316.3554400-21-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602135316.3554400-1-broonie@kernel.org>
References: <20220602135316.3554400-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; h=from:subject;
 bh=uPk8icP4bARsrrVE4s+cg0Z/KWet4VBYf1FxuTnTIJU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhqQZB+Y23gnMNC0oP1TVXy7St2FplVfM45Tp3QWnC+Xii77F
 CzN2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQATWe7J/ldWmHf93m7OJKdPPULZbh
 MZv2xYLdx01KR2v9atepeS2GfcBVdWSj3fasXmvC6ZLyvKLti4oOrgo6en8zKamp9LveBO563PmuBp
 ekHw05+gkilis59rpumdFz6QnX1BNW0pT/5B9hTmPIfKWxsztzEovb6rprmnXsneksUldatRIEOc4x
 2jwmUO3o7Ll124E/ey7LWU9dIfwjYzdfWOLJupdODElAbxyepSFUKiNh/VX3DYezu0/lsT/7Jc6Txj
 /A4lmw0OS9jiDZjkDnF7GuibLTgYvPFSKcsrXbkXjIEib6VPy3hZxb958XLJQ0m1X57PwhY3TCnb8X
 vLST/uRY87IhpTVlV/+rPQW/0MAA==
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
the tlv320dac3x driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320dac33.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 66f1d1cd6cf0..371026eb8f41 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -1317,16 +1317,14 @@ static int dac33_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	aictrl_a = dac33_read_reg_cache(component, DAC33_SER_AUDIOIF_CTRL_A);
 	aictrl_b = dac33_read_reg_cache(component, DAC33_SER_AUDIOIF_CTRL_B);
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		/* Codec Master */
+
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aictrl_a |= (DAC33_MSBCLK | DAC33_MSWCLK);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		/* Codec Slave */
+	case SND_SOC_DAIFMT_CBC_CFC:
 		if (dac33->fifo_mode) {
-			dev_err(component->dev, "FIFO mode requires master mode\n");
+			dev_err(component->dev, "FIFO mode requires provider mode\n");
 			return -EINVAL;
 		} else
 			aictrl_a &= ~(DAC33_MSBCLK | DAC33_MSWCLK);
-- 
2.30.2

