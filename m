Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C001552123
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BC3D28D1;
	Mon, 20 Jun 2022 17:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BC3D28D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739383;
	bh=t6QXcNLzauxbqf0PNTG8MvaAdoQQFis6uQHBpNA5m+I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j4OPIGumpXIj0E9wJ5Eefh4fAVx0qS1UZG+aIo0f3HG0YITYy+kBX416zV9pfwWZ5
	 i2LaqMUcX09UVd0XGgSOke1KAw6RwfKREl6+7TEffiGSMh4VEkkWIynOHhJj8vOrY2
	 VOkooI7RHPEg83fjPETxT/JGWxFfU0Mywdy1oKgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E638F80CBF;
	Mon, 20 Jun 2022 17:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B3AF800B0; Fri, 17 Jun 2022 09:25:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E5C6F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 09:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E5C6F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="nr/26OCn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CkYUa18G"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D16F15C0151;
 Fri, 17 Jun 2022 03:25:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 17 Jun 2022 03:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655450738; x=
 1655537138; bh=t6QXcNLzauxbqf0PNTG8MvaAdoQQFis6uQHBpNA5m+I=; b=n
 r/26OCnEDIr6jYGUp00hxr/NMoxkf6xXfRuhMockkxh6n/wloYbpla88d1SGLc3P
 BtUBgD8RZGZwQq1VPEdFsxTpp0vbEShL/ls6VxYlg3QMzR0vwLar8HSi00UlQ0gL
 CH0ldBnQE8fgusDetIp4GspeBfNwxFV/Kux0Hx5Gn4thT/XQgU8PMW4HgsFFcXRm
 Zivnb/+Onrj1LGZ5AHx2nvHV0C75KC/tYxnCCabt/MYKO/z8c0fQcLinaQbHGkZ/
 ReDK0Ixt6XyqgHi5Jl8vZzwm7V5ELSXQsKa2v6qLRWnUgG5G2P5dohWhsokjAjTc
 L+OzZ1aV3f76OQGSJyChg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655450738; x=
 1655537138; bh=t6QXcNLzauxbqf0PNTG8MvaAdoQQFis6uQHBpNA5m+I=; b=C
 kYUa18GGhGd0oZQ43NnZDN3+5y/3awo+Sws0Pq3eb6UKVOekXJ4Y7ZEHvLp36JHj
 tycJVtu9HwZf6jSnqxW4zSYXVJbe86AaaXxlWH7q4QH3qe9lRa6jd+fNATp9LPAT
 uMB4hcgr49bGrbUHs5jLTWfsDcAY1XnxmodGaA/DgxKZG0akk8naBHEsjI+9wBbi
 bdBT2GvJE4pNDjc9Q1xJKM5StazQkLXgIHK2oujsy/VM2X0INDscm2W7ndAJ5rcf
 mBBIfmMwMR/jziK5WAQT6SO63sjbrOoLYrgXG/T1UfFrVqW/5w3OIEWPJWQoFPkh
 /k+4PB1FRuFRA5/pGTzAw==
X-ME-Sender: <xms:cCysYuGbj_tXIkPunEurAIwroXW5XpxjXpF4QSJbzxhbPXclwax6XA>
 <xme:cCysYvWgkzuxSA4c7vUx_UbBJT8gLLCv-uNPJbxN_6t01QjqR06uBZtc0l9wxHzhR
 zr0LWaTeAJNrwG7Sv4>
X-ME-Received: <xmr:cCysYoL-s8_MAzYdUOgHxl_upF4_8dJ4RyvHl_ZD6Qzg5t8bcXrIWoJ5sq56JxsiML5p_3EqajNOb9VnX0x1uY0f2nUbuWm7o5g4tUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeu
 teefteefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cCysYoGVB8cZQ7yOz48SmLfp873hgDRpdEpPRutGsvxTCLizycl41w>
 <xmx:cCysYkVSvHtiRSBPNAhrPCzXsNP5d45QhqafU_iIo0w9pj_rG6ibZQ>
 <xmx:cCysYrOhmw8cG_xUkAWqqi3Xw5qv0x5wtJ9n4l4N9ZI1Bu5NZbr7WA>
 <xmx:ciysYvyJISiAd-XGF0UUbZ-Rv8dPZGqNpVjs7CZjxA6lvgGh5OS30A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 03:25:36 -0400 (EDT)
Date: Fri, 17 Jun 2022 09:25:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 03/96] drm/vc4: Migrate to new style legacy DAI naming flag
Message-ID: <20220617072533.foajsg6z3c2js3nb@houat>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
 <20220616143429.1324494-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220616143429.1324494-4-ckeepax@opensource.cirrus.com>
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:46 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 broonie@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
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

On Thu, Jun 16, 2022 at 03:32:56PM +0100, Charles Keepax wrote:
> Change the legacy DAI naming flag from opting in to the new scheme
> (non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
> This driver appears to be on the CPU side of the DAI link and
> currently uses the legacy naming, so add the new flag.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime
