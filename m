Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286A46045B
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jul 2019 12:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E1A1699;
	Fri,  5 Jul 2019 12:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E1A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562322126;
	bh=/w4o4bRcmhyj8HBiqK8biMdColumnDqIA7lqOZONsAk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=m3bFX+2hcw2giHeuy5PMA8l7pAQcJVNSxy3lLSDa4Lt0voNIem/T+zF0wncfTAVra
	 eaVe+DQn95JAhYLbwC6nfcJHN8LWJlStpfxtYxKTTccttSiPyJncpWbMgic1N4AhEI
	 j4TpqdVWUIFnCZ4PQsquvMxi+tTwLDDB2ooOEJ4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88242F80120;
	Fri,  5 Jul 2019 12:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF22FF8011F; Fri,  5 Jul 2019 12:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx01-fr.bfs.de (mx01-fr.bfs.de [193.174.231.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C817F800E7
 for <alsa-devel@alsa-project.org>; Fri,  5 Jul 2019 12:20:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C817F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bfs.de header.i=@bfs.de header.b="MEgO1+Bf"
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
 by mx01-fr.bfs.de (Postfix) with ESMTPS id 3B5A820187;
 Fri,  5 Jul 2019 12:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901; 
 t=1562322011;
 h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqP1kDs3lKOEgjeEkVTodlom9AD19S4tR3pqY3KFtgw=;
 b=MEgO1+BfIsDQc8pOkBn3pHjvimld1+SN2KkF4yyiyTfMeQf+rqv78/hExp6loEeCMzPhwm
 cnsepRC2otgLrZ+zIgznBk5HaLartyD+FODe/ZzF++A/QfoWpk+AP9tWE5n1YHSrWZ/cnd
 Fk43qi99i8wdHamvnXeVfWnJcUD24Suc4NTenYtElyDfFHCMoua5eE4BeUibGY4D1+23hh
 C70mkmtotnNSvGi0UDt/c0JyTAWxm/mLTsGhO9K5viylXF4lGFdXMQ7zWgtnx9pZEKAD8B
 YRpAT1zkoE95ZtssTTiY6RdJoOdXjUta0y3YmBAhkFKoWPbYS5DdpTtVG8UYug==
Received: from [134.92.181.33] (unknown [134.92.181.33])
 by mail-fr.bfs.de (Postfix) with ESMTPS id CBABFBEEBD;
 Fri,  5 Jul 2019 12:20:10 +0200 (CEST)
Message-ID: <5D1F245A.7030203@bfs.de>
Date: Fri, 05 Jul 2019 12:20:10 +0200
From: walter harms <wharms@bfs.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de;
 rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To: Colin King <colin.king@canonical.com>
References: <20190705095704.26050-1-colin.king@canonical.com>
In-Reply-To: <20190705095704.26050-1-colin.king@canonical.com>
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
 HAS_REPLYTO(0.00)[wharms@bfs.de]; TO_DN_SOME(0.00)[];
 REPLYTO_ADDR_EQ_FROM(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[]; NEURAL_HAM(-0.00)[-0.999,0];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: cs4281: remove redundant assignment
 to variable val and remove a goto
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
Reply-To: wharms@bfs.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



Am 05.07.2019 11:57, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable val is being assigned with a value that is never
> read and it is being updated later with a new value. The
> assignment is redundant and can be removed.  Also remove a
> goto statement and a label and replace with a break statement.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/pci/cs4281.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/cs4281.c b/sound/pci/cs4281.c
> index a2cce3ecda6f..04c712647853 100644
> --- a/sound/pci/cs4281.c
> +++ b/sound/pci/cs4281.c
> @@ -694,7 +694,7 @@ static int snd_cs4281_trigger(struct snd_pcm_substream *substream, int cmd)
>  
>  static unsigned int snd_cs4281_rate(unsigned int rate, unsigned int *real_rate)
>  {
> -	unsigned int val = ~0;
> +	unsigned int val;
>  	
>  	if (real_rate)
>  		*real_rate = rate;
> @@ -707,9 +707,8 @@ static unsigned int snd_cs4281_rate(unsigned int rate, unsigned int *real_rate)
>  	case 44100:	return 1;
>  	case 48000:	return 0;
>  	default:
> -		goto __variable;
> +		break;
>  	}
> -      __variable:
>  	val = 1536000 / rate;
>  	if (real_rate)
>  		*real_rate = 1536000 / val;
		^^^^^^^^^^^^^^^^^^^^^^^^^

this is confusing. is
*real_rate = rate
intended here ? (like above)

val could be eliminated by using

return  1536000 / rate ;

re,
 wh
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
