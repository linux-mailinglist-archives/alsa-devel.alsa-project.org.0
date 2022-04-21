Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BA9509FCF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 14:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D1EE18D8;
	Thu, 21 Apr 2022 14:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D1EE18D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650544820;
	bh=9gG00Iz3mqrENTaoa8y0Hwexr4oltLYzXVcfADEk/Ik=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYxL43pOsX6FOOoCD5okaVOI3ltKkPdwSj5hcPexhMMPEJP1rjBYDIT1jcSoaKj+L
	 0SJrHDHIex2c72R3YW+wP2bpnnyNmKK6S1LN7K2WLox6XbMJlellxjKUpodq5zc/Aj
	 rof8oJetz0f2g7s76t6k2dHy+zADOkt4t08CTOZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE178F804FE;
	Thu, 21 Apr 2022 14:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E08F8047D; Thu, 21 Apr 2022 14:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3719F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 14:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3719F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fnvSsUIK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BB4161C52;
 Thu, 21 Apr 2022 12:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8FCC385AA;
 Thu, 21 Apr 2022 12:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544711;
 bh=9gG00Iz3mqrENTaoa8y0Hwexr4oltLYzXVcfADEk/Ik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnvSsUIKfsyGCNerlTj3QWr2p6hVZj6P5fSUUv6NR2sevztCHZ02st4XIUv1A7huf
 tjOqAqHFC2mRySTU2PzKUKSWeFwX4F+nK5wgcysM5g79n/hY/Rrn+QqWoMirBAzilr
 D9WfH6uPHqeiaotbrcJhwOO8Bl0glqJaXNkstQrhOBMdHU3p8Lc4rSNO0xkM8Apqze
 a0UjkQobVqprRe/a06chOX/SJBbNKc3FlUn2yF4R09DD0h/rvcKyulqB6uAmGC1qz1
 dBuSyNKy6aVzV85EuTTsTd4MbVF/Er2V3ZthNO36nGU5w/QSHPau8HOD0m832EQQME
 n7og+pc/jC8BA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 2/3] ASoC: meson: Fix event generation for AUI CODEC mux
Date: Thu, 21 Apr 2022 13:38:02 +0100
Message-Id: <20220421123803.292063-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; h=from:subject;
 bh=9gG00Iz3mqrENTaoa8y0Hwexr4oltLYzXVcfADEk/Ik=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVApr1wxoy72crF0ib0G+aPDqqU1bdbsIAyVBhhP
 +mnhnfKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQKQAKCRAk1otyXVSH0GXgB/
 4w6oXHaBHrqC0AwyuE6hLaIx8oM7InBIWuBxen2KO1BfHYIQZOT0EMRGa5YVO92HlZH9kCmRZ092eA
 1tpCJyeDW3+i38hGi6Mma9VyN6nMZPgjallrvc4u8+p7hUk4LbOdh3Yyg2Pu5bJILTKpk1SYwZvCky
 uH5vmmgW+iYeMSZHCNFvD0Gs/gyRn4doiSN9T22qcgP/vYwT7W2QjC9YD09TURzhqFXACYTbLM7Pb/
 JZJ714tx2Z0g6QaMuiZocMcL2P/olpLhRq1i6cvOfL6wQo0gyfZ9aoSfF/d3dx1Esc8+vWm+aOO+3g
 rmLZlfiEgn3N5gwumqOGURp3Tvuj3j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

The AIU CODEC has a custom put() operation which returns 0 when the value
of the mux changes, meaning that events are not generated for userspace.
Change to return 1 in this case, the function returns early in the case
where there is no change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu-codec-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index c3ea733fce91..c966fc60dc73 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -57,7 +57,7 @@ static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(aiu_hdmi_ctrl_mux_enum, AIU_HDMI_CLK_DATA_CTRL,
-- 
2.30.2

