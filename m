Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 441722A8E34
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 05:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC630167E;
	Fri,  6 Nov 2020 05:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC630167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604636222;
	bh=pVlDRSLqC1/3mWONXql8AhmT9BzCLb1tHZEczdJXM48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cRErXI7WofldG1GDYbG5IVyfJFHfzjKG3xMjQr8yjzw6qwUpSnUoRzxfIy8ivnOAq
	 bk69S43XEabHJ8lm+3iIkirf89hZuWMRB8HYzKr4w807JaxCGmZro6VMnzZ4DDww8E
	 Zt+PBFZ6QrUSbFjDeukScI48kD2HR/y5L4+TQDAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98F25F800BA;
	Fri,  6 Nov 2020 05:15:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72590F804B4; Fri,  6 Nov 2020 05:15:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C09CF8023E
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 05:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C09CF8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="tQH0+bRt"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qhjir15c"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 49583580549;
 Thu,  5 Nov 2020 23:15:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 05 Nov 2020 23:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=+qDI3QewsKGWtoQxG+q8X0EcPM
 jQpIpbBevGLhPz5J4=; b=tQH0+bRth6goR3jRxdivrAy8c0dRlWyq9Ym4pN5F3Y
 frGMxZCqc7Rci1k3BXDtEr9sOerPVLN+leTNrpxLeCouQRiyfsmOlGB/ssYO8OeY
 qL4PwT7VtVWSwh20Mb0bhSLKLMr7qDjB45vH4QnvHzfxJlREyz9XfiyFVp1Nojnd
 Qz0iEpT3mQGu/8O/44SfrWpddSmfV34y3GegUi0Ukqw8Ct+cnl2DHnmP3d2mK2Qc
 8Og20ydr9kNF9PTAqYMyAb2xVMEPkGCuat4ALFyOtpGqJHQN9bvdvw1V8lWxsll3
 xnQXmsVHL3iU17reSm3Y9qBVVoQGY8i2V+0je0cXDPLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+qDI3QewsKGWtoQxG
 +q8X0EcPMjQpIpbBevGLhPz5J4=; b=qhjir15cQmcG2e7U8sW/NJgPzoAxVONII
 VPN02Eptah1hMwEdxWhceN8jotm5ku9MuNq3dqe6fqnjOBrxWlq+hX3m5WXfj8iC
 Mbr1nNSsE9p/Qi1bt8fk2KtqVwxaGbcVf8l+Of16efwbPCC2supkbuBPkYMiolN+
 s05HqFH6r33bfDrpvnUjtqZ2gQqrLaFUN4pIgneVvpj02k24tzq1di8HdF9y0kma
 X6Hsgx6bQ7Blj7l4kExIzOaVl1+Yl400fUF9DamzLp5J+SfnC8aAaUceQJ9/usoc
 Rmh7H+Woj0q7bqF6MBffYaXbQaYVT1kYDOjgPmtBFD+uuZP58Y6sw==
X-ME-Sender: <xms:0s2kX1u4YDhZ5K4c3tiA4YdLJ1jnddHxdpdpzpNtP-5f0eZTUic1pQ>
 <xme:0s2kX-dcqgyv26Nk3tws83OwQvmHr3ZSzD6ckDfvin5KZT58xGpfo0yPnoggvJz7U
 rSA2yN_itfqCb1ZIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtkedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
 jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
 htthgvrhhnpeeiteekhfehuddugfeltddufeejjeefgeevheekueffhffhjeekheeiffdt
 vedtveenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
 ohhrgh
X-ME-Proxy: <xmx:0s2kX4xwVWKxwxtRsXvDXqnF72sUaC7-K5Vw5zj_txG4VAWkaJfWaA>
 <xmx:0s2kX8Mfcg-sU_QUR6e8CXaA2fR_cRKJ2xEsRelMiIN4wQbRj1KHuA>
 <xmx:0s2kX198KLqqVYUBqe__EQAtxcq84HLd5cSaY48Smaf5Ud7vvWuL-g>
 <xmx:082kX0a3qnHvQ57Mb3eJub0EjmfuAvJ2dPiwWCj-4oXeNfDttq6U2g>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9B0AC306005F;
 Thu,  5 Nov 2020 23:15:13 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/7] PinePhone BT audio bringup
Date: Thu,  5 Nov 2020 22:15:06 -0600
Message-Id: <20201106041513.38481-1-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
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

This series makes use of the additional DAIs recently added to the
sun8i-codec driver to add hardware routing for BT SCO (headset) audio
on the PinePhone.

The BT audio connection is represented by the "dummy" bt-sco codec. The
connection to the Quectel EG-25G modem via AIF2 works as well, but I do
not include it here because there is no appropriate codec driver in
tree. We have been using an out-of-tree "dummy" codec driver similar to
bt-sco, and I'm not sure if such a driver would be desired upstream.

The modem has a similar amount of configurability as the rtl8723cs BT
chip. For the BT chip, the DAI format and PCM parameters are set in a
configuration firmware file and loaded at driver load time. For the
modem, the DAI format and PCM parameters are set by (and can be queried
from) an AT command. However, this AT command requires a modem restart
to take effect, so the parameters cannot feasibly be changed at runtime.

With a dummy driver, we pick some "standard" set of PCM parameters, e.g.
16 bit mono at 8 or 16 kHz, and assume the hardware agrees. Similarly,
we assume the DAI format pre-programmed in the remote hardware matches
what is configured in the DAI link (in this case, in the device tree).

Is that the right way to model this? Or does the modem (and maybe even
the BT chip) deserve a more featureful driver that reads and/or programs
the format and params at probe time?

Because of those unanswered questions, I'm sending BT SCO support
first/only.

Regards,
Samuel

Arnaud Ferraris (1):
  arm64: dts: allwinner: pinephone: Set audio card name

Samuel Holland (6):
  ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells
  ARM: dts: sun8i-a33: Allow using multiple codec DAIs
  arm64: dts: allwinner: a64: Allow using multiple codec DAIs
  arm64: dts: allwinner: a64: Add pinmux nodes for AIF2/AIF3
  arm64: dts: allwinner: a64: Allow multiple DAI links
  arm64: dts: allwinner: pinephone: Add support for Bluetooth audio

 .../sound/allwinner,sun8i-a33-codec.yaml      |  2 +-
 arch/arm/boot/dts/sun8i-a33.dtsi              |  4 +-
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 25 +++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 37 ++++++++++++++-----
 4 files changed, 55 insertions(+), 13 deletions(-)

-- 
2.26.2

