Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C527CDC2F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 09:06:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046901616;
	Mon,  7 Oct 2019 09:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046901616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570431989;
	bh=pp76bsQfVribkloZk+Eu8MVEqzK8E/ugqF2KbSj72p0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bULY8qEvbRG5Zv35SMqKbt1wyu7rjowM5ha3XgIWuLZtkIcSnRnnb/dvsUJcNUKJ8
	 mmzdngLV30ls/ZQRrctqKUhNMRNj4DFahpXtw/OvYISBqJzLinZEOhR2Uvdl8jHMXE
	 Fzwds1ytli/m8M7Iw0KdoYDaSPifT+kxbSfGFsW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC0CF802BD;
	Mon,  7 Oct 2019 09:04:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC392F802BD; Mon,  7 Oct 2019 09:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24750F80137
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 09:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24750F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Lvcm1U5k"
Received: by mail-ot1-x342.google.com with SMTP id g13so10073879otp.8
 for <alsa-devel@alsa-project.org>; Mon, 07 Oct 2019 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V1Fq1if03fTxZwfIDS+AXRsqn/zMBIp6rhN/Ahq0s0M=;
 b=Lvcm1U5kMqQnGsZ/Z86XsSGVHGp8luMvhUw8V2IMJSj6VbyWwKPMJ5q2LXVUsx7eig
 KYRLZuUKYyOLEjvOdL07CUUwwDtgc6RzP3Zbko/JRR18jNxWne8Rl2my3Y0IaSGUNStN
 jrhOnddOzrYb9eBDjuEp8TmdhL/8DF2pNyxbTshOVduicQWwf3CtVlOH4iBRjtko4yh8
 cLYdIAZcgbbjOkWlT008qamelHEudzFtl24cketvZFLM5iJLtIoxjM5P9kpg0oaUHMtS
 OUcztHsnlP5c9uWRtVlB7dnPTZNBUXi7kdJuffqkXU8negTN3voiobMPHKZZX7F0y9PQ
 r29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V1Fq1if03fTxZwfIDS+AXRsqn/zMBIp6rhN/Ahq0s0M=;
 b=YxnJz7h44+ljjIOm2xss/rIa7NGbwfdiLH5449E1p10+A0t/X4pY7Ns7HT9WsZkPeP
 AKcvI8VpkXdY/TWpW3CxEr22jWrH6jjC5CWLZ91MgRMP3qENjSZ0PXv9E3GRkSKrJ3QZ
 1eXTct+M60Sf5DXagF1gurSDXUhanjlUr4GU2sx1D9XT5CZITy/Ugi0g1v4AlsMcKNS6
 timPecRRsCIByEoDRwau9raJHQMCK1KfvBIQmspwfrxAK4wpiPedyOOVnb/o6l476LNd
 oHpUqFb6C4o/XhUrMX4YnX4omLWKFVuWGtnnBTcg5YMUMnUeXid9st7pXoJU+iMhfl0U
 BDWA==
X-Gm-Message-State: APjAAAXfB4gVG55hbbXdNj1pryWNU0E+U3nAiaRRoBbPZfPMLcfp6HJK
 9DJRY2TycrViajeHxu158pcGywScw4tCoyEb1phNoQ==
X-Google-Smtp-Source: APXvYqz5NKpWPk5P2gnHbhTiIn9IVx8rbMKHqaQKsiNUqdryg3KYXMCeoiihQBTM9L7BJFj6bJX0jcfwMkZtgS8pnRM=
X-Received: by 2002:a05:6830:1d97:: with SMTP id
 y23mr5419897oti.103.1570431875776; 
 Mon, 07 Oct 2019 00:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191005164320.07.I5388b69a7a9c551078fed216a77440cee6dedf49@changeid>
 <201910060040.RXI5XB2W%lkp@intel.com>
