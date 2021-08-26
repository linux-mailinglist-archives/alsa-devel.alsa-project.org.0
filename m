Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2489E3F807B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 04:31:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6E784C;
	Thu, 26 Aug 2021 04:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6E784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629945058;
	bh=RLfiKxehteV4x9MOijCRXbqPKBo+FjwruB/PZjftIfg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=liFXCd7BSIyBWuXeXeGh+lgNHWXUdTyay4mpAmpDZ0VKnVWCbroU8LHKiFh8g5m2Z
	 G9EAFwEsVP7iLPzY3HvgN2FWY8qumVYkRF8A9hSHPbGK/7R2LlWRr/IDIsooQDGyX8
	 z7jRDzC3FGY3fWWKyXUqHC3tV1y3bbBnZq0eZS2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6B34F80224;
	Thu, 26 Aug 2021 04:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9948CF801D8; Thu, 26 Aug 2021 04:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C1C1F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 04:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C1C1F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="rQ+lyNmF"
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 17Q2T2tg007770
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 11:29:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 17Q2T2tg007770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1629944943;
 bh=nhsNDBtebvHsUPUvr/G9QvWMQeecme+7wcswpepJRZg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rQ+lyNmFM5eaAxgStAoXTmP6Y6h+8ewkmnRP9nC51jxmPAjaOq4ogzUkJpDBZTaNF
 HA7l/zpAHFMOvsY6L+ZSE6/YfJ9onLbz3yzUVmWw932gRGp0BwaXVgxz0CLz7PJSdd
 KKVC/0AjOP8JfH9Yxr+ilaBql0RBQZoIw9yrazYn/W3j/tEM8AlZycUZxrJx0csJik
 2f9D346PSR342NLYkB0D/xR5Wm9Wd9JtpuDTZ1aaRagFSZfsRn/iHsO7KEkgGE22pD
 +mIFrBEPxM8kQnBB/ZqCRjx388o3KyvknvnacVQn94rRkFTajYfVfI1we/K2KK4wpH
 GSclM8U3uyUHQ==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id t42so1363451pfg.12
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 19:29:03 -0700 (PDT)
X-Gm-Message-State: AOAM530NJTklHNYj+ma5ljhPMnlwqroeUMGOzVeX7l1QmDzVCjO2ZtH7
 Szdkg/HOX26uGGU0jWyWtZaSI6+VWhZcm4g0vNY=
X-Google-Smtp-Source: ABdhPJwwlP7PCNjslmyo5yR609R7WW/wRzQQGe7mqFLUz3FdVmlyPiGja/E6H9UbwHCjku2hsLeSB2jltn/jv1aaFCY=
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id
 e26-20020aa798da0000b02903e08b98df83mr1335775pfm.63.1629944942299; Wed, 25
 Aug 2021 19:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210825041637.365171-1-masahiroy@kernel.org>
 <9df591f6-53fc-4567-8758-0eb1be4eade5@gmail.com>
In-Reply-To: <9df591f6-53fc-4567-8758-0eb1be4eade5@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Aug 2021 11:28:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDMzR1DnwwAcQFHaKZeGVYDZ1oDKL-QOe_7DaB_yByAA@mail.gmail.com>
Message-ID: <CAK7LNATDMzR1DnwwAcQFHaKZeGVYDZ1oDKL-QOe_7DaB_yByAA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: forbid symbols that end with '_MODULE'
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-wireless@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Luca Coelho <luciano.coelho@intel.com>, Networking <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>
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

