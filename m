Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C972EABF7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 14:32:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620EF1672;
	Tue,  5 Jan 2021 14:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620EF1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609853539;
	bh=Y3X+Ao3y9OwHazKid/hJ8+zkt+P/z3Xwtv2v+7aWPVE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0QernPlx7/z1hd4ipVfDZcY/XNa15OsCYtxXVvZwwpJ5TB1/PD/zq5XT8o2ZdxP8
	 Yyavd7s4dtadaTAj/Cg+Cq1YlB0nkHSFA9qjhZzIuYqh/r1oVrMglwzfgGTJLYh+iP
	 MLdwVCTRTfcYKeEOXYNsRHmB1Nv3Jktp7WzGthF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE114F80268;
	Tue,  5 Jan 2021 14:30:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F098F80258; Tue,  5 Jan 2021 14:30:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF08FF8015B;
 Tue,  5 Jan 2021 14:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF08FF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jZhctHDw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C1E622AAB;
 Tue,  5 Jan 2021 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609853422;
 bh=Y3X+Ao3y9OwHazKid/hJ8+zkt+P/z3Xwtv2v+7aWPVE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jZhctHDwmph0iXETpDjKf8iw7CkcVyDkcNKzFkek7/sF3ZYEKOHz5K3m2nOa8C4EH
 6wtr+tCbSxHWs4FDsn+k4NUavzrL4CXQCI2qUgCCSWFc2/VvVLipcObRLiYbYFj37U
 o+Q4FXnnKZjAp+mPsr1BbV13+zDb/aEDkH0atrhq83Xmg8MkvETJOpXBJiSHNQ0XGt
 kg5cPGtj9ADtg++FUAbjIRshLSskhbJU30cDnpjqRhJ0hsx1KZgl1iMohpDXRb+WKs
 Jq1Nh/ILB0oTae9/VMqzsNBnTaV7jwcyc7UNNK7iFvS8CTSshn5FWWHcsuiWPnosf3
 JEUgUiZxaJkVg==
Received: by mail-ot1-f49.google.com with SMTP id x13so29198770oto.8;
 Tue, 05 Jan 2021 05:30:22 -0800 (PST)
X-Gm-Message-State: AOAM531pl9G1HZkrYNQXH6N4v/RnmZUzu2vI1E1wq/5BeUOnqTV35M3P
 qH0Ida7+Z7gwJy5MyRtKiTUfkuuPbdJub5mc3X4=
X-Google-Smtp-Source: ABdhPJxs3WdKC1hUGYMHRUaOZwuzm9ovdWwReGeDftdobzTgRjaq1WsuJjcw99u+KB5nHsa4XKeWFWTSEjbkBMFo2gE=
X-Received: by 2002:a05:6830:1e14:: with SMTP id
 s20mr56051876otr.210.1609853421829; 
 Tue, 05 Jan 2021 05:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20210103135257.3611821-1-arnd@kernel.org>
 <3c19a5d5-8883-f917-a96a-f51bb188d115@perex.cz>
In-Reply-To: <3c19a5d5-8883-f917-a96a-f51bb188d115@perex.cz>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 5 Jan 2021 14:30:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2fbL3zTP=krdLr0cVKh5f0OmDge2QEGego9iu4z3bvqw@mail.gmail.com>
Message-ID: <CAK8P3a2fbL3zTP=krdLr0cVKh5f0OmDge2QEGego9iu4z3bvqw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 sound-open-firmware@alsa-project.org
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

On Mon, Jan 4, 2021 at 4:00 PM Jaroslav Kysela <perex@perex.cz> wrote:
> Dne 03. 01. 21 v 14:52 Arnd Bergmann napsal(a):

> > diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
> > index d4609077c258..94667e870029 100644
> > --- a/include/sound/intel-dsp-config.h
> > +++ b/include/sound/intel-dsp-config.h
> > @@ -18,24 +18,7 @@ enum {
> >       SND_INTEL_DSP_DRIVER_LAST = SND_INTEL_DSP_DRIVER_SOF
> >  };
> >
> > -#if IS_ENABLED(CONFIG_SND_INTEL_DSP_CONFIG)
>
> The SOF drivers selects the DSP config code only when required (for specific
> platforms - see sound/soc/sof/intel/Kconfig).
>
> It seems that the above if should be modified as:
>
> #if IS_BUILDIN(CONFIG_SND_INTEL_DSP_CONFIG) || (defined(MODULE) &&
> IS_MODULE(CONFIG_SND_INTEL_DSP_CONFIG))
>
> So the buildin drivers which do not require the DSP config probe can be
> compiled without this dependency.

This would be the same as

#if IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)

but using that macro is almost always a bad idea, as it tends to hide
dependency problems and causes things to silently not work right
when the Kconfig rules are incorrect.

      Arnd
