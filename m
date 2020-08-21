Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A537F24CFE1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0895A169D;
	Fri, 21 Aug 2020 09:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0895A169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597996103;
	bh=aPjlnF14zgZg8tK3QsIiYKwfQ5nIQhoCFtQERsafaLA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i/xE/Sv5NMBzXZIq4ufPBhZDz8zaBVh3KHl7o0zwrHBgZxCszvx/7gBUcESQX0/VM
	 sdRnVyOhos1glCqoDeG0PgQ5c1LFQc1H954/Bqe9K6gHRSrjLGIvWxiHXOrXuQ9uIJ
	 DszwW3nsBUknR1TeOMs8eAgzfzOJvKVphiegtX58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA5AF802DF;
	Fri, 21 Aug 2020 09:33:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87079F802DB; Fri, 21 Aug 2020 09:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3079AF802A9
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3079AF802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oQqWiBbc"
Received: by mail-wr1-x42c.google.com with SMTP id r15so1007107wrp.13
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 00:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7af5XMotKX7+7pq+GDcHe4RuHh/qDb+P+7bkBuurbqI=;
 b=oQqWiBbcvD1Lxxady4jXWmfyeyQJZRkYXxNWMUQpC6ZdDn6p5aa/V1Kt4h5O0qvkP3
 mhoXVj2Uv58p18uP9XmQ+3Ec538e+VMaCMy1VBzBAjfDOfweoADp5GC4IIj4/uhei5ES
 F17DvcL1eHVlzQb2uCGQoEmlz19cY9vZyQKAWEI/AJMdR0xDvhstXnbu9g47OGMNSGm9
 wiAysuM46eaExOcnMx7qxv9snzFp4OVLgKPEmiJ86qA5aoZ3v1APeYfk9xjsxM45VIrW
 8bToMViCZqGNAz9xaKBbpRq65e9yZpOERC04zESKyX964rJWO4tcE05XkBEbWtBfbZD1
 pBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7af5XMotKX7+7pq+GDcHe4RuHh/qDb+P+7bkBuurbqI=;
 b=LtVTfeWrILnrZLzl8dy8VuNkKf+Jt4b8wdH4qec7D/gAIhdz635wWPXs22lT9CPK82
 GhxuD0FEZaFuS5pqFmC7AqrYmPB3FR9Lu1MX59yDGrUjcOALCkPS8NVzuulCt2v6JKeQ
 TROSfeoNgr8yA8c7tEVvqJbwzfqWOB7CGxAX1b4hi4GXs/DArUThuE50FAo7nDDepcxf
 eaOIFL/tMnXb9a/weuqkh35cwoeIkz4776jaI/+6w1m44qn4cXgQwRCew9GnNCiEVCeU
 5ivwQEY+ofU+1xjCcnnz0F0FyA+c6Mp3MQwvc9Jw0UTlI0WV9jyC1atory78NtyrRoLV
 1t9w==
X-Gm-Message-State: AOAM530YEFWIWrFI3wu0KIxPZN7tMytaGIK3t1komtSRo2ILrNVB7bp6
 UV44+m8d1Oohoymzsd7qi+Y6OkD3whB8HOqmxGo=
X-Google-Smtp-Source: ABdhPJzl0JeDqHGYoVYAJh80c2IEY966kQCF6X3dAY8wrLiISpuuSsAPpidFO7bLjXn4TlVahutsvmFLrYl9EwqiL90=
X-Received: by 2002:adf:ef08:: with SMTP id e8mr1577386wro.164.1597995215644; 
 Fri, 21 Aug 2020 00:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZCsy+QiMpCCRPNF-BUcjaT+UVE2B_a6Bd48f8tRqXTpOA@mail.gmail.com>
 <87h7swzclq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7swzclq.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 21 Aug 2020 10:33:24 +0300
Message-ID: <CAEnQRZAPeGcBYWjdJOaUNdeqpdbNw63m9QxpXFM92HoD-29ysA@mail.gmail.com>
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Sameer Pujar <spujar@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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

On Fri, Aug 21, 2020 at 10:25 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Daniel
>
> Thank you for your feedback
>
> > > Because of it, the connection judgement for normal vs DPCM is tricky.
> > > I know Pierre-Louis want to use it for SOF, but something is missing,
> > > thus, can't use (?).
> (snip)
> > Thanks for having a look at this. I also tried to use generic machine
> > driver (simple-card)
> > with SOF but I had some trouble creating desired DPCM links.
> >
> > Main limitation of simple-card is that there is no direct way of
> > specifying DPCM links.
> >
> > I had an attempt to introduce a more flexible approach for that here:
> > https://lkml.org/lkml/2019/10/13/123
> >
> > but obviously we can do better than that.
> >
> > For now, I'm using only normal links with simple-audio card and it
> > works fine for
> > me with SOF, but in the future I think we might need to expand that.
>
> OK, the issue is also normal vs DPCM judgement.
> Maybe having "dsp" can solve it, same as audio-graph-card ?
> I'm not sure we need to update simple-audio, too > Mark ?

Yes, the condition choosing normal vs dpcm is fairly similar
for simple-card and audio-graph-card:

if (dpcm_selectable &&
    ((of_get_child_count(codec_port) > 1) ||
     adata.convert_rate || adata.convert_channels)

Can you expand a little bit more about what having 'DSP' means?
