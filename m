Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96750288C48
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 17:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29229165D;
	Fri,  9 Oct 2020 17:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29229165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602256319;
	bh=JB8o6dJV7z2WOAYTovRLJmJppAwil/0YbrK6Ktibkm8=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rb0nN3yeU8+KLwkMEbngoqdfa4o7Km9L+pbwHI716iK3NPTUL1yq9LlwYc39eG0vN
	 sKeAf2TRDvMKRiiJy15Bdy7+LSNqZw3VCAOVkcPhQJaiqO4rTMmGnIk5hqIJXg5Tqm
	 Hn3EkRk4evDgqfDC2WHqmlfP9X0oWb6C0QrRLgIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C827AF8015B;
	Fri,  9 Oct 2020 17:10:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90566F8015B; Fri,  9 Oct 2020 17:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F50BF80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 17:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F50BF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="GiQkKPAh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1621; q=dns/txt; s=axis-central1;
 t=1602256214; x=1633792214;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=ORzkGxePo6tbvhRNduvHCycFbx21mIKX9EB04COaAps=;
 b=GiQkKPAh2yiz47alb7w80kJKsMrzugWg0KaOI+abC9TttbiBgPKW7zWy
 PvLc+SL1cj2dURs0ZBI91csGlUBbaTUEo84C6HE9wuyNKVlhHU6YtMaHx
 BxCBfIVz8jXtheidc1VX6uDHClIOvjM4Fq1iIchwCUwmm3tI4VJupwyfX
 H1SnHFqxEtGQ7xTqGzhWrSfZY3wOR27NJ8khd5Z3nWs+C9nKFiJxMlRx8
 ZTOdseAYG1CLlTRk/BgW6jvrwbdtH05LZ/NlO6oniueKtW5piiGFTiinW
 R5lY/DvqRVOzPL77z7KULSmDXLEo3CuEh6n5F8TqQXG7SbXslespNebzY A==;
IronPort-SDR: P4jFYFsSzQ7+kqhfy1hYhzZX5FSSUbb6LtDOqfPGTyrfWGdu9ktVPD7PrY5gS2Q6Zu0PV0AkyD
 UZVKskrSG2ZZ/YGcK7OGASARRcTRv0MZawP58YlNneHV8BzGVCeuikWfBmFRz4z9KebFKXDxmQ
 tfJw2G391sqRMIp9Q4Ly35nYQRJAYhU5zsSt/FQ17L58qSdXa8ldcFzyrzijENlP2J/lZNftIn
 G2H6+7/LbW4q26XfFogFW48VVuUfmbCXKa9n1W5AYOEvM+H5e36WsitarasH4GN964IJOC0t5X
 w/Q=
X-IronPort-AV: E=Sophos;i="5.77,355,1596492000"; d="scan'208";a="13348599"
Subject: Re: snd_pcm_status() does not update status->avail
To: Jaroslav Kysela <perex@perex.cz>, Jonas Holmberg
 <jonas.holmberg@axis.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "tiwai@suse.de" <tiwai@suse.de>
References: <d9c1f37e-5c8d-f289-270e-c6cda7a56ce3@axis.com>
 <2d4ca02d-8be3-62ca-c273-f5b277e64158@perex.cz>
From: Jonas Holmberg <jonashg@axis.com>
Message-ID: <c4860adb-70fb-7209-58bf-8cc785f7e548@axis.com>
Date: Fri, 9 Oct 2020 17:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <2d4ca02d-8be3-62ca-c273-f5b277e64158@perex.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 2020-10-09 16:30, Jaroslav Kysela wrote:

> It seems that nobody is using those status fields. Usually,
> snd_pcm_avail_update() is used by apps. Anyway, this should be fixed for 
> both
> directions. The avail should be probably synced to
> snd_pcm_plugin_avail_update() output:
> 
> 
> diff --git a/src/pcm/pcm_plugin.c b/src/pcm/pcm_plugin.c
> index ea60eb98..5739cfc2 100644
> --- a/src/pcm/pcm_plugin.c
> +++ b/src/pcm/pcm_plugin.c
> @@ -541,16 +541,20 @@ static snd_pcm_sframes_t
> snd_pcm_plugin_avail_update(snd_pcm_t *pcm)
>   static int snd_pcm_plugin_status(snd_pcm_t *pcm, snd_pcm_status_t * 
> status)
>   {
>          snd_pcm_plugin_t *plugin = pcm->private_data;
> -       snd_pcm_sframes_t err;
> +       snd_pcm_sframes_t err, avail;
> 
>          /* sync with the latest hw and appl ptrs */
> -       snd_pcm_plugin_avail_update(pcm);
> +       avail = snd_pcm_plugin_avail_update(pcm);
> +       if (avail < 0)
> +               return avail;
> 
>          err = snd_pcm_status(plugin->gen.slave, status);
>          if (err < 0)
>                  return err;
>          status->appl_ptr = *pcm->appl.ptr;
>          status->hw_ptr = *pcm->hw.ptr;
> +       status->avail = avail;
> +       status->delay = snd_pcm_mmap_delay(pcm);
>          return 0;
>   }
> 
>                                          Jaroslav
> 

I have tested your patch and it solves my problem. Are you going to push it?

Thanks!
/Jonas
