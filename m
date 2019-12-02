Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042410EE9B
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D2F165F;
	Mon,  2 Dec 2019 18:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D2F165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575308432;
	bh=E+5goV+ysdJ+VxLou/muJW4BA/bhwXXl3FwIIeGrzyk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YCAuoYqYCewUuAvQYyumK9lO2RnoN3XdG0AJnVo8bJFSfsBFjOk1mP1pP9i/4VSEP
	 L78IXFzNBuZ6CQ9EDgUAMntTb/ifgY1gTAbq5BrV4pGXz8en4NCkjbN6LKd/7DQ2LK
	 CHDUOM2+xFKF7GZmcyZLZmQLIcIeOl2Ssgx1ooB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10781F801D9;
	Mon,  2 Dec 2019 18:38:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B852EF80214; Mon,  2 Dec 2019 18:38:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F8DF800B4
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F8DF800B4
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id F35B03C0597;
 Mon,  2 Dec 2019 18:38:36 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZ4Jx6L_J6h4; Mon,  2 Dec 2019 18:38:30 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 648993C003B;
 Mon,  2 Dec 2019 18:38:30 +0100 (CET)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0;
 Mon, 2 Dec 2019 18:38:30 +0100
Date: Mon, 2 Dec 2019 18:38:27 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Message-ID: <20191202173827.GA13630@vmlxhi-102.adit-jv.com>
References: <20191202155834.22582-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191202155834.22582-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1+40 (7f8642d4ee82) (2019-06-28)
X-Originating-IP: [10.72.93.184]
Cc: Nilkanth Ahirrao <external.anilkanth@jp.adit-jv.com>,
 alsa-devel@alsa-project.org, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: rsnd: Calculate DALIGN inversion at
	run-time
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

Hi Geert,

On Mon, Dec 02, 2019 at 04:58:34PM +0100, Geert Uytterhoeven wrote:
> There is no need to store the inverted DALIGN values in the table, as
> they can easily be calculated at run-time.  This also protects against
> the introduction of inconsistencies between normal and inverted values
> by a future table modification.
> 
> Reorder the two subexpressions in the AND check, to perform the least
> expensive check first.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

> ---
> Compile-tested only.
> 
> Interestingly, this decreases code size on arm64, but increases on arm32
> (both gcc version 7.4.0 (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1)).
> 
> arm32:
> 
>        text	   data	    bss	    dec	    hex	filename
>       16186	    276	     84	  16546	   40a2	sound/soc/sh/rcar/core.o.orig
>       16194	    276	     84	  16554	   40aa	sound/soc/sh/rcar/core.o
> 
> arm64:
> 
>        text	   data	    bss	    dec	    hex	filename
>       17426	    392	    104	  17922	   4602	sound/soc/sh/rcar/core.o.orig
>       17414	    392	    104	  17910	   45f6	sound/soc/sh/rcar/core.o
> ---
>  sound/soc/sh/rcar/core.c | 31 +++++++++++++------------------

jFTR, using ARM's aarch64 gcc-8.3-2019.03 and v5.4-10271-g596cf45cbf6e:

$ size sound/soc/sh/rcar/core.o.before sound/soc/sh/rcar/core.o.after
   text	   data	    bss	    dec	    hex	filename
  21433	    380	     88	  21901	   558d	sound/soc/sh/rcar/core.o.before
  21505	    380	     88	  21973	   55d5	sound/soc/sh/rcar/core.o.after

>  1 file changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> index 399dc6e9bde5b042..d20f03dfdee66643 100644
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -376,20 +376,15 @@ u32 rsnd_get_adinr_bit(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
>   */
>  u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
>  {
> -	static const u32 dalign_values[8][2] = {
> -		{0x76543210, 0x67452301},
> -		{0x00000032, 0x00000023},
> -		{0x00007654, 0x00006745},
> -		{0x00000076, 0x00000067},
> -		{0xfedcba98, 0xefcdab89},
> -		{0x000000ba, 0x000000ab},
> -		{0x0000fedc, 0x0000efcd},
> -		{0x000000fe, 0x000000ef},
> +	static const u32 dalign_values[8] = {
> +		0x76543210, 0x00000032, 0x00007654, 0x00000076,
> +		0xfedcba98, 0x000000ba, 0x0000fedc, 0x000000fe,

FWIW, using below test procedure, I can reconstruct the original
two-dimensional dalign_values[8][2] array on the host:

#include <stdio.h>
#include <stdint.h>

typedef uint32_t u32;

void main(void)
{
	u32 dalign, i;

	static const u32 dalign_values[8] = {
		0x76543210, 0x00000032, 0x00007654, 0x00000076,
		0xfedcba98, 0x000000ba, 0x0000fedc, 0x000000fe,
	};

	for (i = 0; i < 8; i++) {
		u32 keep = dalign = dalign_values[i];
		dalign = (dalign & 0xf0f0f0f0) >> 4 |
			 (dalign & 0x0f0f0f0f) << 4;
		printf("{0x%08x, 0x%08x},\n", keep, dalign);
	}
}

-- 
Best Regards,
Eugeniu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
