Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B64A4C0646
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09F3190C;
	Wed, 23 Feb 2022 01:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09F3190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576777;
	bh=bqH1sn9MgRUBZGRIHcP2AnZ1RtAMup0Re5NL+mycSKs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ua0CdB8b1Yi9rrSAl1R3pJzGuVOkcHn5lRmOS+Xvdzj7YwHe55ufXPA7zwzOGEmM/
	 EVxaDOGbE3cJ1v3rnj/NRx3xqrxdbjAPOcoeWnxZAsBVbxO/VqQRPVFsy/bmRGeLM5
	 P06AdMjKXZi68wWcMjNpYQ8GBaSKEFXSTvASAMTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33048F801F5;
	Wed, 23 Feb 2022 01:38:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E37C0F801EC; Wed, 23 Feb 2022 01:38:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7466F800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7466F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ArJJZqNB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 15E2EB81B87;
 Wed, 23 Feb 2022 00:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA65DC340E8;
 Wed, 23 Feb 2022 00:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645576705;
 bh=bqH1sn9MgRUBZGRIHcP2AnZ1RtAMup0Re5NL+mycSKs=;
 h=From:To:Cc:Subject:Date:From;
 b=ArJJZqNB0/2CE/k0o2CCnFRq+KK7MHjXsh1Z38mv1HNvlp0b880gBiFsarVfa2Qpy
 8bOPqLeDf5xm5JI417sPNQXD9u1lnUA+OGQaKvqvaJOqm+3ywM8asFZmDpKCTRkhLP
 BfuqAENBImf1DJtD+2/oJj0gg187tveTrHRaqmJVbydfNyrG1imbKJNwaRK2QLo6Am
 1rFPSAWiQnc0OVY3X2x5PPuuVlL2BOEW2Eq89al8L3wfFm8fDhjoiK2DQJaZRtMSb9
 VfLqO/kyZF+aH4fhe+pzSKndTUkulo66WqMKXYaY/lvLQPFJagEsB9mxRjn2Hv6n7j
 0MFRKOQZbxUfQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: wl1273: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:38:10 +0000
Message-Id: <20220223003810.1947495-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; h=from:subject;
 bh=bqH1sn9MgRUBZGRIHcP2AnZ1RtAMup0Re5NL+mycSKs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFYHgdgqtgThphJUD38NCOrSq95cRq8MRQGAPBGjX
 xTOeWeeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWB4AAKCRAk1otyXVSH0ElVB/
 0ZbCxadDOLOWfgrJhii3LpJC5zr0DTGo9e0/dqu2p7UXVb5Puqbf5rHDWrAOb/unoI3HCSR+TjnjXm
 7BXyn0sPbC7eSu+hrrBsGcY9NHgEq++L+2WDsVvfrwo3pLXGkHQYVl2m2eRMfu4vyZPaFiFRg0fs5N
 BQjyUilWufhSitKLcDVxQ03IKv9NMVOJ/A9Vc5pEmyRDSvtWUrhnI79cC+VPJ91Ar4bZgxDiBn9Khg
 icPOlznRVkhkjRowZnRLY3pBbfK283Iq1QioT27WzMBTdCqShW4FjtF95NeExWDCddEqE842zJbPtV
 Boox+lv0Qe2YM3CXsRcSG8HdrGO4kz
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
the wl1273 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wl1273.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wl1273.c b/sound/soc/codecs/wl1273.c
index d8ced4559bf2..02232f64110e 100644
--- a/sound/soc/codecs/wl1273.c
+++ b/sound/soc/codecs/wl1273.c
@@ -414,13 +414,13 @@ int wl1273_get_format(struct snd_soc_component *component, unsigned int *fmt)
 	case WL1273_MODE_FM_TX:
 		*fmt =	SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_CBP_CFP;
 
 		break;
 	case WL1273_MODE_BT:
 		*fmt =	SND_SOC_DAIFMT_DSP_A |
 			SND_SOC_DAIFMT_IB_NF |
-			SND_SOC_DAIFMT_CBM_CFM;
+			SND_SOC_DAIFMT_CBP_CFP;
 
 		break;
 	default:
-- 
2.30.2

