Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97AF1C6FAD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 13:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 655301761;
	Wed,  6 May 2020 13:53:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 655301761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588766033;
	bh=CZRiv4UAAv2RwJWcouMRkSsArPigsP7iHjNy3jpG7eQ=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikB9Nn5zjZBjUM7CVY3Yhnq9+zkAyBG7uWwUVYXtkwi9D9tp0YWZJ4cCLLn6dZJMe
	 HHSCQgcT0r8dk31rVeD79buu0XF40QPwlZ9dKdT8K4UkOT0ttTmTWONId+BbRZl7y2
	 8xdR69t/nV7mTiSlhXWbHbCuNWQs//AtY2zn1nRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94BDEF800DF;
	Wed,  6 May 2020 13:52:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1784BF80249; Wed,  6 May 2020 13:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 013ADF800DF
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 13:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013ADF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="E17m3b/g"
Received: by mail-wm1-x344.google.com with SMTP id x4so2266757wmj.1
 for <alsa-devel@alsa-project.org>; Wed, 06 May 2020 04:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=XBB+wIQ1zosOEyZvUXCM3lOhjUniZxLo8oqY31+qJpE=;
 b=E17m3b/g5zV4eYdkmltAKLSJ1i4A2fJqd/ngHggp+2V7nFIM8XkHPRivmN/+W3cpQe
 tZVuTJiGLPtSQPKaRYm3WHdquhC60DjHC7oyZ6sPj9oCXoWmayMiIwyCwF9PMpQbuzLs
 CqZFz4Km8f2kYkl5DCk/PStAaytK2uaI0jSwfc11bv+d9MrCRH3pAO6Jp6iKy0SM2gJ4
 YOaNhZbEoGTnboj5PPCUp7LfhoWtioG5DX1KLx7eVPPwt1Fp7axkek6HSyrxGIWSyVus
 hHopPI99mbqnVAJ+44ylzldfc9iqFzzIFHNirirt9gB7dGuq7H63BI1/4mdT6SIJt++3
 Hmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=XBB+wIQ1zosOEyZvUXCM3lOhjUniZxLo8oqY31+qJpE=;
 b=Q5Tkfm0xZRPMzASOPqwv0LXyFzIVJ45Ms5Eo70ARClsKfuTgowjNphH2O1UHLBlErx
 a1ukW90UbQf/Cr91g5s8zi0SXmn1/P9pzDT37ozC2zzCwLYamvFZjCaOBLeGw0mW4aOd
 ND+zkg8adBvV9KNHam2j4VmCxpThf5ffSvujlhCSUVvyOmIxgb++bQsD8dGbJ7eY2w2K
 r/HoftWMcsmVMxFyJ2o6WAUPWIgwK55mikg9MtQoeZVRDJ9R9RTl9vttRNq9snrAdH4O
 CrJL6it3QgBIu2Ht0GL0987bzVWJFSirMdC9Pxj0p9/m8sAjI+jXKzxx5d4i7L3kEbkd
 /fOA==
X-Gm-Message-State: AGi0PuZ1ZZEJPa4wGJ282hcIZm05ozTJndJGxQzvKoKawm0XO748XwEy
 Ri8ZPAZQ9SE7QT1pJbqErB/VtA==
X-Google-Smtp-Source: APiQypJYPcTh+DtH5BqedeYpWvgWCBS2f6MPqH4pLuBqKuAFbyeb/wh4FxRArj1tPcWJin+/LHBMSg==
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr1482386wmu.77.1588765916800; 
 Wed, 06 May 2020 04:51:56 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id w18sm2167174wrn.55.2020.05.06.04.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 04:51:56 -0700 (PDT)
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, kuninori.morimoto.gx@renesas.com
Subject: Re: [RFC] DPCM for Tegra
In-reply-to: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
Date: Wed, 06 May 2020 13:51:54 +0200
Message-ID: <1jzhalffhh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: viswanathl@nvidia.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 nicoleotsuka@gmail.com, atalambedu@nvidia.com, nwartikar@nvidia.com,
 thierry.reding@gmail.com, sharadg@nvidia.com, digetx@gmail.com,
 jonathanh@nvidia.com, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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


On Thu 30 Apr 2020 at 14:41, Sameer Pujar <spujar@nvidia.com> wrote:

> At a high level Tegra Audio HW is depicted as below.
>
> |     Front End PCMs     |  SoC DSP   |     Back End DAIs    |
>
>                          *************
> ADMAIF<0> <------------> *           * <----DAI<0>-----> I2S
>                          *           *
> ADMAIF<1> <------------> *           * <----DAI<1>-----> DMIC
>                          *    XBAR   *
> ADMAIF<2> <------------> *           * <----DAI<2>-----> DSPK
>                          *           *
> ADMAIF<N> <------------> *           * <----DAI<3>-----> SFC (Resampler)
>                          *           *
>                          *           * <----DAI<4>-----> MIXER
>                          *           *
>                          *           * <----DAI<N>-----> ...
>                          *************
>

>
>
> Follow up queries
> =================
> Based on the above experience I do have few follow up queries and request
> for your inputs on this.
>
>  a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>     program required switch in XBAR.

My 2 cents:
DPCM should activate any BE which has:
* a valid DAPM path from the current FE
* a valid BE stream (ex: can handle the stream direction)

AFAIK, you can use any combination of DAPM elements to model your
components, including the XBAR. Then, it is the job of the card driver to
link the DAPM widgets of the different components together and bring the
system to life.

If your XBAR is widgets are not provided by a component which also
provides a dai_link in the sound card, you'll need to add the component
to the auxiliary device list of the card for the widget to be available
in the card.

>
>     This is needed for following reasons:
>
>     - For an open platform like Jetson, we want to give maximum flexibility
>       for a user to customize their audio paths. Number of connected
>       components and order of these can vary depending on a use case.
>
>     - Allow re-use of audio components across multiple use cases.
>       For example, number of SFC instances are lesser than PCM playback or
>       capture devices.
>
>  b) I have modelled SFC and MIXER as backends. Is this allowed?
>
>     This was done to include SFC or MIXER HW components as part of the
>     sound card and use like below in one of the audio use cases.
>  
>     ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
>     ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

What your are trying to achieve here is DAI chaining. From the DAPM
perspective, it is alright. Unfortunately this kind of chaining are
not supported (not yet, at least) from the dai_link perspective, even
with DPCM.


From the DPCM perspective, I think your patch does the following:

ADMAIF1(FE) ---> SFC(BE1)
            |--> I2S(BE2)
ADMAIF2(FE) ---> SFC(BE1)
            |--> I2S(BE2)

Your DAIs are not chained, but put in parallel. Maybe all your DAI
callbacks are called in a way that is convinient enough for your
use cases, but it is not what you intended.

For the example, the rate passed to 'I2S(BE2)' in hw_params() will
be the one provided by the 'ADMAIF', not the output rate of the 'SFC'.

>
>     I used following workaround to connect multiple BE components.
>     With this I can see PCM callbacks happen for all BE DAIs along the DAPM
>     path. The obective was to connect multiple components together and (a)
>     was used to connect one component to another. Each "-->" here connects
>     two components and it is a switch in XBAR. 
>
>     ---
>       sound/soc/soc-pcm.c | 2 +-
>       1 file changed, 1 insertion(+), 1 deletion(-)
>
>       diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>       index e256d43..ee7af55 100644
>       --- a/sound/soc/soc-pcm.c
>       +++ b/sound/soc/soc-pcm.c
>       @@ -1494,7 +1494,7 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
>  
>  	  /* get number of valid DAI paths and their widgets */
>  	  paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
>       -			dpcm_end_walk_at_be);
>       +			NULL);
>  
>  	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
>  			stream ? "capture" : "playback");
>     -- 
>
>  c) Hostless mode did NOT work:
>      - Following audio path was intended to be tested:
>        I2S1 --> SFC --> I2S2
>
>      - [3] offers two options:
>          * CODEC<->CODEC: If I were to use a separate DAI link for each BE to BE
>            connection, then it will result in a similar design what we have
>            currently.
>
>          * Hostless: I did not come across references for this.
>            (Any references in this regard will be helpful)
>
>
> May be the current Tegra ASoC design is more suitable for component model as you
> had previously mentioned. I wanted to understand if above, especially (a) and (b),
> are acceptable in this regard or if there are better options to interconnect
> multiple ASoC components.
>
> Looking forward for your feedback.
>
> Thanks,
> Sameer.
>
> References
> ==========
> [0] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=159664&archive=both&state=*
> [1] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-6-git-send-email-spujar@nvidia.com/
> [2] http://patchwork.ozlabs.org/project/linux-tegra/patch/1582180492-25297-4-git-send-email-spujar@nvidia.com/
> [3] https://www.kernel.org/doc/html/v5.6/sound/soc/dpcm.html