On Wed, Aug 25, 2021 at 8:59 PM P=C3=A9ter Ujfalusi <peter.ujfalusi@gmail.c=
om> wrote:
>
> Hi,
>
> On 25/08/2021 07:16, Masahiro Yamada wrote:
> > Kconfig (syncconfig) generates include/generated/autoconf.h to make
> > CONFIG options available to the pre-processor.
> >
> > The macros are suffixed with '_MODULE' for symbols with the value 'm'.
> >
> > Here is a conflict; CONFIG_FOO=3Dm results in '#define CONFIG_FOO_MODUL=
E 1',
> > but CONFIG_FOO_MODULE=3Dy also results in the same define.
> >
> > fixdep always assumes CONFIG_FOO_MODULE comes from CONFIG_FOO=3Dm, so t=
he
> > dependency is not properly tracked for symbols that end with '_MODULE'.
> >
> > This commit makes Kconfig error out if it finds a symbol suffixed with
> > '_MODULE'. This restriction does not exist if the module feature is not
> > supported (at least from the Kconfig perspective).
> >
> > It detected one error:
> >   error: SND_SOC_DM365_VOICE_CODEC_MODULE: symbol name must not end wit=
h '_MODULE'
> >
> > Rename it to SND_SOC_DM365_VOICE_CODEC_MODULAR. Commit 147162f57515
> > ("ASoC: ti: fix SND_SOC_DM365_VOICE_CODEC dependencies") added it for
> > internal use. So, this renaming has no impact on users.
> >
> > Remove a comment from drivers/net/wireless/intel/iwlwifi/Kconfig since
> > this is a hard error now.
> >
> > Add a comment to include/linux/kconfig.h in order not to worry observan=
t
> > developers.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  drivers/net/wireless/intel/iwlwifi/Kconfig |  1 -
> >  include/linux/kconfig.h                    |  3 ++
> >  scripts/kconfig/parser.y                   | 40 +++++++++++++++++++++-
> >  sound/soc/ti/Kconfig                       |  2 +-
> >  4 files changed, 43 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/w=
ireless/intel/iwlwifi/Kconfig
> > index 1085afbefba8..5b238243617c 100644
> > --- a/drivers/net/wireless/intel/iwlwifi/Kconfig
> > +++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
> > @@ -70,7 +70,6 @@ config IWLMVM
> >         of the devices that use this firmware is available here:
> >         https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi#firmw=
are
> >
> > -# don't call it _MODULE -- will confuse Kconfig/fixdep/...
> >  config IWLWIFI_OPMODE_MODULAR
> >       bool
> >       default y if IWLDVM=3Dm
> > diff --git a/include/linux/kconfig.h b/include/linux/kconfig.h
> > index 20d1079e92b4..54f677e742fe 100644
> > --- a/include/linux/kconfig.h
> > +++ b/include/linux/kconfig.h
> > @@ -53,6 +53,9 @@
> >   * IS_MODULE(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to 'm', 0
> >   * otherwise.  CONFIG_FOO=3Dm results in "#define CONFIG_FOO_MODULE 1"=
 in
> >   * autoconf.h.
> > + * CONFIG_FOO_MODULE=3Dy would also result in "#define CONFIG_FOO_MODU=
LE 1",
> > + * but Kconfig forbids symbol names that end with '_MODULE', so that w=
ould
> > + * not happen.
> >   */
> >  #define IS_MODULE(option) __is_defined(option##_MODULE)
> >
> > diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> > index 2af7ce4e1531..b0f73f74ccd3 100644
> > --- a/scripts/kconfig/parser.y
> > +++ b/scripts/kconfig/parser.y
> > @@ -475,6 +475,37 @@ assign_val:
> >
> >  %%
> >
> > +/*
> > + * Symbols suffixed with '_MODULE' would cause a macro conflict in aut=
oconf.h,
> > + * and also confuse the interaction between syncconfig and fixdep.
> > + * Error out if a symbol with the '_MODULE' suffix is found.
> > + */
> > +static int sym_check_name(struct symbol *sym)
> > +{
> > +     static const char *suffix =3D "_MODULE";
> > +     static const size_t suffix_len =3D strlen("_MODULE");
> > +     char *name;
> > +     size_t len;
> > +
> > +     name =3D sym->name;
> > +
> > +     if (!name)
> > +             return 0;
> > +
> > +     len =3D strlen(name);
> > +
> > +     if (len < suffix_len)
> > +             return 0;
> > +
> > +     if (strcmp(name + len - suffix_len, suffix))
> > +             return 0;
> > +
> > +     fprintf(stderr, "error: %s: symbol name must not end with '%s'\n"=
,
> > +             name, suffix);
> > +
> > +     return -1;
> > +}
> > +
> >  void conf_parse(const char *name)
> >  {
> >       struct symbol *sym;
> > @@ -493,8 +524,15 @@ void conf_parse(const char *name)
> >
> >       if (yynerrs)
> >               exit(1);
> > -     if (!modules_sym)
> > +
> > +     if (modules_sym) {
> > +             for_all_symbols(i, sym) {
> > +                     if (sym_check_name(sym))
> > +                             yynerrs++;
> > +             }
> > +     } else {
> >               modules_sym =3D sym_find( "n" );
> > +     }
> >
> >       if (!menu_has_prompt(&rootmenu)) {
> >               current_entry =3D &rootmenu;
> > diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
> > index 698d7bc84dcf..c56a5789056f 100644
> > --- a/sound/soc/ti/Kconfig
> > +++ b/sound/soc/ti/Kconfig
> > @@ -211,7 +211,7 @@ config SND_SOC_DM365_VOICE_CODEC
> >         Say Y if you want to add support for SoC On-chip voice codec
> >  endchoice
> >
> > -config SND_SOC_DM365_VOICE_CODEC_MODULE
> > +config SND_SOC_DM365_VOICE_CODEC_MODULAR
>
> This Kconfig option is only used to select the codecs needed for the
> voice mode, I think it would be better to use something like
>
> SND_SOC_DM365_SELECT_VOICE_CODECS ?


I do not have a strong opinion.
I am fine with any name unless it ends with _MODULE.


The sound subsystem maintainers and Arnd,
author of 147162f575152db800 are CC'ed.

If they suggest a better name, I'd be happy to adopt it.



--=20
Best Regards
Masahiro Yamada
