Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94351272660
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 15:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59F6916CE;
	Mon, 21 Sep 2020 15:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59F6916CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600696649;
	bh=o+0iqczW184qSyIfJmdLbKKlG7GaquUaoYQd5KfhtwI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e6jXDUfDWHYYJYbgH2AfXctJZeHXF9UxowZ4mUaHjAsu0ovkdLyLc9l4CE5K/CR9E
	 OuhpybjElLxrcxrGiar479Iyl28K0AbSc+VDLpNIw6igyOxHP7j96zONhDuv9OiKUj
	 6AnWCTmcnL7R1kemKf311Y0RdSY2qicb98yiBR2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AE6F80161;
	Mon, 21 Sep 2020 15:55:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37B76F80162; Mon, 21 Sep 2020 15:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC37BF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 15:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC37BF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="N7m/AzG3"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="l2O8I0q/"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 9C1084C5;
 Mon, 21 Sep 2020 09:55:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 21 Sep 2020 09:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=B
 EGNDlvDfXkKXK5REIu5N8vOOMx+km52gjr4Z6s/5Fc=; b=N7m/AzG31Z90u6VzB
 XltErv+k3kNYcTZA1pbzj7WqgwGO5npF0+Nf3Ze7RXVb7HbY4bqLfuAolX0spSv8
 GvtJU7TYsJbvAdNmaZRMR3HJWP9pOwwz/MqttmeqKj5U3uMqL6LH9P698EBQkESu
 Q88pIIMbuRAYQAkVxSBkRBLGkyKx+SLYL7Y6nKHuZ0EKlPvdFlg37lWARpYBpVEe
 zXTgp13eKYctWmwKy3rTC0AO+d8XbmGtyqnbQpLZEh655pWZ+PEWYuoUoJCGSks6
 xreSY581Vnq7A1mxQY3KyWzmGiPGfdRYyubyv6bw9nmYsPre5XyRh5gnngsVfCFu
 UyH2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=BEGNDlvDfXkKXK5REIu5N8vOOMx+km52gjr4Z6s/5
 Fc=; b=l2O8I0q/0iVpb13FY009yJZ1NNM7+PUv0mbTq9OaovWCTTcE4vHwvkcri
 0I0r01zr2yHE23odRqOQ1LRIiBa87eJywH/u4nQ2TuKUhNV9gy/i79i7Pb+7q3VL
 vihJ228lQLKkiB5fca1WsMiXo6kh6FjN6duF+p/JkIFP3BIyePe3qDD6BqpGB2lB
 fZ3FgnTEsfTAsy8UC/a7ZsGhS6SZX4C7hB5vGcD1N3xfXcsXw+waz7WYO6HJo+5/
 HaM9RVgHSUMI8Z8msh69w2bIFBdvi7wZBs/Nb3eJUuOJS0EAzbKfJjqDRWkNo8er
 ZQAaNLNQ4hDnibgAfn05rXRxoMDzQ==
X-ME-Sender: <xms:1bBoX4UeAeB8GgmIgR26hwOZabfy_NJElOfIIAC2slnkpDQAd1Dixw>
 <xme:1bBoX8mYdyJBmyaB8GgUcrbA5UBTb3yhIGwDENbjgbp_4IpV5G_6zAtA7CPNaaK01
 Fy9nQn3LPyXxzZrlNM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepheelvdfhkeelgfevleekleduvefftefhudekvdffhffhgeefuefgheegfeej
 vedtnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1bBoX8b73D5mSBvFXsb05BlZ_y0_EOpTMiFiS-F72hKhpgwZ2_ZuAQ>
 <xmx:1bBoX3WDtmFPsXZpiBhmsoFpac29hEXjEgBWJfAhl9cxNN_3nJDmcA>
 <xmx:1bBoXynb8HajnEpTY5Jzdue1RUc0UqaJuKN3R7L9rGFHqL7JPfByIA>
 <xmx:1rBoX0cVHxrTpDdRh5Hf5Yyw8i26bDfgcGccMg_k5Civ5uEfV6rkmVuAqRI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EBB63280060;
 Mon, 21 Sep 2020 09:55:32 -0400 (EDT)
Date: Mon, 21 Sep 2020 15:55:30 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 03/22] ASoC: sun4i-i2s: Change get_sr() and get_wss()
 to be more explicit
Message-ID: <20200921135530.q36i4l5m4p7u7zyy@gilmour.lan>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-4-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921102731.747736-4-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Mon, Sep 21, 2020 at 12:27:12PM +0200, Cl=E9ment P=E9ron wrote:
> We are actually using a complex formula to just return a bunch of
> simple values. Also this formula is wrong for sun4i.

Just like the previous patch, this could use a bit more explanation,
like why it's a good thing, or how it's wrong on sun4i

> Replace this with a simpler switch case.
>=20
> Also drop the i2s params not used.
>=20
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 25 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 0633b9fba3d7..11bbcbe24d6b 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -175,8 +175,8 @@ struct sun4i_i2s_quirks {
>  	unsigned int			num_mclk_dividers;
> =20
>  	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
> -	s8	(*get_sr)(const struct sun4i_i2s *, int);
> -	s8	(*get_wss)(const struct sun4i_i2s *, int);
> +	int	(*get_sr)(unsigned int width);
> +	int	(*get_wss)(unsigned int width);
>  	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
>  				unsigned int channels,	unsigned int slots,
>  				unsigned int slot_width);
> @@ -381,37 +381,56 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_da=
i *dai,
>  	return 0;
>  }
> =20
> -static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
> +static int sun4i_i2s_get_sr(unsigned int width)
>  {
> -	if (width < 16 || width > 24)
> -		return -EINVAL;
> -
> -	if (width % 4)
> -		return -EINVAL;
> +	switch (width) {
> +	case 16:
> +		return 0x0;
> +	case 20:
> +		return 0x1;
> +	case 24:
> +		return 0x2;
> +	}

Why do we need an hex number here?

Also, why is the return type change needed?

Maxime
