Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5E4389BE
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 17:19:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197CD1663;
	Sun, 24 Oct 2021 17:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197CD1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635088757;
	bh=3P16SzDCZ5uGsdIrnV0b03bXx/UN7wtQestfP3x5CJs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NJmY69rj3V9wvtLKPL/TsCHLZTnfGkUOnK6lweDMj8/H2X3QfNaG8m+jtaqIo+pTm
	 KaEH+9opWFonpDk/u3YO0tCPPPuZECrqmXpVMvCqWK5yE+ee7xHYiQw6uxG4TC5VgO
	 2G9dZpZTqKXYVyRqmQW2zatwIBWbLp2LpA5N6CSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A700F802E7;
	Sun, 24 Oct 2021 17:18:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01029F802C8; Sun, 24 Oct 2021 17:17:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98AACF80166
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 17:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98AACF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="QvWbbBuc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=Wx0knZzTTV3Xd6oi7w1NDuFxpSk5IUn+b6TO2aUcEUY=; b=Qv
 WbbBuc/AlP0qdIMpm9MQ0d51msICbWr+GY0F5eGFoA1abcRCPA1BX8wx0ghNXBxErE+TCtNFit/0q
 A5nBohhn0JbEGppLK4DRvrV5zxQ/VQjrSc6vRfxgPNKqVbfgfbAsIWzAl8bVVmf++jInwVYC4+Cex
 DMoXyPr3GbgwgLxEeRX3KliSvRe6N1pI1wmdn1ZXYaVo1aGIG29b+SK+mJ77o/gB1F5qixZ/Fzmn4
 7eXa3VCnWDMBSzPaZSxkFDpTrBog7onaVHZNJNPNjBx/ca6qFFP05Q+nuKatctMJf17DazfBQ0NRo
 T+9wxapJOpb0zhAuMEtypkntlZya5FLA==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mefFn-0005Px-Iz; Sun, 24 Oct 2021 16:17:43 +0100
From: John Keeping <john@metanate.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: doc: update codec example code
Date: Sun, 24 Oct 2021 16:17:31 +0100
Message-Id: <20211024151731.360638-1-john@metanate.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 John Keeping <john@metanate.com>
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

As the codec API has evolved the documentation has not kept up and still
uses old fields that have been removed.  Update the examples to
represent the current API.

Signed-off-by: John Keeping <john@metanate.com>
---
 Documentation/sound/soc/codec.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/soc/codec.rst b/Documentation/sound/soc/codec.rst
index 8a9737eb7597..57df149acafc 100644
--- a/Documentation/sound/soc/codec.rst
+++ b/Documentation/sound/soc/codec.rst
@@ -40,7 +40,7 @@ e.g.
 	.prepare	= wm8731_pcm_prepare,
 	.hw_params	= wm8731_hw_params,
 	.shutdown	= wm8731_shutdown,
-	.digital_mute	= wm8731_mute,
+	.mute_stream	= wm8731_mute,
 	.set_sysclk	= wm8731_set_dai_sysclk,
 	.set_fmt	= wm8731_set_dai_fmt,
   };
@@ -60,7 +60,7 @@ e.g.
 		.rates = WM8731_RATES,
 		.formats = WM8731_FORMATS,},
 	.ops = &wm8731_dai_ops,
-	.symmetric_rates = 1,
+	.symmetric_rate = 1,
   };
 
 
@@ -177,10 +177,10 @@ when the mute is applied or freed.
 i.e.
 ::
 
-  static int wm8974_mute(struct snd_soc_dai *dai, int mute)
+  static int wm8974_mute(struct snd_soc_dai *dai, int mute, int direction)
   {
 	struct snd_soc_component *component = dai->component;
-	u16 mute_reg = snd_soc_component_read32(component, WM8974_DAC) & 0xffbf;
+	u16 mute_reg = snd_soc_component_read(component, WM8974_DAC) & 0xffbf;
 
 	if (mute)
 		snd_soc_component_write(component, WM8974_DAC, mute_reg | 0x40);
-- 
2.33.1

