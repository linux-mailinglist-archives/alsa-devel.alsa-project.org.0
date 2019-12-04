Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7C111383D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 00:31:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 444C81670;
	Thu,  5 Dec 2019 00:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 444C81670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575502283;
	bh=1JQoOAUk7JE1sZcavZgC61HyVtxEZukrJSPi3bhPbsE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OrHdGiTHCYh/AmdRIfKaiX9KYYL/qadCD6FMNt2M/oABaZsZak9clgH8wbbWEadom
	 DeAxECraC9kHb3ruNiQIE7kykAsF7fN00WaeiCBCJQoGeXxveJwvHcTR2V6JIZxRSE
	 X3FTK7nWx2fVKxmKssgXvHEOnBjY+qpyO8wCG/90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A56BF801D9;
	Thu,  5 Dec 2019 00:29:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A3A0F801EC; Thu,  5 Dec 2019 00:29:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBEE6F800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 00:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBEE6F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="kvYXtn4p"
Received: by mail-io1-xd42.google.com with SMTP id i11so1513640iol.13
 for <alsa-devel@alsa-project.org>; Wed, 04 Dec 2019 15:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRvx3NBCRW7H3nfKt+ATQ5trxxtCYotjD7A52bp3YvE=;
 b=kvYXtn4pJrKiwjNP4EH0RFGVWcxNK/ClNy1lQyj4yNJOjZdx1vikE+uOcx/jc/tqi5
 EWOT9eFgYG9Iy/r/onp60sVjDhyu/yqm+AC3hWVydUmcPNTNleZ4CHFMi9guskUSq93t
 u3nz4lGlPFAtDs+n52ixmx9Kuwz/RlfpVRlNMp8UcO2OupJ0QSoO5h0+x51yFNGwzshW
 U8VbL8C0LnU1VHs2jcbvSjpSalPqYejze9hblsj1DAnVQ+xSj+idnITeKYb1D1mWXNSw
 YJ7SSdA9sWND+YI0Zls1eCADAaDz4LuGSxxaKJCwQU+pvRB+7orsFxjRZQUPhay39yoI
 Yydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRvx3NBCRW7H3nfKt+ATQ5trxxtCYotjD7A52bp3YvE=;
 b=N7uf+AVlRoKqP4QBtv1Hluu94iyBxWfeOfCQ6KFt2DUsU9rSKTrdK0I2jUzikUplJX
 Po91aPhuYNWvLrXgRI58p4KXKs1B93DZvqYuMK8mbnm8iSU1UdrXhCaryrhjoepxsO+u
 6XPvbAFh9jzB4Nvo2cKm0NeRQM97WBcPTvU4rnDWjdl5eUrbgYceV0DrpGXRh1SXFCGw
 z+ewBWATc3BGCwoI4lSjowPNzv5KcQqugyuW8Qw8n9cIHMkE0pOe+42RAm2hTWLIZiZF
 U8DWw0BgU7MFZZOYb7zHleHplp44X6VLM8c8mwDlO1Pl9SzSQDS6UN6/hOcwe5Rq5f8t
 pqUA==
X-Gm-Message-State: APjAAAV6YaTS1DgSNB7d/gWbD38WQZ4fPI+++qu+9RHLW1vu7/ylXSgo
 7xcItyxy/tXFY2roe/ASRNk+0WAQjCaJ3S1++8lhrw==
X-Google-Smtp-Source: APXvYqwjNrJKxK+w6PYSwK92AlpyKx9m0AOOVLTfkIiaw56cHw21U5ocVBeG2AD7BhA2IgG5gqt+9DQlVeGcpPe8MUs=
X-Received: by 2002:a02:7f54:: with SMTP id r81mr5632654jac.121.1575502168219; 
 Wed, 04 Dec 2019 15:29:28 -0800 (PST)
MIME-Version: 1.0
References: <20191204151333.26625-1-daniel.baluta@nxp.com>
In-Reply-To: <20191204151333.26625-1-daniel.baluta@nxp.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Wed, 4 Dec 2019 15:29:16 -0800
Message-ID: <CAFQqKeXG3ihj67L+KgKZW=Cp6ipJC18wUVci3hGTMutBv4boZw@mail.gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, 
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: Set dpcm_playback /
	dpcm_capture
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

On Wed, Dec 4, 2019 at 7:16 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:

> When converting a normal link to a DPCM link we need
> to set dpcm_playback / dpcm_capture otherwise playback/capture
> streams will not be created resulting in errors like this:
>
> [   36.039111]  sai1-wm8960-hifi: ASoC: no backend playback stream
>
> Fixes: a655de808cbde ("ASoC: core: Allow topology to override machine
> driver FE DAI link config")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/soc-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 977a7bfad519..f89cf9d0860c 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1872,6 +1872,8 @@ static void soc_check_tplg_fes(struct snd_soc_card
> *card)
>
>                         /* convert non BE into BE */
>                         dai_link->no_pcm = 1;
> +                       dai_link->dpcm_playback = 1;
> +                       dai_link->dpcm_capture = 1;
>
Hi Daniel,

Typically, for Intel platforms, this information comes from the machine
driver and there are some DAI links that have either playback or capture
set. But this change would set both for all DAI links.
Not sure if this is the right thing to do.

Thanks,
Ranjani

>
>                         /* override any BE fixups */
>                         dai_link->be_hw_params_fixup =
> --
> 2.17.1
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
