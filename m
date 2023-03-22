Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D952A6C55FF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:02:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB3CCED1;
	Wed, 22 Mar 2023 21:01:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB3CCED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515360;
	bh=8uAfPanuz/OzQylChCvYETt3kEKVswS+MP8NmyFmloQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qArhM38OC8S5Xt/ZfQ0BSotbuD8hjEX4kCCZi8wRHt/+ryvabhLHJH+HC81wJuy+P
	 TWpKlW1GlKzn/cJHPPiqFc7JBkx8cDo410oVmgqc0WoGFDHUQ3pEBiK3x6FKUSvhNs
	 vrSoGKqNhc5T0HLBXOKl9eMHlU4SjwgmAINzWQSI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 271C2F8051B;
	Wed, 22 Mar 2023 20:59:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E992AF8024E; Wed, 22 Mar 2023 20:59:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAB8FF8051B
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB8FF8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q/3Ml+22
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1416B81DE7;
	Wed, 22 Mar 2023 19:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BE1C433EF;
	Wed, 22 Mar 2023 19:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515171;
	bh=8uAfPanuz/OzQylChCvYETt3kEKVswS+MP8NmyFmloQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/3Ml+22YT5KNBqzHroYDf467EEbTXuJHMddL3XGB1FKAy05r8lfXrrDtl1N/+4ux
	 t3yvZ9IPjxHjHKoyzCDKkpNCYMRUvI19S05pLm4jYMuQxMLe3PQpglokzyZAHi4fnh
	 sIOMKcuIpRTeswtGKvsWwRpPo7SJXnx3Fp63t43unAmoO1pjmScCyQ+ts09N4y124/
	 keNvGlqI1X73OVVPy2KRAyYSpLkbH+APyftjn0xRwEG0m7Xjpae44TjCEFwqR89QCF
	 qm/bY9RlgAzlf+NTBbKlPlT541TUFsrQi2aRBPCQUXpKWe2C4HHDFzdKaaqOacIgwe
	 51P8iIyeIGEqg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/34] ASoC: codecs: tx-macro: Fix for KASAN:
 slab-out-of-bounds
Date: Wed, 22 Mar 2023 15:58:54 -0400
Message-Id: <20230322195926.1996699-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G4XX5NHFJNFQKLJMY6BXATM52E4MLEHW
X-Message-ID-Hash: G4XX5NHFJNFQKLJMY6BXATM52E4MLEHW
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4XX5NHFJNFQKLJMY6BXATM52E4MLEHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>

[ Upstream commit e5e7e398f6bb7918dab0612eb6991f7bae95520d ]

When we run syzkaller we get below Out of Bound.
    "KASAN: slab-out-of-bounds Read in regcache_flat_read"

    Below is the backtrace of the issue:

    dump_backtrace+0x0/0x4c8
    show_stack+0x34/0x44
    dump_stack_lvl+0xd8/0x118
    print_address_description+0x30/0x2d8
    kasan_report+0x158/0x198
    __asan_report_load4_noabort+0x44/0x50
    regcache_flat_read+0x10c/0x110
    regcache_read+0xf4/0x180
    _regmap_read+0xc4/0x278
    _regmap_update_bits+0x130/0x290
    regmap_update_bits_base+0xc0/0x15c
    snd_soc_component_update_bits+0xa8/0x22c
    snd_soc_component_write_field+0x68/0xd4
    tx_macro_digital_mute+0xec/0x140

    Actually There is no need to have decimator with 32 bits.
    By limiting the variable with short type u8 issue is resolved.

Signed-off-by: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Link: https://lore.kernel.org/r/20230304080702.609-1-quic_visr@quicinc.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 5d1c58df081ac..e5611f655beda 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -241,7 +241,7 @@ enum {
 
 struct tx_mute_work {
 	struct tx_macro *tx;
-	u32 decimator;
+	u8 decimator;
 	struct delayed_work dwork;
 };
 
@@ -634,7 +634,7 @@ static int tx_macro_mclk_enable(struct tx_macro *tx,
 	return 0;
 }
 
-static bool is_amic_enabled(struct snd_soc_component *component, int decimator)
+static bool is_amic_enabled(struct snd_soc_component *component, u8 decimator)
 {
 	u16 adc_mux_reg, adc_reg, adc_n;
 
@@ -845,7 +845,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 			       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	unsigned int decimator;
+	u8 decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg, tx_gain_ctl_reg;
 	u8 hpf_cut_off_freq;
 	int hpf_delay = TX_MACRO_DMIC_HPF_DELAY_MS;
@@ -1060,7 +1060,8 @@ static int tx_macro_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	u32 decimator, sample_rate;
+	u32 sample_rate;
+	u8 decimator;
 	int tx_fs_rate;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
@@ -1124,7 +1125,7 @@ static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
-	u16 decimator;
+	u8 decimator;
 
 	/* active decimator not set yet */
 	if (tx->active_decimator[dai->id] == -1)
-- 
2.39.2

