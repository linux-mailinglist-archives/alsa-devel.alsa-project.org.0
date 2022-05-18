Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C381B52B0D2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 May 2022 05:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7380883E;
	Wed, 18 May 2022 05:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7380883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652844947;
	bh=WviJpFSd2TBAAp+xT9dvtJH06hurDLpld1OD2q2TcXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AngbMzw2d1YUuOAyCXXRLd/KCt88p83yNwy4mfu5xvAbCVgJPeelSYl/QAIb8vc2f
	 iUqNENHJ/qJngQGtHz38i0NCvopsCWzHQaONqE5yOJGvEDrW1P0ra/6ZuaJ5eg3NNQ
	 AbGFnYe9iLYl6hcgksKJAkU8NF419EE+BRcXUOJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEAD3F80159;
	Wed, 18 May 2022 05:34:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47067F8023B; Wed, 18 May 2022 05:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FCF7F800E1
 for <alsa-devel@alsa-project.org>; Wed, 18 May 2022 05:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCF7F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WowgDL/w"
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so1083508fac.12
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 20:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=51tSl6u3fDQDvmPeHjUuIj4yt/E0AMeSUVkrsAWBvmo=;
 b=WowgDL/wsA2fjQh0HjQO6by8hQ8Kc9eaCPq7hue7Eu6fzpOCk+8apEbErb07U7dlEY
 KHeA0jFqERgIqynghdDxnu+0pwwnAZnKmDDPMhoxe1ktAcxfee4f6c0+AF9fIIAUXKHe
 4Mi05E/z61XZ3owaPo+XUj+9n7qYjwz80/nQhB0JoyupnUrhlN5/h5VWUiBLHuoJSV3k
 fT5i5DNqSe/gH0b+S/bAOtlkhXXKMDbsrHKmBqPIxwUvJlqSgHU+MEEz0m8tmxgEfreY
 oJZChIFqwWnJAYuPDqsyakm3avHgUFkr7dXyM0UHFh+b1NWOCXIdskx9UCJV0GtbxUkW
 NJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=51tSl6u3fDQDvmPeHjUuIj4yt/E0AMeSUVkrsAWBvmo=;
 b=DVDxp1uYD8dwoGOWGz/MRXV0H4PTQW9SdE1Mf21GrVvaCJAOBzzFBmG4CwCuHnUurH
 1m5KoivBsDognNhCqFgLkL4bQJsaJ92L9Rx8r+670ue8Q6vszWJwHWY8cPJIUhaXivri
 ZxpI+VMGucyGLmcU7d9bPRdWcDhNAhUKKNe143d2XCqoa9/6dZ0PLUPXjK/0JphHcaNf
 UdjxvORtIFFJl/cRSGJJMHF13CoJlnp/Jtt0ilqtjpMSod6fKsVvwfhqsSs2VlUGQERt
 FK4frb7QrhxbnHlMPiaW0MibU04DLnNCS/bJFVrUaY4avCYW0aCeOOyCQSMBfM4tWNKq
 LKsg==
X-Gm-Message-State: AOAM533iFpiJzbstyeVqTaY19Lh3wEYGSRI++tZEjTWZV91lLKF46iHm
 Tkgzf0t7z/vZ6dpq2U9mxTkiW7sfkM0ZTtpPbsCfZg==
X-Google-Smtp-Source: ABdhPJx4izPOZyY0tv5SW4LDQ5Ykzq2Muqc51+ptblNpftWTq0dyu1hIy/VcfrHCQOwYUBLlt66OVUfonhklAxNFk0I=
X-Received: by 2002:a05:6870:c6a8:b0:ed:d3e0:52b3 with SMTP id
 cv40-20020a056870c6a800b000edd3e052b3mr19480465oab.92.1652844878031; Tue, 17
 May 2022 20:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220518013140.1467326-1-terry_chen@wistron.corp-partner.google.com>
 <00e58668-ca30-0048-6cd1-b2dd4ad66d7a@linux.intel.com>
In-Reply-To: <00e58668-ca30-0048-6cd1-b2dd4ad66d7a@linux.intel.com>
From: Terry Chen <terry_chen@wistron.corp-partner.google.com>
Date: Wed, 18 May 2022 11:34:26 +0800
Message-ID: <CAMmR3bEeV3CbqG7nmHb17xtju2X37wa590z+TMwXFHnkiJNcqQ@mail.gmail.com>
Subject: Re: [v6] FROMLIST: ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, casey.g.bowman@intel.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 liam.r.girdwood@linux.intel.com, Mac Chiang <mac.chiang@intel.com>,
 broonie@kernel.org, Sean Paul <seanpaul@chromium.org>,
 cujomalainey@chromium.org, "Lu, Brent" <brent.lu@intel.com>,
 vamshi.krishna.gopal@intel.com
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

Hi Pierre

We upload v7 patch to follow the coding style as other components. Thanks

On Wed, May 18, 2022 at 10:02 AM Pierre-Louis Bossart <
pierre-louis.bossart@linux.intel.com> wrote:

