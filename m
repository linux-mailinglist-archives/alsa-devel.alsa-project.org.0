Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7535D728AF8
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 00:12:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0532E1D7;
	Fri,  9 Jun 2023 00:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0532E1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686262340;
	bh=MDBZeXdHxayRyS4HwOUAnoANgtBHjjiq1WAz2EToM+0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mUxdHqAY4TOvki9zPFSDrYsHQtMlXKLTmhASU2F6Xr/RFAY9+H0F7aApNCGq61nm7
	 XHhazuMEccvdctA+Ga5MtZ406inmSsbrlZOCGE+Kp9ii9P4XEjvpbvPp/yDXx9kZBi
	 JPoONr9Tp7MG78+OFqgHBcP6p7Xb4GVqkYgZfllg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB8DF80199; Fri,  9 Jun 2023 00:11:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0F5F8016C;
	Fri,  9 Jun 2023 00:11:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE3CF80199; Fri,  9 Jun 2023 00:11:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FDA9F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 00:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDA9F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=WqhUYjWm
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCF7B6606F23;
	Thu,  8 Jun 2023 23:11:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686262272;
	bh=MDBZeXdHxayRyS4HwOUAnoANgtBHjjiq1WAz2EToM+0=;
	h=From:To:Cc:Subject:Date:From;
	b=WqhUYjWmCpd1dCEdct42PjQYQdjK/MTgTVFEqw9GlBGiPRn69tuZjalqGNMKov9gv
	 xkEpE6yHOhOsmawys7tpxQNCy+uv18DLMQEy3EEsv99xR1zSvHPrnBvNu65h2v0b6W
	 QSOQldd85Cep/F0wHfsRBlVnOIPkpJ7rObmGd3AblG5zOicd2Y8PFGQ7Nj/1W989Fj
	 FjwfmDKR9ENXLfkuf9eTbjoNC6uHIjCfgvyCgoUh7t4JveaNegr4Q6/VZgfUG8yvpH
	 r254Pw2exOXCdDGAyBsPAHo1zia+8AC8i/DlkBldMRds9F4VdDNE9i9VJElrX86lY7
	 tvf0pouue6NdQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "ASoC: mediatek: mt8192-mt6359: Remove " Jack" from
 Headphone pin name"
Date: Thu,  8 Jun 2023 18:10:48 -0400
Message-ID: <20230608221050.217968-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EQCS7LJV3BXN2IQQOMGLWPXZSNHZWAPW
X-Message-ID-Hash: EQCS7LJV3BXN2IQQOMGLWPXZSNHZWAPW
X-MailFrom: nfraprado@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQCS7LJV3BXN2IQQOMGLWPXZSNHZWAPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit cbbc0ec6dea09c815f1d1ef0abaf3f2ec89ff11f. That
commit removed the " Jack" suffix with the reasoning that it is
automatically added to the name of the kcontrol created, which is true,
but this name is also used to look for the DAPM widget that will be
toggled when the jack status is updated. Since the widget is still
called "Headphone Jack" the jack can't link to the widget and the
following error is shown:

mt8192_mt6359 sound: ASoC: DAPM unknown pin Headphone

It is not possible to also rename the headphone DAPM widget because its
name is used by a switch kcontrol, "Headphone Jack Switch", both to link
to the headphone widget and to assemble its name. This switch's name is
referenced in the upstream UCM file, so renaming it would break
userspace. Since the original commit didn't bring any benefit, besides
sparing a few CPU cycles, simply revert it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 4e0d5bf12b47..5e163e23a207 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -46,7 +46,7 @@ struct mt8192_mt6359_priv {
 /* Headset jack detection DAPM pins */
 static struct snd_soc_jack_pin mt8192_jack_pins[] = {
 	{
-		.pin = "Headphone",
+		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
 	},
 	{
-- 
2.41.0

