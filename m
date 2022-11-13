Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D796272BA
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Nov 2022 22:30:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F21515E2;
	Sun, 13 Nov 2022 22:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F21515E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668375002;
	bh=gYOoSXtmEF2W9EDi8ZReCtK/d9sDuVWJ8mi9JMk5pdU=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thSdirI7OejX5jvl1RtA5x+rrItpf//uL1/IfTCIUrx229KlY8EA99Tu+BVq+LScP
	 pUmd1sZ5h3nqGlJ/9Gbc7uvnvpBYEBSfjoSMI12NEsYY1ZQ5nmrQZ6lh9pCG77T+Hv
	 jFWw5zQArhu4nTxCM1wi/rEfxbaG9hb3GmDwCtRE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940ECF80425;
	Sun, 13 Nov 2022 22:29:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 567E2F8030F; Sun, 13 Nov 2022 22:29:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6ED8F80085
 for <alsa-devel@alsa-project.org>; Sun, 13 Nov 2022 22:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6ED8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="PvZonr4P"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="p2zn5sA4"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 06A6F5C0049;
 Sun, 13 Nov 2022 16:28:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 13 Nov 2022 16:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668374930; x=
 1668461330; bh=DKRADKismR+EALDLxnUsDhSyAvnnS4TZCWXbLtxP85E=; b=P
 vZonr4P5dZQMqyzopHHAON92z8PXU8ODFraRxBVGhJjVAMScqayapfuk2fExcyaL
 iNUfWfWkWOqSJY6o2IU6ZxCURZetu8PALgJi6AhP6l4Mnv/p40e0r6asE78QJUct
 zDGJrqz+iFTHvqZ6fThcCLaxpAuJUwX4PXgAWpE17/hABwWlrKL3CLfi9XHGH+x3
 h4RrLF2Sf4Uyy9K0qos1N/qq7L17WxSWLLigiww+RopdqBv/kXjUnrjZCqKhMckY
 AnURrE9lK2Wr4WHw6BOUDIZgZWBhUGlyN3XOrid4G5a6zP/IfVxIzg2kr7a91umd
 onHTIVRnrDiL568OcL6hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668374930; x=
 1668461330; bh=DKRADKismR+EALDLxnUsDhSyAvnnS4TZCWXbLtxP85E=; b=p
 2zn5sA4iwx6UablgjPYSbLC9AS5h/h+iXMTUIlmLylK2iDDfKlelWnZEdQP8knl2
 QN7NZCSXDP7jywZOQ0JxxuV2gbIf9hVTC51LMxhbGbpbIIkTSRVyWVs5+Mbv+pVJ
 MQPRcukD1kTbkgp6FDH5NRnOTqVqCGWMJvPogQwq/giz6fQVpY6XedWbY0D4ng1Q
 yklicX5P83ded+A3n+t9cik8a1HJ634JrHUHzSlpCHxO0T0HVscOFY4elLAoyThY
 oO4aR1kZHH3TUxEX3wf4qcAaUI7I2GYiXKVNeu9sdkxPVJwEwNU8Ax+uNXxfXLyG
 rt0o1kJIO7hr+T4tDl6JQ==
X-ME-Sender: <xms:kWFxY66RcxmWIpRMZVgv0NbJKVBzryU-AXT2j9TDJ-L_dzvbGeJLoA>
 <xme:kWFxYz53dSNPJVHaPuki399rJrXPLz58VbXftQ7snkTDDxSuux1jdkb6j4qI1XqX-
 tkt8-reHYFwqwSAMQ>
X-ME-Received: <xmr:kWFxY5fRrUpPHInFDURD68NVCNwDVlCMtVDpf3gsasAHEP0kaFdMZ5bTMqyRYbuTgepnSVrH0q4dFkXpEp-uyGw8-nzy9eQoS2kmgPGf5rJwnr0Pb-ogWd7xYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedtgdduhedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfgfvvehfhffujggtgfesth
 ejredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
 sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepjefgfffhudejfedtue
 dugeeutdetgfeiteffffehjeeugfeuvdehjeetfedtffdtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnug
 drohhrgh
X-ME-Proxy: <xmx:kWFxY3JTZ2SUjEeZfHnCGar4j25PiW-rzBla_3HIOB8E1UjHUOH9PA>
 <xmx:kWFxY-K3UpoyNy4j4gDzUwxp2iIUaH-V4mEZcaLttrIr4Q0608SCPw>
 <xmx:kWFxY4zzqwdKXm_idDnksR4Mwejk9MmZJD9RHmVMdGGHfiaTUxtyxg>
 <xmx:kmFxY_pMQyZEiMlp_UlR8jR0iaS8O1ibmN6ezktYrFv4EM5BJq9psQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 16:28:48 -0500 (EST)
Message-ID: <c1564dfb-b092-d8ae-8600-0cab7f99b2ae@sholland.org>
Date: Sun, 13 Nov 2022 15:28:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: ye.xingchen@zte.com.cn, fengzheng923@gmail.com
References: <202211111641514826535@zte.com.cn>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] ASoC: sunxi: use devm_platform_get_and_ioremap_resource()
In-Reply-To: <202211111641514826535@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 chi.minghao@zte.com.cn, lgirdwood@gmail.com, broonie@kernel.org,
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

On 11/11/22 02:41, ye.xingchen@zte.com.cn wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  sound/soc/sunxi/sun50i-dmic.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Samuel Holland <samuel@sholland.org>

