Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 912924E77B8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:34:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C7E416C2;
	Fri, 25 Mar 2022 16:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C7E416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222457;
	bh=kp1/WrInRghrNEKOwLYg4Ose32CgpVXaqmLFkunHM6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvDiX+pdqBsVAIFs/c4afwwaI608F+yg0VdYw9BWD/WdlGyGmlYSDMj7l9iK0Qci/
	 J6+bVysk28wvzx0DyqxLBxhDgjd5vwW6ovdPwSA6sx+stlJTaY8CiOkz4dFyevvUpT
	 SAXLoqWmaRzlaIUgpqA9+UHaedGZ9TmvXwMGdY30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B14F80212;
	Fri, 25 Mar 2022 16:33:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74143F80212; Fri, 25 Mar 2022 16:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E193FF80115
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E193FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X+ltaJMb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22951616B2;
 Fri, 25 Mar 2022 15:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74813C340F4;
 Fri, 25 Mar 2022 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222384;
 bh=kp1/WrInRghrNEKOwLYg4Ose32CgpVXaqmLFkunHM6Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+ltaJMb2cQTcVo0oCuA2zcuIarzYDRsdSzxLAalFV/hHPJzQGoWx9gtTffJ8vthz
 M1dJ3JjOZzrACoErouuDlXLdpllGnDpUZrYjn/BKo5j8+7jVYNzRIIhZFBKTPJyOIv
 YyuUxNL1yzaF5DHMGCJimNHLuST2Myzod13bS5GGmk8ce14R4+Y+NwtW01B7wwxPHt
 9VcjjW90j/okeJ6n7RFosg95ITLYteoWJD9ugfoxKSrgD+h6B57hlBkZuNZHjQ0Tls
 ffsgqKVEEcvPlN7AHMtOmAULbarfraajI6MKBb2i0AULZRxJ/3A2ez7XYGEZyh4i4o
 dLqdlpf6krZeQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 1/7] ASoC: wm8731: Update to modern DAI terminology
Date: Fri, 25 Mar 2022 15:31:15 +0000
Message-Id: <20220325153121.1598494-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=966; h=from:subject;
 bh=kp1/WrInRghrNEKOwLYg4Ose32CgpVXaqmLFkunHM6Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBE602cFlW45NJSaUYpIMeJgYKnkN2Ni0O1lw7d
 57mXm16JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gRAAKCRAk1otyXVSH0OIAB/
 9OfNZCfc0Sh465QnqFKzfMScS1TjkHbg+aSQndP7yZsNpZeUCG2sOmoZRQ9h2pzMfsjE3/8SHFw3MC
 uXpb7Xf/lMyhKCF19Sk107colyAdAnCSYoJk5bbhsdB9WVW245NhRxP7+Bu5nBbN9AC97kWSj6KlKJ
 EdA1PvBX+IGBjC8HxkrlFw/n03pMGb8M5rjI4f6lRjHDm6DVljBP5JAndef/c6379zwtrQZjXVOfcm
 ayVDLDRg+dvqd4ZByjQxuqMFWje5mmfYJ0Y/M4RXPw804z/f3Lw2Pi/Je8d1sZEEhw5kzRBm+jhC3Y
 ya2qPQfgC34SEGR3ZsD3r/81oQgY+1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

As part of retiring the old defines used to specify DAI formats update the
wm8731 driver to use the modern names.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 5d4949c2ec9b..5b399c631faf 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -429,12 +429,11 @@ static int wm8731_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	struct snd_soc_component *component = codec_dai->component;
 	u16 iface = 0;
 
-	/* set master/slave audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface |= 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.30.2

