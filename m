Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A78413C7F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74EEF15E2;
	Tue, 21 Sep 2021 23:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74EEF15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632259966;
	bh=iKlLZaGOhubDhHOMO/cmIQxcq2i8/JWZZ24GLRIq8pM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TEaG2BSIOs1pA+SlRNCZeRvBs+uCljSIAt8IOEbO1maa1AYph6Zf+Azpp/EXi4UMx
	 1ztJD6fI0Qu7tg6cL3JahCorvdYP+wxAsPT0n6I+sR4y3HT9aWu6yAk6nrXkYyHiDd
	 I4oMPV+klCslNDxQAsGdLpLxeefgKnxXhNWn2Pkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE39AF8026A;
	Tue, 21 Sep 2021 23:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A0A7F80268; Tue, 21 Sep 2021 23:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34DACF80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34DACF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H2S8qTTV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3024F60E05;
 Tue, 21 Sep 2021 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632259879;
 bh=iKlLZaGOhubDhHOMO/cmIQxcq2i8/JWZZ24GLRIq8pM=;
 h=From:To:Cc:Subject:Date:From;
 b=H2S8qTTVObkedByeFDXVBsT0lkNN11aGlbN474FMwQCInQAwC+R+i2Kvb3MqAHGrK
 F1YYCk+ssu6i13viLD5UDO54/i78dqQuqulM+p07gOZd3ssAFeXEETye4SzbojFJFk
 w51p97DcC0poLm4MtR/XCK2FrJHZUIOVPH++UzqdLT1rHtB+6Co9DUnH7mRDkBo2pF
 oaLntjcDZI90Ow+MLNl6lHc+kai/afMBRgmnVhP9PqszZ/XBo4ipufG+PKPdJtyH3r
 /lDLQPdZZxv1eJsgV8DQpX/QXFPZkho6pbufPZ1Hv+MZsrx3zGY5yCiwo+Irdmyn43
 g4ObgZIMyVRSg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: cpcap: Use modern ASoC DAI format terminology
Date: Tue, 21 Sep 2021 22:30:34 +0100
Message-Id: <20210921213034.31427-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933; h=from:subject;
 bh=iKlLZaGOhubDhHOMO/cmIQxcq2i8/JWZZ24GLRIq8pM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk7iZiD7gTIdqYhZATQLlrdINhLE3HMyJaXBTcV9
 1i1PdN2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpO4gAKCRAk1otyXVSH0AsAB/
 4iDjIFKHkTPeb19dzs8GphZqYFm2v/PBFjdj/Me9n8UJdGoiEYMTfCThZG8m+wwLMWOwAriO3SDfgs
 Fg9fWoHC11Cu9Uh7432n+xKisy6zOM5Vibd/JFkvthOUZoNN9g6KwyXhGwG5mU3GzCxrqvp6riXCrf
 CD9xWRUyVxRH+0p25llRDGQWeIv+6Mn4W5XzANUpfZ7Hph9Vr1P8It73ivFmkBit3SokPMrFPK74RO
 iZdjadDSDMVyi8QHvwt8UtxE6EeVpnN1CKIZmAZ+J8oxBqhh/UoEOv74wjJII0wb8MNJVAjNSyhLxv
 pzKNFJuFGFoqu98j1t9r6un/Zbl5wW
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
the cpcap driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cpcap.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 05bbacd0d174..598e09024e23 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1168,15 +1168,15 @@ static int cpcap_hifi_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/*
 	 * "HiFi Playback" should always be configured as
-	 * SND_SOC_DAIFMT_CBM_CFM - codec clk & frm master
+	 * SND_SOC_DAIFMT_CBP_CFP - codec clk & frm provider
 	 * SND_SOC_DAIFMT_I2S - I2S mode
 	 */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		val &= ~BIT(CPCAP_BIT_SMB_ST_DAC);
 		break;
 	default:
-		dev_err(dev, "HiFi dai fmt failed: CPCAP should be master");
+		dev_err(dev, "HiFi dai fmt failed: CPCAP should be provider");
 		return -EINVAL;
 	}
 
@@ -1318,15 +1318,15 @@ static int cpcap_voice_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/*
 	 * "Voice Playback" and "Voice Capture" should always be
-	 * configured as SND_SOC_DAIFMT_CBM_CFM - codec clk & frm
-	 * master
+	 * configured as SND_SOC_DAIFMT_CBP_CFP - codec clk & frm
+	 * provider
 	 */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		val &= ~BIT(CPCAP_BIT_SMB_CDC);
 		break;
 	default:
-		dev_err(component->dev, "Voice dai fmt failed: CPCAP should be the master");
+		dev_err(component->dev, "Voice dai fmt failed: CPCAP should be the provider");
 		val &= ~BIT(CPCAP_BIT_SMB_CDC);
 		break;
 	}
-- 
2.20.1

