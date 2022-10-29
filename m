Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE03611F64
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Oct 2022 04:46:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC49991;
	Sat, 29 Oct 2022 04:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC49991
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667011567;
	bh=+wnWQcbxgvmLtlRTiZ9RFXhhRhF75uw6RRP4a/6dy+A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XibQqcJuo96AUpvjl5I6+yOGCS7ZS+mmrzqEcoG+JKmxj3nOA4tYWTXgPIU+sVQtB
	 A0hDlhCpJf3GHalh+7PmgDE3qzeqs00wuIFn5a06QUDN7FuKgOaoIucuHGxQbuFbVc
	 M5s9s2nRpyWcrUnF5Q9vgEq4mOZ9bJ69nUBQxcoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D33CDF804E0;
	Sat, 29 Oct 2022 04:45:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 714EFF804CC; Sat, 29 Oct 2022 04:45:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4C47F80162
 for <alsa-devel@alsa-project.org>; Sat, 29 Oct 2022 04:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C47F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iivIreLT"
Received: by mail-wm1-x336.google.com with SMTP id
 f16-20020a05600c491000b003cf66a2e7c0so274703wmp.5
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 19:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YZXo/xYgWHdeXsm3TKun82+YgflY0gzZ71VBRkYirJ4=;
 b=iivIreLTe3H6gc5x/7AyxZ69o0BoikXYGyoLAUDbRrlkMzlKUxh+YHPl3MCTXvdzKD
 pdtyCvMx+thh9mR9tRANfBPLtOLLOoH2GyfHqT3f+YMgECAjiwE++w1VpmRuWjsYmvam
 QDJaoPV/KUjDhCYPgD2+aedemS8mq4RZ0I3OuSd4f3j2W9RmT4g1KTXNOCqSyFD6MasG
 mh3dzmLHZ4dgcTk5rbq+MiKjmOnEkNDNd3vyXWF2cOK1h4ADJ3BxwwQiUTl9LcKK8feb
 tBoOkT5r7Xsb1+t1gTUTQH/GZY5R5RVo2ri7CHmLUFn9zfpR6p8jcg+TnEkLiGaa29jF
 qZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YZXo/xYgWHdeXsm3TKun82+YgflY0gzZ71VBRkYirJ4=;
 b=P0sRaOcOHNtkWhDO2VhXFqj3LgTumQJ/iqe9qNexx/hwwTLB08dPhKrxW7s7nELWYE
 KPsomOuhdjXpBH316V/7WCJKlC5l1IIyQxSoq4/9PFmqsFSkwBL01Gbv2OJk3BWaOZHz
 Few1LDZpxUuqsRpue6UGgrg34/zEEpIVqbu43CR41zqnFZYtxsSDgwvHJj6VrvaNt+71
 Q+x7wxGKxVRmwgYKVAQ7Rbk7u4/D4vluH04A6JN4HQIlJD4+nMyFyOI1CRXMNwcGwQhE
 ch+zBm04s9+n3UET4qc2zsnyNqS6Gpm+xUJqnhs9W8BluCUDdQS40wl4K7+yalhR8aBr
 IfaA==
X-Gm-Message-State: ACrzQf3eTcVH9YWrMYMWT7SCaUarcXolAjl/UF5JTzbp9RXe909yATm1
 HxYF7Q4eIQSSI/IfBAEHOXydisNuODpt3n2PnA==
X-Google-Smtp-Source: AMsMyM7+FgJoPDXg+5fV0hccD3lp80BzLyX1FCwvdbGfrAqIdV74loEBdAetWHugsYkGJc4jMGZqDzlBPpyKrLLTdS4=
X-Received: by 2002:a1c:770f:0:b0:3c8:33ba:150f with SMTP id
 t15-20020a1c770f000000b003c833ba150fmr11412919wmi.194.1667011497604; Fri, 28
 Oct 2022 19:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <1666511085-2748-1-git-send-email-fengzheng923@gmail.com>
 <69fa20ca-da52-b85f-ffcc-66a533471568@linux.intel.com>
In-Reply-To: <69fa20ca-da52-b85f-ffcc-66a533471568@linux.intel.com>
From: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
Date: Sat, 29 Oct 2022 10:44:43 +0800
Message-ID: <CAE=m61-=WafE6iwnpboa0F7bi-LR2gFMo6raw5g=JdkNTx_Trg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: sun50i-dmic: avoid unused variable warning for
 sun50i_dmic_of_match
To: Chao Song <chao.song@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, samuel@sholland.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jernej.skrabec@gmail.com,
 lgirdwood@gmail.com, wens@csie.org, broonie@kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Hi, Song Chao:

Chao Song <chao.song@linux.intel.com> =E4=BA=8E2022=E5=B9=B410=E6=9C=8826=
=E6=97=A5=E5=91=A8=E4=B8=89 22:31=E5=86=99=E9=81=93=EF=BC=9A

>
> On 10/23/2022 3:44 PM, Ban Tao wrote:
> > In configurations with CONFIG_OF=3Dn, we get a harmless build warning:
> >
> > sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
> > 'sun50i_dmic_of_match' [-Wunused-const-variable]
> >
> > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> > v1->v2:Add "Acked-by" tag.
> > ---
> >   sound/soc/sunxi/sun50i-dmic.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sunxi/sun50i-dmic.c
> b/sound/soc/sunxi/sun50i-dmic.c
> > index 86cff5a..62509cb 100644
> > --- a/sound/soc/sunxi/sun50i-dmic.c
> > +++ b/sound/soc/sunxi/sun50i-dmic.c
> > @@ -391,7 +391,7 @@ static const struct dev_pm_ops sun50i_dmic_pm =3D {
> >   static struct platform_driver sun50i_dmic_driver =3D {
> >       .driver         =3D {
> >               .name   =3D "sun50i-dmic",
> > -             .of_match_table =3D of_match_ptr(sun50i_dmic_of_match),
> > +             .of_match_table =3D sun50i_dmic_of_match,
> I don't think this is the right direction (remove the of_match_ptr) to
> fix the issue.
>
> of_match_ptr(of_table) returns of_table if CONFIG_OF=3Dy, and returns NUL=
L
> if CONFIG_OF=3Dn.
>
> So guard  the definition of sun50i_dmic_of_match with `#ifdef CONFIG_OF`
> should be better.
>
> Many other drivers do it this way.
>

But I think there is no difference between the two modifications. I refer
to other driver files of sunxi (sound/soc/sunxi), all of which are in the
same format.

>
> >               .pm     =3D &sun50i_dmic_pm,
> >       },
> >       .probe          =3D sun50i_dmic_probe,
>
