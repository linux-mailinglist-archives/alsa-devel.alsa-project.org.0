Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0846D602C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 12:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD15167D;
	Mon, 14 Oct 2019 12:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD15167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571049013;
	bh=gK9IAsi+Nh6BH+B5gLpIMPaEs6SQWwE98EMziUMISCU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RfpQZ2MgmvwKA/WI/lI2Ls7CLRyjayB1IJkam3RWaAvq1B2AvPF+Ah25pTuykisTk
	 jS6n1OpFgnBI5+kafA1NueM0bKo68NTMCYS5qCceaeV/c7xGrNCiKfFRhyRUaCdltj
	 4ribqmmWujppDYqEFxK6d33H4o94nbAPB0xWmHlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E555F80377;
	Mon, 14 Oct 2019 12:26:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CB69F8036C; Mon, 14 Oct 2019 12:26:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A22E4F80362
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 12:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A22E4F80362
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="KvUU7xGu"
Received: by mail-ot1-x343.google.com with SMTP id 60so13354647otu.0
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2gNfmZJ5/1ywIBAglWfJ1GQhU7lYRYGj78jRXB8nZA=;
 b=KvUU7xGueOdTvLYGN0YCl+yNdFRL12cVtp36VZQeUh/UOFbq/t7ylixoxslq6SjFVA
 WeSuJ7nkjVvJn/gz2lExXAIb6PZhigPL5ADksY5Q/0qfo56FGkX1GI6hYbA0EddocPCb
 ZiXC1l4L2R5y0rjJh0TTyGJYj4K5KheJwlsh2RsKbf9n/LGx5GVBKraEq0H8AMggtfWu
 DVwm6WhXE+hJcbmvsb1spXTWXvy+QJnqjitk+RpJTi66lQlti23hAkLS35OaZjtT5opl
 aqczV0SU4bfwbjgCDjmu9WbUEM3BPM6TL6LPQ5f+B8xGiNQ5OdVB+fwO8s/FZHSHbNR4
 SSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2gNfmZJ5/1ywIBAglWfJ1GQhU7lYRYGj78jRXB8nZA=;
 b=TUHYhXtM3ez8gRlNzZPi4N3GGC3o4/SLrhDixof919Hq5w6jj+iDPwo7tOqB8IVrvR
 QVO8S0kjC9Sbs+Dky2OfuNI7QMjPO8Vx+zeilFusy+bXpHbSWTag1xxEvJLOVCZeZc13
 AH/+VyGrDk/ZMGtkhgYchiFgoSI5KnJ0ga+sTpq0YwF3sBNMhysCU1c+caAKqfz+g5OQ
 8HwAklk8oF9PFoKvfCHJBl8/14QoooNYJDuWtKNwbdZm5Pgjzbbr8M8k/WAJJpHxUr3G
 Ms/7Jl0G47q3aa3x30gt94AGJE0fUMCf2EXi+7f0LDz6Rnw6wGzi+xtSTCj2XqG1bdAt
 Qf4w==
X-Gm-Message-State: APjAAAU7gDh/8+A8qTQWBU7dJVRXYGysWHQX2ktdxMNGK0Ku/IGFFSRw
 nyFzgRckJXC5PsOVcewKBTueqvrB6/JGEbz7cVGeKQ==
X-Google-Smtp-Source: APXvYqyvZCtpMEsAR5R8mu0eANfkz0L7vCRZN5v6gSdqM/aSG7UC/Hh3Yo2isE/Xh9wQG11gKzO079TpUDZ28nHJQ8E=
X-Received: by 2002:a05:6830:158:: with SMTP id
 j24mr8255902otp.99.1571048802022; 
 Mon, 14 Oct 2019 03:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191005164320.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <201910060040.RXI5XB2W%lkp@intel.com>
 <CA+Px+wUqwjPKkbZAfJ0+a6JAhxRqGLqq_JRY6Qwoh49JrxKr8w@mail.gmail.com>
 <e02d6319-77b2-b74d-883e-7ec87c5bd1fc@intel.com>
In-Reply-To: <e02d6319-77b2-b74d-883e-7ec87c5bd1fc@intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 14 Oct 2019 18:26:30 +0800
Message-ID: <CA+Px+wUJvpHHM8NuEgjnnU+ObFXFPtNqPheGq5nAOfq4ohRMsQ@mail.gmail.com>
To: Rong Chen <rong.a.chen@intel.com>
Cc: Gwendal Grignou <gwendal@google.com>, devicetree@vger.kernel.org,
 ALSA development <alsa-devel@alsa-project.org>,
 kbuild test robot <lkp@intel.com>, Guenter Roeck <groeck@google.com>,
 Nicolas Boichat <drinkcat@google.com>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, kbuild-all@01.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [kbuild-all] Re: [PATCH v2 07/10] ASoC:
 cros_ec_codec: support WoV
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

