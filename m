Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32625FCB5C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 18:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1A441673;
	Thu, 14 Nov 2019 18:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1A441673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573751014;
	bh=hMH7xDysRumEHSrpiNeZlw7IBCXNNhVzVAaWQqb0Tec=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1WXvb/oFA0hlxYUebEhjb538ufvxFSJ3a+Ri8pPeT7BzaWKLI2S+NG+fVaabpjA9
	 62fkQHuxVboBZfFL3WlHhel5nKxhmygIu9HWFD93a5j+d+kIszdou7Nf94NREUmPBp
	 HNqgSOKNShxet+TIKhwU9ZrGOVT/vw+gEkupYV8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0559EF800EF;
	Thu, 14 Nov 2019 18:02:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9C6F800EC; Thu, 14 Nov 2019 18:02:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05B97F8007E
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 18:02:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05B97F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gQNjW9fu"
Received: by mail-qv1-xf42.google.com with SMTP id n12so2644727qvt.1
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 09:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1l5ZXAPHJt0a+XpeA7xQeXkw9CmNqTnUN3g64Iafec=;
 b=gQNjW9fu+UTvoleQ8tOOf5NpmJruqGHt1EvvtSyGxkQDXsh0eGjJMUH4zTQj/hHMtc
 PHiC9CMQa9R6FhKgwMfxKjlEEZ0qlGRzX8NTzRN1n6oVyir+D/ojwZWxECm0UFw21P90
 o3OqWI7IbQV8OFUqE8W2KgYO2T8tLal+e29EzkejJj/ZRLslBRtfDTTcQxCP/1WpAE0K
 qOenJYZxUj0o65u5m16zJbM7ONTUpM70XntIHgA75mazMqJILh5026oVQLOd+PoJ5DTO
 KLmVtzdYOy2KXC2leqUwih4iPUxmrRTgdO6Gz6CDAkxXBZdbJwoRGg0q9RqfSMoGLqlZ
 s8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1l5ZXAPHJt0a+XpeA7xQeXkw9CmNqTnUN3g64Iafec=;
 b=pE/3fGnxdARK2WXQvsQ07x+2nNaTxa68DIytNW7eBj4fI17ca9Q1g+s3k49LKynPs9
 liIHN+tmrwfsU35SrdCRLmR2ruy++2abwkOgwynJOvWzD+HqqfmC0wGFi9g/dzp/kKmw
 U8j1DmK+kmkH+TR3UhzWYgRAHY+pQf099L9dlFgN7flpma8mr3w2HI1BK2u3KaVbAFa0
 oj5Ua8MN7867bEN4RpEMhdTXF4xx3gYeDXydzjfjqq1ZuDOMV3FISGNBsp7wvlEd35AN
 pR6hGxcltqeSjyLNZd0ZgIKJYzu7YRvfarr5CxEJ7MCKYEZnBgipPUb572AZTVuaQBT6
 E4NQ==
X-Gm-Message-State: APjAAAWZm1P5qageFEPLTyl3SPSUy9CagqzES61wGBY39kLXUh/BfjMy
 sXXs4IBmRNG7rwyAgsGFn7ayLs25/vEwJOwEiYijFA==
X-Google-Smtp-Source: APXvYqzot6FBVnO83R2lmasQUs7XRy8tEip+Omj1oNafWjZ6nVOWohDS+O8L/UP4Zr4JlAHkkejjRTUAYm1nDsHpTP0=
X-Received: by 2002:a0c:d2b4:: with SMTP id q49mr8697240qvh.135.1573750954348; 
 Thu, 14 Nov 2019 09:02:34 -0800 (PST)
MIME-Version: 1.0
References: <201911142322.pHmcOJHb%lkp@intel.com>
 <20191114153304.n4pyix7qadu76tx4@4978f4969bb8>
In-Reply-To: <20191114153304.n4pyix7qadu76tx4@4978f4969bb8>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 14 Nov 2019 09:02:23 -0800
Message-ID: <CAOReqxgtfNWDZOMnT6nSWh408dsrGxJLVgKtUN2dNf0J-JpnWw@mail.gmail.com>
To: kbuild test robot <lkp@intel.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
 ALSA development <alsa-devel@alsa-project.org>, kbuild-all@lists.01.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: Re: [alsa-devel] [RFC PATCH linux-next] ASoC: rt5677:
 rt5677_check_hotword() can be static
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Nov 14, 2019 at 7:33 AM kbuild test robot <lkp@intel.com> wrote:
>
>
> Fixes: 21c00e5df439 ("ASoC: rt5677: Enable jack detect while DSP is running")
> Signed-off-by: kbuild test robot <lkp@intel.com>
Acked-by: Curtis Malainey <cujomalainey@chromium.org>
> ---
>  rt5677.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
> index 48955b22262fa..cd01a3a8daa82 100644
> --- a/sound/soc/codecs/rt5677.c
> +++ b/sound/soc/codecs/rt5677.c
> @@ -5243,7 +5243,7 @@ static const struct rt5677_irq_desc rt5677_irq_descs[] = {
>         },
>  };
>
> -bool rt5677_check_hotword(struct rt5677_priv *rt5677)
> +static bool rt5677_check_hotword(struct rt5677_priv *rt5677)
>  {
>         int reg_gpio;
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
