Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6757AB94
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 03:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82CBE170E;
	Wed, 20 Jul 2022 03:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82CBE170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658279689;
	bh=AlRYRU4V5TJDntlv9pC4QvcgEa5MRoS+G+jtvGQpEks=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFVgZqbR9ySAJookiR6kOwQ6LCWw6caledLp3AeqWuHBSyMjmWITbvYfgakvQxx51
	 mV7dYJUSR2rByBQ1BlNLxojHm6JaPAmyn692vGhiqZZY1G+KSGwH9oT0LIeD0xLJ6v
	 f5wgsAlUY5fWo+FIn6t1LIm24d7KzLfk+A3Jbvs0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F01AF801EC;
	Wed, 20 Jul 2022 03:13:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18DA0F80543; Wed, 20 Jul 2022 03:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 265C3F801EC
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 03:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 265C3F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XMbcTnhN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 39E68B81DE6;
 Wed, 20 Jul 2022 01:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D96C341CA;
 Wed, 20 Jul 2022 01:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658279578;
 bh=AlRYRU4V5TJDntlv9pC4QvcgEa5MRoS+G+jtvGQpEks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XMbcTnhNTLaCvnYtE612E+Gm5xeHQhmw3WxrxwT2ZDlAYAIsWKrJdwS63vVOlWV2w
 dapd70Qyreqz6mFpjCr6aMJce/9ZTAuZ4Uyk3Pyj+K/PTjcuglw5GbH489o3xndVJ1
 N0AaZzPAbQf7ijEAiUxjKwTsrwV8uvWVUfX+jDPryg/i652vPQufcTBLQTle0DLDAu
 AWLUUalHvh0yQZ+sFRZB/fFWZYMEov9LG+umOuTdUgxabNuZeRUFsWuUnYhQtxmQuo
 mOlbqThZDBSD6/csTaHQfGNNcoweThtCgZFENz5pCMrs3rNn1jp5kw9JaA3AfWyrdt
 1eBk++FqbSq8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 38/54] ASoC: wcd9335: Use int array instead of
 bitmask for TX mixers
Date: Tue, 19 Jul 2022 21:10:15 -0400
Message-Id: <20220720011031.1023305-38-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011031.1023305-1-sashal@kernel.org>
References: <20220720011031.1023305-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, tiwai@suse.com,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

[ Upstream commit a5d6d28e2ea38dff017cb562dfbe0259d093a851 ]

Currently slim_tx_mixer_get reports all TX mixers as enabled when
at least one is, due to it reading the entire tx_port_value bitmask
without testing the specific bit corresponding to a TX port.
Furthermore, using the same bitmask for all capture DAIs makes
setting one mixer affect them all. To prevent this, and since
the SLIM TX muxes effectively only connect to one of the mixers
at a time, turn tx_port_value into an int array storing the DAI
index each of the ports is connected to.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Link: https://lore.kernel.org/r/20220622061745.35399-1-y.oudjana@protonmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1e60db4056ad..ad887c9c7573 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -342,7 +342,7 @@ struct wcd9335_codec {
 	struct regulator_bulk_data supplies[WCD9335_MAX_SUPPLY];
 
 	unsigned int rx_port_value[WCD9335_RX_MAX];
-	unsigned int tx_port_value;
+	unsigned int tx_port_value[WCD9335_TX_MAX];
 	int hph_l_gain;
 	int hph_r_gain;
 	u32 rx_bias_count;
@@ -1328,8 +1328,13 @@ static int slim_tx_mixer_get(struct snd_kcontrol *kc,
 
 	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kc);
 	struct wcd9335_codec *wcd = dev_get_drvdata(dapm->dev);
+	struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kc);
+	struct soc_mixer_control *mixer =
+			(struct soc_mixer_control *)kc->private_value;
+	int dai_id = widget->shift;
+	int port_id = mixer->shift;
 
-	ucontrol->value.integer.value[0] = wcd->tx_port_value;
+	ucontrol->value.integer.value[0] = wcd->tx_port_value[port_id] == dai_id;
 
 	return 0;
 }
@@ -1352,12 +1357,12 @@ static int slim_tx_mixer_put(struct snd_kcontrol *kc,
 	case AIF2_CAP:
 	case AIF3_CAP:
 		/* only add to the list if value not set */
-		if (enable && !(wcd->tx_port_value & BIT(port_id))) {
-			wcd->tx_port_value |= BIT(port_id);
+		if (enable && wcd->tx_port_value[port_id] != dai_id) {
+			wcd->tx_port_value[port_id] = dai_id;
 			list_add_tail(&wcd->tx_chs[port_id].list,
 					&wcd->dai[dai_id].slim_ch_list);
-		} else if (!enable && (wcd->tx_port_value & BIT(port_id))) {
-			wcd->tx_port_value &= ~BIT(port_id);
+		} else if (!enable && wcd->tx_port_value[port_id] == dai_id) {
+			wcd->tx_port_value[port_id] = -1;
 			list_del_init(&wcd->tx_chs[port_id].list);
 		}
 		break;
-- 
2.35.1