On Wed, Oct 9, 2019 at 3:25 PM Rong Chen <rong.a.chen@intel.com> wrote:
>
>
>
> On 10/7/19 3:04 PM, Tzung-Bi Shih wrote:
> > On Sun, Oct 6, 2019 at 12:54 AM kbuild test robot <lkp@intel.com> wrote:
> >> url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/ASoC-mediatek-mt8183-mt6358-ts3a227-max98357-support-WoV/20191005-171021
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> >> reproduce:
> >>          # apt-get install sparse
> >>          # sparse version: v0.6.1-rc1-42-g38eda53-dirty
> >>          make ARCH=x86_64 allmodconfig
> >>          make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> >>
> >> If you fix the issue, kindly add following tag
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >>
> >>
> >> sparse warnings: (new ones prefixed by >>)
> >>
> >>>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <asvoid * @@
> >>>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    expected void *
> >>>> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    got void [noderef] <asn:2> *
> >>>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
> >>>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    expected void const volatile [noderef] <asn:2> *
> >>>> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    got unsigned char [usertype] *addr
> >>>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
> >>>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    expected void volatile [noderef] <asn:2> *
> >>>> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    got unsigned char [usertype] *wov_lang_shm_p
> >>     sound/soc/codecs/cros_ec_codec.c:699:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
> >>     sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    expected void volatile [noderef] <asn:2> *
> >>>> sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    got unsigned char [usertype] *
> > I cannot reproduce the same sparse errors.
> >
> > My commit stack: apply my patches onto broonie/sound.git for-next
> > $ git log --oneline
> > b4471777f5d8 (HEAD -> draft) ASoC: mediatek: mt8183: support WoV
> > b6bb558fa59d ASoC: dt-bindings: mt8183: add ec-codec
> > a08bede115d4 ASoC: mediatek: mt6358: support WoV
> > f67068fd0c91 ASoC: cros_ec_codec: support WoV
> > 7e11271c070e ASoC: dt-bindings: cros_ec_codec: add SHM bindings
> > fd04f20e77d3 ASoC: cros_ec_codec: read max DMIC gain from EC codec
> > c008f01d5bc3 platform/chrome: cros_ec: add common commands for EC codec
> > 50d2c1f9b1f4 ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
> > 00e5a1c121eb ASoC: cros_ec_codec: refactor I2S RX
> > 3f0c475d6ec8 platform/chrome: cros_ec: remove unused EC feature
> > 3877dcd0194c (mark/for-next, asoc-next) Merge branch 'asoc-5.5' into asoc-next
> >
> > My reproduce steps:
> > $ make ARCH=x86_64 mrproper
> > $ make ARCH=x86_64 allmodconfig
> > $ make ARCH=x86_64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' -j40

Find a typo from my previous message.  It should be "make ARCH=... C=1 ...".

> > 2>&1 | grep -v sched | tee log.txt
> > (Note: filter sched out to not get flood sparse errors)
> > $ grep cros_ec_codec log.txt
> >    CHECK   sound/soc/codecs/cros_ec_codec.c
> >    CC [M]  sound/soc/codecs/cros_ec_codec.o
> >
> > It did not generate the same message as 0day reported.
> >
> > One difference would be the sparse version (it is from "apt install"
> > in my environment):
> > $ sparse --version
> > 0.6.0 (Debian: 0.6.0-3)
> > On the other hand, 0day used "v0.6.1-rc1-42-g38eda53-dirty".
>
> Hi,
>
> The sparse warnings could be generated by the latest sparse
> (https://github.com/lucvoo/sparse.git). Could you try again?

Thanks.  By using the version from github, it can generate the same
sparse errors.
$ sparse --version
v0.6.1-rc1-43-g0ccb3b4

It seems current debian's version (i.e. 0.6.0 (Debian: 0.6.0-3))
cannot reproduce the errors even without the typo mentioned above.

>
> Best Regards,
> Rong Chen
>
> >
> > Guenter, what we could do in the case?  Do you have any idea?
> > _______________________________________________
> > kbuild-all mailing list -- kbuild-all@lists.01.org
> > To unsubscribe send an email to kbuild-all-leave@lists.01.org
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