>
>
> On 5/17/22 20:31, Terry Chen wrote:
> > To be able to do  driver data for adl_mx98360a_cs4242 which supports
> > two max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec
> > on SSP0 running on ADL platform. Also add the capability to machine
> driver
> > of creating DAI Link for BT offload. Although BT offload always uses SSP2
> > port but we reserve the flexibility to assign the port number in macro.
> >
> > Signed-off-by: Terry Chen <terry_chen@wistron.corp-partner.google.com>
> > (am from https://patchwork.kernel.org/patch/12845884/)
> > (also found at
> https://lore.kernel.org/r/20220511075522.1764114-1-terry_chen@wistron.corp-partner.google.com
> )
>
> not sure what this is about, what's the point of adding information on
> the v5 in the v6 patch?
>
> >
> > ---
> >  sound/soc/intel/boards/sof_cs42l42.c          | 92 ++++++++++++++++++-
> >  .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++
> >  2 files changed, 95 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/intel/boards/sof_cs42l42.c
> b/sound/soc/intel/boards/sof_cs42l42.c
> > index ce78c18798876..2efffc7933479 100644
> > --- a/sound/soc/intel/boards/sof_cs42l42.c
> > +++ b/sound/soc/intel/boards/sof_cs42l42.c
> > @@ -41,8 +41,13 @@
> >  #define SOF_CS42L42_DAILINK_MASK             (GENMASK(24, 10))
> >  #define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
> >       ((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) |
> ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
> > -#define SOF_MAX98357A_SPEAKER_AMP_PRESENT    BIT(25)
> > -#define SOF_MAX98360A_SPEAKER_AMP_PRESENT    BIT(26)
> > +#define SOF_BT_OFFLOAD_PRESENT                       BIT(25)
> > +#define SOF_CS42L42_SSP_BT_SHIFT             26
> > +#define SOF_CS42L42_SSP_BT_MASK                      (GENMASK(28, 26))
> > +#define SOF_CS42L42_SSP_BT(quirk)    \
> > +     (((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
> > +#define SOF_MAX98357A_SPEAKER_AMP_PRESENT    BIT(29)
> > +#define SOF_MAX98360A_SPEAKER_AMP_PRESENT    BIT(30)
> >
> >  enum {
> >       LINK_NONE = 0,
> > @@ -50,6 +55,7 @@ enum {
> >       LINK_SPK = 2,
> >       LINK_DMIC = 3,
> >       LINK_HDMI = 4,
> > +     LINK_BT = 5,
> >  };
> >
> >  /* Default: SSP2 */
> > @@ -278,6 +284,13 @@ static struct snd_soc_dai_link_component
> dmic_component[] = {
> >       }
> >  };
> >
> > +static struct snd_soc_dai_link_component dummy_component[] = {
> > +     {
> > +             .name = "snd-soc-dummy",
> > +             .dai_name = "snd-soc-dummy-dai",
> > +     }
> > +};
> > +
> >  static int create_spk_amp_dai_links(struct device *dev,
> >                                   struct snd_soc_dai_link *links,
> >                                   struct snd_soc_dai_link_component
> *cpus,
> > @@ -467,9 +480,56 @@ static int create_hdmi_dai_links(struct device *dev,
> >       return -ENOMEM;
> >  }
> >
> > +static int create_bt_offload_dai_links(struct device *dev,
> > +                                    struct snd_soc_dai_link *links,
> > +                                    struct snd_soc_dai_link_component
> *cpus,
> > +                                    int *id, int ssp_bt)
> > +{
> > +     int ret = 0;
>
> either you remove this useless init...
>
> > +
> > +     /* bt offload */
> > +     if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
> > +             return 0;
> > +
> > +     links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
> > +                                      ssp_bt);
> > +     if (!links[*id].name) {
> > +             ret = -ENOMEM;
> > +             goto devm_err;
> > +     }
> > +
> > +     links[*id].id = *id;
> > +     links[*id].codecs = dummy_component;
> > +     links[*id].num_codecs = ARRAY_SIZE(dummy_component);
> > +     links[*id].platforms = platform_component;
> > +     links[*id].num_platforms = ARRAY_SIZE(platform_component);
> > +
> > +     links[*id].dpcm_playback = 1;
> > +     links[*id].dpcm_capture = 1;
> > +     links[*id].no_pcm = 1;
> > +     links[*id].cpus = &cpus[*id];
> > +     links[*id].num_cpus = 1;
> > +
> > +     links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
> > +                                                "SSP%d Pin",
> > +                                                ssp_bt);
> > +     if (!links[*id].cpus->dai_name) {
> > +             ret = -ENOMEM;
> > +             goto devm_err;
> > +     }
> > +
> > +     (*id)++;
> > +
> > +     return 0;
>
> ... or you remove the return 0;
>
> pick one.
>
> > +
> > +devm_err:
> > +     return ret;
> > +}
> > +
>
> >       },
> > +     {
> > +             .id = "10134242",
> > +             .drv_name = "adl_mx98360a_cs4242",
> > +             .machine_quirk = snd_soc_acpi_codec_list,
> > +             .quirk_data = &adl_max98360a_amp,
> > +             .sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
>
> No, I've told this before in previous reviews: do not use a topology
> name that was designed for a different platform, this is not
> maintainable. If the topologies happen to be the same, either generate
> them twice or use a symlink.
>
