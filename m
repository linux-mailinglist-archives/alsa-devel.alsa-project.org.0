Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDA293F2E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 17:03:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC7901721;
	Tue, 20 Oct 2020 17:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC7901721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603206198;
	bh=3ba/wimSiC1niwCkzHgI8JexLvZDQjHTBH0b4a7mWgQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TweBrAnm5C9w915EAY7im++DPOTAktzgknd/9FB0ueBHpzq9N4Nbuj9a9BrfaTd6+
	 eFD1kxQJ86W710845egNrmMr4dF9BhjeGEXA7mHmSEzg8DFhJtOkxPyr5ykxwfUt3L
	 gHN6Ha1wY2oLZPANcIx7H9JN0aOiVrp1NTPEURDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DE8F80216;
	Tue, 20 Oct 2020 17:01:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B704F800AD; Tue, 20 Oct 2020 17:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA260F800AD
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 17:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA260F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="pcALPfUl"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KEvgm6012136; Tue, 20 Oct 2020 17:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=XgCfUqxaOYwvz9RDx21gH1OGoREoJaNipM7JO27tcpQ=;
 b=pcALPfUlGTVlYjzgy9lQZOr9M/jywqlaRBDLx7FCwCeHIRBaIgXSyKKlk+EEwGcb0jca
 BxSCCUZQTF7U/ZpEN38ebvJPyOa1hdY37nyUHTziP2vgc50Z/XGd08CW7nHJUThXljuX
 ilcRlNsaQKIfHIiA3zVD9xhKpPmKRKkm+9d3+2PK+RYIF8M+fuSBCgP2JVBUBCd0ti0f
 0FaZmGfEURtGM6jFgvSa2V/PrDAlVdO52WRtVnmcJjXSksWL4TlT+i0TOO3sAPQfrRlu
 rpxMtUe2vvNDRem4vYgoIwpPNWh4YQ6KJUgatqCG3PpqJYrFKX8ZnBNQbRZ501/M7ONd Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qgg4432-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:01:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BA2910002A;
 Tue, 20 Oct 2020 17:01:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30F6B2E6D30;
 Tue, 20 Oct 2020 17:01:20 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 17:01:19
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>,
 <arnaud.patard@rtp-net.org>, <olivier.moysan@st.com>
Subject: [PATCH v2] ASoC: cs42l51: manage mclk shutdown delay
Date: Tue, 20 Oct 2020 17:01:09 +0200
Message-ID: <20201020150109.482-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_08:2020-10-20,
 2020-10-20 signatures=0
Cc: alsa-devel@alsa-project.org, arnaud.pouliquen@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

A delay must be introduced before the shutdown down of the mclk,
as stated in CS42L51 datasheet. Otherwise the codec may
produce some noise after the end of DAPM power down sequence.
The delay between DAC and CLOCK_SUPPLY widgets is too short.
Add a delay in mclk shutdown request to manage the shutdown delay
explicitly. From experiments, at least 10ms delay is necessary.
Set delay to 20ms as recommended in Documentation/timers/timers-howto.rst
when using msleep().

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
Recommended Power-Down Sequence:
(see https://statics.cirrus.com/pubs/proDatasheet/CS42L51_F2.pdf)
1.    Mute the DACs and ADCs.
2.    Disable soft ramp and zero-cross volume transitions
3.    Set the PDN bit to 1.
4.    Wait at least 100 μs.
The codec will be fully powered down after this 100 μs delay.
Prior to the removal of the master clock(MCLK),
this delay of at least 100 μs must be implemented after step 3
to avoid premature disruption of the codec’s power down sequence.

Changes in v2:
- Manage explicitly DAPM events through a switch case in mclk_event()
---
 sound/soc/codecs/cs42l51.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index 097c4e8d9950..c61b17dc2af8 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -254,8 +254,28 @@ static const struct snd_soc_dapm_widget cs42l51_dapm_widgets[] = {
 		&cs42l51_adcr_mux_controls),
 };
 
+static int mclk_event(struct snd_soc_dapm_widget *w,
+		      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
+	struct cs42l51_private *cs42l51 = snd_soc_component_get_drvdata(comp);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return clk_prepare_enable(cs42l51->mclk_handle);
+	case SND_SOC_DAPM_POST_PMD:
+		/* Delay mclk shutdown to fulfill power-down sequence requirements */
+		msleep(20);
+		clk_disable_unprepare(cs42l51->mclk_handle);
+		break;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget cs42l51_dapm_mclk_widgets[] = {
-	SND_SOC_DAPM_CLOCK_SUPPLY("MCLK")
+	SND_SOC_DAPM_SUPPLY("MCLK", SND_SOC_NOPM, 0, 0, mclk_event,
+			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 };
 
 static const struct snd_soc_dapm_route cs42l51_routes[] = {
-- 
2.17.1

