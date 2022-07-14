Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE82B57435D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4786A18E6;
	Thu, 14 Jul 2022 06:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4786A18E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773217;
	bh=RUUKpFFgLZU5wPepFLY7h5IaUmNL/AXE1xUV7qaneFM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sApnog0x+5AmYAtaAcdjadXIcz8tIjt+YDBveuPxoL3BP5hHHgAmgniAgfqzUCh5U
	 +HgeNe6txkgezasbfDIkXHbSbBN6Feiq90uRMUuz6Btfo2yZFMMSFyiT1RNudGNFoc
	 4oexLRPPdZeSlMZ1Ji5Pq4V2R1NhRIVtmeGocyyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0186F8062F;
	Thu, 14 Jul 2022 06:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 605D0F80620; Thu, 14 Jul 2022 06:25:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81B80F80614
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B80F80614
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JIS/bHcU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C54F61E95;
 Thu, 14 Jul 2022 04:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F266C34114;
 Thu, 14 Jul 2022 04:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772695;
 bh=RUUKpFFgLZU5wPepFLY7h5IaUmNL/AXE1xUV7qaneFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JIS/bHcUQvMR2p1uaEd0p2fPZ+IzvYmka5KBhD9iaY1+UVVs9ZOVdbnzHHsf7DNtQ
 J6A+fB5GG9WOg8MMZKu5z8kTu5Ow6GiJ7IJsanEfn6eBxnk4kU2Pki2pknRVQH5+/C
 tft/Av4VwaafPgg82rOREiwQIlLxR0Q+iGQ5HJ3gp1gxz2zuk/Gsys27Tx7XlV2t2C
 qKg6ubWcdyOR/n7t0PQymVBDptubxIaZssXljNRlphoENQ9W7GoJobaMS3FrMW8+yA
 bqfMTGX4sEn9rabPHT3jhg/LIv3si2V92ytRiDIcMoebQp7FMiBpE180M40escinIf
 WrMfZ15+OyAcA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/28] ASoC: wcd938x: Fix event generation for
 some controls
Date: Thu, 14 Jul 2022 00:24:11 -0400
Message-Id: <20220714042429.281816-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 kernel test robot <lkp@intel.com>, lgirdwood@gmail.com, tiwai@suse.com,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
 quic_potturu@quicinc.com, yong.wu@mediatek.com, quic_srivasam@quicinc.com
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

[ Upstream commit 10e7ff0047921e32b919ecee7be706dd33c107f8 ]

Currently wcd938x_*_put() unconditionally report that the value of the
control changed, resulting in spurious events being generated. Return 0 in
that case instead as we should. There is still an issue in the compander
control which is a bit more complex.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/20220603122526.3914942-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd938x.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 4480c118ed5d..8cdc45e669f2 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2517,6 +2517,9 @@ static int wcd938x_tx_mode_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
+	if (wcd938x->tx_mode[path] == ucontrol->value.enumerated.item[0])
+		return 0;
+
 	wcd938x->tx_mode[path] = ucontrol->value.enumerated.item[0];
 
 	return 1;
@@ -2539,6 +2542,9 @@ static int wcd938x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
+	if (wcd938x->hph_mode == ucontrol->value.enumerated.item[0])
+		return 0;
+
 	wcd938x->hph_mode = ucontrol->value.enumerated.item[0];
 
 	return 1;
@@ -2630,6 +2636,9 @@ static int wcd938x_ldoh_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
+	if (wcd938x->ldoh == ucontrol->value.integer.value[0])
+		return 0;
+
 	wcd938x->ldoh = ucontrol->value.integer.value[0];
 
 	return 1;
@@ -2652,6 +2661,9 @@ static int wcd938x_bcs_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
+	if (wcd938x->bcs_dis == ucontrol->value.integer.value[0])
+		return 0;
+
 	wcd938x->bcs_dis = ucontrol->value.integer.value[0];
 
 	return 1;
-- 
2.35.1

