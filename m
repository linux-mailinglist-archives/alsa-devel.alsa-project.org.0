Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49279210E40
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 17:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB997168A;
	Wed,  1 Jul 2020 17:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB997168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593615707;
	bh=Gce+JZ/VP/h7PUqZUfULwbk1d/xPBTFpEuxQlDw0t54=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hK0Xt22d40HCoEpPmMJbwYLWUJx26Qt0VtyEAtl6IdHveChcOWKk4BH0/217OJRs7
	 CCcZbOXR906Wvwme4H0+iV5k+tHuSFsof3mLTi6ZLzZxY31vepgeBWcn91RXukfiX+
	 gW1NRDsvsNrmJq9X1FAWeMux5y51Mk4Jy56fsaIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00077F801D8;
	Wed,  1 Jul 2020 17:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52ED8F80217; Wed,  1 Jul 2020 17:00:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5250CF800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 16:59:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5B584A003F;
 Wed,  1 Jul 2020 16:59:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5B584A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593615591; bh=xgS5T6PJMHWeWU1UIjIZqI7AINN7zXfdmNmgg9xlzg0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=zCfEXAY9HFe52/pRp5j3lTuZpdgdF+djXju6hrhBuo/HEgyebTaPwDJQbL042Wlvl
 gTBjQeVfMa8OhKwK3NlYXDqVdG72YdoY8YOGRk1zJG094rXE1RhWpUupyQQ1f0PezL
 lVBHjbL4jB3glBaGoeXYRltV1SvlImEyFiIzgUgw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  1 Jul 2020 16:59:49 +0200 (CEST)
Subject: Re: [PATCH alsa-lib v2 0/2] Make dmix lockless operation optional
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200623154931.27755-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <2211b9f9-fdf0-80dd-0742-f5b91b9f3ccd@perex.cz>
Date: Wed, 1 Jul 2020 16:59:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623154931.27755-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Dne 23. 06. 20 v 17:49 Takashi Iwai napsal(a):
> Hi,
> 
> this is a revised patch set for the PCM dmix, to make the lockless
> operation optional and fix the semaphore usage in the lockless mode.
> 
> Unfortunately I got a server problem in the last week and lost many
> posts during the weekend, so I couldn't follow up to the thread (I
> just read from the lore archive).
> 
> In this patch set, to make my intention clearer, I swapped the
> patches: the first to disable the lockless operation as default and
> the second to fix the semaphore usage in the lockless mode.
> 
> In the first patch, the magic number is changed as Jaroslav suggested,
> and the description has been updated.  The second patch is equivalent
> with the previous one.

All looks good now, thanks:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

				Jaroslav

> 
> 
> thanks,
> 
> Takashi
> 
> ===
> 
> Takashi Iwai (2):
>    pcm: dmix: make lockless operation optional
>    pcm: dmix: Fix semaphore usage with lockless operation
> 
>   configure.ac               | 13 +++++++++++++
>   src/pcm/pcm_direct.c       | 16 +++++++++++++---
>   src/pcm/pcm_direct.h       |  1 +
>   src/pcm/pcm_dmix.c         | 18 +++++++++++-------
>   src/pcm/pcm_dmix_generic.c |  2 +-
>   src/pcm/pcm_dmix_i386.c    |  1 +
>   src/pcm/pcm_dmix_x86_64.c  |  1 +
>   7 files changed, 41 insertions(+), 11 deletions(-)
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
