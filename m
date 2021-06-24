Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1163B3546
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 20:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE7B1657;
	Thu, 24 Jun 2021 20:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE7B1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624558094;
	bh=9L53cC/5fRMmhfkkLkggS+rxkIhe2wkA6CWwnyvja9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wde75rJlCrG2mRbfXSRWBLms20dbSC86hpyJxW7/Pq6CQN1ooM4FAxxsA5p+/ESzf
	 LxXNp1Q5yddScafa3BDTV/n4w8LzX3TdSP/Hdr3ay7/ZsUVflwG4EuL/ifqSVFsXaZ
	 564IO4iWVzLZMXK/BFa5dXY6wgsaDMz/mda7Bl00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A577F80268;
	Thu, 24 Jun 2021 20:06:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1AC6F8025F; Thu, 24 Jun 2021 20:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0DA9F80147
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 20:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0DA9F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="G+qo6Rfh"
Received: by mail-qk1-x732.google.com with SMTP id w21so16197474qkb.9
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+w4TKhEWywShggBppqhNffWPIRNlqLwVxO4wtPV7dzc=;
 b=G+qo6RfhpqM5Vra1zdeDtlFJqFpWvlHWxvq27S3Ddvphn13HCB/HhC3xKyUY6RzSd8
 2YFEM7QEv3GQh3iVYoe4ru3aQVFiTSsSx3QQ8HEiBgt5SR4gYVlu621OzFUARY3FF7nE
 3wKX7IvMvLUV2n3PCU4POzg/hdUtjkx5j+wE6AY157pPHE+RPqjTDCp+qX3i+eqna0C7
 1DjZLzuA20NTTpgUREtO+NbLFI8G7wwr+F9Vkz5jYaiV155qhICATf/tDQiasnXrCvCj
 hfPFUgi+a9B+FZQVbHQv1Y6gMUVC1Amv/gRDIJss2BH3EY5JTMOWD3KFlG/nCdT4l+pq
 AYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+w4TKhEWywShggBppqhNffWPIRNlqLwVxO4wtPV7dzc=;
 b=UDC4ZPb7k8PpU/A6imobcQEf1NwuiMDgYq0s4DYp8+fgiMVGe3Mlah263dNyyjYlVf
 byu3Aisan5/G7jOgb2OZPjmU4/oQLXbUDCLw8rdtgdu2QUrVMK7ymRLSp+fEEiwj7yAk
 jJTgJUUiyulp4be08clklI4VDyzWKzFRa2isb3pFS4D7fbf4ZQsANxrpJZcJQQzDfDpP
 mTgiJPaZWzo/JNwwj9meaqJgg3GCN/fYtHcRK4W7S6L/jgzI0HKqK+hOcqady4HzV/7n
 hqU9pV62l4STWh1JzAODwnxVcGW3EXV3kz61Dem0tjxJQ5DU651UunXHsEyMLjCL1yma
 vUtQ==
X-Gm-Message-State: AOAM5308DUhxGQ5+FUipad8uZdAnF5WRktKf6gSXsCu+L0GIWFe6oof7
 Adn6JRkOx/UtwiFakg7e2d/L91YBqzrtHeK1p/LHLw==
X-Google-Smtp-Source: ABdhPJzIzQhtK7hvInoCAymNQX2Wq5mTJHbyPFkhLWGuzkhtAg/MxOHqT+EoStZ7LKxdFzd4Lw3wmn//BMHm9qRehAo=
X-Received: by 2002:ae9:e810:: with SMTP id a16mr7044541qkg.158.1624557994389; 
 Thu, 24 Jun 2021 11:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210617090809.16901-1-shumingf@realtek.com>
 <20210617123914.GD5067@sirena.org.uk>
 <d6374c5158c844d69b4f546fd741f07f@realtek.com>
 <20210617132716.GE5067@sirena.org.uk>
 <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
In-Reply-To: <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 24 Jun 2021 11:06:22 -0700
Message-ID: <CAOReqxhDT8Z6jC89=m_Hka4diaxJqwhyKZmrVAw626wAAL72Fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt711: remap buttons
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "jairaj.arava@intel.com" <jairaj.arava@intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, "bard.liao@intel.com" <bard.liao@intel.com>
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

On Thu, Jun 17, 2021 at 7:23 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> On 6/17/21 8:27 AM, Mark Brown wrote:
> > On Thu, Jun 17, 2021 at 01:19:05PM +0000, Shuming [=E8=8C=83=E6=9B=B8=
=E9=8A=98] wrote:
> >
> >>>> This patch uses the same mapping as the machine driver:
> >>>> BTN_0 : KEY_PLAYPAUSE
> >>>> BTN_1 : KEY_VOICECOMMAND
> >>>> BTN_2 : KEY_VOLUMEUP
> >>>> BTN_3 : KEY_VOLUMEDOWN
> >
> >>> Which machine driver?  Can't there be multiple machine drivers, and i=
f
> >>> they're already overriding things why do this?
> >
> >> The rt711 codec is designed in the Intel platform only for now.
> >
> > I'm sure your sales team would be happy to change that!
> >
> >> The machine driver is 'sof_sdw.c' that resides under sound/soc/intel/b=
oards.
> >> It seems Intel uses the same mapping in all other Intel machine driver=
s.
> >> Please check the commit as below.
> >> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/comm=
it/?id=3D1f64a08bd5a9a218deb37c03c1e98e9567379698
> >
> > Sure, but if the machine drivers for these platforms already do the
> > right thing why change the CODEC driver?
> >
> >> Hi Sathya,
> >> Do you know why the m/c driver uses this mapping?
> >
> > I'd guess it's just because that's the standard set of headphone button=
s
> > that Intel uses for their platforms.
>
> Intel has no specific requirement, we just follow what the Google 4-butto=
n description says [1]
>
> That said, I can't recall why half of the machine drivers follow one patt=
ern and the other half a different one.
>
> Same as spec:
> sof_da7219_max98373.c:  snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_=
PLAYPAUSE);
> sof_da7219_max98373.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_=
VOLUMEUP);
> sof_da7219_max98373.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_=
VOLUMEDOWN);
> sof_da7219_max98373.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_=
VOICECOMMAND);
>
> sof_cs42l42.c:  snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUS=
E);
> sof_cs42l42.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP=
);
> sof_cs42l42.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDO=
WN);
> sof_cs42l42.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOM=
MAND);
>
> swap wrt. spec:
> sof_sdw_rt711.c:        snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_=
PLAYPAUSE);
> sof_sdw_rt711.c-        snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_=
VOICECOMMAND);
> sof_sdw_rt711.c-        snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_=
VOLUMEUP);
> sof_sdw_rt711.c-        snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_=
VOLUMEDOWN);
>
> kbl_rt5663_max98927.c:  snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_=
PLAYPAUSE);
> kbl_rt5663_max98927.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_=
VOICECOMMAND);
> kbl_rt5663_max98927.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_=
VOLUMEUP);
> kbl_rt5663_max98927.c-  snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_=
VOLUMEDOWN);
>
> Brent, Curtis, Jimmy, can you comment on the order?

Sorry for the late reply, I couldn't figure out why this slipped by my
email filter, I guess I should look closer next time. Soraka has been
checked (kbl_rt5663_max98927) and yes the mapping does appear to be
incorrect, volume up key returns voice command in evtest. Sathya will
have to check the headset button mapping, on rt711 but my guess is it
is also incorrect.

>
>
> [1] https://source.android.com/devices/accessories/headset/plug-headset-s=
pec#control-function_mapping
>
>
>
>
>
