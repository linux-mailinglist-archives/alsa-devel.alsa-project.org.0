Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 747995314F5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 18:35:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E15116AB;
	Mon, 23 May 2022 18:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E15116AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653323740;
	bh=/i1oZX4dUuFLft/qFvrCS5jJCjvVQOS8g772gEOkwWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZoEutvyzaaofQfuA6lE0xvaY1085h0AlriPEimHgngU1CMccPbRDeJU/oT4NcyPPc
	 DQJTVS1zY4La+VrSBDL9ncqykadcB7QC1Ygmvm/sQHrISSjHh3I52yCANEfoYhqWOH
	 m1dw4vQDcvDxCLEZUMBK6yWnGXtCWowNwuEXNcJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5A7F8025E;
	Mon, 23 May 2022 18:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A82EDF80116; Mon, 23 May 2022 18:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B41F80116
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 18:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B41F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="V4gZGewx"
Received: by mail-ej1-x62f.google.com with SMTP id rs12so18249043ejb.13
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 09:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G/XA8ganN6D8SJro5978H4m5Fr+5l+LHKXISgC45i6U=;
 b=V4gZGewx8jIJhhKQRA3xFN/sZpiyapULO/rXmi27p0MmEibaEgQ8lH/+ejDyKRD2aK
 JmXLAC7N1DBNvBcq6khSV/szTMTFxbwPoyH9ag/RcgAZaLNvfFa3NkmSZnlOFIpQRGBG
 HFWAMTzc4Rih6kdSZ+4g38GMRpnnlGT5Wdqqc9FBi+RFYs78DfAuap/qX/8zm5NqMwNf
 /4H1Fb+2qzFVUINXJzpsdgOq38PEpU6MP0ML/oB1mqpNOYziflnFlyEbbEs4QQo6/+k8
 e56iow3cMFrFf4soDANOpi2DTNdbdI7R93SpDItrN+4tg+aL6OKiO4E5MZ95N9GZFqWc
 84IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G/XA8ganN6D8SJro5978H4m5Fr+5l+LHKXISgC45i6U=;
 b=6Rdgi4kkUEX7g7WXfIjyEY3sMfyOWbnX26db1ZSEXrNpudjw6xsjsJrNNRABzMJrEy
 W9zvDTXqcXtm06rhx7yL9KgC+7zrfOIh0cIhAfKgJ0VJGZmp9gspBS0BPJBbsijZYlAY
 gIeAGPLeFH1pT/MEhhKJaL9zeV895e6a7+THgT+8Ed3GqmYmO+1r5kwIfGdxpvHSfENb
 xV5J10zZkynbWT5kGyMwdi4pgp+0NQcHSYPeguPotTyuydRreU3ah4Ffw5hm4Zj+1oMQ
 0EMF0xZIHMAUtKBHISa2/d4pW/z+IcZOkzm6e8MCOEpHzOn124sOmiNg2xp1+PgBYKqi
 t8fg==
X-Gm-Message-State: AOAM531kEE+z+qwofBodne51k627G7YW8ZexkipViVsrzpa8iVUypQqy
 oUHZpyaTK3ZhvR6jh1ucLz87zL+22YaV9HmKBXKamDxa+es=
X-Google-Smtp-Source: ABdhPJw4KEeaBlMeJuRWGPa57xCB7Ewlw+G+TBeTDM2j4L9pKHotAqYYEh2UZdxh5ovyLhk/tMuvzvFu6fcl2j4lkqs=
X-Received: by 2002:a17:907:3f19:b0:6f5:6b2:9615 with SMTP id
 hq25-20020a1709073f1900b006f506b29615mr21628853ejc.659.1653323669337; Mon, 23
 May 2022 09:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220518013140.1467326-1-terry_chen@wistron.corp-partner.google.com>
 <00e58668-ca30-0048-6cd1-b2dd4ad66d7a@linux.intel.com>
 <CAMmR3bEeV3CbqG7nmHb17xtju2X37wa590z+TMwXFHnkiJNcqQ@mail.gmail.com>
In-Reply-To: <CAMmR3bEeV3CbqG7nmHb17xtju2X37wa590z+TMwXFHnkiJNcqQ@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 23 May 2022 09:34:18 -0700
Message-ID: <CAOReqxif-+X5_EcR3N8EOx1H=cE3AdOr-Te8aqB4JBx5JrbFTg@mail.gmail.com>
Subject: Re: [v6] FROMLIST: ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
To: Terry Chen <terry_chen@wistron.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, "Bowman,
 Casey G" <casey.g.bowman@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Curtis Malainey <cujomalainey@chromium.org>,
 "Lu, Brent" <brent.lu@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On Tue, May 17, 2022 at 8:34 PM Terry Chen
