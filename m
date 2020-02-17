Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F30D160B09
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:48:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1933167B;
	Mon, 17 Feb 2020 07:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1933167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922085;
	bh=TfaH9ZN9WZJFdxVtjJ00fu/TOJe80UAXYmZ2svkopyo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBVP0VATSLe+Vz4pt38d0xK2uWMtCfv0I7htHlP0dL4UgjICh/roOL7jbh7LCl/Y9
	 KwVLZ0RBlJNIyNP7A0lntQWSDwbsfUtuE4IX4rW3mtOAV+7YBzam+UOujmdFqHiJFV
	 BMiF83amW3GIC2n9zyujW8gyAbP5UL5IR4wXaEWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E66F80247;
	Mon, 17 Feb 2020 07:43:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044E1F8015E; Mon, 17 Feb 2020 07:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B148F80214
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B148F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="R1ADsWhQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="neEzQIWl"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 03161537E;
 Mon, 17 Feb 2020 01:42:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ijuXwZjdCzjoi
 Fk9M3o3Cb+h29NCqVUZXZzHgJRRplI=; b=R1ADsWhQSyvgkOpaH6PvX4LLq1DID
 +1PkIe0ueIMnb3e90XX+Bit989ONf5kAfy2rZM1n9jgXTtShfJlJIqAlrOSmcBZa
 B0NlnVDnbJrMyOyxQpfy02EiR9RfoNSpAqdlLaKrBFQIVS2dccEvYrampTn7Eu0T
 iTExLYS9s8XD+2DlOseKyH88JTiF1HqY+FSz2z4oXLfWJlFGc+Jor0sH5TzT8dpD
 hqLsck7pkN/9F8+OzNMne8ENI1Dz76azTUzFDY+5rCQU0DpI+78CwFm05cviAQYC
 FcfmC87DUEf2mkYnxrgu5zUH7YZDUz/qC04yo8kdwBq7PFk8vc83qpMrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ijuXwZjdCzjoiFk9M3o3Cb+h29NCqVUZXZzHgJRRplI=; b=neEzQIWl
 k4Mg6iMdCoHf7G1RfJWzmx/0WzH83GV5Ju9RATO830ZcWUsxlzNNWicFMBU9McUF
 9nd8SnpETMNSiukTKsZ8vakHBJk9Fqq8eewmsXdFRwoZvO2SbPcHtHak1tDqfwHj
 Ezj/1jf+J+ltApuI7Af5gdNICv5XXWXRPz1zxQhN76/ILHwgqnDcHJ+2Ne75AXVX
 yNPMgOm6UVTOauRmj9PZjci7iY+V4E61lIp7MciQQmxLxMXaCCDwYIDWX5py4+9T
 6dl39EDu5IF8BisxSof1soTMZ+fnKrD7M6ZrTxR6MNL9fKpVJJFUIoMSKk6IK8Ji
 EJUjJbjkHSbVaA==
X-ME-Sender: <xms:7jVKXlmRp5Uf3RuNr1-4QXcvEK_bezmmR3yp72lstXZ8yZ4_ookf6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7jVKXlHOHxKFP15X0p2WKTfP6GOwFJcwN12RFRFhCkjRCGNwnPX4wg>
 <xmx:7jVKXmqLPn0UUoVUmBYI8PAqid45svTo1S5EZW_KPZidYd3e4CKCXQ>
 <xmx:7jVKXp6hmQWLSvF1VCE-qum6q2jW0fGg6SPloV6zPsSLZaGOHk-U7Q>
 <xmx:7jVKXpP25F-DM9SwlLus5_SMjNfQK4RjdAtq50wP7jtXtW4aMt94pw>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B37A328005D;
 Mon, 17 Feb 2020 01:42:54 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:22 -0600
Message-Id: <20200217064250.15516-7-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [RFC PATCH 06/34] ASoC: sun8i-codec: Fix setting DAI
	data format
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use the correct mask for this two-bit field. This fixes setting the DAI
data format to RIGHT_J or DSP_A.

Cc: stable@kernel.org
Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 32b7410540c6..cb3867644363 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -81,6 +81,7 @@
 
 #define SUN8I_SYS_SR_CTRL_AIF1_FS_MASK		GENMASK(15, 12)
 #define SUN8I_SYS_SR_CTRL_AIF2_FS_MASK		GENMASK(11, 8)
+#define SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK	GENMASK(3, 2)
 #define SUN8I_AIF1CLK_CTRL_AIF1_WORD_SIZ_MASK	GENMASK(5, 4)
 #define SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV_MASK	GENMASK(8, 6)
 #define SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK	GENMASK(12, 9)
@@ -242,7 +243,7 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
-			   BIT(SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT),
+			   SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT_MASK,
 			   value << SUN8I_AIF1CLK_CTRL_AIF1_DATA_FMT);
 
 	return 0;
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
