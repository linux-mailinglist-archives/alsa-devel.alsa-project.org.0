Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BC20A1AD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 17:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8408A18F9;
	Thu, 25 Jun 2020 17:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8408A18F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593098206;
	bh=HxXVc0zx3DH5l7+/pZDDD/uAY4Op4pDocPH+3k2E6cY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVX3Nk7H4ucjC7jL1GqbDaY1u7eZF+BIN4H1Yx4/RLFgw2UIjOsh5jmlIVaoN+zYD
	 UK9JL+JVTNADeFyX4TGZfFlKgTmITect93SOHFtm/wOw9cfZlktPIhf9YDueqQBlac
	 qTOdkM2ziPLuXoKB5qYgm1V1isTtIGR7atSmrNXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00DD8F802BC;
	Thu, 25 Jun 2020 17:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43604F802A1; Thu, 25 Jun 2020 17:13:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F85F80218
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 17:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F85F80218
IronPort-SDR: 0J/99ZFKyoimDFqDEy+UHyay8DD+SRwdvJjbM06G4nJLDKzQsaYKG38YdFa2ZMuYiL+ylwTKGl
 NoshYnQW7tgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="163016165"
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="163016165"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:13:11 -0700
IronPort-SDR: WvToeqrkXALUQFs1ucst3TAJL5/sDiBosGIIWLDL3yoeyu/ZrfWCJfG8jCJXSMdo2/Yjhvz7AT
 UsQ2GxadByeQ==
X-IronPort-AV: E=Sophos;i="5.75,279,1589266800"; d="scan'208";a="279835696"
Received: from jmgutiex-mobl.amr.corp.intel.com (HELO [10.251.16.15])
 ([10.251.16.15])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 08:13:11 -0700
Subject: Re: [PATCH alsa-lib 8/8] topology: Make buffer for saving dynamic size
To: Piotr Maziarz <piotrx.maziarz@linux.intel.com>, alsa-devel@alsa-project.org
References: <1593083026-7501-1-git-send-email-piotrx.maziarz@linux.intel.com>
 <1593083026-7501-8-git-send-email-piotrx.maziarz@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d764d947-ed85-1d66-ed4f-701b30d1e0a7@linux.intel.com>
Date: Thu, 25 Jun 2020 09:31:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1593083026-7501-8-git-send-email-piotrx.maziarz@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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



On 6/25/20 6:03 AM, Piotr Maziarz wrote:
> Some fields can exceed size limit, e.g. private data has no size
> restriction. Therefore it needs to be dynamically increased.
> 
> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> ---
>   src/topology/save.c | 36 ++++++++++++++++++++++++++++++------
>   1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/src/topology/save.c b/src/topology/save.c
> index 4ecf86c..d6ee8b6 100644
> --- a/src/topology/save.c
> +++ b/src/topology/save.c
> @@ -19,22 +19,43 @@
>   #include "tplg_local.h"
>   
>   #define SAVE_ALLOC_SHIFT	(13)	/* 8192 bytes */
> +#define PRINT_BUF_SIZE		(1024)
> +#define PRINT_BUF_SIZE_MAX	(1024 * 1024)
>   
>   int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
>   {
>   	va_list va;
> -	char buf[1024], *s;
> -	size_t n, l, t, pl;
> +	char *buf, *s;
> +	size_t n, alloc_size = PRINT_BUF_SIZE, l, t, pl;
> +	int ret = 0;
> +
> +	buf = malloc(alloc_size);
> +	if (!buf)
> +		return -ENOMEM;
>   
>   	if (pfx == NULL)
>   		pfx = "";
>   
> +again:
>   	va_start(va, fmt);
> -	n = vsnprintf(buf, sizeof(buf), fmt, va);
> +	n = vsnprintf(buf, alloc_size, fmt, va);
>   	va_end(va);
>   
> -	if (n >= sizeof(buf))
> -		return -EOVERFLOW;
> +	if (n >= PRINT_BUF_SIZE_MAX) {
> +		ret = -EOVERFLOW;
> +		goto end;
> +	}

what this patch does is change the allocation limit from 1KB to 1MB, but 
the data still has no size restriction. At what point do we decide to 
throw an error?

> +
> +	if (n >= alloc_size) {
> +		char *tmp = realloc(buf, n + 1);
> +		if (!tmp) {
> +			ret = -ENOMEM;
> +			goto end;
> +		}
> +		buf = tmp;
> +		alloc_size = n + 1;
> +		goto again;
> +	}
>   
>   	pl = strlen(pfx);
>   	l = *dst ? strlen(*dst) : 0;
> @@ -47,7 +68,8 @@ int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
>   		if (s == NULL) {
>   			free(*dst);
>   			*dst = NULL;
> -			return -ENOMEM;
> +			ret = -ENOMEM;
> +			goto end;
>   		}
>   	} else {
>   		s = *dst;
> @@ -57,6 +79,8 @@ int tplg_save_printf(char **dst, const char *pfx, const char *fmt, ...)
>   		strcpy(s + l, pfx);
>   	strcpy(s + l + pl, buf);
>   	*dst = s;
> +end:
> +	free(buf);
>   	return 0;
>   }
>   
> 
