Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8A827956
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 21:48:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94ADA3E7;
	Mon,  8 Jan 2024 21:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94ADA3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704746885;
	bh=UQ/Pqq9hCugSxC3Fzh31NRAczf6loqtAEVkRzY9ZrUY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ukSqDJovgb7J9U1CX5rnwqLuT0E/db6kJoclnPbp3SkOvVicLdB8bn9tkr661YurI
	 4bDlNbHnM3IryyEegwI90fSiGndOgtygu20vAAwSzyQT6eZ/X9k8btMO7m2/z/7wT+
	 yq4hVYRWGHHjmZRK+FsBfmcc9eqhU2kWJKVSv888=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B90DF80579; Mon,  8 Jan 2024 21:47:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BBEBF8057B;
	Mon,  8 Jan 2024 21:47:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACEA4F80254; Mon,  8 Jan 2024 21:47:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE6E4F8003A
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 21:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE6E4F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=fu3FyYNg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704746837;
	bh=UQ/Pqq9hCugSxC3Fzh31NRAczf6loqtAEVkRzY9ZrUY=;
	h=From:To:Cc:Subject:Date:From;
	b=fu3FyYNgD+idTI4piSZ17tN+M/ZavzrqZBkRgO1z+9KFmMqXzHO/8MaMHHeKbgKmT
	 FCunKCxfVFTFdoQar8AN/9ZqZr73MNkTPjR4aPHsgoeJMS3NuE0UjmZFmJZh9B/wfm
	 uBEtKjRtItys+DDipV5HuIPi+QxZbVslRP6BrQ25fHTV6u4sqn6rq+CbWBPIPNKJIu
	 Z7TIDqO1NBgHE+VnrVF1jYrZ+UsjsfAxgLF+mpZLRIqqcC8Nrg5QeSBRea5wf5wLY2
	 BeZvGKI5a1tuhoHWLF+B5uVf+5ch4VRy95pl7af70cunodjkUWc85q+yz1zoXVfAPQ
	 RwNDbkGikAX2Q==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 924B33781475;
	Mon,  8 Jan 2024 20:47:12 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado=20via=20Alsa-devel?=
 <alsa-devel@alsa-project.org>,
	Rob Herring <robh@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8192: Check existence of dai_name before
 dereferencing
Date: Mon,  8 Jan 2024 17:44:58 -0300
Message-ID: <20240108204508.691739-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5YBWHRYDRBUM66OTYWJXYXDO6ZUU4SFE
X-Message-ID-Hash: 5YBWHRYDRBUM66OTYWJXYXDO6ZUU4SFE
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YBWHRYDRBUM66OTYWJXYXDO6ZUU4SFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following commit 13f58267cda3 ("ASoC: soc.h: don't create dummy
Component via COMP_DUMMY()"), the dai_name field is only populated for
dummy components after the card is registered. This causes a null
pointer dereference in the mt8192-mt6359 sound card driver's probe
function when searching for a dai_name among all the card's dai links.

Verify that the dai_name is non-null before passing it to strcmp. While
at it, also check that there's at least one codec.

Reported-by: "kernelci.org bot" <bot@kernelci.org>
Closes: https://linux.kernelci.org/test/case/id/6582cd6d992645c680e13478/
Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 5bd6addd1450..bfcb2c486c39 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -1208,7 +1208,8 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			dai_link->ignore = 0;
 		}
 
-		if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
+		if (dai_link->num_codecs && dai_link->codecs[0].dai_name &&
+		    strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
 			dai_link->ops = &mt8192_rt1015_i2s_ops;
 
 		if (!dai_link->platforms->name)
-- 
2.43.0

