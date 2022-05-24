Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95068532356
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 08:39:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DE831712;
	Tue, 24 May 2022 08:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DE831712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653374370;
	bh=s4gRkVHVR+5eEd2fADaylH3q5sz35I9hYaoSnV3Ozqg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mhqeEKDVPvY0l81P9tpe4SIXNL5Na/bstQ/SaxiptLMwnM0UtRVHFSfNFeVv37laC
	 XX+PyCq8JItN3B1BxhiVbthuzG106ymuN5rBsKBoGibNq6P4P8llai0sIaK/brHl+3
	 K/7tPse13VDhrn8AlBF3A9vmrZLjFszD58ba++lM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE14F800E3;
	Tue, 24 May 2022 08:38:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D341CF804D1; Tue, 24 May 2022 08:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA2FF800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 08:38:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BB545A003F;
 Tue, 24 May 2022 08:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BB545A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1653374301; bh=huu3jOQPoaAnG2W3QrSFAjuxQvusNGNqEZoU+CzteyQ=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=Vkv5ns9jd5dP9p5NZu8VT5TL9YvUWTQRbPkcQC19nPCj7aLmU3Bj+MZmst9Ogv5Ai
 b4ugu+T8AERjAPDeUe2JkXppMqV7oleOZq83sII1Dn8GX3DaNPyXyJ8dKX0TfPtQM6
 0eiC7DBvVT3N5I1yJ+XleCU0w4C5MYnr2vqFnpFg=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 May 2022 08:38:18 +0200 (CEST)
Message-ID: <34911ddf-62c5-b692-0237-a6d44b1fe7a3@perex.cz>
Date: Tue, 24 May 2022 08:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ALSA: usb-audio: Configure sync endpoints before data
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
References: <20220524062115.25968-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220524062115.25968-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Craig McLure <craig@mclure.net>
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

On 24. 05. 22 8:21, Takashi Iwai wrote:
> From: Craig McLure <craig@mclure.net>
> 
> Devices such as the TC-Helicon GoXLR require the sync endpoint to be
> configured in advance of the data endpoint in order for sound output
> to work.
> 
> This patch simply changes the ordering of EP configuration to resolve
> this.
> 
> Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=215079
> Signed-off-by: Craig McLure <craig@mclure.net>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> ---
>   sound/usb/pcm.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index 6d699065e81a..b470404a5376 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -439,16 +439,21 @@ static int configure_endpoints(struct snd_usb_audio *chip,
>   		/* stop any running stream beforehand */
>   		if (stop_endpoints(subs, false))
>   			sync_pending_stops(subs);
> +		if (subs->sync_endpoint) {
> +			err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
> +			if (err < 0)
> +				return err;
> +		}
>   		err = snd_usb_endpoint_configure(chip, subs->data_endpoint);
>   		if (err < 0)
>   			return err;
>   		snd_usb_set_format_quirk(subs, subs->cur_audiofmt);
> -	}
> -
> -	if (subs->sync_endpoint) {
> -		err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
> -		if (err < 0)
> -			return err;
> +	} else {
> +		if (subs->sync_endpoint) {
> +			err = snd_usb_endpoint_configure(chip, subs->sync_endpoint);
> +			if (err < 0)
> +				return err;
> +		}
>   	}
>   
>   	return 0;


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
