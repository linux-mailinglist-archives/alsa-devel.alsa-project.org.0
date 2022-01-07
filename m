Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20F487DCC
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 21:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BC917A2;
	Fri,  7 Jan 2022 21:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BC917A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641587909;
	bh=hltAheX0fIx14aeUOUzNkVKdmvjpiRlcUkoYXb4SmBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sztpvL7/MY98zwNYfph87Hj/0k0jL1Qu4EFOnJnqJ8VKVDp2/a2Sh6DjCA/1Z6NDd
	 eoQUOlArvDpTjyOiB5kQxbm/OIQAjElbLV5kT84MRh3GuyfAS0GacCbXKlTqerdKck
	 Dsu7tmSvFGe+DP3pODd7//BvTUmJXMTfqIXIC/Ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9219CF80254;
	Fri,  7 Jan 2022 21:37:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C200F80249; Fri,  7 Jan 2022 21:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BFBDF800AE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 21:37:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BFBDF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XB9uD+RN"
Received: by mail-ua1-x935.google.com with SMTP id i5so12311925uaq.10
 for <alsa-devel@alsa-project.org>; Fri, 07 Jan 2022 12:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=URaeNQSnQ73jvSKBJF6f+Dw5ROIER+iKBdb5o0+p7SQ=;
 b=XB9uD+RNL+2sB1acFBrOJ0gRkJMNEZgA3fXCPtneGMYA2KO7xfoCWY8iSNsXUMkzG1
 x10JywvMc12imk8IMEPik3fQAicZEW1UvpufjDNcEw/l6BGiWOiU7Ah3Jbq8DjsZV/uY
 ynpcuoCxentjsoAi42gnU3vYhtOpn0aEXoUKgnDLN6qiKY7oWdxeY4CLm62Y1wpnl4ie
 Hg3MBezzf85f6xn5Spq2xWE6VrBY7NJZ4ciGDk5NtjmN7boO+uAa2B+G4sqSBex9l0hR
 erjXE0tqyWreCGVQVCDHG1NW0nY5Zkr69o0iSq9MM99x/487RS9fosdr4FKmqP95oeZY
 cwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=URaeNQSnQ73jvSKBJF6f+Dw5ROIER+iKBdb5o0+p7SQ=;
 b=0Vfr8tIOlYcwQVFnNI6zsZHYuDxZN/E+DM1NseGYfpsGm2q96cPZqX7Ay3c5hVV/jF
 CBg9UfjGodDTKNhWxVhfcdBC9T0RiQY1kSXp6Ll+U3gBwpJ+nHmN6yXluv+YJRmBc+AR
 RprX9r5ZIx22cNMUj+Ws4zsw8KnM1/kz/70oqRQ/CDPN+wMQIEeRQkJi/G5eGOgHDZGr
 P1upaF5cMSvtkZ0wR+MaCShnER3zhol8fNrWEC2GBPSfBA7kZMO335ppbHB01JG8Bmn4
 WyjdjQu5oXZbgjPPnuxYTB/CWBRLPvaAsPP6WyQmAXJoQgasSHUC3PLfK73c6DaOCPjT
 E9rA==
X-Gm-Message-State: AOAM533n95w5OzfTJ4eMwROvoADjM1JhzPu0g8UO5jjweGavou26hiUC
 ix8T/5ZcTlG5CB5vb5y6v5M=
X-Google-Smtp-Source: ABdhPJzl6jRdYElf681db+o4cFM3p5OW6zBBv2ud2+V0RsYbkp7xs8Pn0RAq6dquM6DGlJCpU18RBQ==
X-Received: by 2002:a67:f7c2:: with SMTP id a2mr22998424vsp.30.1641587829475; 
 Fri, 07 Jan 2022 12:37:09 -0800 (PST)
Received: from geday ([2804:7f2:8002:f237:d475:1acd:9c67:d4cd])
 by smtp.gmail.com with ESMTPSA id y76sm4071471vky.0.2022.01.07.12.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:37:09 -0800 (PST)
Date: Fri, 7 Jan 2022 17:37:06 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Stefan Sauer <st.kost@gmail.com>
Subject: Re: [PATCH] ALSA: seq: virmidi: Add a drain operation
Message-ID: <Ydikcgcmwfk05Eic@geday>
References: <CAJ4JBRO7qE63TAC-=4y=QMaiAEfkyjRmgiZEF_57Hm+ztc8+Qg@mail.gmail.com>
 <20220105204717.12175-1-st.kost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105204717.12175-1-st.kost@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Wed, Jan 05, 2022 at 09:47:17PM +0100, Stefan Sauer wrote:
> If a driver does not supply a drain operation for outputs, a default code
> path will execute msleep(50). Especially for a virtual midi device
> this severely limmits the throughput.
> 
> This implementation for the virtual midi driver simply flushes the output
> workqueue.
> 
> Signed-off-by: Stefan Sauer <st.kost@gmail.com>

Hi, Stefan,

Thanks for the patch!

However it seems you forgot to Cc: Takashi Iwai.

Cc:ing him now so he takes notice.

Thank you,
Geraldo Nascimento
> ---
>  sound/core/seq/seq_virmidi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
> index 4abc38c70cae..f5cae49500c8 100644
> --- a/sound/core/seq/seq_virmidi.c
> +++ b/sound/core/seq/seq_virmidi.c
> @@ -262,6 +262,16 @@ static int snd_virmidi_output_close(struct snd_rawmidi_substream *substream)
>  	return 0;
>  }
>  
> +/*
> + * drain output work queue
> + */
> +static void snd_virmidi_output_drain(struct snd_rawmidi_substream *substream)
> +{
> +	struct snd_virmidi *vmidi = substream->runtime->private_data;
> +
> +	flush_work(&vmidi->output_work);
> +}
> +
>  /*
>   * subscribe callback - allow output to rawmidi device
>   */
> @@ -336,6 +346,7 @@ static const struct snd_rawmidi_ops snd_virmidi_output_ops = {
>  	.open = snd_virmidi_output_open,
>  	.close = snd_virmidi_output_close,
>  	.trigger = snd_virmidi_output_trigger,
> +	.drain = snd_virmidi_output_drain,
>  };
>  
>  /*
> -- 
> 2.34.1
> 
