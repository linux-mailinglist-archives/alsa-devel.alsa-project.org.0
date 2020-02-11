Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96A158D59
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 12:15:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55F2F1668;
	Tue, 11 Feb 2020 12:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55F2F1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581419729;
	bh=9mQ9U3rokZN36ydw1KPxowGw0tuPSDrVOcPKSw8K4sw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aewVKo/xQBs6/RDWUa6rj90gduG1b/bkgKwgy7HPt/QV3GGthgOre9B3Ojo3sRI2j
	 919ConCmpbrWsA6RaOr+ifKurl/IoL5nveOiW/9XpriLHRejel5ToqaYCYyKR4unmV
	 YWeu6UvaPASCJI4QT1tKY756UEBLzMBz0PKHAzQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CB82F80146;
	Tue, 11 Feb 2020 12:13:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AAF3F80145; Tue, 11 Feb 2020 12:13:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C125F800F0;
 Tue, 11 Feb 2020 12:13:42 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A714FA003F;
 Tue, 11 Feb 2020 12:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A714FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581419621; bh=93dcy1ASdaTdET66E6qZ9A3eYuEmk2RSdjK8T7ZE4XM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jx/wPlvuIq3S6l+m4dQpb5NZ+YkmKGrwpk3XJnwYaPwRdKp67fPPvkWmx0z3pVG10
 JX02iOEjT6vooCnkL6BqnEWb1j/0QHEBSnzw3Frkqdt3FyI0OQbEpXwD4Ly9h9Pbv+
 mvm+0sh+mhrrc2zJgVjuFIvdkLUDN2AACiXhY9zo=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 11 Feb 2020 12:13:38 +0100 (CET)
To: Rolf Eike Beer <eb@emlix.com>, patch@alsa-project.org
References: <5948808.FfnTCzJfH2@devpool35>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fce7bfe6-428f-77bd-2bce-96f28e287ded@perex.cz>
Date: Tue, 11 Feb 2020 12:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5948808.FfnTCzJfH2@devpool35>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] do not set close-on-exec flag on
 descriptor if it was already set
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 11. 02. 20 v 11:22 Rolf Eike Beer napsal(a):
> There is no need to set this again if O_CLOEXEC is supported.

Thanks. Applied.

				Jroslav

> 
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---
>   include/local.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/local.h b/include/local.h
> index ea0ec32d..ed6ba936 100644
> --- a/include/local.h
> +++ b/include/local.h
> @@ -320,8 +320,10 @@ static inline int snd_open_device(const char *filename, int fmode)
>   			fd = rsm_open_device(filename, fmode);
>   	}
>   #endif
> +#ifndef O_CLOEXEC
>   	if (fd >= 0)
>   		fcntl(fd, F_SETFD, FD_CLOEXEC);
> +#endif
>   	return fd;
>   }
>   
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
