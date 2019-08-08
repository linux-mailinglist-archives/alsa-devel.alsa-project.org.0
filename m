Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9598886A88
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 21:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331191612;
	Thu,  8 Aug 2019 21:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331191612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565292260;
	bh=NwsCAXzSW37RPiDp/wR33oWyoUHVMz5SO59V5SZ3UDk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oSPSJ9bq7U8JpZeqG/7Mx9yIi3+31qKyptx7BoR/Wqj3XZBxybgZRQDk4qWHRkFn+
	 mk2KYkXJsXaTtQbj/9/PmzVytPFJgtLkH5IEuF0NMhQEN8RjURmeiDTL3cVA6IdgE+
	 FbuAuNY/3qalaa43Zi47efStIFxKH5Uou+Syh4wM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E67F803F3;
	Thu,  8 Aug 2019 21:22:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39BC2F80534; Thu,  8 Aug 2019 21:22:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD31DF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 21:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD31DF803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="ho/cJY83"
Received: by mail-yb1-xb42.google.com with SMTP id q203so3393912ybg.11
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmqTcOsjxckEEwqwnfFmcZmRZSEGwpZuTkqoj8Sid+I=;
 b=ho/cJY83Hu2xMiKkwKteSK3qDrn0jExdJSBQGQMQha+hyrsIXl9N695caLGMVTNcTw
 fmyx6uJGee9pyb2vl4OOzNMpm97+eUQpOf4fbteQWnAMlybJQPbGCbH/4I4o3gfAq2l/
 aqu8KEWrDCQu0IVQOHQVBohvLsZm1VOjq7SxyAlemMz4odhjGMfVl8a90Emj+LD/iPuy
 QwglAuTm2uoE5hehfn003yvcqg4h2gKVB2eKwLMm4+in2hpnDROzVheqKirafTzS1kma
 ix4nH6H5QJ+Oy4Vq4HVMBB9J0Y71aHtS82yD572bgXC5Xk4nbspRAJmDRfVfZs6Drjvz
 9CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmqTcOsjxckEEwqwnfFmcZmRZSEGwpZuTkqoj8Sid+I=;
 b=Fn6ORjgUmIcwmuZDTEmiPrZmH2hqz4zCaCzfmCcAUfVTy2gAnKs9NqHviN6CudTPMH
 SHew8nNre7PlDCHQP0VI74w2xRFBc/XPBZRXWUCpqsEAJCfWCQv0gRUVtNc7ZBhEgStf
 70L+yG4IiWPxL4zmRRFrR1N6wEqnGHkOaoHCcCvrwGZ15vuyJh2bAS07XeRYrYGZaljM
 bkzYpPCC92PwBMAObW51uneMun5mTlOkS4ogunabxmGasESg4fz1Bcs3HgFORQwpcS+1
 22tQdRtnYBOK1JrOckZwz3fL4ousTBYoEWLEuWgPni6R22JlgFC7gCS1n3xW6K2fvH/T
 FJiw==
X-Gm-Message-State: APjAAAVeidp+CyOF9oT9iWEK7hTcg8TcnTqLsge6dQyEOPlSJNsxRzH7
 hYjDFeTNMXu7Agjzx7Y52ZqTZVs4K/3QinSWZcFoxQ==
X-Google-Smtp-Source: APXvYqyWUVJrZ0tINlQckfeaNKdtsuO5asKhsx/6Npo1jNRvHLPO7fuXoFeKtNAPFILhuEM4KCxHos54kUnxcrujOhM=
X-Received: by 2002:a25:af45:: with SMTP id c5mr11737797ybj.193.1565292148594; 
 Thu, 08 Aug 2019 12:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <1565251120-13082-1-git-send-email-mac.chiang@intel.com>
 <CAFQqKeXO5XHTrgTvXDRtqPDZZNrb24GB9ps3L=7WYadW0nYuKA@mail.gmail.com>
 <555a5469-a49b-92fa-cf8a-d379c2f46b05@linux.intel.com>
In-Reply-To: <555a5469-a49b-92fa-cf8a-d379c2f46b05@linux.intel.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 8 Aug 2019 12:22:17 -0700
Message-ID: <CAFQqKeX7C9BZ+bn5T8mJKy6+3y0GDOCCt+OxePpT6GCN-PqpfA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>,
 Chiang Mac <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Bard Liao <bard.liao@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake machine
 driver support
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

On Thu, Aug 8, 2019 at 12:15 PM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
> >     +       } else if (soc_intel_is_cml()) {
> >     +               unsigned int i;
> >     +
> >     + broxton_audio_card.name <http://broxton_audio_card.name> =
> >     "cmlda7219max";
> >     +
> >     +               for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
> >     +                       /* MAXIM_CODEC is connected to SSP1. */
> >     +                       if (!strcmp(broxton_dais[i].codecs->dai_name,
> >     +                                       BXT_MAXIM_CODEC_DAI)) {
> >     +                               broxton_dais[i].id = 1;
> >     +                               broxton_dais[i].name = "SSP1-Codec";
> >     +                               broxton_dais[i].cpus->dai_name =
> >     "SSP1 Pin";
> >     +                       }
> >     +                       /* DIALOG_CODEC is connected to SSP0 */
> >     +                       else if
> >     (!strcmp(broxton_dais[i].codecs->dai_name,
> >     +                                       BXT_DIALOG_CODEC_DAI)) {
> >     +                               broxton_dais[i].id = 0;
> >     +                               broxton_dais[i].name = "SSP0-Codec";
> >     +                               broxton_dais[i].cpus->dai_name =
> >     "SSP0 Pin";
> >     +                       }
> >     +               }
> >              }
> >
> > Would it be possible to keep the ID's unchanged? Its quite confusing
> > with so many platforms reusing the machine driver so it would help if
> > the changes are minimal.
> > I understand why you want to change the ID's but it would be simpler to
> > just use the existing ID's in topology I think.
>
> Ranjani, just to avoid confusion here, what 'ID' are you referring to?


> I can see that in the existing GLK code (copied below) the .id field is
> not touched, only the name and dai_name are changed, is this what you
> were hinting at?
>
Yes, Pierre. The DAI link ID's as defined in broxton_dais[]. I guess Mac's
intention was to keep them ordered for by SSP port numbers but it is not
really necessary to do that. The ID in the topology can be changed to match
the ID in the machine driver.

Thanks,
Ranjani

>
>         if (soc_intel_is_glk()) {
>                 unsigned int i;
>
>                 broxton_audio_card.name = "glkda7219max";
>                 /* Fixup the SSP entries for geminilake */
>                 for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
>                         /* MAXIM_CODEC is connected to SSP1. */
>                         if (!strcmp(broxton_dais[i].codecs->dai_name,
>                                     BXT_MAXIM_CODEC_DAI)) {
>                                 broxton_dais[i].name = "SSP1-Codec";
>                                 broxton_dais[i].cpus->dai_name = "SSP1
> Pin";
>                         }
>                         /* DIALOG_CODE is connected to SSP2 */
>                         else if (!strcmp(broxton_dais[i].codecs->dai_name,
>                                          BXT_DIALOG_CODEC_DAI)) {
>                                 broxton_dais[i].name = "SSP2-Codec";
>                                 broxton_dais[i].cpus->dai_name = "SSP2
> Pin";
>                         }
>                 }
>         }
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