<terry_chen@wistron.corp-partner.google.com> wrote:
>
> Hi Pierre
>
> We upload v7 patch to follow the coding style as other components. Thanks
>
> On Wed, May 18, 2022 at 10:02 AM Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 5/17/22 20:31, Terry Chen wrote:
>> > To be able to do  driver data for adl_mx98360a_cs4242 which supports
>> > two max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec
>> > on SSP0 running on ADL platform. Also add the capability to machine driver
>> > of creating DAI Link for BT offload. Although BT offload always uses SSP2
>> > port but we reserve the flexibility to assign the port number in macro.
>> >
>> > Signed-off-by: Terry Chen <terry_chen@wistron.corp-partner.google.com>
>> > (am from https://patchwork.kernel.org/patch/12845884/)
>> > (also found at https://lore.kernel.org/r/20220511075522.1764114-1-terry_chen@wistron.corp-partner.google.com)
>>
>> not sure what this is about, what's the point of adding information on
>> the v5 in the v6 patch?

Hi Terry,

I think Pierre's confusion here is that you used chromeos style guides
but didn't upload to gerrit, you sent it to ALSA. When sending to ALSA
you should use the kernel style guides upstream.

>>
>> >
>> > ---
>> >  sound/soc/intel/boards/sof_cs42l42.c          | 92 ++++++++++++++++++-
>> >  .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++
>> >  2 files changed, 95 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
>> > index ce78c18798876..2efffc7933479 100644
>> > --- a/sound/soc/intel/boards/sof_cs42l42.c
>> > +++ b/sound/soc/intel/boards/sof_cs42l42.c
>> > @@ -41,8 +41,13 @@
>> >  #define SOF_CS42L42_DAILINK_MASK             (GENMASK(24, 10))
>> >  #define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
>> >       ((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) | ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
>> > -#define SOF_MAX98357A_SPEAKER_AMP_PRESENT    BIT(25)
>> > -#define SOF_MAX98360A_SPEAKER_AMP_PRESENT    BIT(26)
>> > +#define SOF_BT_OFFLOAD_PRESENT                       BIT(25)
>> > +#define SOF_CS42L42_SSP_BT_SHIFT             26
>> > +#define SOF_CS42L42_SSP_BT_MASK                      (GENMASK(28, 26))
>> > +#define SOF_CS42L42_SSP_BT(quirk)    \
>> > +     (((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
>> > +#define SOF_MAX98357A_SPEAKER_AMP_PRESENT    BIT(29)
>> > +#define SOF_MAX98360A_SPEAKER_AMP_PRESENT    BIT(30)
>> >
>> >  enum {
>> >       LINK_NONE = 0,
>> > @@ -50,6 +55,7 @@ enum {
>> >       LINK_SPK = 2,
>> >       LINK_DMIC = 3,
>> >       LINK_HDMI = 4,
>> > +     LINK_BT = 5,
>> >  };
>> >
>> >  /* Default: SSP2 */
>> > @@ -278,6 +284,13 @@ static struct snd_soc_dai_link_component dmic_component[] = {
>> >       }
>> >  };
>> >
>> > +static struct snd_soc_dai_link_component dummy_component[] = {
>> > +     {
>> > +             .name = "snd-soc-dummy",
>> > +             .dai_name = "snd-soc-dummy-dai",
>> > +     }
>> > +};
>> > +
>> >  static int create_spk_amp_dai_links(struct device *dev,
>> >                                   struct snd_soc_dai_link *links,
>> >                                   struct snd_soc_dai_link_component *cpus,
>> > @@ -467,9 +480,56 @@ static int create_hdmi_dai_links(struct device *dev,
>> >       return -ENOMEM;
>> >  }
>> >
>> > +static int create_bt_offload_dai_links(struct device *dev,
>> > +                                    struct snd_soc_dai_link *links,
>> > +                                    struct snd_soc_dai_link_component *cpus,
>> > +                                    int *id, int ssp_bt)
>> > +{
>> > +     int ret = 0;
>>
>> either you remove this useless init...
>>
>> > +
>> > +     /* bt offload */
>> > +     if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
>> > +             return 0;
>> > +
>> > +     links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
>> > +                                      ssp_bt);
>> > +     if (!links[*id].name) {
>> > +             ret = -ENOMEM;
>> > +             goto devm_err;
>> > +     }
>> > +
>> > +     links[*id].id = *id;
>> > +     links[*id].codecs = dummy_component;
>> > +     links[*id].num_codecs = ARRAY_SIZE(dummy_component);
>> > +     links[*id].platforms = platform_component;
>> > +     links[*id].num_platforms = ARRAY_SIZE(platform_component);
>> > +
>> > +     links[*id].dpcm_playback = 1;
>> > +     links[*id].dpcm_capture = 1;
>> > +     links[*id].no_pcm = 1;
>> > +     links[*id].cpus = &cpus[*id];
>> > +     links[*id].num_cpus = 1;
>> > +
>> > +     links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
>> > +                                                "SSP%d Pin",
>> > +                                                ssp_bt);
>> > +     if (!links[*id].cpus->dai_name) {
>> > +             ret = -ENOMEM;
>> > +             goto devm_err;
>> > +     }
>> > +
>> > +     (*id)++;
>> > +
>> > +     return 0;
>>
>> ... or you remove the return 0;
>>
>> pick one.
>>
>> > +
>> > +devm_err:
>> > +     return ret;
>> > +}
>> > +
>>
>> >       },
>> > +     {
>> > +             .id = "10134242",
>> > +             .drv_name = "adl_mx98360a_cs4242",
>> > +             .machine_quirk = snd_soc_acpi_codec_list,
>> > +             .quirk_data = &adl_max98360a_amp,
>> > +             .sof_tplg_filename = "sof-adl-max98360a-rt5682.tplg",
>>
>> No, I've told this before in previous reviews: do not use a topology
>> name that was designed for a different platform, this is not
>> maintainable. If the topologies happen to be the same, either generate
>> them twice or use a symlink.
