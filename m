Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDAB2A8E3C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 05:18:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23E6822;
	Fri,  6 Nov 2020 05:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23E6822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604636319;
	bh=feS5rOxy7ZnXxOFu3lJ26cZI40qIWl0W+MPjSJT6Rdo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2Ec+/jZBYk9OVKrln26TxrjnmygU/BWwxD6VljMl/6vmh4mFwFB98Dwz20QLwQ+i
	 gc2wNJoJSXz50DfFIKQBlfX/P3i9Y/AXV3cNowDjB/5uS3eaVkiAXfUyqrM2RLVW24
	 HysLl8D4nA8piG+EUrHm7jBuLT00BZfdHLhaQIPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE687F804E1;
	Fri,  6 Nov 2020 05:15:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7766EF800BA; Fri,  6 Nov 2020 05:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DA5BF800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 05:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA5BF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="qP3Y7zh0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="L6eMSLRs"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4AD0558054B;
 Thu,  5 Nov 2020 23:15:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 05 Nov 2020 23:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fM+mBIXLYcK3O
 mS1n9AWddTUKsKTi5ZEVIA4pgh+LXo=; b=qP3Y7zh0nuyqmDe2Zmj0O2CARqUzr
 b5necBApgGlt3XJEx8sOppxkmVH6WHv9YKvcFx72IMoF4xXX9MjhB2dSD5eyOPrC
 91urB2kA9sMtBhmI1WbiaAYeWzr2gBBXDenjS3+kh79Vvx8WB48yvoSGUokT5bVH
 Nm8RfYYSUjiXXlEFzMlZomCiiOim3vweKWg8TONRzeO+F28/CX1RZwKepwif7B/k
 DAYzqInnAiOJE0KcsUDDhyXnjNVtli18G3cjZYNxZM3ZOWxt2SGsXjaVA/uqPsBq
 XFxAyGQRRTVA/lH6/UfwdkHmMSla24T8T9LLqbc18eBN9tIA0M1RZCscQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fM+mBIXLYcK3OmS1n9AWddTUKsKTi5ZEVIA4pgh+LXo=; b=L6eMSLRs
 wgjhVdUGJjWzbu1S/k0P+OasGaua9Rg7Vmww0ZnmML7PT3aJg6KcccEb90rpCWky
 z/fa/AQW4snqs10I4CUVYQt8TKmCe1sFaA2U3cYAytIWfsBjXSnpz/o/Yf/jWV9j
 5HncSId2x5BK0L/ROvME9hQqBF5gDF2k9N5Inf0sErRepkqLW0GKeM++/7HTk93j
 6cVllQwl1eMHNNuXOFDow2ajRiXvW/N+JofygYt9ZllvWat5oxKsW9JlDoaVtKNu
 e46MonYQN+kdbDtxafoCWrgUWqcDlLZaW9rnHbxpluW8ChDSd2+BX1PE+Eyxua5X
 jb2/7CdTRkbAJg==
X-ME-Sender: <xms:0s2kX5VE5Our2X_bgrzvAu4m8yxvMweaWLiXr_TUtmR0Lte2mJh4_Q>
 <xme:0s2kX5ktIT3Mnd4cwnio9Yf3kL2MdLUvkUdvHapGESjr_rcnTQUq_be6HScVzkipR
 aVolwi5DWDg0mXvUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:0s2kX1Y4hITkQLECWWP4VitUCx0NeUxTRzyPes9u4H0uOWPNgVo0JQ>
 <xmx:0s2kX8WsFP9waegg5_yVvcJJnmFMUjD6NEmSPnzfGfTnELlDJq_EOA>
 <xmx:0s2kXzlS5oZDZZ538XMargNqpCpIWwsDIjS8RILFhuDNOuuB93b6IQ>
 <xmx:082kX8iI8jM7-yVPGVLbJS5AuiR3fhjWC7IkW2ZeJMmAVq_WWZx1uA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21F333060060;
 Thu,  5 Nov 2020 23:15:14 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/7] ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells
Date: Thu,  5 Nov 2020 22:15:07 -0600
Message-Id: <20201106041513.38481-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106041513.38481-1-samuel@sholland.org>
References: <20201106041513.38481-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Increase sound-dai-cells to 1 to allow using the DAIs in the codec
corresponding to AIF2 and AIF3.

The generic ASoC OF code supports a #sound-dai-cells value of 0 or 1
with no impact to the driver, so this is a backward-compatible change.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 67405e6d8168..1a2590f54b9b 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   "#sound-dai-cells":
-    const: 0
+    const: 1
 
   compatible:
     oneOf:
-- 
2.26.2

