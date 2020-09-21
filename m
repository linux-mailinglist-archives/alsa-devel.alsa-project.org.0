Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 748192723E8
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 14:31:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1924516C1;
	Mon, 21 Sep 2020 14:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1924516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600691478;
	bh=RHKQR7CbzI0F6ZRKVieWVWj1G/b0kU9KL/lrLU/cXIE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oLdhBYjVqVVVNj0PzOwUipT+aZNrYMp7kElVtRuErXChGLyDbR3Vuy5MPKTataoe6
	 iAJhGWuuIA9k09wfa42m8PcmZltCcZmrjkXsUfRW9Y2a06N58HIgTUHX57mcZwRkFP
	 6FK0I7Ia89pkKnb7tKYrGipbErtK1RSLb79LVpRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 376B0F80171;
	Mon, 21 Sep 2020 14:29:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B61C5F80162; Mon, 21 Sep 2020 14:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86057F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 14:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86057F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="BmH4loHf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uCP6Fvdb"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 46BABB57;
 Mon, 21 Sep 2020 08:29:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 21 Sep 2020 08:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=R
 HKQR7CbzI0F6ZRKVieWVWj1G/b0kU9KL/lrLU/cXIE=; b=BmH4loHf/twmMvruG
 h+1fAO/CvxSkfl44OnYhWxEx9nAlNqB9xc0MBQipOjf3YpW9p4Y2UxFv5u1jwwEk
 7itf8mgtLdyHUTNFAlgVz11YQvxeLAMdIXXbcBdiSvpXLoJ4iL8W4GXRL2AX9l4C
 w4d/8tRbIVhEJUimi7VoZszz/9dNSk/KQ/rw/7NHU0LJq6ICr2MalqxmZHNtvdCO
 GoS/5WX4ZxAXn3mj+IOgBmejzXi9Iydb/8cyfzXDvqVbHQeTJmGoEOEXwWPEAOmp
 MTQ3yIHAKIweDxETUuvLopmQ+JEaX7JiLaADyZS4QitYgrwa7a+/18eOkmQ8RUDM
 +Dfpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=RHKQR7CbzI0F6ZRKVieWVWj1G/b0kU9KL/lrLU/cX
 IE=; b=uCP6FvdbREPriWo7tBN7COrxikiM1temZ9SQ7f1vnlWJXXvpTgR8/9WKF
 kGwplJwffLMMZMU3LkW4bYkyd6g7UFI9QfVFjeAJjXI/SRHxXt3Cet9h5D8+gfnF
 OukGuVCqfRLO46NtvgMf/Rt2q6Vl4DxvzUFlQLq5CfjVCkYbMLCPv961KFo4RiMh
 ARu2F1aqKZfZaXxMvQx8XhOmZKqk7TSCFEzY102TvWsSUKDor6w+NO2M5GZABkbO
 XXF1vINgJBGIMsRMFOd4simfgjl+K3nqKrJoyEfVUe4Ozfw/CbYRhN/yJyHBan4s
 PFJzTtoMmqieBbOhGHyPo+R6I9ysg==
X-ME-Sender: <xms:n5xoX2Urj45I8RuFot4ZW1GTKO1jGOAaFRwEfOPzw3-hYRLhznqFMQ>
 <xme:n5xoXylUBDPDNvKOWfMGfVZeTqjyqmZDH_cMYtsDFq1fOKmJc7UloqI4F4-VuT8lU
 l0xdfK5E8_JQdgkrU8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepheelvdfhkeelgfevleekleduvefftefhudekvdffhffhgeefuefgheegfeej
 vedtnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n5xoX6YDobf3ogp7c8SHV-Yk_rRA2uc1uDT86C0UPE5mNFI5wgY1cA>
 <xmx:n5xoX9UdwW79t8SEbNgS2451IJpJPK2zkH1UejK3VnnXZ18zE4yFDg>
 <xmx:n5xoXwnWphsACygt4earwWgNmDEcjJ9UZiDhs4nrWeCxNQGLQO3IGQ>
 <xmx:oJxoX786_gnFaDjZ6XBX4Ymq0ztTe-t6QLlEfLX6vTz5qNRVAAO84E4SLM4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F091328005A;
 Mon, 21 Sep 2020 08:29:19 -0400 (EDT)
Date: Mon, 21 Sep 2020 14:29:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 02/22] ASoC: sun4i-i2s: Change set_chan_cfg() params
Message-ID: <20200921122918.kzzu623wui277nwr@gilmour.lan>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200921102731.747736-3-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Sep 21, 2020 at 12:27:11PM +0200, Cl=E9ment P=E9ron wrote:
> As slots and slot_width can be overwritter in case set_tdm() is
> called. Avoid to have this logic in set_chan_cfg().
>=20
> Instead pass the required values as params to set_chan_cfg().

It's not really clear here what the issue is, and how passing the slots
and slot_width as arguments addresses it

> This also fix a bug when i2s->slot_width is set for TDM but not
> properly used in set_chan_cfg().

Which bug?

Also, Fixes tag?

Thanks!
Maxime
