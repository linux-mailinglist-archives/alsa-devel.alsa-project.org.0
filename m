Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DD68FAE1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 08:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA65165F;
	Fri, 16 Aug 2019 08:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA65165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565936667;
	bh=BgZWMKWhAb2yP5J+27MN1VpmgULDcrys05puqFsLXiQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMS8l/wHmiwJBcURyXw8/E9Tu5LUSTMdP+9XfXmn4XHN104kDLezYFDN9gxAltLCu
	 7VplA2bNNZyVK360FDUhSekoP23mY/7ugs/+5ebTg9zb65F4iLWLvbuKY7mt0mkosZ
	 iwYP31C8qaYr8ZrKGxC+AkUBNKlk4bl5hQXdirWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73C28F80213;
	Fri, 16 Aug 2019 08:22:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76567F80214; Fri, 16 Aug 2019 08:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5202F801DB
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 08:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5202F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d2YLXXBO"
Received: by mail-lj1-x243.google.com with SMTP id x4so4319385ljj.6
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v14OzUMjNE/HZfmgpIMBDvJqOK1CswJ2VwtCDJGNi9A=;
 b=d2YLXXBOzD77vCmyMvNMNkLFQOk7NUI1qpgaDcil7EdRabwka633i5xOEC3ejL7pYY
 Wh44in0bgl21+YBTpijwOL92QY34JVSDRu48ytxYYkABfv4odbonMAnA3Nxe2cRjAWVA
 yl16HvY4gjb4mXLnUmMC5DWAnMQEtvU8s9mub2TsrRAslQfWbxFfvTEo4byXrIT7U/BU
 ddujW/xmZ1w5/dXspnNrvQFag4c+3/qm7lAw7hQVJr0nkWCCYYr6CSFfwB4KV5OX4KOi
 P0UmbrAsOQtYPm2DQ1mzBdxRoOL8UWH79mJ2rHUYPJphWQifjjlUBMBHOd0c/75WvAdQ
 Ithg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v14OzUMjNE/HZfmgpIMBDvJqOK1CswJ2VwtCDJGNi9A=;
 b=rXO9i2JUtndm8KT7dF7y1SGxqdnpoAy6ATDv0fNWF03JBKuTWeg46wbZTF6qIuHa9F
 akDtgCwtx1T5AiwHkBNIieT2qSa3ZAuIg4bwtKVZKHZWJnoObXgkV7Aw6iSh+8URNZ+v
 44Icew2GcFHwpvRKs5mMYozPVYmZnA2C7sS7VveIpn4f4CJtLFdRVm0jOjxiUJH/kr3c
 FLjRtOO5p38V6A8Wpv/1DxX9PCKY3+3K+iU5VngmPCmVSLQbaxbfPaFud5NkHJ2+a40O
 M4JOBhBbrXR8LuXxpSL+9cuw60oErpbADjwPmlj0NpEfBL+iWvP7U9n5OMFjD8luyPus
 eFmg==
X-Gm-Message-State: APjAAAX34o2RTUYTJ9Qe4X88VF68KuJ3Qcy0B4ZWYkPjhPX3d66F+3SM
 HIidkjgVx2+1UQavp8PzBbB0t/doWm3+rkAq9ws=
X-Google-Smtp-Source: APXvYqwhioniLpZMMBXNvBmmi5v2yWJBAdLohCrRL1i0nxn3uIqNq01gaFdnIoMaSgfpTsi8KzDMhjIp1PuPqIbAlHw=
X-Received: by 2002:a2e:978e:: with SMTP id y14mr4692405lji.10.1565936551522; 
 Thu, 15 Aug 2019 23:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-3-codekipper@gmail.com>
 <20190814093011.GD4640@sirena.co.uk>
In-Reply-To: <20190814093011.GD4640@sirena.co.uk>
From: Code Kipper <codekipper@gmail.com>
Date: Fri, 16 Aug 2019 08:22:20 +0200
Message-ID: <CAEKpxBkbuQZ9-XLCOcWxV5gzyXPbASmBgYVJ6fL5yj98GE0f9w@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 02/15] ASoC: sun4i-i2s: Add set_tdm_slot
	functionality
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

On Wed, 14 Aug 2019 at 11:30, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 14, 2019 at 08:08:41AM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Codecs without a control connection such as i2s based HDMI audio and
> > the Pine64 DAC require a different amount of bit clocks per frame than
>
> This isn't a universal property of CODECs without a control, and it's
> something that CODECs with control can require too.

ACK
>
> >       return sun4i_i2s_set_clk_rate(dai, params_rate(params),
> > -                                   params_width(params));
> > +                                   i2s->tdm_slots ?
> > +                                   i2s->slot_width : params_width(params));
>
> Please write normal conditional statements unless there's a strong
> reason to do otherwise, it makes things more legible.
ACK
>
> > +static int sun4i_i2s_set_dai_tdm_slot(struct snd_soc_dai *dai,
> > +                                   unsigned int tx_mask,
> > +                                   unsigned int rx_mask,
> > +                                   int slots, int width)
> > +{
> > +     struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> > +
> > +     i2s->tdm_slots = slots;
> > +
> > +     i2s->slot_width = width;
> > +
> > +     return 0;
> > +}
>
> No validation of the parameters here?
ACK
Thanks,
CK
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
