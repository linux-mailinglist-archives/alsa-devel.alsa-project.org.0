Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83D390264
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:26:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC901741;
	Tue, 25 May 2021 15:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC901741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949188;
	bh=3/H3e3WqzAkcRlxZaJXmUj6HqydpVE5BYfXW8USMKVU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B73T0QIovMbn0jaHoKb9x34ZN90n/2Jbhke63cOsHmyL3VNo9xUiz5JqCQwL7yXZy
	 JsKil717CdM+C8dsN4RJFF7bEFzjQfQGUTV4HF4RqDMxftpaS1psERGZuy0Q2KWPXT
	 oI48yi2VzydXQRIQep3T75QoOvTdkwqObcxy3W5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D8CCF80424;
	Tue, 25 May 2021 15:24:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F70BF80113; Tue, 25 May 2021 15:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF8F1F801EB
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8F1F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Cd7vRdfj"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YSLAyLB4"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9BFCB5806F6;
 Tue, 25 May 2021 09:24:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 May 2021 09:24:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 mwr+loUju+nUboAV2hMRTjqnQueA+4RdS0j/M9fNa9A=; b=Cd7vRdfjoGi7Fcng
 TBvMum69m3QhfF2HwMCkBw4WExrniuycMSYXJbOhcQ7WRcnw6o59e7/MoLnUYdtn
 53ZMZf/9DsATvjJn8pKSyQBzSi8BpCV2pHi7V4tzhmpAewvO8cZISLIei2xamEOP
 tIEY7XTAFk8enHBO2NRKJ9N9bUvVWZn7yfgJ1RcWWOJBV0GnxyWad44XqqnLtXRx
 RtS89ID6qkz/yzWVe0WpFyvpTSM+F+yrbOKlwwloj0zXvPs++tL3NBlWd2h25bNz
 a72N5kMRfpe1Bt3TdWkt6QGtxRfFl7uapvuJTvaVNsN9XSDLzcGmWX1G7QLv0LrA
 m0f0hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=mwr+loUju+nUboAV2hMRTjqnQueA+4RdS0j/M9fNa
 9A=; b=YSLAyLB42uKhVp45iIM4+Ybxqns+f0UyMNmLKTEfvPr2O+dLENGDOtTrT
 VyF618Eac1x3iDQxR8a9CFrED5y6JUVV3rWoUhHAkHGUGVqUAdJSakT3Io6gpd+G
 UYBE+6TYyRsGDCBfd+EV3+ooP9zHEWRXkvwe8dPEHmLrrukeagFon7cyqbOZF4lR
 oE4ND4GjwGda9QSkjq/v7crYeoOOazhWj/lh0peg3v2hJKTujJOdCcSE8+3VMCex
 GTgiZOUCn/3009oB6z2ypo5Fn2b8YGoVJwzbuNUzPDZqHHIo8O0JWrKRzE9mgKQX
 qrmC96kif67KVs9ySlCiRgBQeDHBQ==
X-ME-Sender: <xms:cvqsYO4bcFRyVIqa7MJQFTbF6emxBNij3qh7Esys7n5K8nj3N6LNFw>
 <xme:cvqsYH7UMRi2GyIRgc_BZDCbzLEX0f6JqogFLxHsybLUMCgjg5nqdY-tAAfPsDXlh
 0tc46ry6UHgQtdkTHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cvqsYNcFqTG-QKcQALPkSUYwJ0xo3WU1yyQoSWHxp5uFvbck5d9yFQ>
 <xmx:cvqsYLISThlYdIbC2JuXoH1P_2PsiRUxK7q6uCBci4gmAUabEA_gWw>
 <xmx:cvqsYCKmZb8_hpcy9I8PENiKakw4Rm3RAa98PXbptoy_qaM4Mg7_qA>
 <xmx:cvqsYKDZ9sotwubZ5Sfqs3X9ZHmMXpx6kA06mhKJ36xvo7tej0IixQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 01/12] ALSA: doc: Clarify IEC958 controls iface
Date: Tue, 25 May 2021 15:23:43 +0200
Message-Id: <20210525132354.297468-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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

The doc currently mentions that the IEC958 Playback Default should be
exposed on the PCM iface, and the Playback Mask on the mixer iface.

It's a bit confusing to advise to have two related controls on two
separate ifaces, and it looks like the drivers that currently expose
those controls use any combination of the mixer and PCM ifaces.

Let's try to clarify the situation a bit, and encourage to at least have
the controls on the same iface.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../sound/kernel-api/writing-an-alsa-driver.rst     | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index e6365836fa8b..01d59b8aea92 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3508,14 +3508,15 @@ field must be set, though).
 
 “IEC958 Playback Con Mask” is used to return the bit-mask for the IEC958
 status bits of consumer mode. Similarly, “IEC958 Playback Pro Mask”
-returns the bitmask for professional mode. They are read-only controls,
-and are defined as MIXER controls (iface =
-``SNDRV_CTL_ELEM_IFACE_MIXER``).
+returns the bitmask for professional mode. They are read-only controls.
 
 Meanwhile, “IEC958 Playback Default” control is defined for getting and
-setting the current default IEC958 bits. Note that this one is usually
-defined as a PCM control (iface = ``SNDRV_CTL_ELEM_IFACE_PCM``),
-although in some places it's defined as a MIXER control.
+setting the current default IEC958 bits.
+
+Due to historical reasons, both variants of the Playback Mask and the
+Playback Default controls can be implemented on either a
+``SNDRV_CTL_ELEM_IFACE_PCM`` or a ``SNDRV_CTL_ELEM_IFACE_MIXER`` iface.
+Drivers should expose the mask and default on the same iface though.
 
 In addition, you can define the control switches to enable/disable or to
 set the raw bit mode. The implementation will depend on the chip, but
-- 
2.31.1

