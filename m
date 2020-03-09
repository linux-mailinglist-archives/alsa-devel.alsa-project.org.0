Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 852A317E543
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:02:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0C3168B;
	Mon,  9 Mar 2020 18:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0C3168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583773365;
	bh=Lx7415VUYJZ9clT9pfLLj8BH3QMH5ynyqGWkKaN3K+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qi0etWvwjenc8GjRDtHjOGkbTlP/lepgCm4Ia89R8KFgN3is7XOxblASINBz0fZvB
	 yHOW3ejBTc0tdOCV1VcErIYzpj5PTEn8FFQBvvb9ac50t8JebKUpgr3SQoWtbbso3R
	 LN5huvkE3rcwBc0vURkC/U3cX5S+fy9uRBRXsrl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAEFF800DA;
	Mon,  9 Mar 2020 18:01:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0B66F800DA; Mon,  9 Mar 2020 18:01:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F7D1F800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 18:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F7D1F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="nbBSCWLi"
Received: by mail-io1-xd42.google.com with SMTP id t26so2096743ios.11
 for <alsa-devel@alsa-project.org>; Mon, 09 Mar 2020 10:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rY3Eoq3idHFGjCrdr+cdPyN4Ku0GrYFLG04WoSLkUbE=;
 b=nbBSCWLiQVjFlPr/3qo9J2DAL6fIlPzTVPelWcAO8R/wZJS33JyJDb1T4QOlKOSfl0
 sM7hzn/4QqJvHoB0ze2bebkxwJN4rFm2U0Fx3IKsJKU3imFi+ZeSycRqkb2mSsaw4qlv
 WAgjfGu8jrkLSqQ8IPHc7v/RO04JXwLO2lVJx6gn+1pfuCsp8B7FGqq62lFX0UL6a9mo
 ep+BLvs+cDaKNRs5jNYdcxCWE9J7Bt1oF7leEay8YO5wB+0Yp/kQ7lFgWLbHamAqbNdN
 eCH2e6wfqUtqiHF2jcUj2jMKQTLkzW1wK3/XBBvVS/lNfsXIoY9aK/w4ibqQODI4KgAX
 xOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rY3Eoq3idHFGjCrdr+cdPyN4Ku0GrYFLG04WoSLkUbE=;
 b=YloN95uJuXywoetWU+24OsE2dSlmn/5+3Q5/XwgFFw9stjF6pR7jLqajSDcHi8cCZl
 TwvRYj8BCEZX4/XdkzJJcSRqnZ4MIA16wq7tuhJK6eWQWDUaMjEQ5gortUcGA0+cw/dw
 Ma7A7TY8EUwgFEDr7Py7mNMEgmfx/YrvLDPPb33tfVR0xf+BYrNt5065l3nspANsdlfc
 FOhZGPQKhLMbzkYI/ZO9CJy+f77UzGW405uEry6EJc95Fhj/x9h5DoppECM19BTQ24dg
 OMWns0gOr673ojkF1a0ATMMlCTwIFB9mwzjEqQt9plegixfbfi0/udKvTxLsezSoMMQe
 0ZSw==
X-Gm-Message-State: ANhLgQ2KmoCLl90a/Xdpwig7xnAC2c8QRdTXrb7+ljzgtCvSAUYlS3Sb
 I27kvyFjN5QpAbDJ2U8QXthu8tSe/9YR8ydOAWj0hpS3
X-Google-Smtp-Source: ADFU+vtT3NyUkK0CTmNBlISCBEDzizPGeM2IyCIls4yagf4ZsfW5a8wzxVlByOQu58zO8rHcWv2Yg/QgHbBN673/tRw=
X-Received: by 2002:a6b:e806:: with SMTP id f6mr7998451ioh.52.1583773254244;
 Mon, 09 Mar 2020 10:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <874kuyi33c.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kuyi33c.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 9 Mar 2020 10:00:43 -0700
Message-ID: <CAFQqKeViGDniocxCScM9KGfawCDiOzMfjK=aAFAnnWV=C3JzXg@mail.gmail.com>
Subject: Re: [PATCH 0/9] ASoC: soc-pcm cleanup step6
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

On Sun, Mar 8, 2020 at 9:12 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Mark
>
> We are using plural form for for_each_xxx() macro.
> But, for_each_rtd_codec/cpu_dai() are out of this rule.
> 1) - 7) are for it.
> 8) - 9) add new for_each_card_xxx() macros.
>
> Kuninori Morimoto (9):
>    1) ASoC: soc.h: add for_each_rtd_codecs/cpus_dai() macro
>    2) ASoC: Intel: use for_each_rtd_codecs/cpus_dai() macro
>    3) ASoC: mediatek: use for_each_rtd_codecs/cpus_dai() macro
>    4) ASoC: meson: use for_each_rtd_codecs/cpus_dai() macro
>    5) ASoC: qcom: use for_each_rtd_codecs/cpus_dai() macro
>    6) ASoC: soc: use for_each_rtd_codecs/cpus_dai() macro
>    7) ASoC: soc.h: remove non plural form for_each_xxx macro
>    8) ASoC: soc-dapm: add for_each_card_dapms() macro
>    9) ASoC: soc-dapm: add for_each_card_widgets() macro

LGTM Morimoto-san. I feel like the last 2 patches might be a bit of an
overkill but then they might make sense to keep the code consistent with
the use of the for_each*() macros everywhere.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