In-Reply-To: <201910060040.RXI5XB2W%lkp@intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 7 Oct 2019 15:04:24 +0800
Message-ID: <CA+Px+wUqwjPKkbZAfJ0+a6JAhxRqGLqq_JRY6Qwoh49JrxKr8w@mail.gmail.com>
To: kbuild test robot <lkp@intel.com>, Guenter Roeck <groeck@google.com>
Cc: Gwendal Grignou <gwendal@google.com>, devicetree@vger.kernel.org,
 ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Nicolas Boichat <drinkcat@google.com>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, kbuild-all@01.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2 07/10] ASoC: cros_ec_codec: support WoV
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

On Sun, Oct 6, 2019 at 12:54 AM kbuild test robot <lkp@intel.com> wrote:
> url:    https://github.com/0day-ci/linux/commits/Tzung-Bi-Shih/ASoC-mediatek-mt8183-mt6358-ts3a227-max98357-support-WoV/20191005-171021
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-rc1-42-g38eda53-dirty
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
> >> sound/soc/codecs/cros_ec_codec.c:430:39: sparse: sparse: incorrect type in return expression (different address spaces) @@    expected void * @@    got void [noderef] <asvoid * @@
> >> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    expected void *
> >> sound/soc/codecs/cros_ec_codec.c:430:39: sparse:    got void [noderef] <asn:2> *
> >> sound/soc/codecs/cros_ec_codec.c:549:69: sparse: sparse: incorrect type in argument 2 (different address spaces) @@    expected void const volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
> >> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    expected void const volatile [noderef] <asn:2> *
> >> sound/soc/codecs/cros_ec_codec.c:549:69: sparse:    got unsigned char [usertype] *addr
> >> sound/soc/codecs/cros_ec_codec.c:698:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
> >> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    expected void volatile [noderef] <asn:2> *
> >> sound/soc/codecs/cros_ec_codec.c:698:33: sparse:    got unsigned char [usertype] *wov_lang_shm_p
>    sound/soc/codecs/cros_ec_codec.c:699:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2> * @@    got latile [noderef] <asn:2> * @@
>    sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    expected void volatile [noderef] <asn:2> *
> >> sound/soc/codecs/cros_ec_codec.c:699:48: sparse:    got unsigned char [usertype] *

I cannot reproduce the same sparse errors.

My commit stack: apply my patches onto broonie/sound.git for-next
$ git log --oneline
b4471777f5d8 (HEAD -> draft) ASoC: mediatek: mt8183: support WoV
b6bb558fa59d ASoC: dt-bindings: mt8183: add ec-codec
a08bede115d4 ASoC: mediatek: mt6358: support WoV
f67068fd0c91 ASoC: cros_ec_codec: support WoV
7e11271c070e ASoC: dt-bindings: cros_ec_codec: add SHM bindings
fd04f20e77d3 ASoC: cros_ec_codec: read max DMIC gain from EC codec
c008f01d5bc3 platform/chrome: cros_ec: add common commands for EC codec
50d2c1f9b1f4 ASoC: cros_ec_codec: extract DMIC EC command from I2S RX
00e5a1c121eb ASoC: cros_ec_codec: refactor I2S RX
3f0c475d6ec8 platform/chrome: cros_ec: remove unused EC feature
3877dcd0194c (mark/for-next, asoc-next) Merge branch 'asoc-5.5' into asoc-next

My reproduce steps:
$ make ARCH=x86_64 mrproper
$ make ARCH=x86_64 allmodconfig
$ make ARCH=x86_64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' -j40
2>&1 | grep -v sched | tee log.txt
(Note: filter sched out to not get flood sparse errors)
$ grep cros_ec_codec log.txt
  CHECK   sound/soc/codecs/cros_ec_codec.c
  CC [M]  sound/soc/codecs/cros_ec_codec.o

It did not generate the same message as 0day reported.

One difference would be the sparse version (it is from "apt install"
in my environment):
$ sparse --version
0.6.0 (Debian: 0.6.0-3)
On the other hand, 0day used "v0.6.1-rc1-42-g38eda53-dirty".

Guenter, what we could do in the case?  Do you have any idea?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
