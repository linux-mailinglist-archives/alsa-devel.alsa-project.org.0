Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96545160B10
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:49:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38EAC4E;
	Mon, 17 Feb 2020 07:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38EAC4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922168;
	bh=UwqcYk+UiujcNm4ICzeqbx7v+6mjc8ywB2Dtgmfruyk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBnBN2TDfQBTsnLcGIo3DNZay5XikiL4vqea5qzCvxuqYW1ep9O+4xqfOmFd4HNRO
	 BAIPNKH9YAKusrd++WOB9UzDSAMnkvvHzmuPFiB4sxgrnA7hHHpFN6VoEgwt4koRR+
	 GC1Yxy8E70D/ImKGncLxffMKdWGJH98m/Ty2/LZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF952F802F8;
	Mon, 17 Feb 2020 07:43:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B95C7F802BE; Mon, 17 Feb 2020 07:43:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27FC1F8025F
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27FC1F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="nQN89O1n"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NWebf0hC"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 58674539F;
 Mon, 17 Feb 2020 01:42:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=if7xr+Sp8ss0f
 9YqwMqw18AX7QTuXK6q1CEVj33p/34=; b=nQN89O1nFLZtQYlqH89I0Kmx5EBrM
 JMjAqr2aBnz9Jw97GauexifTLIRYSYN5hIxTERMKL/QnzrjwN5aKGUtkEqk6vYOi
 OQFo+90INsKRq+6zr0XagjGvUqLrKOQ+ZYJNLFYuw5h6Ru23GFvWhXGMQohg7HFO
 mHUpYtDKm1vwTBT7biF9+Ip7G7q0S47GxfFFRkl8ruwXjvGxDqORdboD5d+P7L7v
 DdyWxwzb0ML3LLFNeU8py2b+wJQiTNxDFhaPQlr/AlgqAuucOWVW95cdkX42zqop
 XKe2THxeuGSxNzUgTDwkJQynH0mG5K1Seqtyi+t/0J+Rm68wEtBQloIbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=if7xr+Sp8ss0f9YqwMqw18AX7QTuXK6q1CEVj33p/34=; b=NWebf0hC
 YRw2t54WE710Iix4f2kX216aODyK7MaXe40G22nwq4NM1S8E83ycvMWxTFOngoJy
 96tGCTRiGTZsHFpu6iAcP6MXTy/Am8MqItLB46CyXmq8KI1YHtFZ8OVwIupjheOA
 RT4VNK1gopc22IkSlHqBZcHKl0EQNEMZcrfnvQBkYdPSxuFQv9UpDPtzrxIJk7vm
 fPiBrvRoofsLEAsnwMHHVqHdz3MiWBpm93ykAsX+BVrF2T5hMr6QnyeTgw3y4oes
 SSKUAVa6PetTsGFM81A/MZloxu0pHtl/jivQVWKA2eYdFJaPJwrP5oWHd+LbzCRs
 d/tC/IzkTI1oHg==
X-ME-Sender: <xms:7jVKXgk9WbQi4qoVVqHJXTPVoZa2Gp-2PbCu8zF1DluYo33TYXt7AQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:7jVKXrwoToJ4ItX6p0QNZsgmwgbQpmAgW0R4SKpsT07CB7_EaExfyQ>
 <xmx:7jVKXhtdweaRWVC5t2ZNqexYIqTV1RF1163UNVD99zGVBrkrcMFUYQ>
 <xmx:7jVKXn-Wrmj-oeXIaSZVXpPjBdgerAzMoQR6JKLSiGDScpYpTQ_iMQ>
 <xmx:7jVKXnNN2Lg85QfQl7EnCuE65MmvuxwZ1WWkfHTJXLne0esz1VcxpA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 935FC328005E;
 Mon, 17 Feb 2020 01:42:53 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:21 -0600
Message-Id: <20200217064250.15516-6-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [RFC PATCH 05/34] ASoC: sun8i-codec: Remove incorrect
	SND_SOC_DAIFMT_DSP_B
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

DSP_A and DSP_B are not interchangeable. The timing used by the codec in
DSP mode is consistent with DSP_A. This is verified with an EG25-G modem
connected to AIF2, as well as by comparing with the BSP driver.

Remove the DSP_B option, as it is not supported by the hardware.

Cc: stable@kernel.org
Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 sound/soc/sunxi/sun8i-codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 33ffbc2be47c..32b7410540c6 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -236,7 +236,6 @@ static int sun8i_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		value = 0x2;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-	case SND_SOC_DAIFMT_DSP_B:
 		value = 0x3;
 		break;
 	default:
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
