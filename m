Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A472120AB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 12:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AE6516E4;
	Thu,  2 Jul 2020 12:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AE6516E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593684722;
	bh=7zOf0XHFLX0eK3QuQhqBjCbi88LKF6pOiXhH3KqTZ6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=thHIR2j0Z9zd4el23u4HF0cpZjDzOT6t+z4VNmymWWWZEcU+cfjVHkaZ85LhiVLCG
	 qMaOEiXCALZ3FAWZe+0OtRtAiQp3qr5FKraiuc4SqPbmPR91LCOyLP9S3nl48ueTLV
	 jH5ZZ48Jm41xksVxZV9viDHVBEjRxYYthhH9w3Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D25F80134;
	Thu,  2 Jul 2020 12:10:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EF03F8022D; Thu,  2 Jul 2020 12:10:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE797F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 12:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE797F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="Ga4jYOuv"
Received: by mail-qk1-x742.google.com with SMTP id j80so25076085qke.0
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MNkwKZ84Zrawk816auciDQTYwDrs9ybRS0FVRLuLd9I=;
 b=Ga4jYOuvR8MX3nF2I6L7nPH0rm/ZyxshqRb5F4+rL33+Dnnyb7FevBZZ90KDsvrHKV
 WgfFd92ZJh5hmBt1OEWYUt4vNpzYROC9C4LhqphBIgEmjRIuA2uLoAqnId7O9xEpBOUs
 Nla0Wih4ZFy2hHQ3+TBKtg2SY7KBhlFLwmoyxSWCgb0u9AhCwZrAPgE2nWZbdmGIRdHO
 Bn+d7Dg/YVemE9LvZSnqhR+jUeppn8wUwMia4TUXkC/w3ps8MVS8IgrrSDC0yol2L1RR
 2t/1JL25f6Pb6bomI8yC4grazve3xpODK2cXQrPtDv5FgiCe0uQ6kj9ytlhs6OXRwq6F
 X/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MNkwKZ84Zrawk816auciDQTYwDrs9ybRS0FVRLuLd9I=;
 b=mcUBfrCCAH2k2Ge3j2OGB87Jai6sY2O4hR4HL5ghHuqR87Ns/jho6OzET5cRckiIL6
 RPf52j/MiowqcgTDq46apFSH+ByJCsgK7FJCxLsAWUMr+Cr70+ComKuuohzRLWm/OP6v
 0lPPn7x8cjoDAebC/3XkQUR55jyxo4fQbWI6CSqZh85wXd0JRjDirOl3OFQyjwBbQzOs
 GPJ/Kj0EPIYB/HGtY4o9p8lYFniRBD3smSM2JH7V+jxrxzjV+6XYvUy533jAZ/y+bDEK
 V1cqlhNzTJhBRc7x2SdM1rk5dYCiRRCfUuIVLoUsnsLlChNoU+Oeth/TeKkScb5VkoN1
 wZ0w==
X-Gm-Message-State: AOAM530LvwBY+aAi2o2nrgxyKjfn3HBW0Ouiag8kdu1+ECitBRI90G0U
 5AHOVDXdNkOIGW8z5+CNn6G0pUSvn8RP2EZ74WsYjg==
X-Google-Smtp-Source: ABdhPJxSCrlGDF8VbOkF76c527VsV7+BA6AZM2DosVAXwrPnrjTB9/lEdURnS2JpeZC7MdKZXtTdxC39Y9vZxDerRRc=
X-Received: by 2002:a37:2781:: with SMTP id
 n123mr29703103qkn.106.1593684610371; 
 Thu, 02 Jul 2020 03:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200521162518.1809995-1-lma@semihalf.com>
 <3c89e614-81f5-ba87-19a9-fbe9f5c73925@linux.intel.com>
 <CAFJ_xbr8TN3ynfELJ3NQnkuRg0VRbkjB7=Cyb8yu2L==JGXJiw@mail.gmail.com>
 <475fb5c0-9b26-a8f6-c102-25c7775bc2ca@linux.intel.com>
 <CAFJ_xbq-QotvPG=AxSp7=Etc5P5f4ePRWLCvSNnTkzUO9o_qjQ@mail.gmail.com>
 <268b11b6-9f4c-d769-a7f9-536d77198705@linux.intel.com>
 <CAFJ_xboUTDtnpvskb2dY4fGhGLNkEgT0sH3dU0NYJV_Cb_gqPw@mail.gmail.com>
 <BY5PR11MB4307284BAE6DA415CFC0865CFD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <CAFJ_xbq3DU8NMmymYHLjy0z+QbGRAOmB4NaiXPphAr2Zu0MPAg@mail.gmail.com>
 <BY5PR11MB4307CBA736456853777A9FD9FD6E0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <BY5PR11MB4307C20278F32D17551112FAFD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <7e38bb2e-2132-d305-e94d-043fa53bd836@linux.intel.com>
 <BY5PR11MB4307BBBCAA78A0506BBC5F74FD6C0@BY5PR11MB4307.namprd11.prod.outlook.com>
 <b2236769-6957-dc41-21b2-aca238994b4b@linux.intel.com>
In-Reply-To: <b2236769-6957-dc41-21b2-aca238994b4b@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Thu, 2 Jul 2020 12:09:59 +0200
Message-ID: <CAFJ_xboZp02M3XAzTXMyUJU50CZDNBnrd_oOnYBWxFfMpr=1pg@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "N,
 Harshapriya" <harshapriya.n@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Ross Zwisler <zwisler@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>
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

Hi,

I am also ok with Harsha patch. I have checked it on my Eve and it looks ok=
.

Best regards,

Lukasz

=C5=9Br., 1 lip 2020 o 19:08 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
>
>
> >>> Tested and the following is something we can use without creating a n=
ew
> >> dailink.
> >>>             struct snd_soc_dai *codec_dai =3D asoc_rtd_to_codec(rtd, =
0);
> >>>     if (!strcmp(codec_dai->name, KBL_REALTEK_DMIC_CODEC_DAI)) {
> >>>             if (params_channels(params) =3D=3D 2 ||
> >> DMIC_CH(dmic_constraints) =3D=3D 2)
> >>>                     channels->min =3D channels->max =3D 2;
> >>>             else
> >>>                     channels->min =3D channels->max =3D 4;
> >>>     } else {
> >>>             rate->min =3D rate->max =3D 48000;
> >>>             channels->min =3D channels->max =3D 2;
> >>>             snd_mask_none(fmt);
> >>>             snd_mask_set_format(fmt, pcm_fmt);
> >>>     }
> >>>
> >>> Pierre, thoughts?
> >>
> >> thanks Harsha, that looks like what I had in mind, but my earlier ques=
tion was
> >> why we deal with the rates and formats only in the last case?
> > The speaker codec supported only 16 bit.  (Vendor mentioned)
> > For playback on this platform, only 48Khz was used.
>
> ok then, as long as Harsha and Lukasz are aligned I'm fine. Thanks!
>
