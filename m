Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF46B16A2
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 01:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD2B167A;
	Fri, 13 Sep 2019 01:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD2B167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568330662;
	bh=WvtYTndxytRu3XWaAZPsifF6YUsvrjjxJf1215GpLOo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mwk0YWOtodYXPvmFRGDqkjNJfCQX5QfH/sBesuFB0IL7tHUT0n4zZae3nCAa0fmo9
	 xUtpbeTi3cU21FQdCq8GvG8B18PY2J7aUzSp1oUnRPtvihXef2IV9G3VjGkJ9axJT7
	 IJNtrqnKfmDnZA98dkfUSIXdNuHZciONz36MakJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A6A6F805FC;
	Fri, 13 Sep 2019 01:22:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DC01F805FA; Fri, 13 Sep 2019 01:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C592F802DF
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 01:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C592F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mVclnYpU"
Received: by mail-pg1-x544.google.com with SMTP id j191so3715048pgd.3
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YmpY77tOjMlIBM+QNhtMQBjrqYVfrKFcyr6SgoPVdxU=;
 b=mVclnYpUotNVMVlsDFEnMjm9huupDI5osneDwNjpz3DEn7odTq1c2j3DWotgaHFfiP
 RrjHJyXSDm+jOs+8PAS76MemG0ZSxEVKxiDuzMSVkqgGaPZ+rBRIRjAdsDKGdsqmDTtV
 8Mt5Z3cBPNwe+5kJ6n1RslkClAwV6Wvjtx61BNTXpB7H7V+dtKgX9hc5up8a01GcBRgR
 1aygXyMNnQwQU56EcGzPJFVX4neoPPoyr92ld2d0Hs2kf0jf9Y5L3RTNqCXiFkcC2qFv
 z/cuxBvO5uT+Jm8RnPJQe231C5TPgiAibBCNfbVu/wM4UTIERhf0rLgrHxYfKtOwmB2t
 61+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YmpY77tOjMlIBM+QNhtMQBjrqYVfrKFcyr6SgoPVdxU=;
 b=seLPMJ6r7cYTIwUXTv6CQl8fp7K8RJj3JNy8qMAc1DuF17xjDeEV+B/fZT/0lrdxVe
 CTJRf1BGUDBfqfp81XgplWQ7iqu08E99Vz8KbLCqKZFwW/DbS6YMeWXzY3p2UBKOVcis
 QuVl0j1rKr2b/D/4DV+uzsLF/QkBaPNdqZ9oYLZPxGPOuZg00WGogqBq4m2qYYhC+WbJ
 9itOtdGiI9FytHx8DmEE55OFVzr4vJ9OcOd7Db72Ieav06tF+OSEuSQTx7VVGYEncrhC
 3Mvpk2YKTWzfKDydVzy7m3HUUwhvPjO8Z5ls1txX/CJlmEBHo39zE4RPo1qc4QQSCdEB
 Hrjg==
X-Gm-Message-State: APjAAAXLyxZhO6mmVbXjQvYdol8uckBxn//cUiQjwhatZ9wiYGJpYwyH
 w+bN1UT//rGHOEWXSuEVvRA=
X-Google-Smtp-Source: APXvYqzjkWQvAVi05TsLPjjsDKWOcCu5aiWUyBmF1hRLmeD9T7T6K9HbN6XFLr4Amm9oqjG/SQ3UEQ==
X-Received: by 2002:a17:90a:e98e:: with SMTP id
 v14mr1337906pjy.101.1568330519125; 
 Thu, 12 Sep 2019 16:21:59 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q204sm33758013pfc.11.2019.09.12.16.21.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:21:58 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:21:37 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190912232136.GC24937@Asurada-Nvidia.nvidia.com>
References: <cover.1568025083.git.shengjiu.wang@nxp.com>
 <65e96ca15afd4a282b122f3ea8b13642cf4614c7.1568025083.git.shengjiu.wang@nxp.com>
 <20190909200156.GB10344@Asurada-Nvidia.nvidia.com>
 <VE1PR04MB6479D271F4271ECF404473E7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479D271F4271ECF404473E7E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH 1/3] ASoC: fsl_asrc: Use
 in(out)put_format instead of in(out)put_word_width
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

On Tue, Sep 10, 2019 at 02:22:06AM +0000, S.j. Wang wrote:
> Hi
> 
> > 
> > On Mon, Sep 09, 2019 at 06:33:19PM -0400, Shengjiu Wang wrote:
> > > snd_pcm_format_t is more formal than enum asrc_word_width, which
> > has
> > > two property, width and physical width, which is more accurate than
> > > enum asrc_word_width. So it is better to use in(out)put_format instead
> > > of in(out)put_word_width.
> > 
> > Hmm...I don't really see the benefit of using snd_pcm_format_t here...I
> > mean, I know it's a generic one, and would understand if we use it as a
> > param for a common API. But this patch merely packs the "width" by
> > intentionally using this snd_pcm_format_t and then adds another
> > translation to unpack it.. I feel it's a bit overcomplicated. Or am I missing
> > something?
> > 
> > And I feel it's not necessary to use ALSA common format in our own "struct
> > asrc_config" since it is more IP/register specific.
> > 
> > Thanks
> > Nicolin
> > 
> 
> As you know, we have another M2M function internally, when user want to
> Set the format through M2M API, it is better to use snd_pcm_format_t instead the
> Width, for snd_pcm_format_t include two property, data with and physical width
> In driver some place need data width, some place need physical width.
> For example how to distinguish S24_LE and S24_3LE in driver,  DMA setting needs
> The physical width,  but ASRC need data width. 
> 
> Another purpose is that we have another new designed ASRC, which support more
> Formats, I would like it can share same API with this ASRC, using snd_pcm_format_t
> That we can use the common API, like snd_pcm_format_linear,
> snd_pcm_format_big_endian to get the property of the format, which is needed by
> driver.

I see. Just acked the patch.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
