Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3531BC7D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 16:31:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4971675;
	Mon, 15 Feb 2021 16:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4971675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613403063;
	bh=MvUbnqH/J5ojY9CoMEljDUlPIerrK6KG8KU7rZKW+90=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBQ3mwmDC/pfqs/a4ts2rO2OfVDnq6bcLDe3NiZpKvLbDpGxTBo9XUYpnq/BM8Y3O
	 D+Ib3FvxBt5Y9nIDvnbfUWNq/EzxpZzlmM0U5yIGr/XQxiXn7N6hKSrhs2lR8rnTMs
	 1BuerAb6Ehyb9mcoiPquV5++cqTJjbmHPAP72wdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21768F800C1;
	Mon, 15 Feb 2021 16:29:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE64CF80258; Mon, 15 Feb 2021 16:28:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01BA9F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 16:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01BA9F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VsFGQLyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613402915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpNbCXa3LLeVYQ9DuTQANorJRafKek6tnQAqzgjmksA=;
 b=VsFGQLyO03qV7QE5NebcgovAUwZGjwApv/DeY5UU7+CefLoPqXrzvGzEKfAIDExwpXR/hF
 wiC10FaqIhNOYkKMdG/WhYKc9tSQzveGNQY7dOkCumFTEgsDiYiLLtjy3BSxvDKDgqkonl
 sQfSDFf3IZZZe8rPog8Modx655QTXk8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-6MednSUtNqCRKLHtGIZcrA-1; Mon, 15 Feb 2021 10:28:34 -0500
X-MC-Unique: 6MednSUtNqCRKLHtGIZcrA-1
Received: by mail-qt1-f198.google.com with SMTP id o7so5447676qtw.7
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 07:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qpNbCXa3LLeVYQ9DuTQANorJRafKek6tnQAqzgjmksA=;
 b=c6vcmGK1BG0NJWpBqYcXr4bifyp5tnwHJo6ayVHaTsf5oPtYTKCTV5c8V9SKw6x7+5
 AvqwEbgljpBnmHdvmHoZZ9gB5Og1qWobliW29iqjRwQwvuIzDMPqKKV6rkJwlk3s3mUW
 mDZRGjm75zkkPITbDdfgdYGnfwlkNDOrRfrb4u7hdhSFB9P+wXdjoZrmta7ZlDGHZE/Y
 E4Ge5hjSJ0XyOM6jWAQ6QqkbiHAVqicMjACvP/KjAIIY8OBd0ToLFvvO8/WqOaiXCZj1
 EmR+ESphUPhTw96JDhoj6mjlvbDN3V7sGWWYiD6dsPSiwL+5RQKMcvQ/nzjuUh06kii9
 rJXg==
X-Gm-Message-State: AOAM531It41HUAKB7XgcmoUPeKMXJHZdOnSYPG3L+IBTxwMMkQrWfMY2
 Wj3QU4bSklB/0Eq0hZWJowV3r7dRdz5OEWhoABRKgtNTjTVJeod8oJ8mpg+ym8AxlX7SOFqekXz
 5Fot471Zf6vzaztqU9fgBtmQ=
X-Received: by 2002:a37:6c02:: with SMTP id h2mr15747169qkc.488.1613402913714; 
 Mon, 15 Feb 2021 07:28:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPcqZGpt313S3UgA1ecM3+khrHLAae1n33Uut2tgZvJzHWeC4MDAcz0FTvSwcv/hNdjM+c0Q==
X-Received: by 2002:a37:6c02:: with SMTP id h2mr15747155qkc.488.1613402913508; 
 Mon, 15 Feb 2021 07:28:33 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id r190sm12495588qka.54.2021.02.15.07.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 07:28:33 -0800 (PST)
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix missing check in skl_pcm_trigger
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu
References: <20210215151356.15252-1-dinghao.liu@zju.edu.cn>
From: Tom Rix <trix@redhat.com>
Message-ID: <e53684a9-afda-8c06-1b54-7327e95b0b01@redhat.com>
Date: Mon, 15 Feb 2021 07:28:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215151356.15252-1-dinghao.liu@zju.edu.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
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


On 2/15/21 7:13 AM, Dinghao Liu wrote:
> When cmd == SNDRV_PCM_TRIGGER_STOP, we should also check
> the return value of skl_decoupled_trigger() just like what
> we have done in case SNDRV_PCM_TRIGGER_PAUSE_RELEASE.
>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  sound/soc/intel/skylake/skl-pcm.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index b1ca64d2f7ea..a5b1f333a500 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -516,6 +516,9 @@ static int skl_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
>  			return ret;

Is there any additional error handling to be done for the

skl_stop_pipe that just happened ?

Tom

>  
>  		ret = skl_decoupled_trigger(substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +
>  		if ((cmd == SNDRV_PCM_TRIGGER_SUSPEND) && !w->ignore_suspend) {
>  			/* save the dpib and lpib positions */
>  			stream->dpib = readl(bus->remap_addr +

