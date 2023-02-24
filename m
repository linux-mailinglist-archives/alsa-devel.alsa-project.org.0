Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96746A1D3E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 15:09:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C3E832;
	Fri, 24 Feb 2023 15:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C3E832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677247771;
	bh=Oq2cgGTNFolGMp2hlVeWgvvLAmgRBdfsEVQSk6MsZsY=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HNHMDQdsGTDbCoqSAIEWPe0yfuUmSAB45jPc+ChqWeslvFwVuuNFEq5BlFjzN7srw
	 3aG2HtN22bQiRhfUR+jz6VqqYTXfcWlaxqBxg/UMXiUBEssRLBriFoV9qoLGCzsX2A
	 DIwDLdyb9XcJ42QYezhkGEA0xk4YTc/4ctpiIyL0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D2EF8053D;
	Fri, 24 Feb 2023 15:07:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08756F80527; Fri, 24 Feb 2023 15:07:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AB6CF80125
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 15:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AB6CF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uKKPbBrV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B42F2B81BEE;
	Fri, 24 Feb 2023 14:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4736AC433D2;
	Fri, 24 Feb 2023 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247662;
	bh=Oq2cgGTNFolGMp2hlVeWgvvLAmgRBdfsEVQSk6MsZsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uKKPbBrVYPXVtVtVuluQ0hZNDzeo41eFFiaJBZlmJc0FJjaH5Mrk83kF1sYILsIbw
	 1n03r2XCb1ES0nFnDrMH7Lv0rlDun+8sy9T3o+oJnFzJXNl36xzzZwjp1NWWV42+Gn
	 TTxeMwvLe23VtiqM2ydtEazfr3UbzOB4qYLxYUxo5S9nDBEUHtEiY259LNGL4Pixnf
	 BRJ9aUj4dKoGSGZzt5s1qHoavhf15xRRGNKbH1Np+Jo45pMHXFNsEqiSUQs/HQ9GZG
	 bwyCevc5py6Ezl7afx4i97+D6NZ4nZAkouQM5rvGSFNFQv9lcoFw5rTfnr7WWJIb8J
	 AoEF5mr50w6hA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:57 +0000
Subject: [PATCH 3/4] ASoC: mt8192: Report an error if when an invalid
 sidetone gain is written
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=729; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Oq2cgGTNFolGMp2hlVeWgvvLAmgRBdfsEVQSk6MsZsY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSiKI/9K+DYjuaCW6GBP9SMdFxb8sNVK2hWQSGR
 k0Ewe1eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEogAKCRAk1otyXVSH0KVdB/
 sHYybcK4VnCEic3yC/2mq3YLv2JzZZtTdDOrDDzw1GALc/ous7F1BMbn4ZjyfaFgQrkmagi+4gmNmA
 burLXblBiKahWsvJsLmUjtZx7SMrkZgvon5LWoX7U4aFw6NewfZdKnyaGE8dn/0yO5wmoV16UmlI7Y
 jWlfvomJnD5oombhkBTGCqZmH3Gbgf2ILKZ918qUxPlzYnj/EWMaoqoEryj4usxbo7nHRxacdcjpDh
 3fWFVmC7mUQ/RI4hVKSRaYmIaA1Gyah+ink0ob8Yosc4fIKT9YV6WJxGghrYft6TeGK55u/1PKvbYa
 SgOkeN91Mr5CQ1HwDbxsR3G32zJLGq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: IKNJ2BUGFZUOBHYGLFF5UDXCGMBGPMPD
X-Message-ID-Hash: IKNJ2BUGFZUOBHYGLFF5UDXCGMBGPMPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKNJ2BUGFZUOBHYGLFF5UDXCGMBGPMPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reporting an error on invalid values is optional but helpful to userspace
so do so.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index a33d1ce33349..a02a297c0450 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -601,6 +601,8 @@ static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 					 POSITIVE_GAIN_MASK_SFT,
 					 (gain_db / 6) << POSITIVE_GAIN_SFT,
 					 &change);
+	} else {
+		return -EINVAL;
 	}
 
 	return change;

-- 
2.30.2

