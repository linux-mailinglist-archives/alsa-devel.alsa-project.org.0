Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD021C1A2
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 03:45:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB370165E;
	Sat, 11 Jul 2020 03:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB370165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594431899;
	bh=jIrXHwkUGTSo1uyeKqdJeqanQOojzF3yCJI2TEAUMGA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=msZEbg7nEWE8OoBgEv151Qq3Sa7Az5ijd/xDrOy1J36CmbEhFf0P9553aToNb61pQ
	 UG9dyS8bQRLugndTXTur7LD5GdUk4a7vzbzibE0z5xug62t8PM8qYDcUogYgeiwQG8
	 0c9oiwoID5dQ8wSk6cAToNGl+YceOLujm1QDKhEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9A7F80084;
	Sat, 11 Jul 2020 03:43:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD021F80216; Sat, 11 Jul 2020 03:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D7BBF80084
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 03:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D7BBF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="OETpcIsZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NGRfGRRj"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 665F358046B;
 Fri, 10 Jul 2020 21:43:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jul 2020 21:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=H
 LgEH/278Opa5rtB0os+SzkGd6M293q0r6hnuwndsH4=; b=OETpcIsZ/w7fLD9vI
 jxBVrbG1+yoNJiZDSsgRR33JmQ6otsy2LGhaP5Dq58q4YOwlkDpFzVee4Q7NBFx5
 z6WDuvdrTdQZsulT139LLHJDRLWo0FyX4Wd1ovAndYUIY0DDhXBEcRhsNtDnJ0+S
 0kWneIuFWNSU9NNNSlfgduIjawEU8G+ChV9JZImOcAeU6C/a76GNJ1apnk9i/GYw
 04XqQPMI7gsKz8zwRvmx60G+eARIou5YpUPipfz66JJgbFLH+Jiakjk0LKxpBM/i
 oXt1HLyNchf/qL9T5XdgS0F9cktz+a1uf5R+Djqbd1gESe+7nSd2ZNvN3gQ33tL6
 BO0kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=HLgEH/278Opa5rtB0os+SzkGd6M293q0r6hnuwnds
 H4=; b=NGRfGRRjGajfOa4oqWhCMRfPjEQ/fr7k8P05hv1bTcZujnTjc2hGyJ2rH
 yBU3GsXTSxgylf6z3muV57ukJ7bEtIsHwlS8raLVq+MPOgzPr3LJ0WETIoxx1SoA
 y2xy+qY2cvjB7DjEWXnCU0QXqWKpDJ3gsKEeVEw8YOSOc2Cl6Ge7Fq/0Cgu/SegO
 rJlovnUz+/AC8XExAQ1UM9LnAmP2rgaXJ1Cmh5/bJ8lwkjXSGMmukAyzCFF2stUi
 wPR3uBu+2dGAvKpz12iJgFKROAU1wHhYr9c8XRZxENr04vmytKXVXveKEupu9fJE
 RH7L81sjA0qET3942aOCdM/onOoVg==
X-ME-Sender: <xms:KhkJX8z8q--1SxP5KnunZarNkXEv-kogxKbThIpnzq0mIcMyDZUTKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddvgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpefgleekudevjedtjefhieelvdfhgeegieeikeelhfeffeffffffgedu
 teetleeijeenucfkphepjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghn
 ugdrohhrgh
X-ME-Proxy: <xmx:KhkJXwQHYM1QAUstOd77deyOhQBUZff43ws-qBJIxN7USRUmFe8dWA>
 <xmx:KhkJX-XsQJ_88C10qwIzJiegM2XRZb0y6q1tAAMTgww0TmpKjWcUzA>
 <xmx:KhkJX6gHemG4by0MW23SaKB1d9f5LAEaQ4Shj8Uz7R_rzqNIN_17MA>
 <xmx:LBkJX_LcUWuqKwq4qdAKDUb-1Fpe50g72-jcW2_uCpIbXCPEqSepMA>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id AED6D328005D;
 Fri, 10 Jul 2020 21:43:05 -0400 (EDT)
Subject: Re: [linux-sunxi] [PATCH 01/16] ASoC: sun4i-i2s: Add support for H6
 I2S
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
 peron.clem@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-2-peron.clem@gmail.com>
 <72a6fddf-5e84-f050-2eee-74178d457789@sholland.org>
 <3787973.dVgI16VYFl@jernej-laptop>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <6f183057-2c5b-2acf-4394-535ee09fe8db@sholland.org>
Date: Fri, 10 Jul 2020 20:43:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3787973.dVgI16VYFl@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

Jernej,

On 7/10/20 2:22 PM, Jernej Škrabec wrote:
>> From the description in the manual, this looks off by one. The number of
>> BCLKs per LRCK is LRCK_PERIOD + 1.
> 
> Are you sure? Macro SUN8I_I2S_FMT0_LRCK_PERIOD() is defined as follows:
> 
> #define SUN8I_I2S_FMT0_LRCK_PERIOD(period)	((period - 1) << 8)
> 
> which already lowers value by 1.

No, sorry, I had missed the subtraction happening in the macro. So there's no
problem here.

Thanks,
Samuel
