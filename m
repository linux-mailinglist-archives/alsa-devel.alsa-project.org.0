Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B7784B24
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Aug 2023 22:08:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C90757F1;
	Tue, 22 Aug 2023 22:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C90757F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692734932;
	bh=M5N735hmhlUn/42I52cmp8fSfMEJAwfpPtJMf3ri0HE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DQavHUYCWM0Y3gMBjZmbc+5n8qnJdqWOaaLnQxUfgmiza8eimjq8dmnYCr/iuOtky
	 PdvBqkvSXWxqkwdelFZcUkifMBP/76PJ15lgMiIKasRWIMFjFvNruhM+BQ1jDNRfwO
	 gHXMI1Ve51WA7c/cEa6E1OGNMKxJ+QLHAnKdY6zU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44112F804F3; Tue, 22 Aug 2023 22:08:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E636BF800F5;
	Tue, 22 Aug 2023 22:08:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E5D5F80158; Tue, 22 Aug 2023 22:07:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr
 [80.12.242.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 989FBF800AE
	for <alsa-devel@alsa-project.org>; Tue, 22 Aug 2023 22:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 989FBF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=W0x5Nouo
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id YXfBq73trxiGYYXfBq9Cf4; Tue, 22 Aug 2023 22:07:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1692734868;
	bh=BqANjHXG+mgSGlru4/suuPmjj23Toc5pJJs87UEpxT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W0x5NouoJPBOhf9VoR9+F8c8OqnbcQmsGnlc2eGqGkyTt9anehbOPWj/9KiGY4jwI
	 KumpSsCzE3WFtSn/xAYnna7HmkNbNWZF9o66ZEDarOuJMvmk26ij8G5w+ER/dB2YwV
	 cDa2WNLukRL9myM8zXzjKpb0r/7JvjxPEe58UaYWvwJ10r1Ta4rWpa12MEFd3aitXL
	 sENTMzMIbBulm6tDKhqVV530G/5dsOseyg2bcLIhX266XVVkpoGQiCmCBPbWjjguW6
	 y+djQaZlZrcYfcZfjenyaQHd40TGGHUOFTNxKde46Foa+J65Pmk3A7nb7gCQ6cOj1c
	 XYkRR9FXGP9Fg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 22 Aug 2023 22:07:47 +0200
X-ME-IP: 86.243.2.178
Message-ID: <49247018-20fe-8a04-75f2-dad4524aa3a3@wanadoo.fr>
Date: Tue, 22 Aug 2023 22:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: ac97: Fix possible NULL dereference in
 snd_ac97_mixer
To: Su Hui <suhui@nfschina.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, maciej.szmigiero@oracle.com,
 yangyingliang@huawei.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20230615021732.1972194-1-suhui@nfschina.com>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230615021732.1972194-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VNZKXOY5TRSQE43MYUKWACXSYVKEGE2J
X-Message-ID-Hash: VNZKXOY5TRSQE43MYUKWACXSYVKEGE2J
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNZKXOY5TRSQE43MYUKWACXSYVKEGE2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 15/06/2023 à 04:17, Su Hui a écrit :
> smatch error:
> sound/pci/ac97/ac97_codec.c:2354 snd_ac97_mixer() error:
> we previously assumed 'rac97' could be null (see line 2072)
> 
> remove redundant assignment, return error if rac97 is NULL.

Hi,

why is the assigment redundant?

Should an error occur, the 'struct snd_ac97 **' parameter was garanted 
to be set to NULL, now it is left as-is.

I've checked all callers and apparently this is fine because the probes 
fail if snd_ac97_mixer() returns an error.

However, some drivers with several mixers seem to rely on the value 
being NULL in case of error.

See [1] as an example of such code that forces a NULL value on its own, 
to be sure.

So, wouldn't it be safer to leave a "*rac97 = NULL;" just after the 
added sanity check?


CJ


[1]: 
https://elixir.bootlin.com/linux/v6.5-rc7/source/sound/pci/atiixp.c#L1438

> 
> Fixes: da3cec35dd3c ("ALSA: Kill snd_assert() in sound/pci/*")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   sound/pci/ac97/ac97_codec.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/ac97/ac97_codec.c b/sound/pci/ac97/ac97_codec.c
> index 9afc5906d662..80a65b8ad7b9 100644
> --- a/sound/pci/ac97/ac97_codec.c
> +++ b/sound/pci/ac97/ac97_codec.c
> @@ -2069,8 +2069,8 @@ int snd_ac97_mixer(struct snd_ac97_bus *bus, struct snd_ac97_template *template,
>   		.dev_disconnect =	snd_ac97_dev_disconnect,
>   	};
>   
> -	if (rac97)
> -		*rac97 = NULL;
> +	if (!rac97)
> +		return -EINVAL;
>   	if (snd_BUG_ON(!bus || !template))
>   		return -EINVAL;
>   	if (snd_BUG_ON(template->num >= 4))

