Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C562FF62E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 21:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F7CA1907;
	Thu, 21 Jan 2021 21:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F7CA1907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611261828;
	bh=DUArAgxsmT/3b8aTJ7Gp2qGLLkOgOxtiSaRSqHxpthc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jettzH1c8nbRXQAxEeRKem4EtHuTJku3a+vKcc7NORCXe+wHH+Nmup53IMDL/IiMm
	 a+hwCS2jjuvYlb80TA4pCI853SywoxrkUR+/sGQ76B4Xmx5r+0SSNHbzUr0xWYZ8yI
	 nmTGjBCMn6znpKdpKd+C76jBnB7b1kf7E5CcEE28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9783F80162;
	Thu, 21 Jan 2021 21:42:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A03EF80257; Thu, 21 Jan 2021 21:42:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75F87F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 21:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75F87F80162
Received: from [192.168.1.41] ([92.131.99.25]) by mwinf5d31 with ME
 id KYi4240010Ys01Y03Yi4JV; Thu, 21 Jan 2021 21:42:06 +0100
X-ME-Helo: [192.168.1.41]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 21 Jan 2021 21:42:06 +0100
X-ME-IP: 92.131.99.25
Subject: Re: [PATCH] ALSA: fireface: fix info leak in hwdep_read()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Clemens Ladisch <clemens@ladisch.de>
References: <YAka5xudQNQgRkuC@mwanda>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
Date: Thu, 21 Jan 2021 21:42:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAka5xudQNQgRkuC@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

Hi Dan,

Le 21/01/2021 à 07:10, Dan Carpenter a écrit :
> If "ff->dev_lock_changed" has not changed

According to the "while (!ff->dev_lock_changed) { ... }" just above and 
the lock in place, can this ever happen?

In other word, I wonder if the "if (ff->dev_lock_changed)" test makes 
sense and if it could be removed.


(same for your other patch against sound/firewire/oxfw/oxfw-hwdep.c)

CJ


> and "count" is too large then
> this will copy data beyond the end of the struct to user space.
> 
> Fixes: f656edd5fb33 ("ALSA: fireface: add hwdep interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   sound/firewire/fireface/ff-hwdep.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
> index 4b2e0dff5ddb..b84dde609a03 100644
> --- a/sound/firewire/fireface/ff-hwdep.c
> +++ b/sound/firewire/fireface/ff-hwdep.c
> @@ -35,12 +35,12 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf,  long count,
>   	}
>   
>   	memset(&event, 0, sizeof(event));
> +	count = min_t(long, count, sizeof(event.lock_status));
>   	if (ff->dev_lock_changed) {
>   		event.lock_status.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS;
>   		event.lock_status.status = (ff->dev_lock_count > 0);
>   		ff->dev_lock_changed = false;
>   
> -		count = min_t(long, count, sizeof(event.lock_status));
>   	}
>   
>   	spin_unlock_irq(&ff->lock);
> 

