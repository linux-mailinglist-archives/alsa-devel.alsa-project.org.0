Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C584742B855
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 09:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5489C15F2;
	Wed, 13 Oct 2021 09:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5489C15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634108560;
	bh=XhwxKt0a+pdNk65hPHzgfgQZf7JFI01r2G1A8H2EwrI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdIflZunmxzHSiC6R5fzcfNKVwJr8QsYEs+sR5ICHBzX2scOLn+d9z3lppIfNg6jJ
	 gofWO9KVNXcf6Iq+fTr1zmvDvdA7iajCt8mWOfKcRPCEsBDQYNLmTTQ8mgK3YzbMXI
	 eJ7VWMu1vuEfaL3rcaOBRZnXwhXebCezBlOmZBJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD51F8028D;
	Wed, 13 Oct 2021 09:01:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E2D0F80269; Wed, 13 Oct 2021 09:01:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D539AF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 09:01:13 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C9978A0040;
 Wed, 13 Oct 2021 09:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C9978A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1634108472; bh=fAOOUpMq3tu+sj9P5YgtkC4EXwiBrT+Sx5NY5LC5DAM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=N2hxm0jHJN+x+tZ31c8UXm2amWhUILhSRChKmlcW2S8OeFiXdv89MBXkOu1iz5EZT
 F3rFr+GD72kix6xLTMCS5zgDmyQxHwuO3DhVU3oK019RGLqFdCiG8s+6OLKA1oZZRO
 Xb7oohAbvREUnhUy0C4lhRFPaMDZKG/7Pxo8Ldic=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 13 Oct 2021 09:01:10 +0200 (CEST)
Message-ID: <c6e57159-a6c6-9f76-db33-e09ca0f50893@perex.cz>
Date: Wed, 13 Oct 2021 09:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] alsaloop: added option prateshift for PLAYSHIFT ctl
 elem used in PLAYSHIFT
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
References: <20211005194903.7957-1-pavel.hofman@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211005194903.7957-1-pavel.hofman@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 05. 10. 21 21:49, Pavel Hofman wrote:

> -static void openctl_elem(struct loopback_handle *lhandle,
> -			 int device, int subdevice,
> -			 const char *name,
> -			 snd_ctl_elem_value_t **elem)
> +static int openctl_elem_id(struct loopback_handle *lhandle, snd_ctl_elem_id_t *id,
> +		snd_ctl_elem_value_t **elem)
>   {
>   	int err;
>   
>   	if (snd_ctl_elem_value_malloc(elem) < 0) {
>   		*elem = NULL;
> +		snd_ctl_elem_id_free(id);
> + 		return -ENOMEM;
> + 	}
> +	snd_ctl_elem_value_set_id(*elem, id);
> +	snd_ctl_elem_value_set_interface(*elem, SND_CTL_ELEM_IFACE_PCM);
> +	err = snd_ctl_elem_read(lhandle->ctl, *elem);
> +	if (err < 0) {
> +		snd_ctl_elem_id_free(id);

Move the id allocation management to the caller.

> +		snd_ctl_elem_value_free(*elem);
> +		*elem = NULL;
> +		return err;
>   	} else {
> -		snd_ctl_elem_value_set_interface(*elem,
> -						 SND_CTL_ELEM_IFACE_PCM);
> -		snd_ctl_elem_value_set_device(*elem, device);
> -		snd_ctl_elem_value_set_subdevice(*elem, subdevice);
> -		snd_ctl_elem_value_set_name(*elem, name);
> -		err = snd_ctl_elem_read(lhandle->ctl, *elem);
> -		if (err < 0) {
> -			snd_ctl_elem_value_free(*elem);
> -			*elem = NULL;
> -		} else {
> -			if (verbose)
> -				snd_output_printf(lhandle->loopback->output,
> -						"Opened PCM element %s of %s, device %d, subdevice %d\n",
> -						name, snd_ctl_name(lhandle->ctl), device, subdevice);
> -		}
> +		snd_output_printf(lhandle->loopback->output,
> +				"Opened PCM element %s of %s, device %d, subdevice %d\n",
> +				snd_ctl_elem_id_get_name(id), snd_ctl_name(lhandle->ctl),
> +				snd_ctl_elem_id_get_device(id),
> +				snd_ctl_elem_id_get_subdevice(id));
> +		return 0;
>   	}
>   }
>   
> +static int openctl_elem(struct loopback_handle *lhandle,
> +			 int device, int subdevice,
> +			 const char *name,
> +			 snd_ctl_elem_value_t **elem)
> +{
> +	snd_ctl_elem_id_t *id;
> +
> +	if (snd_ctl_elem_id_malloc(&id))
> +		return -ENOMEM;
> +	snd_ctl_elem_id_set_device(id, device);
> +	snd_ctl_elem_id_set_subdevice(id, subdevice);
> +	snd_ctl_elem_id_set_name(id, name);
> +	return openctl_elem_id(lhandle, id, elem);

Missing snd_ctl_elem_id_free(id). Eventually, the id may be allocated using 
snd_ctl_elem_id_alloca().

> +}
> +
> +static int openctl_elem_ascii(struct loopback_handle *lhandle, char *ascii_name,
> +		snd_ctl_elem_value_t **elem)
> +{
> +	snd_ctl_elem_id_t *id;
> +
> +	if (snd_ctl_elem_id_malloc(&id)) {
> +		return -ENOMEM;
> +	}
> +	if (snd_ctl_ascii_elem_id_parse(id, ascii_name)) {
> +		snd_ctl_elem_id_free(id);
> +		fprintf(stderr, "Wrong control identifier: %s\n", ascii_name);
> +		return -EINVAL;
> +	}
> +	return openctl_elem_id(lhandle, id, elem);

Missing snd_ctl_elem_id_free(id). Eventually, the id may be allocated using 
snd_ctl_elem_id_alloca().

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
