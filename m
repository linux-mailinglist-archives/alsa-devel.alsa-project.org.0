Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8086C5664
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8C1F0B;
	Wed, 22 Mar 2023 21:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8C1F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515544;
	bh=A6pt0fBfN/Zyrl5nc6/78At8qWhXZtk4cMhzsh+ULBo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VpHkAMb+bzOpde/OzF9B0iATS8OJVvDpGI5WbQgq6CoaIzWOtTSP8YFF84cgoSg8O
	 Owf82Bi9wzSByYKEHPWf/3ZeC52c65ITA5JO+tup3IHLmxlU+rb8Dxevee6Y2WoHUe
	 RNnuZzhwjDZwOORixkVv/VfTJHu3mbVXlrm9KNI4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF6DF804B1;
	Wed, 22 Mar 2023 21:01:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0565BF80542; Wed, 22 Mar 2023 21:01:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 98F6CF80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 21:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98F6CF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hx5OnlKK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A581622D6;
	Wed, 22 Mar 2023 20:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D639C433EF;
	Wed, 22 Mar 2023 20:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515286;
	bh=A6pt0fBfN/Zyrl5nc6/78At8qWhXZtk4cMhzsh+ULBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hx5OnlKKGN4dV9Mcnm/6x5AGDX+4r3nQR0XFesj2kL7TGkPiWzAJTyEeOMY26wSzO
	 Xdh/sD203+EWrd67GK+0LBbghyREJOxQQeVGt7Cs2Qi4BNS3f2oTyscRyno87GWCV9
	 0Em54wC074DjNjs8YP0eMz/jh6DgsqPckE3QtSlFEoIxUjzY/tyEIoyOgIx0fA8abN
	 BAypkDiIY6HFcRnkB6LvfCs1ETF52wI4Gz7UMCFMGT1HwxkfUH3cSR95nHZlGuoEoY
	 vIA8a00voex5GZ+fMz2GSIgcIGw2KvCa1bUzargaYtd0r32p9E7ObgnT3ZLBhTpHPN
	 AhC1lUWbG2t6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/16] ASoC: codecs: tx-macro: Fix for KASAN:
 slab-out-of-bounds
Date: Wed, 22 Mar 2023 16:01:06 -0400
Message-Id: <20230322200121.1997157-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322200121.1997157-1-sashal@kernel.org>
References: <20230322200121.1997157-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GL7QDVGPUOH3SNI7ZHMDJYILJB4II5KW
X-Message-ID-Hash: GL7QDVGPUOH3SNI7ZHMDJYILJB4II5KW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GL7QDVGPUOH3SNI7ZHMDJYILJB4II5KW/>
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
index 2b7ba78551fab..35d148e60c334 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -239,7 +239,7 @@ enum {
 
 struct tx_mute_work {
 	struct tx_macro *tx;
-	u32 decimator;
+	u8 decimator;
 	struct delayed_work dwork;
 };
 
@@ -632,7 +632,7 @@ static int tx_macro_mclk_enable(struct tx_macro *tx,
 	return 0;
 }
 
-static bool is_amic_enabled(struct snd_soc_component *component, int decimator)
+static bool is_amic_enabled(struct snd_soc_component *component, u8 decimator)
 {
 	u16 adc_mux_reg, adc_reg, adc_n;
 
@@ -843,7 +843,7 @@ static int tx_macro_enable_dec(struct snd_soc_dapm_widget *w,
 			       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	unsigned int decimator;
+	u8 decimator;
 	u16 tx_vol_ctl_reg, dec_cfg_reg, hpf_gate_reg, tx_gain_ctl_reg;
 	u8 hpf_cut_off_freq;
 	int hpf_delay = TX_MACRO_DMIC_HPF_DELAY_MS;
@@ -1058,7 +1058,8 @@ static int tx_macro_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	u32 decimator, sample_rate;
+	u32 sample_rate;
+	u8 decimator;
 	int tx_fs_rate;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
@@ -1122,7 +1123,7 @@ static int tx_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
-	u16 decimator;
+	u8 decimator;
 
 	decimator = tx->active_decimator[dai->id];
 
-- 
2.39.2

