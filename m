Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D9E21820C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 10:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 368101670;
	Wed,  8 Jul 2020 10:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 368101670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594196075;
	bh=Gqh11UiG2+F/LHFxJpAOq5p7jpOlo0S6qUWZwnjh2/w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PEcvDzyd95XetQrJT0+VhNlQKPnI0U+pIP+/wlxGJbRKjKUFGDAeTmryviRZrCtCV
	 wtfodrubCX0Mqbml7OVyv/09taNJSnCvsfn1ToShgi0XK+/GWQPXZaTXskvl2F2FnC
	 CXNi2KAoFvow8NJLY63F43yZyyCG/LF6vauicr+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50AA7F80258;
	Wed,  8 Jul 2020 10:12:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13E7BF80161; Wed,  8 Jul 2020 10:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2CDEF8015C
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 10:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2CDEF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="JGrN7IAR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MqguM69H"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8418F5801C9;
 Wed,  8 Jul 2020 04:12:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 04:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=G
 qh11UiG2+F/LHFxJpAOq5p7jpOlo0S6qUWZwnjh2/w=; b=JGrN7IARgfhBh+TYe
 spWxXGNdUcQDnVFdKyixl0fYvvH6xJE2djLhIpQoI3PaOR96xHYEKB9y7LWGuKQZ
 Wm7zqMOzf1+BMhTlzcE8XzeqGCEi+bK2b5nvOAfZL2xf+XXOv/fjw9c/pEKnzU87
 Op3zoBhLVrjR/2z3QbtXmmTP0AarXrW6b6w+MtwK4136yhs5Fme0addu/Z1mrQHT
 n0aCEWQxQnTxSwt7tQYfIooNx7qUGcB6BHJlapo40cTwRBEg2gIQK0mkzg+NSnoe
 lREucFh5AqjnYTuwk+vvfKGSt2Yz7TAiCOwGbdeuIKvzCiQVFduGlitQK1NABuv2
 o3sPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=Gqh11UiG2+F/LHFxJpAOq5p7jpOlo0S6qUWZwnjh2
 /w=; b=MqguM69HgwVhZ2LfdsU7p7gkgcYkwfx88zlEIjsnKU1qg+cYe812la7Dx
 9twClAB2Busn1YMK0XKL4KD0JUtkKln/PI6eKSdQQ5UI5CjlTqbaPDFG7Qn7pk8E
 nNBz3m03oYpmTN1jnGjnU/MvuwxHUgqRw0q0w3mmTyNz843v4eLp2yXnzyGxtyQK
 9mgu9SgHm/rNFPHnntSSVfI3iCo6cKnEzLdMx61KSp/77PjPBbr6657WZfLx0fqS
 bMuu/78tX+ccfUhyPz0CToWvlvmisfj6Rab/q2KHvOWcDU1n4iJYbmHdODifc9fQ
 cEbTIxzGqobWsI9uIzxCQ00CWiDpg==
X-ME-Sender: <xms:1H8FX_XqiUxkF3w1npvl2KiPBXj_eaKnhwZ_mjecBfLsUOe3224xZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1H8FX3lEo9eAqzU90yHPSuQe4UhMoT9p6vjKrmqEilWV40AMB0dPiw>
 <xmx:1H8FX7Y19YTvZboPsu2qS3uYAV8aeE8lKAIIuU422hAJDAIOBgcURg>
 <xmx:1H8FX6XOVIfmPPzegoT0O_H9vMmmY1OaseE7zQIM6Y6nffXklZAgCw>
 <xmx:1H8FX_fXVuG5vBqH6T10VjYO0mtGtSNT19lkLwDCkTl7oHQPWmmi4Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B7227328005D;
 Wed,  8 Jul 2020 04:12:03 -0400 (EDT)
Date: Wed, 8 Jul 2020 10:12:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 03/10] ASoC: sunxi: sun4i-spdif: fix kernel-doc
Message-ID: <20200708081202.2dlhr7unkdqma2gg@gilmour.lan>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200707191615.98296-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200707191615.98296-4-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jul 07, 2020 at 02:16:08PM -0500, Pierre-Louis Bossart wrote:
> Fix W=3D1 warning - typo in field description
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
