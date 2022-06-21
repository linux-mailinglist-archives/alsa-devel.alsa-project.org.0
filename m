Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3CB5529D3
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 05:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB812851;
	Tue, 21 Jun 2022 05:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB812851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655783764;
	bh=07+2pTkDmWBr1Qg7uGOxiUbRrK8o3pK+wZ3rbPMtaA8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=telja7gYH2qwgBWp774kX6wxdlk/90hmLoNgSNfaOJ3IhXiiuPUBb5TJR+tFurxlO
	 edqk+CQP2ItcDL1w3s62lHG9aQJC1i33KsqUpNxuSF4t+KslOSQvNjuvvC8Q9UGHj+
	 MyBhiFAxZ3aw+0HXzFdrCAX8EOafDogxULcWeWuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63062F80253;
	Tue, 21 Jun 2022 05:55:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5C1F80155; Tue, 21 Jun 2022 05:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38139F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 05:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38139F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="OSb+CYEM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="PYb5Ho6h"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E5CE732009A1;
 Mon, 20 Jun 2022 23:54:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 20 Jun 2022 23:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1655783694; x=1655870094; bh=Aj0WbuhEK+ve9fPGKSsd1N6JT
 jcG1lfLNaPRI4PgfF8=; b=OSb+CYEMVLtOFgHTAu+BCjGTP+WFbQ4dtbBjCMiWN
 FAq8Pk83JVWHMC/Or7scxyf46aOjIBWHB20UrUwni+44nefxLBlmsIr2f60+AAtk
 ScTIpBofLQ157k4NBjs3EXAYfoRiFHkDzSNtXYYC/Oj0OCaBa6E3PNSrT6N1jwWU
 NMWEcyXctiIWr74F+EH/iaW5TZXaIEQaxIjfS0ntGku7Qeeg/Nn9rBDGiPVb0vJQ
 NYPch1DmLyTVFItTaG8lY5L/0M4foP05BI87jqo8I5G3cFNKUc8gbrotOLxOZ6/2
 ZJoilgbe2M+p+Y4ig+ZmiXtjyuESDFVJrIQPa6vto3DXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1655783694; x=1655870094; bh=Aj0WbuhEK+ve9fPGKSsd1N6JTjcG1lfLNaP
 RI4PgfF8=; b=PYb5Ho6h90HMXuYOd5z2zUmbzfaAbx9/rMGrNR0bngMH5DHWrm/
 jeFK4h9OZEnLOixiyR+VWmXCWS11Emc9dU0mRDKP2i4f/TS6JEU+dE9M84t+Xe1k
 ELgkLjldx0dIrPpO9cKKZFwWwY+MOfrnBOU7eC9iT8e57Coh6MzVomyuqJrHqbbP
 heFyL1qK+NcGCRP3l3Eg9XOn5+hiBa1Q/8scICXpL7UK+PHNqZAxIpDaipPepX2+
 cCTVRDhBDkDn05UxoXh0Rh7rOOJnTpQkml81F1vvzmEjejZgolMDf+y6rXy2nlmD
 2aU/Jz0TA37xq8843+lm2HWLcE4sgoEh9/A==
X-ME-Sender: <xms:DkGxYjgoyCX2JSjoT3VAH_KbJP8SbSCG4uWg66QLK5ZBPg1Vu09ZNA>
 <xme:DkGxYgCM8dWKHYCQC09b5ot7woRnr7YYjVjOr4n6lHy5zO1BMHDzWkYnsdVkklnkN
 KV3Z4pN-LG9d_KyWA>
X-ME-Received: <xmr:DkGxYjH0ACNQfXvZ_Cwg2QSSsbQLnk0xhBmd_WguANcCzTuPFGqEpy9WIF8OqzP203RbSHguAtbJETgjm57r0NLiO1qWFXvTue0Hpc07xn2hepC3qZROKcWfsZknUhLz2RE0og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
 hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:DkGxYgRr26KpFA4bYsLQGSTMprPZ3bRFyEyckfyN50dDCP15q6ZrCA>
 <xmx:DkGxYgzthdVriyu5pM08mTZhsEBNIXxFhRPNaloqyOMIeqnxPyD3LQ>
 <xmx:DkGxYm5S9ayqxoSqhDynzknqCrTA6zgx-bAzfp5V2Eh997k_HeyvYA>
 <xmx:DkGxYlKJgb-h_LU0szZkHeFp3HeAMQXJzlaZBhnl4QhgkCGHq5JcpQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 23:54:53 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal bias support
Date: Mon, 20 Jun 2022 22:54:49 -0500
Message-Id: <20220621035452.60272-1-samuel@sholland.org>
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

Changes in v2:
 - Move register update from component probe to device probe

Arnaud Ferraris (2):
  ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
  ASoC: sun50i-codec-analog: Add support for internal bias

Samuel Holland (1):
  arm64: dts: allwinner: pinephone: Enable internal HMIC bias

 .../bindings/sound/allwinner,sun50i-a64-codec-analog.yaml | 5 +++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.0.dts | 4 ++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pinephone-1.1.dts | 4 ++++
 sound/soc/sunxi/sun50i-codec-analog.c                     | 8 ++++++++
 4 files changed, 21 insertions(+)

-- 
2.35.1

