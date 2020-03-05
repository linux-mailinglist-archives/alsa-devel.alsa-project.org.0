Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5917B039
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 22:02:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A89BA1669;
	Thu,  5 Mar 2020 22:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A89BA1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583442174;
	bh=VHeIp7Vf126zTQh+8yKcp+O0GCqPXKBZXNRRpBM9YEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kti9640P0bMKf/tlFhrPJJQj0pJUuxACWY1JBxhrReeIKWB8paDinqP+aFrk/6kbv
	 jhZW5XaCSORumDZfV/5O/zNhHiFJOcfhhVgrEDPtYRD7lvYMwPxyh0DMMLDp/jwV0y
	 PdtPZcN7vjaXsrqk8+lskTBGsHV0cHXDwl+tpeXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86CADF8025F;
	Thu,  5 Mar 2020 22:01:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F976F8025F; Thu,  5 Mar 2020 22:01:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C297EF8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 22:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C297EF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="I/QXXunR"
Received: by mail-qt1-x841.google.com with SMTP id v22so132714qtp.10
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 13:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rirrIqBp1YR7hjzgEMz3Rta06AiFV4BR0aGUnx3XIoE=;
 b=I/QXXunRVbFkGm/ZLRBPW3UsEw4H6o4hRmjQMTPkzGnV2vmi3JPOMeBD4CgS++3SeK
 cLFY8098wcd4R+PA/gxMvKOXe8Ch/CaldGDJCwyFc9tEz51/XIaOH8dQBtv43Q1VlRhG
 4OXwRQ8nNdnfOvsEvnyamZ46t2l1rYXoMJKxHv+/ilmczrkKPR1p9T4meSUfi4z8UciP
 szx0cTJbWHLmmV1SCOj1QGOsxthvh7S3oDFhNl47/R7/NaqbCweMx37J1FoWZBsQe2H2
 dnQwwIjmzrcDOzz05ZJzcGftWy0KbO7HvrhlbIKGdiB+IaqmsBuGY6zAiHygB4hp3fbB
 nTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rirrIqBp1YR7hjzgEMz3Rta06AiFV4BR0aGUnx3XIoE=;
 b=BAU85RA96cjcfpJWqVz/J3jt88heVkrRYq6wye0lhMu4FD3ksAfklkvnIOAwPwr2uf
 yUrCeewpEHVbTpDhh3lBJBfzGiwkIwm9JengpO0PGCP9GVfj3s/xJu7nrySfc+MGNJQn
 tRiTekjh6/+E9Y8hHv+Cgi/C7Rz+gTNieOtIBwqsE0Un4bzRTeMkoxMEmkpqJqcjBtV1
 O7r7vUqDCqxnoq+rWol+iUvfY6730MRKKdNg+FLcDqnFLCMQyKYnt6NakyjBVgykf96D
 T/zs/Jz4cE7xz7K35YX8OwikRK/AEzUW53TtRIOYwIJXkuAdcmAxcxWuibPfCvTH2qOZ
 u1ZA==
X-Gm-Message-State: ANhLgQ0gXytlTZ6aF/iL4PZWt5d2s7JTuLVluy9vaLmjHQy+zUnKwwNR
 5NtTRQikGjD6f4Xm6BDY5EyoSRAwIC8kGAlDWL3LJw==
X-Google-Smtp-Source: ADFU+vvXGIvyNEbhdAXOUMO6fV8hcppcasQNk9Y2u82llE9+NjxPBgupXTgs0hR3vvmt15kRRG1gWVbcMa3Cw/K3Xr4=
X-Received: by 2002:ac8:17ab:: with SMTP id o40mr92761qtj.308.1583442055471;
 Thu, 05 Mar 2020 13:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
 <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
 <20200305174324.GH4046@sirena.org.uk>
 <7c52ff6f-76ef-7c55-65e6-9c0437bb983a@linux.intel.com>
 <20200305183335.GK4046@sirena.org.uk> <20200305191059.GL4046@sirena.org.uk>
In-Reply-To: <20200305191059.GL4046@sirena.org.uk>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 5 Mar 2020 13:00:44 -0800
Message-ID: <CAOReqxhxZPvnRLssBgKKSHZ70Msj-eZwgNAu5ZmbLk+JWj8DNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
To: Mark Brown <broonie@kernel.org>, Ben Zhang <benzh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

+Ben Zhang <benzh@google.com> who wrote the original driver for our 3.14
tree.

On Thu, Mar 5, 2020 at 11:12 AM Mark Brown <broonie@kernel.org> wrote:

> On Thu, Mar 05, 2020 at 06:33:35PM +0000, Mark Brown wrote:
> > On Thu, Mar 05, 2020 at 12:08:57PM -0600, Pierre-Louis Bossart wrote:
>
> > > b) do you have any objections if we remove this devm_ use without
> trying to
> > > dig further into the gpio management. This is a 2015 product that we
> use to
> > > verify the SOF driver on Broadwell, not an Intel-owned device.
>
> > The main thing I'm missing with this is a coherent explanation of the
> > problem and how the changes proposed fix it.
>
> Just to emphasize: the main concern here is that the issue is understood
> and that it's not just going to pop up again as soon as something
> changes.
>
