Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04CF7797
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 16:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE821674;
	Mon, 11 Nov 2019 16:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE821674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573485876;
	bh=I5LxgcXxL/NI/cDrU5B3A+ahk75wBuCtHrFNEgQxaTU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nf1ZLFejasgZaJKbEgVzTdlB7SnQrwex3kM6TOJ7xL3dBPJob7SAUaXagmU7T7muT
	 8z0NLKczflQk8JL0REPymCQfWXaW0WDnCNn4EM3QzGLlglSzMSWMfJQtzghl1iPMzN
	 A2/BR/Zwq9irOon+8ISGz+KCh9nqL3BdnR5FWCrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2D4F80518;
	Mon, 11 Nov 2019 16:22:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F13CF804FF; Mon, 11 Nov 2019 16:22:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 477A6F8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 16:22:44 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C540FA003F;
 Mon, 11 Nov 2019 16:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C540FA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573485763; bh=Uu95vIWo4zvzlrnppnCoTAwEIYy8moa8/Jiy3dpz2vM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=4eq5FnXvw1LzrQYGR4473V6kkCXnUsd6qiK/K0mX3DHFuuJyhlhNESUoaoCSN933Z
 pabnbWAn81C6Bz2sdsiQwgA4q3OhhZPBbgPM28uSvXCre/aBrbeqcid1vOjZR+W6Zn
 q3+s3b3K9QaMNPEZdwMrEEaIuoFy/IJfHq0WjK0s=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 11 Nov 2019 16:22:40 +0100 (CET)
To: Curtis Malainey <cujomalainey@chromium.org>, alsa-devel@alsa-project.org
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-6-cujomalainey@chromium.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cedaf20b-6752-5f49-64c4-0f3abec8244c@perex.cz>
Date: Mon, 11 Nov 2019 16:22:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107015808.26844-6-cujomalainey@chromium.org>
Content-Language: en-US
Cc: broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH 06/11] ucm: docs: Add DisableSoftwareVolume
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

Dne 07. 11. 19 v 2:58 Curtis Malainey napsal(a):
> Some userspace audio servers might default to software volume, this
> allows the ucm to force its behaviour
> 
> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>   include/use-case.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/use-case.h b/include/use-case.h
> index 05628303..1aeaf9d4 100644
> --- a/include/use-case.h
> +++ b/include/use-case.h
> @@ -334,6 +334,8 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>    *      - This is used on platform where reported buffer level is not accurate.
>    *        E.g. "512", which holds 512 samples in device buffer. Note: this will
>    *        increase latency.
> + *   - DisableSoftwareVolume
> + *      - Set to "1" to force userspace to use hardware volume controls
>    */
>   int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
>                        const char *identifier,
> 


My understanding is that if the hardware volume controls are defined in UCM, 
then the UCM user (audio server) should use them. Otherwise, the software 
volume control should be applied. I don't see the reason to have this info 
doubled.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
