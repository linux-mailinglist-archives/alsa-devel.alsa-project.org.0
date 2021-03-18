Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2069D34053F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 13:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9661168C;
	Thu, 18 Mar 2021 13:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9661168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616069749;
	bh=3GpCvRvdqkcgNtN8qcV0oPalO+rbvnWwS+hp/dOrMCQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCRsYD+knAPgMCT6lcVLckUECwEg5MfyrytLZpFXmvDvNb94/A8itd0h2DN7XrzBv
	 DXrQKFlVj/LppdTuXTn1tjIPGamcd7yuMNyNBQRnZBCYFVIp26NO16RD/4O1IKrDVA
	 IbsKSQd6Qnfv73GwaVcn/Ct3I9IFizCx72lS9rl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21454F800C8;
	Thu, 18 Mar 2021 13:14:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B2A8F80165; Thu, 18 Mar 2021 13:14:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E5FF800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 13:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E5FF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="vuEU5cYm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=swing;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
 Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nkRWPHh0QcwvwA8p8Hl/OGQO2W0MbT9LeHHjwKHLBiM=; b=vuEU5cYmWimhyH25Jj15e3qDf1
 xQDEf5rxrjgs3zL9ebDcm8ilDTDwf4OOWaYeqkoxOzOW/D2j3DyZVCpflQOr5ei5DwFTvIyLwOlOZ
 ljHL7pApKGpKHZlN4InDZRv6fNZHKOpC2TPGYPEjTbk4sM+EXhJO9Rn6/c1MJhWy/tMw=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
 by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1lMrXV-000BOh-Me; Thu, 18 Mar 2021 12:14:08 +0000
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id 3942d378;
 Thu, 18 Mar 2021 12:14:07 +0000 (UTC)
Date: Thu, 18 Mar 2021 12:14:07 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] conf: fix memory leak on the error path in
 parse_args()
In-Reply-To: <s5hv99pkbsk.wl-tiwai@suse.de>
Message-ID: <2103181212170.1962@stax.localdomain>
References: <2103171535560.14556@stax.localdomain>
 <s5hv99pkbsk.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Wed, 17 Mar 2021, Takashi Iwai wrote:

> On Wed, 17 Mar 2021 16:44:20 +0100,
> Mark Hills wrote:
> > 
> > Having a little trouble which bisected to this patch.
> > 
> > First noticed it's causing Chromium to crash out one of its subprocesses 
> > (stack trace below)
> > 
> > Can actually be replicated with a simple "aplay -L":
> > 
> > aplay: conf.c:2207: snd_config_delete: Assertion `config' failed.
> > Aborted (core dumped)
> 
> That patch seems to have a few flaws.
> Could you check the patch below covers it?

Thanks. Yes, the patch builds ok and resolves my two test cases (aplay and 
chromium). That's the only testing I've done so far.

> --- a/src/conf.c
> +++ b/src/conf.c
> @@ -5080,6 +5080,8 @@ static int parse_args(snd_config_t *subs, const char *str, snd_config_t *defs)
>  		const char *new = str;
>  		const char *tmp;
>  		char *val = NULL;
> +
> +		sub = NULL;
>  		err = parse_arg(&new, &varlen, &val);
>  		if (err < 0)
>  			goto _err;
> @@ -5104,6 +5106,7 @@ static int parse_args(snd_config_t *subs, const char *str, snd_config_t *defs)
>  		err = snd_config_search(subs, var, &sub);
>  		if (err >= 0)
>  			snd_config_delete(sub);
> +		sub = NULL;
>  		err = snd_config_search(def, "type", &typ);
>  		if (err < 0) {
>  		_invalid_type:
> @@ -5169,7 +5172,8 @@ static int parse_args(snd_config_t *subs, const char *str, snd_config_t *defs)
>  		err = snd_config_add(subs, sub);
>  		if (err < 0) {
>  		_err:
> -			snd_config_delete(sub);
> +			if (sub)
> +				snd_config_delete(sub);
>  			free(val);
>  			return err;
>  		}
> 
> 

-- 
Mark

