Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D176161E95
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 02:37:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE9B1668;
	Tue, 18 Feb 2020 02:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE9B1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581989824;
	bh=hUS/eP/k5KDRetTIu9BexvM9ewO4ohWBh+vpXTxvZy0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rM5QTFw2qn7odIuCxT8X2QxS3KSlGqPnlq/iXoEdqCqE011u/cS3H7FuOWa6pIkLG
	 v6JPsoBww8nUV/Z+QANff6J8LlDcc7ZhGaQDpm3jDsH++pAj51WFUZHUtEOaqc64R9
	 KF89XU26hqyz+5i7tuoFTQtXDHV30rw09CC4pIh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE4CF800C4;
	Tue, 18 Feb 2020 02:35:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B37F7F80172; Tue, 18 Feb 2020 02:35:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71386F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 02:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71386F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="TBjUAvH2"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="emEn5VRV"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2C406713D;
 Mon, 17 Feb 2020 20:35:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 20:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=3
 /frFdDog4FFMXYLrMEqlb9W6/lavkPu4eDG9CYrLUs=; b=TBjUAvH2+r4py/WeH
 dYAXfAV4xxtqVJJvqORkLcT/xfwC5knGW4m8noq+FusysuQMjxp9A9H9lNss2gnE
 ymgEbL6i0MGS6OF8k1usR5lR+Cg9edB4Rv9Ib/c3SSX2UApy0Xa0c00d3U3ox/o9
 4Q5K9XHW/gNfqp/j/Q0WXTD/9Qke/BMjRGiRYkbaheZ+HU2Jld0d6KfqMuxhuvr/
 OFqZyDIAvhvNiue09cak608wjlJRg9VirPCiEYtWK50FUC6uOZzuW/f2ekpg6F+M
 XIm0oTZZVUAWHUScEwFvVdjHnkB6zB5DnF6H0dAARSAY8Et9XLfz0qBp6j+TO5f/
 gZcfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=3/frFdDog4FFMXYLrMEqlb9W6/lavkPu4eDG9CYrL
 Us=; b=emEn5VRVxNTBoJPTmLWomfIy5R32M8Md760VVUhJ8eGdlPLXN/bBDeAhn
 +GcRJWZ+ZcfYF+TjHHHmpxUG2qZH9XzsdXTHFcnislY/u2Fx3s+0ze1T0G/q/Nr9
 pV0YUiWSfpM1yX7Qc08gt5hHW5RUaRe0kEN7x6p4rTO0uwbJYi5mzghsgYonmo5h
 UgrwwrrjA8pjcj8qu3DprW0R2++v1uvMz4mGtCPNJ5nt4KL8Ius1gwBwa8qRoyOd
 6SvpNR9WOVvc26Rp8jw00FcSlVDTCEUoYaNwABsoBbqg4v/t6Gctsh1lsY6TtMHY
 fD5VzybJD8UZnTSBy9Lg6S1ohvpbw==
X-ME-Sender: <xms:TT9LXgMZLVK3eoy7lHkwIhGNH59zEU_eNFtjj4jAdQj4T8gzQPs2xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeejgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:TT9LXo2V3EfTC9_V2ZPSxdf994TQft8hgcC1iX8yeLmBq9K211zslw>
 <xmx:TT9LXr3xwclyYDuE7X_abSeevmEbdYeyRHoI4C0PUBnTzHN2mAuSkg>
 <xmx:TT9LXmW8Slb9DKdlRHeHD8iOTo1pmbW9sKShTs1y-AM3XGHDPHyf9A>
 <xmx:UT9LXsmgCGu_GY9u1ruN_VtYA7ZhFghMMyHEI-o8EdG6-txapHEZVQ>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88DCB3060BD1;
 Mon, 17 Feb 2020 20:35:08 -0500 (EST)
Subject: Re: [RFC PATCH 05/34] ASoC: sun8i-codec: Remove incorrect
 SND_SOC_DAIFMT_DSP_B
To: Mark Brown <broonie@kernel.org>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-6-samuel@sholland.org>
 <20200217150208.GG9304@sirena.org.uk>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <1cdcbc0d-39c7-25f2-68eb-a44e815fb9b8@sholland.org>
Date: Mon, 17 Feb 2020 19:35:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200217150208.GG9304@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Myl=c3=a8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2/17/20 9:02 AM, Mark Brown wrote:
> On Mon, Feb 17, 2020 at 12:42:21AM -0600, Samuel Holland wrote:
>> DSP_A and DSP_B are not interchangeable. The timing used by the codec in
>> DSP mode is consistent with DSP_A. This is verified with an EG25-G modem
>> connected to AIF2, as well as by comparing with the BSP driver.
>>
>> Remove the DSP_B option, as it is not supported by the hardware.
>>
>> Cc: stable@kernel.org
>> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
> 
> This can only break things for existing systems using stable, if they
> haven't noticed a problem with DSP B they'll certainly notice failing to
> set up the DAI at all without it.

Are you suggesting that I drop this patch entirely, or only that I remove the CC
to stable (and/or Fixes: tag)? Is this something that can't be removed once it's
there, or is the concern about making user-visible changes on stable?

Thanks,
Samuel
