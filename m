Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D22422E966
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 11:46:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE84E166E;
	Mon, 27 Jul 2020 11:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE84E166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595843199;
	bh=fkGVbnShUP51LN+3IACG0mjf31jsgv6QXnyYBo6FVlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFcuFxj2bPnn5aDWqd2gE5ZAkyxaBn++0fD56dDLxSw0T5e+5pp5dv9pCvoGQHJEk
	 WyyULG2JkNfXMH0P0tMXO1hneTcht47LWWDsjKvTF/zbBEOkHKrhxJClFoYCMLAUrR
	 ZrUNggboxo9vPKY9ZWT7lzF09OFi0WKBz6KreGIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ED79F80171;
	Mon, 27 Jul 2020 11:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC99DF801EB; Mon, 27 Jul 2020 11:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33441F8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 11:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33441F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QBy/eUft"
Received: by mail-wr1-x42d.google.com with SMTP id f7so14189279wrw.1
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAslkRLwWI359lOgsWgFWFLEOu0zBogs11vp59ytjkk=;
 b=QBy/eUftfWpLXnXVPSMLenDStk1Ax3iki65llBQCKleXm+DXeT9W7GBighHaUWWecg
 pziHl+zGORr07TyOzlgaSnpjVQeoxv7kcnfG6pkJp1p44VeO7M46NglNPTiwxkS8DbLT
 J1NIKmsYvOyHw/1Ecn/A1yNW3k84AYwAm72q60mSmQV81gDRNWrIKGyJIAkCVoJzXnsv
 GNlB/kbbmlxlJxMVin7+dw9t9Dp9Jh+5PbU6femYZXIgK6GqE3e+Wo6kdj5OQy4DABLH
 NEB6K7GttLj4IqCe4Mhl77DV68hsg7M0Jj1ubbRe2QttkDMhHHZdD/Okkw19d49lNmSI
 q8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAslkRLwWI359lOgsWgFWFLEOu0zBogs11vp59ytjkk=;
 b=VnqR+lv57AuX9D5zRyY3xQAKaNa2tmvKjXJnIGAlmUFf6lVJmeksOMc9hMQ4EemvNm
 JFS0c6r1LZKYs/giS2kjkK2703lpnIN1ndj7BZCTB2bRnnFfdo8KwgfA9jEo8VcpsQdi
 hGYhpYMf4lb8pRsjmNHvDHwRZ4RZ7pd29B92PvIBhwLBrrzSmsaxzTKVv8p+vVlHbYPT
 Oq6Zqgwy951w8cYh5hXZW8fp8Gfpg+PUjO/NurTIgYIxt0pZrnNAQGiSq8rtw49f3cEG
 Tckmzmpwt3MgecIdx+J7cQiCD2QManUqr4LA8eo/r0rt1n2QvntO4r39qPQ5HKQUZPfm
 Gl8A==
X-Gm-Message-State: AOAM531leGWGer9+PB/6CNrMyUHSzJL4A8Da+y6PwJgyorRv3BMNDeLt
 a3/kNtqgh/LchHx/zdhxchCSjA3fFF7McA19QVCcMM5oo9Q=
X-Google-Smtp-Source: ABdhPJxpMIlmI837NhOg9b3HhX5PqwmbMeJ5kDLNMSt7en7mSjpnTpWFxBfEJtn7R/2IawSZjrsTZyXNIeOIbgw4roA=
X-Received: by 2002:adf:e902:: with SMTP id f2mr10865664wrm.174.1595842827497; 
 Mon, 27 Jul 2020 02:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAEnQRZC4FNrLSbasRH4Au=W_tHyQUV_y0WOn-RDZboEhnf0e+g@mail.gmail.com>
 <877duqylh5.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877duqylh5.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Jul 2020 12:40:15 +0300
Message-ID: <CAEnQRZC4=PkWSe9A-+_1JJg9GmhAv9ph=Q3t_rjd+Fmj0SU8oQ@mail.gmail.com>
Subject: Re: snd_soc_component_driver substream ops
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Mon, Jul 27, 2020 at 1:13 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> Thank you for asking
> And sorry for late response, Japan was holiday.
>
> > Looking at snd_soc_component_driver I see there
> > are some operations like: open, close, hw_params, hw_free. (1)
> >
> > Now, snd_soc_component_driver has snd_compress_ops.
> >
> > Do you think it is worth it to group operations from (1) in a similar structure
> > maybe snd_<xyz>_ops.
>
> It seems snd_soc_component_driver is using many functions and flags.
> Keeping these in the some structure is better, IMO.
>
> I think separating "component" and "compress" is better cleaning ?
>
>         struct snd_compress_ops {
>                 ...
>         };
>
>         struct snd_soc_component_driver {
>                 ...
> -               const struct snd_compress_ops *compress_ops;
>                 ...
>         };
>
>         struct snd_soc_component {
>                 ...
>                 struct snd_soc_component_driver *driver;
> +               const struct snd_compress_ops *compress_ops;
>                 ...
>         };
>


Hi Morimoto-san,

Thanks for your answer.

Although I still have many months ahead to understand ASoC framework, I don't
think moving compress_ops out of snd_soc_component_driver it is a good idea.

For me it looks like snd_soc_component_driver abstracts the functionality of a
component so operations should still stay under snd_soc_component_driver.

Indeed snd_soc_component_driver has a lot of operations and flags, I think we
can group the operations as follows:

* operations on PCM substreams (e.g: open(component,substream))
* operations on DT nodes (e.g: of_xlate_dai_id(component, device_node)
* component operations: (e.g: set_pll(component)
* constructor / destructor.

I think a first step would be to create an equivalent of
snd_compress_ops for PCM substreams.
The name ideally would be snd_pcm_ops and all the functions will have
a component and a PCM
substream.

Anyhow, snd_pcm_ops already exists and acts only on a component.

So, I think those operations should be called:
* for PCM: snd_substream_pcm_ops
* for Compress: rename snd_compr_ops with snd_stream_compr_ops.

Another thing I don't understand is why PCM uses 'substream' term
while compress uses 'stream' term.

I must admit that my head hurts every time I try to understand ASoC related
stuff. Thanks a lot for taking your time to clean it up and make the code
easier to understand.
