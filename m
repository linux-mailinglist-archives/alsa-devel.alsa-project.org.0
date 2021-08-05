Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E63E0D85
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 07:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 361A71660;
	Thu,  5 Aug 2021 07:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 361A71660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628140135;
	bh=cEmuE+ZoKp6ltlajP/9Bt0KupOsgSsFaKZKEn61NFwU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sjxq3x6fEcQRLlQHIiViU5pL0SK+do1GW1+nTEN8D9HXk3bOXE9XpGL7yhvhjelDC
	 oUfoe2FPMuTHBg+EEitIhR59kELYkLZAxcXIi1BJsXi7EKC9/oegHpPPiuNPeVHnaB
	 kUAfNrBSBbTuajqljeyYix4ulTP5BYztciX5++lM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF0BDF8032C;
	Thu,  5 Aug 2021 07:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C9AF802E8; Thu,  5 Aug 2021 07:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 158ACF8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 07:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 158ACF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="tRyYKGWj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DCGC7K42"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D76245C00DD;
 Thu,  5 Aug 2021 01:07:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 05 Aug 2021 01:07:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=JbkV0OkjI25/Uw7VNuOjM6Wr15
 +eFNku94LfNLShlFI=; b=tRyYKGWjjfutwG0EWgeN9kznaKc/6mYGNboUYPqziK
 UO7lWCa3CsbslnM4UB6NJ/AqZNPZ7y3YCqQ7N+Oy6smguX7db6W8/HlLz4eyDcEi
 gQeQ3nqpr40SqM7MQVxGDwo0gqZKCNK7X9MaDBtY7VkuLT5EIHIziSwT7LDZ1gu5
 jnd7SBULdo08PYvyzNgAN1St39B88z8HDJ8E1qCc7S86kW9rHCU+adg3tvI29Jm3
 ePnBWdNXpxHCnHEJG5EWt+rUY5GHtfK5WoWDdtxmPodNuLD62ZCW4f1tgD86CA8o
 FsJh5hytQoMNlY7mlNBi05EbrgzUY/HBhOStjM/hoFLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JbkV0OkjI25/Uw7VN
 uOjM6Wr15+eFNku94LfNLShlFI=; b=DCGC7K42wKULXMYV4j86FCHB1c78C01Bz
 bpJs+d2LUJCsIpQUF9b3VY21nucK3y508zsm+KRbvOALj81M0H2bAV6J/m6sMazG
 cOXfaDkn5DeFykCogGPFfi7SEH9zYCM6pO/o4gft2WUEltKQ3NC+TwOVdP76DOqO
 uYD571PhvIJYglB7n5sG2bt64J6q//y3JUiWZtJcNXQ0hEIQGkbUZ+/clYBjTUn8
 mj57G9rZToTSkwD50mEJrhz8dPVSnQr1W4e6PEp5ZeBDbkjmyIJt91D7Ny6dTUtm
 oblfeFf9SmPSONa0TWqkcnNRcYqNJ+rYtcA8hU4VnVVfU/3/QQWyw==
X-ME-Sender: <xms:_HELYUFhRSWvx6IAmVkL9fiUFg2uc9fBYwDdQpfMLFDVQDB3SOf9Ew>
 <xme:_HELYdXqzIGi1uXDyArmf2plstX7BJFR_2Ktr2yTpMX81KwYqrdgVmEHA6JlQ5OMm
 GUP0yF2l2wHcHSVLQ>
X-ME-Received: <xmr:_HELYeKy94g6FSF_GVM7C5RoXE3OfcNO62o-Frbx8hG-NokL6yD3ilb-FPQCKHuQ65kGsiftKPo2QQcvy9Je-cVE8UD79EzVkVS-u_FUVPWdanBtOX-wcISIYGyoJJ4J9ukm_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieekgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrfgrth
 htvghrnhepieetkefhheduudfgledtudefjeejfeegveehkeeufffhhfejkeehiefftdev
 tdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
 grmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:_HELYWGiaQV3Jj5EVUX1jYA7GPWajDC7mIWHadq5U2DToOBBzat8oQ>
 <xmx:_HELYaUNjUGiBESU-pE_JFUGuEk-GZgc89tWa-y9_Q_G3SgK09GRmQ>
 <xmx:_HELYZOpU87xZdlBZ_a6wysxLbAIISxFmlf-wWLH4P3rXRDUVysMDw>
 <xmx:_HELYYxMM-Jg-E3V-iyz33KiWwLbSwE1KERMsggKqEpJ7tvEdF5Zwg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 01:07:07 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: simple-card-utils: Avoid over-allocating DLCs
Date: Thu,  5 Aug 2021 00:07:06 -0500
Message-Id: <20210805050706.46833-1-samuel@sholland.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Samuel Holland <samuel@sholland.org>
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

The allocation of the DAI link components (DLCs) passed the wrong
pointer to sizeof. Since simple_dai_props is much larger than
snd_soc_dai_link_component, there was no out of bounds access, only
wasted memory.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/generic/simple-card-utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 677f7da93b4b..10c63b73900c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -640,8 +640,8 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			cnf_num += li->num[i].codecs;
 	}
 
-	dais = devm_kcalloc(dev, dai_num, sizeof(*dais),      GFP_KERNEL);
-	dlcs = devm_kcalloc(dev, dlc_num, sizeof(*dai_props), GFP_KERNEL);
+	dais = devm_kcalloc(dev, dai_num, sizeof(*dais), GFP_KERNEL);
+	dlcs = devm_kcalloc(dev, dlc_num, sizeof(*dlcs), GFP_KERNEL);
 	if (!dais || !dlcs)
 		return -ENOMEM;
 
-- 
2.31.1

