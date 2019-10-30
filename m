Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF020E9A62
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 11:51:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 798C52187;
	Wed, 30 Oct 2019 11:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 798C52187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572432719;
	bh=v9TyFp6cr81bmVz/ZEjfN+uN5TsgYFmwiPwS4g2/2wQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TbLK+twm7tx5t8vda26j3l4hp4whse5nneEZrBziopkFY/6R5jJD+kK/Naj4xynD5
	 M2FzNgkmbQjII2xfO04HBkxtkdfFfRoP4fZH/4TywXvze4/qgMFAZ+PObFeN5unTAI
	 xH1MNBq6a9SXIBRtTq80H0ZloIdioHOZghyGVjBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCEDFF802BD;
	Wed, 30 Oct 2019 11:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D572F80361; Wed, 30 Oct 2019 11:50:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1120CF802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 11:50:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1120CF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Dz+JJHKf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YVXnjnbt"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2AB9B21857;
 Wed, 30 Oct 2019 06:50:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 30 Oct 2019 06:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=CCPsVNDGGwm0FSgvGD/QsDzdTaT
 m0U4wKUVI64Rle5c=; b=Dz+JJHKfyczo7tqVVG/F5Jdu2x0LC7p+P7p3o/V9y1f
 I/nH+er7/HRF+R84rzExCAv5aoJe99FU8Tx84ntdTxRWmoTc2DKZtHHaXJ3LAw0M
 aXMkhiA/UpPokZGAY013cnXZQEdcx8nUbKAIfB8IOfhVosRw6ScuBxQ52eBG0Cr4
 CmTJNARhKMfUdUQvYEgwtCbpSLsNFwTL/EwVuwF2onVc5dKje6C3e5zCp7cvOROm
 DqijtsS5DwQyQk4gE/n2E822YXIMxEB0QEByVm/1MeByLqAPO05OJQ1J92py4LFR
 NjCB1VZmnPAE3SPQsRBXdvLRznH2mxjBG6Ni3DBAahA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CCPsVN
 DGGwm0FSgvGD/QsDzdTaTm0U4wKUVI64Rle5c=; b=YVXnjnbtiI4TG4V4RqY0/L
 jN5A6/lSja/4SHg7W5bQgCxFBRND+QRwGRNXxyWoNwgDn4VYGbz8onaVwX7/NtpK
 tJqt45zVOaf/7eK06Ihddj6pyFg0x1uP1cYZK3FMeV1+k82sj4qBD06NqclfEQjn
 6/AZxlpBKLtsAQClkV3+Y4P8Bbfb05on97/THa8AfPqImJgF7HT2wxfS3pdvcDRC
 yTHd0M58RFKcmaxUZkNC8VpyO+VrKbYjjb4G8vMtNJlK9VFGBRxERM9wAmQJjnkv
 P6aABtruuZAfszI3IQmw+WqFV3jYzpRp5/xMR8dbxsRIU1DWanlZ9A9V6ScnMATA
 ==
X-ME-Sender: <xms:3mq5XZUDs2k2H_nn4u66-nqmTq4494eNrydKK7vFeVJ-idZrLuJcjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddtfedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:3mq5XRsVGRZLEW6-SJ0ZliXlWAfBs4hF9-5MWImhymwUmbzqAOgKoQ>
 <xmx:3mq5XYTy3AQuySjXOMlhMyEj7uXFTq1WUkG1ieowJOaR8hPHwDnC3w>
 <xmx:3mq5XSnaN5lwn0D3aM892u3asfCxwNBrqz0_nh9HcIpteInJiVShjQ>
 <xmx:32q5XXbCuqAR8BpyMkr0tzSI5f-63ZSOwoFQJAaIUJ_Q97jC0z3fug>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id D779C80070;
 Wed, 30 Oct 2019 06:50:04 -0400 (EDT)
Date: Wed, 30 Oct 2019 19:50:02 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191030105001.GA6313@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Clemens Ladisch <clemens@ladisch.de>, alsa-devel@alsa-project.org
References: <20191030100921.3826-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030100921.3826-1-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [alsa-devel] [PATCH] ALSA: firewire-motu: Correct a typo in the
 clock proc string
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, Oct 30, 2019 at 11:09:21AM +0100, Takashi Iwai wrote:
> Just fix a typo of "S/PDIF" in the clock name string.
> 
> Fixes: 4638ec6ede08 ("ALSA: firewire-motu: add proc node to show current statuc of clock and packet formats")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/motu/motu-proc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/motu/motu-proc.c b/sound/firewire/motu/motu-proc.c
> index b47ba818343f..187f6abd878c 100644
> --- a/sound/firewire/motu/motu-proc.c
> +++ b/sound/firewire/motu/motu-proc.c
> @@ -16,7 +16,7 @@ static const char *const clock_names[] = {
>  	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT] = "S/PDIF on optical interface",
>  	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_A] = "S/PDIF on optical interface A",
>  	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_OPT_B] = "S/PDIF on optical interface B",
> -	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX] = "S/PCIF on coaxial interface",
> +	[SND_MOTU_CLOCK_SOURCE_SPDIF_ON_COAX] = "S/PDIF on coaxial interface",
>  	[SND_MOTU_CLOCK_SOURCE_AESEBU_ON_XLR] = "AESEBU on XLR interface",
>  	[SND_MOTU_CLOCK_SOURCE_WORD_ON_BNC] = "Word clock on BNC interface",
>  	[SND_MOTU_CLOCK_SOURCE_SPH] = "Source packet header",
> -- 
> 2.16.4

Oops, indeed.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
