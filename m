Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668921E06D4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 May 2020 08:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03D3D1713;
	Mon, 25 May 2020 08:19:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03D3D1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590387629;
	bh=JASidayBW8v8c4a1G+F4808rKv2FutCxzdkc1kcE/TM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGtvpEkRn+vNHZKhG9HPltngzO6B5KQmjXjVFxEyO67fM5KrP8xzD+vvXNBEdNm8T
	 6CJo80qTFm4JmWxHLNkBjpzUSFb7/sAAiD3B9IuPpA6h6l5nvC8pHpUbhrbhhNO+hP
	 uJ4yvv03LHLAgIj/iAAHlaGZXdDJJ1GYHg/sG4q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B97EF8016F;
	Mon, 25 May 2020 08:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F472F8021E; Mon, 25 May 2020 08:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05376F8014E
 for <alsa-devel@alsa-project.org>; Mon, 25 May 2020 08:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05376F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sgLbL5BC"
Received: by mail-pf1-x442.google.com with SMTP id 23so8424589pfy.8
 for <alsa-devel@alsa-project.org>; Sun, 24 May 2020 23:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qkQKxQdGGgWdvEooTQeXfQ5Uv6xFbcDpVhOQuc16oUc=;
 b=sgLbL5BCVGnsptyzLFvhBHakHWNFyE7cXapL55cgodXb2vOhXm56MOdyIhCbvyn+V6
 N5SpUnMqMfQTxpDC1oxfNr3O0Z5D9Q+P35dmFRYpwkUHzM7HUXzNKDIN4y3Q/pt4yOOj
 nJ79hm3sG+vkBgfUoOUM7+9/7ASYFUIelrkTzM+sj4p7iYvQyMjNUzbnGcY/2i3fO8x8
 78Xsdeo6b0CdlwlRBVjX9uib/uaYHpQkXdll055UGUGElf7mLUzQphtdpc4wZyA7j5eV
 FgMRfBBTXcDDFYydBzTMFJxhjryo7u9v5GiERnJ6QEtJl9DvihXJrH+0ZCeDrKJ9dyYr
 NrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qkQKxQdGGgWdvEooTQeXfQ5Uv6xFbcDpVhOQuc16oUc=;
 b=H1kGtscnY7efzDpWkJWRX3JUrJaPtoIy649/d33gjqonxVYbu6cPvrhTdi61RYEvt8
 Dl1G4GnYywxUbwF/kJTuXy8Wwml4IzF5C7JCumCf1H7sx0j2sBhR1r/+W+9pxD2Xevwa
 wztEGn9su9iDWbSm4wgNyzBF7bBDaHf5LjuDr+Xwpmdh5SbxTQEIT3MY/fnzBQ6HXv/m
 x2D6Hqk+wpqEjGZhd4n1YPkNagE/Z8x1kJLtJfJkoBQosrCHdV3YHTnYtUiW+LGdv7K1
 O0D5isrqb6/gSe03VUtMSAeBHYozAq5sNbejJ7bc6hS93oatNKvtXvAOjV2BP1GcPRDH
 TXbQ==
X-Gm-Message-State: AOAM531u7tkcVz7eXSuEH11NGfVVZy4STYKVYm5sR2L+qprvbx6ciZDx
 qq9zwJr1IjwzMO5jhe/sTgA=
X-Google-Smtp-Source: ABdhPJxg1bg01cddhbRJZVYfWekQ2aQNsAE8dMBcRjN0GaOgL4XmmTFhE2NzLEqiY8iUckwGGjP/VA==
X-Received: by 2002:a65:52cd:: with SMTP id z13mr10751049pgp.259.1590387512418; 
 Sun, 24 May 2020 23:18:32 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 i197sm24018pfe.30.2020.05.24.23.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 23:18:32 -0700 (PDT)
Date: Sun, 24 May 2020 23:18:27 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Message-ID: <20200525061827.GB12112@Asurada>
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
 <20200525050950.GA1244@Asurada>
 <CAA+D8AML7P3j+14w5PywPy4QEcxw09z1izZSZbrOB_nte+XDmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AML7P3j+14w5PywPy4QEcxw09z1izZSZbrOB_nte+XDmA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, May 25, 2020 at 02:11:18PM +0800, Shengjiu Wang wrote:
> > > @@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
> > >                       goto disable_asrck_clk;
> > >       }
> > >
> > > +     /* Stop all pairs provisionally */
> > > +     regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
> > > +     regmap_update_bits(asrc->regmap, REG_ASRCTR,
> > > +                        ASRCTR_ASRCEi_ALL_MASK, 0);
> > > +
> > > +     /* Restore all registers */
> > > +     regcache_cache_only(asrc->regmap, false);
> > > +     regcache_mark_dirty(asrc->regmap);
> >
> >
> > I see you doing regcache_mark_dirty() in the resume() now,
> > being different from previously doing in suspend()?

> Which is for probe -> runtime_resume case.
> After probe, the power may be disabled, so move mark_dirtry
> to runtime_resume, then regcache can re-write all the registers.

I see. Just noticed that you add a regcache_cache_only
in probe(). Acked already. Thanks.
