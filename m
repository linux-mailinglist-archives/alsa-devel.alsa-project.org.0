Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9B411B45
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 18:55:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FDC916D3;
	Mon, 20 Sep 2021 18:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FDC916D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632156939;
	bh=ZSbsqtm50QTeE32VXtGGhUOpXaVxWKEcuEdRBzgcF9s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OLqzCqvT/1fEe2lGGrSqcIqBOCn2qLgZRxe5Ub/hY+ahEI57DZoSXOJ9BwAsqz0Yk
	 jHhpn58La3dM8JSjv9zz+1qJU6RIRBZnNdgTh18x95aXNnXILEOyaC8iKqUVVhFsca
	 s/VrKXU/Sv+Xf+0SptMnRa0TkED8n+2T7/ZjT9F0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D63F5F80152;
	Mon, 20 Sep 2021 18:54:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48365F8025D; Mon, 20 Sep 2021 18:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D175F80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 18:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D175F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uMhEgFN3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E115261505;
 Mon, 20 Sep 2021 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632156847;
 bh=ZSbsqtm50QTeE32VXtGGhUOpXaVxWKEcuEdRBzgcF9s=;
 h=From:To:Cc:Subject:Date:From;
 b=uMhEgFN3nmxxckKfJLDXVomNaFBwwVs66Gcbdut5vDhmY4jJtUwO9wpg5+wwkeegC
 fjUbjMT07zpwaYsfydQ02F1+kKHWQpRZDRayp9AllqeY2cVLlXabxzBJjgJn8J1e3p
 ML2ze2FfR5tmoe8uGqV3GWvR809816JxgdYmzvY+IfGwEtgF9pQPNCoJKNHmoJ9k2K
 v0nZjQ5/KTOSDiTV0y/xRF3ak5byBEfXmv6hAZs1r85/LwysmEzMpIRxzYSWMTolOG
 Bv9wyDCxPZXdl4z66f39kSttEQaL1sWxzuf7n6GgZ2kMMTlooHsI+zvw0wD41PdCeF
 fZLcFsCcd7dFg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: cpcap: Use modern ASoC DAI format terminology
Date: Mon, 20 Sep 2021 17:53:23 +0100
Message-Id: <20210920165323.17338-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164; h=from:subject;
 bh=ZSbsqtm50QTeE32VXtGGhUOpXaVxWKEcuEdRBzgcF9s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSLxnE4vjLYX3Vn5PcRRxrZGE1uAaVPtwvQUiYO/x
 OedQmCSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUi8ZwAKCRAk1otyXVSH0A+oCA
 CGtUVfW0cdfvrU7cY1dyi0HuydzY7REKMfAFqo+etbNC4IAGkr9r6QaF3Rtc8m5L+wUGJc4FAg7mou
 cLTHbyjy74YFXa3tHeiOU4MqHZCq6pvXvx4JZQxlt4wMB8qkApyYpXmR091m7p7m4siqGSeC5QIpFA
 k9IKbXo0aspVTEzBjARslBifMwWtNc+3ZxH8qKy/A6ZlHBjFkYZ0KunGBqFGYPhlbxSy6P8S4jexIf
 nD3SPByRK5Is3EGiiT2jPz4R3XFwWyJ0lMMPcM2geuiy/T6XgHHMgIEcDCEpMx+4VUd0vswRSTZ97P
 OAvSkcXgsWrN4bpihUuD+v5QYsVnc/
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
 sound/soc/codecs/cpcap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index 05bbacd0d174..9a932d088fb5 100644
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
 
-- 
2.20.1

