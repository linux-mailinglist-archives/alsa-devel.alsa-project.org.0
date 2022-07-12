Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C908571BE1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 16:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34A8A1664;
	Tue, 12 Jul 2022 16:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34A8A1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657634503;
	bh=PLCS0fgFTi6fkR+zw+1nEmAjrdXYGMkZbPY4PaSOZYQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mt0hzRlWhjZVais6Xa8qxqYIECkuV/e8V2pvm/2LLYI8LbX8F2K/YamgWplQGyvja
	 Sv5U7PDSSRUh45y9r24FMjtZMy9O2WuYY/JfKIbtHLImkRO8TwHdtDDDD8so+WBwWj
	 /upl0hUy3bPEMMmloqQ7OGfJAnbYwMH+d9ZyWFTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 865E7F80279;
	Tue, 12 Jul 2022 16:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE1E4F80246; Tue, 12 Jul 2022 16:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 167AEF8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 16:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 167AEF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k8HJGhE9"
Received: by mail-yb1-xb31.google.com with SMTP id 136so14073592ybl.5
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 07:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sYY6nXCKD6t30QeXZzY/iyGlqBqf+vc2z0phNL/Eg5g=;
 b=k8HJGhE9i7B3f6fXvhZ3P0HZBKpKwDS1pIja6IaScsD/R4cHnW/TfG0WC2C/yGAR0H
 lW83iJwH0EyDvfLzP9E+VKMVCEnWEEoR6GrJPtGn1utXHOoX/4ADJariDHDERwoniiOc
 DWPMIjXUca8RrVQceMUeI0KBsTI7oMAo1XuXoMuLCD4KixLFKsePYP1wwfQY2xo6EE2w
 vxBSuUpmkDFV+WgLqc45N1VfEAtHfARRedGII5h4s5EmWfwGUi4X++V4U30TJr1tHb1K
 sabpmRyvwLsIPOS8Zjpcxwg9t5NckJil5NJcITxrM0cCE/f95Z+wi15uKyCcWybfjaCS
 Wo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sYY6nXCKD6t30QeXZzY/iyGlqBqf+vc2z0phNL/Eg5g=;
 b=j1VhtjyrUe7Ah9U305iBFwXdA7Wfon38hqkPYnHgtekgad/ysPmp2j5WvqckjNK2RE
 gpfMitlEvcYLqCRGj1PPr9S0DNSYSoo4rimJgcnlhkUAZcZy65gbjpc/1mS8NQixLO1f
 K1iIFWWL2WATxfZj5yZKQqgdiRE4XJZ2W8rJ4j77/2PWlqhBDFG9iWkIvo8KiLM2SWTe
 Rp3tFfrayUql097Sso5w2l4HStzsg8FE/DDl48IwUvq6hdFNb2LQNahKOBtpI3FEYqTy
 gdqxO3pgbKcaXGoE6WQ5EKafAqi9ftXpuezZKeuSisT50sePOVviGhkhitD7c6qJWEXj
 fy8w==
X-Gm-Message-State: AJIora/rYmRZgxbYh3VGQJICTKAvyBfnfoHwXtFqUWGoX47f/ddp25B+
 hBlJZux8Vh0HjIr9na0xCw/R4IpbuEYQHOnegGQ=
X-Google-Smtp-Source: AGRyM1vQ/Z4slZe3IQ0KDjUeluH6AIisNX0us5ZbdFvcLrNpwdlkbv9EzKh42yNUn6me2yh2cb0KyBpRhi8gL8FLkMY=
X-Received: by 2002:a05:6902:686:b0:66e:627f:4d29 with SMTP id
 i6-20020a056902068600b0066e627f4d29mr21041851ybt.385.1657634432032; Tue, 12
 Jul 2022 07:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
 <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
 <YsnoH64cKCT7gndw@smile.fi.intel.com>
 <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
In-Reply-To: <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Jul 2022 15:59:54 +0200
Message-ID: <CAHp75VejUSXoGsvCP6Mrf9Ypi4f93-fWLr_AwsOu-0=fvZ8eYg@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On Tue, Jul 12, 2022 at 3:51 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> On 2022-07-09 10:42 PM, Andy Shevchenko wrote:
> > On Sat, Jul 09, 2022 at 10:45:49AM +0200, Cezary Rojewski wrote:
> >> On 2022-07-08 6:49 PM, Andy Shevchenko wrote:
> >>> On Fri, Jul 8, 2022 at 6:32 PM Cezary Rojewski
> >>> <cezary.rojewski@intel.com> wrote:
> >>>> On 2022-07-08 5:25 PM, Andy Shevchenko wrote:
> >>>>> On Fri, Jul 8, 2022 at 2:34 PM P=C3=A9ter Ujfalusi
> >>>>> <peter.ujfalusi@linux.intel.com> wrote:

...

> >>>> A long shot, but what if we were to modify get_options() so it takes
> >>>> additional element-size parameter instead?
> >>>
> >>> But why? int / unsigned int, u32 / s32  are all compatible in the cur=
rent cases.
> >>
> >> I'd like to avoid any additional operations, so that the retrieved pay=
load
> >> can be provided to the IPC handler directly. The IPC handlers for Audi=
oDSP
> >> drivers are expecting payload in u32s.
> >>
> >> // u32 **tkns, size_t *num_tkns as foo() arguments
> >> // u32 *ints, int nints as locals
> >>
> >>      get_options(buf, 0, &nints);
> >>      if (!nints) {
> >>              ret =3D -ENOENT;
> >>              goto free_buf;
> >>      }
> >>
> >>      ints =3D kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
> >>      if (!ints) {
> >>              ret =3D -ENOMEM;
> >>              goto free_buf;
> >>      }
> >>
> >>      get_num_options(buf, nints + 1, ints, sizeof(*ints));
> >>
> >>      *tkns =3D ints;
> >>      *num_tkns =3D nints;
> >>
> >> No additional operations in between. The intermediate IPC handler can =
later
> >> refer to the actual payload via &tkns[1] before passing it to the gene=
ric
> >> one.
> >>
> >> Casting int array into u32 array does not feel right, or perhaps I'm m=
issing
> >> something like in the doc case.
> >
> > C standard.
> >
> > int to unsigned int is not promoted. And standard says that "The rank o=
f any
> > unsigned integer type shall equal the rank of the corresponding signed =
integer
> > type, if any."
> >
> > I don't know why one needs to have an additional churn here. int and un=
signed
> > int are interoperable with the adjustment to the sign when the other ar=
gument
> > is signed or lesser rank of.
>
> I still believe that casting blindly is not the way to go. I did
> explicitly ask about int vs u32,

There is no such type in the C standard.

> not int vs unsigned int. Please note
> that these values are later passed to the IPC handlers, and this changes
> the context a bit. If hw expects u32, then u32 it shall be.

H/W doesn't expect u32, HW expects bytes or group of bytes with:
1) dedicated address alignment (if required);
2) dedicated byte order;
3) dedicated padding (if required).

Correct me if I'm wrong.

> Please correct me if I'm wrong, but there is no guarantee that int is
> always 32bits long.

There is no guarantee by the C standard, indeed, but there is an upper
level guarantee, by the Linux kernel.

> What is guaranteed though, is that int holds at
> least -/+ 32,767. Also, values larger than INT_MAX are allowed in the
> IPC payload.

Yeah... this is binary protocol, right? So, what limits are you
talking about here if they are not applicable there anyway. It's
simply different dimension of limits (i.e. bytes and bits and not C
language types).

--=20
With Best Regards,
Andy Shevchenko
