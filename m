Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEFD71824E
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 15:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B75F206;
	Wed, 31 May 2023 15:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B75F206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685540512;
	bh=ZxstVsALKprh5w2ZGfhTBQt6300rXrxJFsUl1z+X+t4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bcpv0qX+QL3IBEVlHRdXCTVj1gytvBK/62E9lyIybhA+wtDSVRD7rM6gInMFmHwkO
	 1ugzIzIj8CP85dZ+IszQ9cJ7YrJRfzgDQ9q6jvk3PI6mcnO9nPB2CwNlsfUYH96Ubv
	 ZRJ3XT6IYA1LomBOzOk855JkwpkPAxaRjmE+ECaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3DBAF80086; Wed, 31 May 2023 15:41:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E453F8042F;
	Wed, 31 May 2023 15:41:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C44F3F8042F; Wed, 31 May 2023 15:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C50DDF80086
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 15:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C50DDF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JpaC2eqQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0331D63B0E;
	Wed, 31 May 2023 13:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB21C433EF;
	Wed, 31 May 2023 13:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540445;
	bh=ZxstVsALKprh5w2ZGfhTBQt6300rXrxJFsUl1z+X+t4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JpaC2eqQdK8XRnprSVan9J6BIxq7UifXGQadxs6IhNErrSDUk8N1Lq8MkPLNR00ud
	 n/KKiglP12sjP1ImCUAVTXAvnzYZ30UiBpIDRrLiOELLtRUIOrSQcozoVoQR79vJD2
	 BBeJcz6THM/T9dauHqqwnxNuSlrUjgeZkE/6cadGXeWGMCA0vvfFZV7W/bARKH7S+B
	 6lrBfVya/dEQNGVJuqaToYpLyjLSgHofzIlAXeDGcG9eJqjlOYWytEtWd7lqeQ71/H
	 CJp/GD/uZrUvGy1QHG2bB8aFoKWapTTJ6z6L4pjSHPFJU8XUfk4QDZC/AIjPMEdksx
	 q/FZ0OB/YnEmw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 15/37] ASoC: lpass: Fix for KASAN use_after_free
 out of bounds
Date: Wed, 31 May 2023 09:39:57 -0400
Message-Id: <20230531134020.3383253-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134020.3383253-1-sashal@kernel.org>
References: <20230531134020.3383253-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S5M6CZGC3PXOF4EEXMTDE77JFDHFVCQC
X-Message-ID-Hash: S5M6CZGC3PXOF4EEXMTDE77JFDHFVCQC
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5M6CZGC3PXOF4EEXMTDE77JFDHFVCQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>

[ Upstream commit 75e5fab7db0cecb6e16b22c34608f0b40a4c7cd1 ]

When we run syzkaller we get below Out of Bounds error.

"KASAN: slab-out-of-bounds Read in regcache_flat_read"

Below is the backtrace of the issue:

BUG: KASAN: slab-out-of-bounds in regcache_flat_read+0x10c/0x110
Read of size 4 at addr ffffff8088fbf714 by task syz-executor.4/14144
CPU: 6 PID: 14144 Comm: syz-executor.4 Tainted: G        W
Hardware name: Qualcomm Technologies, Inc. sc7280 CRD platform (rev5+) (DT)
Call trace:
dump_backtrace+0x0/0x4ec
show_stack+0x34/0x50
dump_stack_lvl+0xdc/0x11c
print_address_description+0x30/0x2d8
kasan_report+0x178/0x1e4
__asan_report_load4_noabort+0x44/0x50
regcache_flat_read+0x10c/0x110
regcache_read+0xf8/0x5a0
_regmap_read+0x45c/0x86c
_regmap_update_bits+0x128/0x290
regmap_update_bits_base+0xc0/0x15c
snd_soc_component_update_bits+0xa8/0x22c
snd_soc_component_write_field+0x68/0xd4
tx_macro_put_dec_enum+0x1d0/0x268
snd_ctl_elem_write+0x288/0x474

By Error checking and checking valid values issue gets rectifies.

Signed-off-by: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com
Link: https://lore.kernel.org/r/20230511112532.16106-1-quic_visr@quicinc.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 589c490a8c487..88d8fa58ec1eb 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -746,6 +746,8 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
 
 	val = ucontrol->value.enumerated.item[0];
+	if (val >= e->items)
+		return -EINVAL;
 
 	switch (e->reg) {
 	case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
@@ -772,6 +774,9 @@ static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
 	case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
 		mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
 		break;
+	default:
+		dev_err(component->dev, "Error in configuration!!\n");
+		return -EINVAL;
 	}
 
 	if (val != 0) {
-- 
2.39.2

