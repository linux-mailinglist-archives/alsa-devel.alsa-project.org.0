Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A3A1C99
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D70F1699;
	Thu, 29 Aug 2019 16:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D70F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088548;
	bh=gngkZjmeCkE/Ast/3eWhG1FLMJMbValbdUSoWSTq3vU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+AMlXxKIl0y7r1UaNtNR2TRDjB+LjY3jiKgF0xze+8YIJBsl8GtfL27b0aAdvyru
	 UbB/d2OmJ+ZYl3ZfhyVbxmrkKg/j9F8p7jWm0XxAAPTFObapc59s5JGYeAdZeMDNhQ
	 qlnbN5dRNipNwzmaPG3/VHt2iRILcqgqFtdybjqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96747F896B2;
	Wed, 28 Aug 2019 07:58:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7DEEF802BC; Mon, 26 Aug 2019 11:30:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 637BDF8014A
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 637BDF8014A
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id C77E13C057C;
 Mon, 26 Aug 2019 11:30:41 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iszw9UR9EpzT; Mon, 26 Aug 2019 11:30:36 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 13EEE3C00C5;
 Mon, 26 Aug 2019 11:30:36 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 26 Aug 2019 11:30:35 +0200
Date: Mon, 26 Aug 2019 11:30:32 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190826093032.GA24143@vmlxhi-102.adit-jv.com>
References: <877ebi1v1e.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877ebi1v1e.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
X-Mailman-Approved-At: Wed, 28 Aug 2019 07:58:24 +0200
Cc: Timo Wischer <twischer@de.adit-jv.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rsnd: fixup 6ch settings to 8ch
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

Hello Morimoto-san,

We've been reviewing this patch in the context of Renesas-Yocto-v3.21.0
BSP integration, where it is contained as commit [1].

On Thu, Apr 25, 2019 at 03:16:58PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> rsnd need to use 8ch clock settings for 6ch for TDM.
> Otherwise, it can't work correctly.
> This patch fixup it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sh/rcar/core.c | 18 +++++++++++++-----
>  sound/soc/sh/rcar/rsnd.h |  1 +
>  sound/soc/sh/rcar/ssi.c  |  2 ++
>  3 files changed, 16 insertions(+), 5 deletions(-)

[..]

> diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
> index f5afab6..44bda21 100644
> --- a/sound/soc/sh/rcar/ssi.c
> +++ b/sound/soc/sh/rcar/ssi.c
> @@ -303,6 +303,8 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
>  	if (rsnd_runtime_is_tdm_split(io))
>  		chan = rsnd_io_converted_chan(io);
>  
> +	chan = rsnd_channel_normalization(chan);
> +

Since the "chan" value is already normalized by calling:
 => rsnd_ssi_master_clk_start()
  => chan = rsnd_runtime_channel_for_ssi(io)
   => rsnd_runtime_channel_for_ssi_with_params()
    => rsnd_channel_normalization()

I was wondering if it is really required to call
rsnd_channel_normalization() second time in ssi.c for fixing the issue
described in this patch?

>  	main_rate = rsnd_ssi_clk_query(rdai, rate, chan, &idx);
>  	if (!main_rate) {
>  		dev_err(dev, "unsupported clock rate\n");

[1] https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/?id=54721f595654
   ("ASoC: rsnd: fixup 6ch settings to 8ch")

-- 
Best Regards,
Eugeniu.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
