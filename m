Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE4154DA8B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 08:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203E81ABB;
	Thu, 16 Jun 2022 08:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203E81ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655360829;
	bh=xRz6qUFAhZ4KVNFOXRrGzfgAu/EcgeQSazWeOW2XCys=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P0tXoq+EOZms/JB7wiXTToVQ1b9CC9I9vSvHpBTnt47dR6Tgi3QMxhYJqHHtYmKbH
	 URCjibv82liQnYycEZZot7WhZIjy7Vrd061NAc9D7mPispFp0DCNJnPWpBsLYu2fC0
	 fe/uYpqESeUXU+qqz+Wrq402enhVL9MKQnRvwaZs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F2AF80423;
	Thu, 16 Jun 2022 08:26:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 694F4F800F0; Thu, 16 Jun 2022 08:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67455F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67455F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="oRV5c0++"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="a54JFqrc"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DAB7C3200B2F;
 Thu, 16 Jun 2022 02:25:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 16 Jun 2022 02:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1655360756; x=1655447156; bh=Xnp4ckN+cZwV9xzQVgATT4HTL
 TgBz5AgEV9Xzx+z6Ck=; b=oRV5c0++bKiskbBAezs67H9yvAo3oy3HW2fTHP/zr
 SMiLE/o+Ota/gXm+vI18sC51q2Pu+pJzomq13/3gYjlSWr5+Oc1wYpt/HzaGUX21
 JdiST4q5q7myWZ0O9fOP90swm4vb6CrDbRVcHY/FrEuW8SFMsU/D9dwxVKTz+n+8
 40isa4Zs3l6ezb4D6k4QmLQ+DSRaZt5zY/LwQ6Kmdqt2MU8BbNLbhWZ9RPw2a38Z
 5nSsYppbqF4T8Rq5++Zo+VkYsn45hItf7Y0O5x4KPJWtYiYkWt3/oXvIcgyHAZtH
 H0+/2/C2FI6AmnbqynfKaDvR62kCJxOegOLa3Jd+Ps+0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655360756; x=1655447156; bh=Xnp4ckN+cZwV9xzQVgATT4HTLTgBz5AgEV9
 Xzx+z6Ck=; b=a54JFqrcFQCbsFrEPhetIGNxCusZrgAjFbJjIdH6/aRnNVrXGn6
 IAfJgpK9SGK6lxpUYsCoeB6zEnDRt2Y/JZWs8BuLYqT3jRi/ibw/fWFD9LVQ3rne
 jLGPVAl1+WOihMZgSx9YBKuJMJN54M8FzyEL/qdbDOFSbd3ULaOQTf0FYJN5zfw4
 bok+jOUaTSOtPeCKqgOD8MQ01VHfEPx6B+5XDD2wcsSYHP+XOM7CANzoJh1vun7S
 g1srrx3Gh7b1dcYL97ytDCvLwJzvDu4Psacz8oBMEdT8usA8odmvE/J0hqK5eEHs
 OczuZXujSh0+0cMhPubGdKWZClFYa7EfF4Q==
X-ME-Sender: <xms:88yqYkTV-Hb6vSYoDfQKcxwxmD_0leCw4kxTvHZ2n-KmwKxJTJ4Zpw>
 <xme:88yqYhwCNBIaiOC6P_bQ8j_F6_PSEBBKarpK0064Tp48aeqweNuA8OeFtf5wjyOYG
 UAc5kPl5v8wbgiheg>
X-ME-Received: <xmr:88yqYh1mOqtTU45bi4fAX_23c0h7fm3-WjhJw7q1Fri9XgPIXRXv3BpoI9GWZHvMxv8JSchdRbbdPqTIjOg4bEuBlhHlNBzCSerLJ7l6qS7PXYuwQLiA5cnBsfkGrG3izIQx8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddthecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeeh
 hffhkeekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:88yqYoD0Ou05GTvMXlxR9uRomhyoiUabBKeLQ4XyAZkEdkISL0RBHg>
 <xmx:88yqYtjeCJzWB7X1yZ3mgo0xm58iIKE9FSX5Zktt6KeUv3JTAsv36A>
 <xmx:88yqYkqOA6if4u2hF0BOr9QFbmnSq1wiZt6kSwbdEIM6DUq0nEUCAw>
 <xmx:9MyqYt4GJOkih0MZ7KF2UugYL2n1DPQgi_GmG6dnJk1sePH1Y6jK8Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:25:54 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: sun50i-codec-analog: Internal bias support
Date: Thu, 16 Jun 2022 01:25:51 -0500
Message-Id: <20220616062554.57266-1-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

This series adds support for enabling the codec's internal microphone
bias, which is needed on at least some versions of the PinePhone.


Arnaud Ferraris (2):
  ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
  ASoC: sun50i-codec-analog: Add support for internal bias

Samuel Holland (1):
  arm64: dts: allwinner: pinephone: Enable internal HMIC bias

 .../allwinner,sun50i-a64-codec-analog.yaml    |  5 ++++
 .../allwinner/sun50i-a64-pinephone-1.0.dts    |  4 +++
 .../allwinner/sun50i-a64-pinephone-1.1.dts    |  4 +++
 sound/soc/sunxi/sun50i-codec-analog.c         | 29 +++++++++++++++++++
 4 files changed, 42 insertions(+)

-- 
2.35.1

