Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423EF430EEB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 06:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C588A18A9;
	Mon, 18 Oct 2021 06:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C588A18A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634531632;
	bh=whLYPxmHlljqjllxvywOoFD6tbvpSuzkaJcQpgo6qAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UFpaLM+GdueIbiD5lgB7p8alggGXVrCCkwK2CaA2OrbKl4HzeSM5EpWDeWH3e2dYS
	 Hz8FXqgUPVnbPyhAP+r1194sr+uJebw5geYM1ZViknfjgXvZ7OCVaw4SsJjXT4eDpS
	 bnrLdrzCRv34J6KsDF6i3uyIr5DrEb212FGUNoao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A901F80253;
	Mon, 18 Oct 2021 06:32:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A66A0F80224; Mon, 18 Oct 2021 06:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A120EF80111
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 06:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A120EF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Z8qvok2J"
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 70FDE4005F
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 04:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634531545;
 bh=U/lrU9doQqwd1ysFTM7JHi6pcoTfn5h3DmiyMc5pktE=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Z8qvok2JIn8qrfsneVeI//RHbP3KUpI3F9cC/8hA6aNFBrvhZWpXKhkYFQ6n1Y1dP
 cxheHktznMd0pStotod0v3cj/6JiEInjn8r2AJJaILmZzbm7KvB/BYKsnohUo1FeXU
 fApKYl2sFJqdZDG4d5mSWJ/tGLM1qf0b7lSVpUjWSYXLaQ0E75dNU487EzP2K2S9BJ
 bJPYXBl643GIiMw3AKaEatTVHg8VtzBfhjWx0lS16AbBZA1lt4PYI5OFAQ7nfa66nY
 YB8t1zUfOOc0Tj9F+1J1eEA2j27ZrOwv3kd2VapfER1QbYAMhuZqLtF9oxSeSNviBf
 93s4JdjlCazRw==
Received: by mail-oi1-f200.google.com with SMTP id
 x17-20020a544011000000b00298d5769310so8082298oie.12
 for <alsa-devel@alsa-project.org>; Sun, 17 Oct 2021 21:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U/lrU9doQqwd1ysFTM7JHi6pcoTfn5h3DmiyMc5pktE=;
 b=46XuW6yJBb0lGAJWaDN7pATm50H0kkUXZjTdLGEYfu/smpZBspSp46w2pxebaxQ8PA
 eHbMq/kyUfpTOLt5MdW9IkAHIOes/wrF7gcB2bVGaz1lrK/od+wcNKQJwX/IbJryvLEY
 MlWZ2OTiR50UN22nktYc5sAi0+gkOcRmD+ILkxq8BXmeWXCGU+aO/h8DV+8GVteaxRC2
 ZAmrveRdrmL422pkaI+138z92h+UzVqRi9IhfSLUIlKYfzmp6jN9XXuSHup6cncW6pJy
 /T6dZn0MHRmv4Z91nORbc8Bgd0WP47N/sXUDBqzcpH68RWFpI0pr/BLcj6QSxoSsN9Hc
 zJVA==
X-Gm-Message-State: AOAM532rn/s6+RkYc34jfSs4edSjAiov2pJEFIdZOu81L8l5KyWPEBfl
 W4jSJtXj2zpAWeRSR+PZEiCuwkr0WztPugd4/C1+rbKNX8L6LRM7QG/Bt4X4AzUQYJXw3CLoBdJ
 vJcY/61IWOfGpuTPh9JADADeY6WBLFrlGpe6ZRGhJdDFVU62MDJoXzYBU
X-Received: by 2002:a05:6808:11c9:: with SMTP id
 p9mr27660161oiv.169.1634531544234; 
 Sun, 17 Oct 2021 21:32:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuwwDiJXobfmICV3J4V1DJfAAeQOnBhDnLKVgpTY/0U0gwOLHN8hw694iB0C7OGHwtxz5lB0GaTbOogGT67k4=
X-Received: by 2002:a05:6808:11c9:: with SMTP id
 p9mr27660146oiv.169.1634531543919; 
 Sun, 17 Oct 2021 21:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211015133424.494463-1-chris.chiu@canonical.com>
 <c40282f6-cb8f-22ca-4a57-26fcbc39f423@linux.intel.com>
In-Reply-To: <c40282f6-cb8f-22ca-4a57-26fcbc39f423@linux.intel.com>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Mon, 18 Oct 2021 12:32:12 +0800
Message-ID: <CABTNMG0oef2AQywfzQ3iMfHWXxi6RDUL9VaQ_cYfbFp1JZqAWg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Initialize the sof_sdw_quirk with
 RT711_JD_NULL
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 yang.jie@linux.intel.com, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On Fri, Oct 15, 2021 at 11:08 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 10/15/21 8:34 AM, Chris Chiu wrote:
> > The jd_src of RT711 which is initialized in rt711/rt711_sdca_init
> > will be overridden by rt711/rt711_sdca_add_codec_device_props when
> > the sof_sdw_quirk is not RT711_JD_NULL. It will force the JD mode
> > to RT711_JD1 and cause confusion while debugging the JD mode of
> > the boards without quirk. Initialize sof_sdw_quirk with RT711_JD_NULL
> > to honor the jd_src value in rt711/rt711_sdca init.
>
> Not able to follow what the "confusion while debugging the JD mode of
> the boards without quirk" is. You need a DMI quirk or need to override
> the default quirk with the kernel module parameter.
>
The JD mode will be set by rt711/rt711_sdca_init first (which is JD2
as https://github.com/torvalds/linux/blob/master/sound/soc/codecs/rt711.c#L1209.
Then it will be overridden by rt711_add_codec_device_props() while doing
rt711_parse_dt(), which is now always JD1 since the current
sof_sdw_quirk init value.
I'm afraid that JD2 is a more preferable mode rather than JD1. Then we
will have to
maintain a bigger DMI quirk table for more and more coming alderlake machines.

Given the rt711 codec has initialized the jd_src to JD2, The
sof_sdw_quirk should only
override it unless necessary? But now it's forced to override. Or can
we have a more
generic solution for it?

Chris


> This also has the side effect of breaking ALL existing DMI quirks
> implicitly using JD1...
>
>
> > Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> > ---
> >  sound/soc/intel/boards/sof_sdw.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
> > index 6b06248a9327..d05c0565e09c 100644
> > --- a/sound/soc/intel/boards/sof_sdw.c
> > +++ b/sound/soc/intel/boards/sof_sdw.c
> > @@ -15,7 +15,7 @@
> >  #include "sof_sdw_common.h"
> >  #include "../../codecs/rt711.h"
> >
> > -unsigned long sof_sdw_quirk = RT711_JD1;
> > +unsigned long sof_sdw_quirk = RT711_JD_NULL;
> >  static int quirk_override = -1;
> >  module_param_named(quirk, quirk_override, int, 0444);
> >  MODULE_PARM_DESC(quirk, "Board-specific quirk override");
> >
