Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859114C0643
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:38:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248AF190C;
	Wed, 23 Feb 2022 01:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248AF190C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576704;
	bh=ee7qrMUnvORzdQXdbICteFD+rRl7kHIrX3fsYJDc8w0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Rfk/DTOiVwFAknGoWMr+zxRtS9f0HFfHpY5faHzRZdmhDAFQ3ZC5BrVFtys5X0HSi
	 EdUGSk4xib8rNsZ7/kGjKHZaadz14So1570HERcL+BGjFjnbaAfk1dhIp3kqZfvK6l
	 3lxuuF/yaR2q7ZZ7mpL7Jka+66o1YGYvGj8Ui1q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C1B0F801F5;
	Wed, 23 Feb 2022 01:37:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB840F801EC; Wed, 23 Feb 2022 01:37:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7489CF800D1
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7489CF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fVwtBH3U"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9B47B81B87;
 Wed, 23 Feb 2022 00:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E83C340E8;
 Wed, 23 Feb 2022 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645576631;
 bh=ee7qrMUnvORzdQXdbICteFD+rRl7kHIrX3fsYJDc8w0=;
 h=From:To:Cc:Subject:Date:From;
 b=fVwtBH3UmXC3VUiJaONPg/24ZcdDLG0DTBzAgntIk8YoNiId1l/+XUFbX/Xc4nDfp
 lg0EIPsCiiAJJOoA5/+e0/uuAnbE3Em45QLFWq4FXumShwCb08lU/1Rj/+sjN2JMbv
 G9s33XJnklSTEo7UXnbajVh8Sp2Uga6LazfXFlfShRfsUW8TDiJaaQHAqtoUo/BW5j
 zw7hD9dOHe+wWFnFvSEg1QB75cJ1yxz72i1hvNE6rvprkoV99OedzmCEk93bnBbxdA
 4i6u6sbR4RrUe/JfVWPvF1r3eIQZGwaqHF2i6L/c4gfrG0yKCxubFPAVjuS5zTppX9
 e356S53U/O31Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: uda1380: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 00:37:07 +0000
Message-Id: <20220223003707.1903798-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1746; h=from:subject;
 bh=ee7qrMUnvORzdQXdbICteFD+rRl7kHIrX3fsYJDc8w0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFYGblhXnhSj0P2K7+C3Yj0i4WAC1+ccoyW25ePB8
 bW44OwKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWBmwAKCRAk1otyXVSH0P/vB/
 0Q5U2eMv7ntrNk2YlsfYyEjM64ofnDAqoFRiOMH+IjXGL1CgykusrQcTN+oYOCqbbubm0ZByVNyM7E
 KxCswFFdovWCuBb05sfU+8fwOuCkXGLY011HDXQV/fC+QHLJiJRoWwrVfxB+vRhfhH4ChDZOliVt/Y
 2Eo/ez4q19LQMWBWAEuPLgLKaoRmzDmsKD2CZIO1qXFN/4tjekiUEHEB5Eqbr/nIUADUtGufSPjvtd
 kDFfffH61jUvIwDIpeLt/jm5jLRLTxQpEo5s/frSFR6y72Lsj/nh6zDTQ8VjCwrRMtS+XPVW/7YdZ+
 0SyjrcHXpnW9ekxJ8fJo6hLHSO6KuX
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
the uda1380 driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/uda1380.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 89f2bfeeb70e..13060a9a2388 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -435,8 +435,8 @@ static int uda1380_set_dai_fmt_both(struct snd_soc_dai *codec_dai,
 		iface |= R01_SFORI_MSB | R01_SFORO_MSB;
 	}
 
-	/* DATAI is slave only, so in single-link mode, this has to be slave */
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
+	/* DATAI is consumer only */
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC)
 		return -EINVAL;
 
 	uda1380_write_reg_cache(component, UDA1380_IFACE, iface);
@@ -465,8 +465,8 @@ static int uda1380_set_dai_fmt_playback(struct snd_soc_dai *codec_dai,
 		iface |= R01_SFORI_MSB;
 	}
 
-	/* DATAI is slave only, so this has to be slave */
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)
+	/* DATAI is consumer only */
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_CBC_CFC)
 		return -EINVAL;
 
 	uda1380_write(component, UDA1380_IFACE, iface);
@@ -495,7 +495,7 @@ static int uda1380_set_dai_fmt_capture(struct snd_soc_dai *codec_dai,
 		iface |= R01_SFORO_MSB;
 	}
 
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBM_CFM)
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) == SND_SOC_DAIFMT_CBP_CFP)
 		iface |= R01_SIM;
 
 	uda1380_write(component, UDA1380_IFACE, iface);
-- 
2.30.2

