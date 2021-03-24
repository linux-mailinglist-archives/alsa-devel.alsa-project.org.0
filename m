Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB51347FD3
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 18:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87214166E;
	Wed, 24 Mar 2021 18:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87214166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616608421;
	bh=ahq5xV6ErNi302Et72HHppIcgTNmry8oKxpGagPYPxE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ni31yVgMxEu+sQurTC9/yHqnw2LUpmP+s/N6WA7IFHIVgG68RCugddjpxYwE3AIEy
	 1+QZcawyJMOslXAV8CE6xNPHmDosU4VBRdiyS5npNkcwq3Zps7snamPOiDThuD4evD
	 lt0Txy9K59W+yz9WAqtEOlIzn9x2+93dWjdFmnCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1123F801D5;
	Wed, 24 Mar 2021 18:52:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BC1CF8016B; Wed, 24 Mar 2021 18:52:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CD68F8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 18:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CD68F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="rafG6BzZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=cWD1YkAT602Bo4ovvV2QDn6jkJrROrkUMXV1Y4u1zvo=; b=rafG6BzZ8GeOVQwTMWlD9nvQjW
 S3i5Xkk1WjYAT74bBSg5+zjx5LgImQVIdrIfRhqNKLlTOfmgXn6Rh+rnxhrpJ8S4cQL767+IUPrGn
 +NojTCgFP5waIB35XQf30goq9Psg5AuDtucB+Ue8w9b40pE++dOGozNlgpYpd9SQki+8jJSmuDz1x
 DwJskEuaZAsW0O7qwzWGpRbH4PUTHjQZztGCssPkr5QP3XRy986b2BiGNwBuRRJ4VSxXwVzwPc2dQ
 1SLhlvabLE40l4ky1kbQIhLc/x4Vfu0ZlQ2/OjJmRnIQfhvZgvUYXGvaFIo3Ez9uTl6BeD8ADU2sO
 F1agfxAw==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lP7ex-00Beb1-Cw; Wed, 24 Mar 2021 17:51:29 +0000
Subject: Re: [PATCH] ALSA: pcm: A typo fix
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, perex@perex.cz,
 tiwai@suse.com, broonie@kernel.org, mirq-linux@rere.qmqm.pl,
 lars@metafoo.de, joe@perches.com, huawei@kernel.org,
 viro@zeniv.linux.org.uk, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20210324065612.31362-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6d2e91a2-a013-c9b1-8725-1715253d0646@infradead.org>
Date: Wed, 24 Mar 2021 10:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324065612.31362-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 3/23/21 11:56 PM, Bhaskar Chowdhury wrote:
> 
> s/unconditonally/unconditionally/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  sound/core/pcm_native.c | 80 ++++++++++++++++++++---------------------
>  1 file changed, 40 insertions(+), 40 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 17a85f4815d5..9884961bca7d 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> 
> -	return 0; /* unconditonally stop all substreams */
> +	return 0; /* unconditionally stop all substreams */
>  }
> 
> --

Please fix line 1472 (in linux-next) while you are touching this file:

 * Return: Zero if succesful, or a negative error code.


-- 
~Randy

