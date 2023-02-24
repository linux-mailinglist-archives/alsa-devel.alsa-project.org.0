Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01866A1D44
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 15:10:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E489206;
	Fri, 24 Feb 2023 15:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E489206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677247815;
	bh=tJW69WWMKlprOa5Xp3MSQu9gJosO9MCtIHdxPOTSeTM=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OCBholxkjgXMHVS8Oq0aZKfRaodlvxqsCxa1V+npJBBxYrlT4ouEJaMc3u6JiQEz0
	 FJsSo6fKY47uDRoJg/JsL1h4WZ/gbXklXSVpOkmCejdOToVyqdKWEKvdtmqK80KhdF
	 eI8lj+Fcfdh1fXziMKC2s1Q/rRl1jSMkw+IAoMqQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65071F80557;
	Fri, 24 Feb 2023 15:08:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BD12F80542; Fri, 24 Feb 2023 15:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9B2AF80116
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 15:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B2AF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=exI1HPiq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88A2B618E8;
	Fri, 24 Feb 2023 14:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2061C4339C;
	Fri, 24 Feb 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247665;
	bh=tJW69WWMKlprOa5Xp3MSQu9gJosO9MCtIHdxPOTSeTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=exI1HPiqonADtQ3JbWxYrA0MvmrGUJ5sDDyhhgai0FWcxboCZRDuUIN9TGWCn8104
	 qHhSyUlgIZ5Oj3w6WRbc0L7gbUXFwRUemlpsSKCMj+W/i0+/Xew9NlBvV2FhT32G7G
	 bVSBawb2n7XVXx01Pnun+OBBDIFvTcYq+Y4DyHwDDTh651L6T6s3FjaFUWvxHGAyZm
	 QZXSbIcms4hzEkVPkuYb3Fk7EJoeNHlql3GBQCK7CnwVOjMR6dL6s6ZOb3hsKvG426
	 dPuzGVEYhgx+fVPBl00LjM7RGxPcjNwRVNeRZUS5IrE8uckiZrDjYMpXfd0JxgUtI7
	 oBdQkL2SN6uiw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:58 +0000
Subject: [PATCH 4/4] ASoC: mt8192: Fix range for sidetone positive gain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tJW69WWMKlprOa5Xp3MSQu9gJosO9MCtIHdxPOTSeTM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSj76AsGbh8BaFvHgyLdCRoaexzbW9BgLDoOgOC
 J6TdUxqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEowAKCRAk1otyXVSH0EaCB/
 9Hy8hUSJ7pct+oUw+uwv5aFtd39IiXzilcaerZgNl786hX0BWJ6gN4wMCsKSctPepdVVMzytQkF9cu
 gs5Rw3oo8vWL3QcSNuF/4kP/E1edK/fCedSR80cTmL9cxDyXXO+P8pbNcRMVeKsflgIUCNky5hlNzH
 vxcEJeKM3g9AP7axDa0k+dQGySwQZkE6SK6dFfoh0Bt2X9PgXB9HO6yul6rgkqC1sz8LmD/jAi1Rik
 ymG5hWRm1oOZ1/jcZT90v2D8WH7+5LeH+yhqlEjVKEOXE5Zs2M6bZs+6RuVOiX+q5gN9Mz+L+3+pCn
 1t2qHuh3soPr5qc6RDZ9JcSi6cwmvQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: H5VPWVFSZS3TPWOKVO2AOSMUIC6ZK4VC
X-Message-ID-Hash: H5VPWVFSZS3TPWOKVO2AOSMUIC6ZK4VC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5VPWVFSZS3TPWOKVO2AOSMUIC6ZK4VC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Sidetone_Positive_Gain_dB control reports a range of 0..100 as valid
but the put() function rejects anything larger than 24. Fix this.

There are numerous other problems with this control, the name is very non
idiomatic and it should be a TLV, but it's ABI so probably we should leave
those alone.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index a02a297c0450..4919535e2759 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -670,7 +670,7 @@ static int mt8192_adda6_only_set(struct snd_kcontrol *kcontrol,
 static const struct snd_kcontrol_new mtk_adda_controls[] = {
 	SOC_SINGLE("Sidetone_Gain", AFE_SIDETONE_GAIN,
 		   SIDE_TONE_GAIN_SFT, SIDE_TONE_GAIN_MASK, 0),
-	SOC_SINGLE_EXT("Sidetone_Positive_Gain_dB", SND_SOC_NOPM, 0, 100, 0,
+	SOC_SINGLE_EXT("Sidetone_Positive_Gain_dB", SND_SOC_NOPM, 0, 24, 0,
 		       stf_positive_gain_get, stf_positive_gain_set),
 	SOC_SINGLE("ADDA_DL_GAIN", AFE_ADDA_DL_SRC2_CON1,
 		   DL_2_GAIN_CTL_PRE_SFT, DL_2_GAIN_CTL_PRE_MASK, 0),

-- 
2.30.2

