Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F0B3D22AC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 13:26:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B37E16D7;
	Thu, 22 Jul 2021 13:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B37E16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626953182;
	bh=FAR5ieDiKGDNwTcePZeQpDYD1f/JWYec24NBPYu10wA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2r1E5OM4Wwe/sPj1+gTq+TM/pqgE9o6gNj1doSEnBPdEXB/vykc8H/lUts6a2X55
	 sUBQnYeWsz6p3j6IscDx19LgRLAqCavad1BKn8nfgte4KH9YS+Ac+FnyySAsk9GDEX
	 c6GuTIE5USBYNNdFHaRLOp0mGT03ckjJXvrZBI/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C41CAF80114;
	Thu, 22 Jul 2021 13:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6F0F80227; Thu, 22 Jul 2021 13:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4507F800DA
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 13:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4507F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gzpBTRdQ"
Received: by mail-ej1-x630.google.com with SMTP id qb4so7811486ejc.11
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 04:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zL2aOBuAI0jpx1RVe+pXYJunWCpyUrXi51PbpIodnNQ=;
 b=gzpBTRdQb4tmAtuw9XOdMUMm8drJOSGlWqw6GltvthXERDXTkyAu2IxjXmQLBZp3oX
 GWw/VS3byQ0fYdKJRUrXQTQbpfXf9bnVdybouqR4duUvhmg4D9LKMladshK44bizMuCw
 2dY31n+pyuto3FYcEOGpTsh/QWRUSTvPnqBJ54lQtMYC8RTUce8kszpINYbx1vHKmbgN
 Bj3jK2nn0kE+41oi1tjXi7WyNxJFvzjcXbGq7TIcrbQcpPdWHLyeLKV2PRnot2SU0Py4
 6qS/oSli5qXV/qgomvqTDwq+FakClDoQTk3ckJ5MPgb408L8+I/xWWPfKqdV3gQtNnLV
 u10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zL2aOBuAI0jpx1RVe+pXYJunWCpyUrXi51PbpIodnNQ=;
 b=Qqe01CYB+LyLRcQ1zeNpQoC+sFEk1yMgXvhTTN3lzybxeRVhT4bMmrUcmC1Q/UjZ1e
 8cquRf0IFhNppQ+P6xbFk6UleopSUKUGZgV1nJf4kj7uL1oFXFvYRMG1JczHTnyZ2U8W
 xnkwnmG3/rFYyUExWAp58UR1O+zbZ0f80P0jGNomr3vmyOpRLC7OAwOjdNfG5aR6FXfs
 isjeXshKgCOoEO2JZ9tilTFEYQ4cF26y5gKBh+WddqicOk08vKjDYKiLxFgHbXPi8T9M
 JbmR4Q2AtUSDEPgSvPWjKzHOUwWoGkeCJ6pP7yQYH0ojXZYMc879Ic6vHSWbCPzoJMjj
 SoQA==
X-Gm-Message-State: AOAM5316NjXjoBehsD0L1k9DjZDGAjEJWf7CAzl/wiSHbWavvkN9n7Md
 s04mLWu+Qf1Z0wOGXk+3lo9CG2DymgdoZ826mOQ=
X-Google-Smtp-Source: ABdhPJzCgQW9i9kPK7gINwayDcANDfADkeQXEdbaqZVjue4FRg439VRZFNB/kKP/8cbdP2T1zZqgSVdP+2BpW0fJK1k=
X-Received: by 2002:a17:906:3006:: with SMTP id
 6mr43997084ejz.73.1626953083091; 
 Thu, 22 Jul 2021 04:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210722105611.1582803-1-mudongliangabcd@gmail.com>
 <20210722111654.GW25548@kadam>
In-Reply-To: <20210722111654.GW25548@kadam>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Thu, 22 Jul 2021 19:24:16 +0800
Message-ID: <CAD-N9QWjjmUUSOmcBJX2n0zJrNRK3hPd03M=NbAfWNamEkfhJw@mail.gmail.com>
Subject: Re: [PATCH] soundwire: stream: add s_rt into slave_rt_list before
 sdw_config_stream
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Thu, Jul 22, 2021 at 7:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, Jul 22, 2021 at 06:56:11PM +0800, Dongliang Mu wrote:
> > The commit 48f17f96a817 ("soundwire: stream: fix memory leak in stream
> > config error path") fixes the memory leak by implicitly freeing the s_rt
> > object. However, this fixing style is not very good.
> >
> > The better fix is to move list_add_tail before sdw_config_stream and
> > revert the previous commit.
> >
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  drivers/soundwire/stream.c | 14 +++-----------
> >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> > index 1a18308f4ef4..66a4ce4f923f 100644
> > --- a/drivers/soundwire/stream.c
> > +++ b/drivers/soundwire/stream.c
> > @@ -1373,19 +1373,11 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
> >               goto stream_error;
> >       }
> >
> > +     list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
> > +
> >       ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
>
> There some sanity checks on the stream inside sdw_config_stream() so
> that's probably why we didn't add it until later.  (I don't know the
> code well, but that's what I would suspect from a glance).

I think those sanity checks are not much related to list_add_tail.

Except that, do you have other concerns?

I think this patch could improve the readability of code, so I submit
this patch to the mailing list. But I am not sure if the community
favors this kind of patch.

>
> regards,
> dan carpenter
>
