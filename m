Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA463F0EAF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 01:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4082716AB;
	Thu, 19 Aug 2021 01:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4082716AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629329899;
	bh=5Lj0Qxd8zsNRLRPROniWdCTodJIrsY34z78eCvvVxrY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TqZDaAt27Cz0d2m+Y2GAGT1iJbYRs2uBT74iCtqW4J6YnVWkDPRuO01RPu4dlnN0q
	 F8dKem7yXCDSUp3t/a3BMPdm2vAy18+hJ8sCBox0xRpNTIi15gdr9coQROGCPI+td8
	 FSHH1DWe27665efs1nhzZzLVEECewrpoSODwi088=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC80F80259;
	Thu, 19 Aug 2021 01:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F14FF80249; Thu, 19 Aug 2021 01:36:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2733EF80169
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 01:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2733EF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nLxnwZJL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CC5C60EB5;
 Wed, 18 Aug 2021 23:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629329807;
 bh=5Lj0Qxd8zsNRLRPROniWdCTodJIrsY34z78eCvvVxrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nLxnwZJLUOmBhQ1Jm2pMwV/E+UGgOMHN0ZdWu48WnJ/IXn+ezvzTU8grz6CTMWFTV
 NMAmOff0Crf6iOsxlyN/M6usuHa6efFi8krzM/SjW9fgcq6yuQ1D02UGzOkBisNo1w
 t9mVRjleLX7QuT9Cx/zkrOvY1TMS5tQKOR4tSa7kiPGW1rWFLIFi9MzF3+UG6KSts4
 deK8U8s/BHF9v23q5NDc3i/xdODc/L1xf0jlbEk5EoTI/tAWytg9wY5ZfY/3ToYjzM
 SpBZjdZePHqUVYnnTdwUvTptnmkDk2Nh1WU/vHOiQpVd2GWmz3bk+oiQfdc3z8CSgi
 GZYVb9hbyyIig==
Date: Thu, 19 Aug 2021 08:36:44 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] ASoC: uniphier: make arrays mul and div static const,
 makes object smaller
Message-Id: <20210819083644.6c88a29eef5926eca76cffcb@kernel.org>
In-Reply-To: <20210818151746.38520-1-colin.king@canonical.com>
References: <20210818151746.38520-1-colin.king@canonical.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Wed, 18 Aug 2021 16:17:46 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the arrays mul and div on the stack but instead make them
> static const. Makes the object code smaller by 4 bytes.
> 
> Before:
>    text    data     bss     dec     hex filename
>   16226    4984      64   21274    531a ./sound/soc/uniphier/aio-cpu.o
> 
> After:
>    text    data     bss     dec     hex filename
>   16062    5144      64   21270    5316 ./sound/soc/uniphier/aio-cpu.o
> 
> (gcc version 10.2.0)

This looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/uniphier/aio-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
> index cf9814130067..4e8d5f7532ba 100644
> --- a/sound/soc/uniphier/aio-cpu.c
> +++ b/sound/soc/uniphier/aio-cpu.c
> @@ -128,8 +128,8 @@ static const struct uniphier_aio_spec *find_spec(struct uniphier_aio *aio,
>  static int find_divider(struct uniphier_aio *aio, int pll_id, unsigned int freq)
>  {
>  	struct uniphier_aio_pll *pll;
> -	int mul[] = { 1, 1, 1, 2, };
> -	int div[] = { 2, 3, 1, 3, };
> +	static const int mul[] = { 1, 1, 1, 2, };
> +	static const int div[] = { 2, 3, 1, 3, };
>  	int i;
>  
>  	if (!is_valid_pll(aio->chip, pll_id))
> -- 
> 2.32.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
