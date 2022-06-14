Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585BC54ADDD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:00:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09C417C9;
	Tue, 14 Jun 2022 11:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09C417C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655200810;
	bh=JxCOr4CBa8MxarjHXDy96mqlbrD/Rvj5+PCsLL2ECgA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyab35FWS8lih7on4dUPB5oIfScBPglejlVAD7j78AkHY/bg3HdOwjcT+ubkKSdVa
	 MKgUii3qJmFsiqMw1gLXeG9qhCQZcU4mSVaevlfZcuEy2tgRXJWGMJV8wmG5Qv6cRO
	 1hgM7cBAbK4yWIEu6rsBCWm8Eq3Tl06RM2q5Gizc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2214BF800E1;
	Tue, 14 Jun 2022 11:59:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B811F80139; Tue, 14 Jun 2022 11:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F5B8F8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 11:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F5B8F8012B
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hi1smtp01.de.adit-jv.com (Postfix) with ESMTPS id AC41A5201FA;
 Tue, 14 Jun 2022 11:58:57 +0200 (CEST)
Received: from lxhi-065 (10.72.94.27) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Tue, 14 Jun
 2022 11:58:57 +0200
Date: Tue, 14 Jun 2022 11:58:51 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH] ALSA: pcm: Test for "silence" field in struct
 "pcm_format_data"
Message-ID: <20220614095851.GA4199@lxhi-065>
References: <20220409012655.9399-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220409012655.9399-1-fmdefrancesco@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.27]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Cc: alsa-devel@alsa-project.org, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com,
 Mark Brown <broonie@kernel.org>, naveenkumar.sunkari@in.bosch.com
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

Hello Fabio, hello All,

On Sa, Apr 09, 2022 at 03:26:55 +0200, Fabio M. De Francesco wrote:
> Syzbot reports "KASAN: null-ptr-deref Write in
> snd_pcm_format_set_silence".[1]
> 
> It is due to missing validation of the "silence" field of struct
> "pcm_format_data" in "pcm_formats" array.
> 
> Add a test for valid "pat" and, if it is not so, return -EINVAL.
> 
> [1] https://lore.kernel.org/lkml/000000000000d188ef05dc2c7279@google.com/
> 
> Reported-and-tested-by: syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
> 
> I wasn't able to figure out the commit for the "Fixes:" tag. If this patch
> is good, can someone please help with providing this missing information?
> 
>  sound/core/pcm_misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> index 4866aed97aac..5588b6a1ee8b 100644
> --- a/sound/core/pcm_misc.c
> +++ b/sound/core/pcm_misc.c
> @@ -433,7 +433,7 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
>  		return 0;
>  	width = pcm_formats[(INT)format].phys; /* physical width */
>  	pat = pcm_formats[(INT)format].silence;
> -	if (! width)
> +	if (!width || !pat)
>  		return -EINVAL;
>  	/* signed or 1 byte data */
>  	if (pcm_formats[(INT)format].signd == 1 || width <= 8) {

JFYI, PVS-Studio 7.19 reports:

sound/core/pcm_misc.c	409	warn	V560 A part of conditional expression is always false: !pat.

I haven't fully validated the finding, but it appears to be legit,
since the pointer variable (as opposed to the contents behind the
pointer) is always non-null, hence !pat always evaluating to false.

If the above is true, then the patch likely hasn't introduced any
regression, but also likely hasn't fixed the original KASAN problem.

Or are there alternative views?

BR, Eugeniu.
