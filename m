Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 103E4611C04
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 22:58:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0A7D950;
	Fri, 28 Oct 2022 22:57:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0A7D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666990703;
	bh=k0ciXJ9TnsI96EclJ+3I0qJrPTH22yg0wvdKWox0Yts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ewEzEfm8Tznv7FmdGMGlbEG+pRmmUsfVDHEG6eA+wT2x+3KiogktsQIHA/NEEECcj
	 8Zw97ehShlSDQejnzrQo6vK4hVL4Fwdkw1dFxix/ZQjpYKi/n5NIhEpVjks+sae0fM
	 CQq7wce6MZLIzsytzSzq4c15QEJhWcN/PPj4mReY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3340CF80568;
	Fri, 28 Oct 2022 22:56:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E276FF80563; Fri, 28 Oct 2022 22:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E7E6F8024C
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 22:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E7E6F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Dr/5K/hx"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CD1676602943;
 Fri, 28 Oct 2022 21:55:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666990559;
 bh=k0ciXJ9TnsI96EclJ+3I0qJrPTH22yg0wvdKWox0Yts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dr/5K/hxbGJrVT4XPuyjGzz/3Uum/9Fd9mrf8EQhK/6ZcWFGej3jAAgOHmJK//bUU
 TQ5J3NxsnHW67K1TKUI6HCXxr6VYdZNYNkXy6U3Mi7Q2Or18yPfN+v1v5XDd6c5lt1
 QwaBjBwtRR4uwm9gcArc0HucMg1BUNbGteR9UQEtJzbgGpk1P+dMokd3vbreQuEZ6u
 ceUiW+a+fnsAAT+As/738oHDRssJPvywt3jXdgwz+vNUYCQkAdrUG9p49oIXFdM8MR
 P++AX6xwtUG1mvI5Ro4y/msZiEOpqecj3RnAKuER9ICKw2cU0wjSEbrRiXLioin/47
 3BIwOoyt9X33g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Date: Fri, 28 Oct 2022 16:55:38 -0400
Message-Id: <20221028205540.3197304-7-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028205540.3197304-1-nfraprado@collabora.com>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

Add support for the dbvdd and ldo1-in supplies.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/codecs/rt5682.c | 2 ++
 sound/soc/codecs/rt5682.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 2df95e792900..f0a400285dcf 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -35,6 +35,8 @@ const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
 	"AVDD",
 	"MICVDD",
 	"VBAT",
+	"dbvdd",
+	"ldo1-in",
 };
 EXPORT_SYMBOL_GPL(rt5682_supply_names);
 
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 52ff0d9c36c5..d568c6993c33 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1424,7 +1424,7 @@ enum {
 	RT5682_CLK_SEL_I2S2_ASRC,
 };
 
-#define RT5682_NUM_SUPPLIES 3
+#define RT5682_NUM_SUPPLIES 5
 
 struct rt5682_priv {
 	struct snd_soc_component *component;
-- 
2.38.1

