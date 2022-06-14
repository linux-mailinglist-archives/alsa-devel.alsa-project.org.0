Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124454AEA6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 12:44:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D104E175A;
	Tue, 14 Jun 2022 12:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D104E175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655203470;
	bh=WtKbJ3HPpudvkfqjYhRRcbsCvljirpu4Qq0Unsmkl3U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2WcluUF1z1ysNyksxGJvHl57A1lqaanYXIVx2f9PWkX9Ivl2ombxVotY3OQ1Pett
	 yP7hOnVS9k/oK81Kq5DdKroSq6XHRCAZdHPckeErzEZZyqD3ylzubrc+jEkrHEHDh3
	 RnftYL2AbUb3FFlnuajh8b9kitjSIVLIcbDKZ8tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D95BF800E1;
	Tue, 14 Jun 2022 12:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82A20F800E1; Tue, 14 Jun 2022 12:43:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 347ECF800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 12:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 347ECF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fuh/hwSn"
Received: by mail-wr1-x435.google.com with SMTP id c21so10714590wrb.1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 03:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58My0mpinLHyTuDa/H86KpBx1dzYAXeM2EITtFo9zMM=;
 b=fuh/hwSnlr8FXhNJBcZOrijMZ4RxGYyviL1vzq0OQsIj0fQEFhr1HuoCiFf8CRrkB0
 c2WArCkmltPMIk7sGPPuCBYigdhXeGLHpNF9e5GZW5VsbVmddxv1+4te4BXNeBAek+cX
 tJu6pO1FORL5CH3W9/yjL2IUSIILz/iFyQuoaC5gt1VvIeE1K2ycg94mFFVU0LjHKGCL
 j2cCWUN/XUliblsn8GnQ1jhMeLHN8db5Dx/Kqn11TK2Q8X5bTj86uFRPCl/X3KfwDDAv
 qp22BUckyAu4MDeOHWb/h0Eh+JkkGEiXqLaiJYDV9gqrc9Vo6OA7WMCIfEWziwZmsraX
 +9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58My0mpinLHyTuDa/H86KpBx1dzYAXeM2EITtFo9zMM=;
 b=khSAD4q+xAcqMfxIcfXMVvm/g5MAaXrWfLTuoLLrkQVB/MaO+gc1L9CL6JPq1wVJaA
 JVTMfbSbFbZvA7T2AKQ9luhRufJElfflaIwDXq9tPOmcatDXOKtHpf+TPZeF9gVaymA+
 LdA/8FlXTw3ICBtesbyVKsG9CiYCsyKcOiZiZajirz0ScbZpYSGEcYtfaN2nEyPqg3qa
 dp8zJpnhk2KaRfJyp3/xnPNgD+StwBpeVdaeXkEPRk7IOcwUs5gM971cGK6jXBMxHxsA
 +c48lU6k+I3+TjCMinVVbkHA5gSpx4gPwyBAJm7Pc6Uu2eutiJcqWX4SrYXy8Ra8W61m
 A1EA==
X-Gm-Message-State: AJIora/D+0PgNBZlct7o76ZmE+xBMuOXYrv+PHfG0Lj9YhnPssNDzK8H
 4311D2hXpF7WcYpkMW6o96Q=
X-Google-Smtp-Source: AGRyM1vifZNk7UNCd0fbSo6GfAzc1DWqTpviOn5j20ZquC99csaXOxr92vBy0F9G1mnLmVJ4Bm8G/g==
X-Received: by 2002:a5d:4c49:0:b0:210:353c:1c91 with SMTP id
 n9-20020a5d4c49000000b00210353c1c91mr4418062wrt.159.1655203399325; 
 Tue, 14 Jun 2022 03:43:19 -0700 (PDT)
Received: from opensuse.localnet (host-87-16-96-199.retail.telecomitalia.it.
 [87.16.96.199]) by smtp.gmail.com with ESMTPSA id
 f2-20020adfb602000000b002185c6dc5b1sm12959912wre.108.2022.06.14.03.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 03:43:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH] ALSA: pcm: Test for "silence" field in struct
 "pcm_format_data"
Date: Tue, 14 Jun 2022 12:43:16 +0200
Message-ID: <2245197.ElGaqSPkdT@opensuse>
In-Reply-To: <20220614095851.GA4199@lxhi-065>
References: <20220409012655.9399-1-fmdefrancesco@gmail.com>
 <20220614095851.GA4199@lxhi-065>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: alsa-devel@alsa-project.org, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com,
 Mark Brown <broonie@kernel.org>, naveenkumar.sunkari@in.bosch.com
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

On marted=C3=AC 14 giugno 2022 11:58:51 CEST Eugeniu Rosca wrote:
> Hello Fabio, hello All,
>=20
> On Sa, Apr 09, 2022 at 03:26:55 +0200, Fabio M. De Francesco wrote:
> > Syzbot reports "KASAN: null-ptr-deref Write in
> > snd_pcm_format_set_silence".[1]
> >=20
> > It is due to missing validation of the "silence" field of struct
> > "pcm_format_data" in "pcm_formats" array.
> >=20
> > Add a test for valid "pat" and, if it is not so, return -EINVAL.
> >=20
> > [1] https://lore.kernel.org/lkml/
000000000000d188ef05dc2c7279@google.com/
> >=20
> > Reported-and-tested-by:=20
syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> >=20
> > I wasn't able to figure out the commit for the "Fixes:" tag. If this=20
patch
> > is good, can someone please help with providing this missing=20
information?
> >=20
> >  sound/core/pcm_misc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> > index 4866aed97aac..5588b6a1ee8b 100644
> > --- a/sound/core/pcm_misc.c
> > +++ b/sound/core/pcm_misc.c
> > @@ -433,7 +433,7 @@ int snd_pcm_format_set_silence(snd_pcm_format_t=20
format, void *data, unsigned int
> >  		return 0;
> >  	width =3D pcm_formats[(INT)format].phys; /* physical width */
> >  	pat =3D pcm_formats[(INT)format].silence;
> > -	if (! width)
> > +	if (!width || !pat)
> >  		return -EINVAL;
> >  	/* signed or 1 byte data */
> >  	if (pcm_formats[(INT)format].signd =3D=3D 1 || width <=3D 8) {
>=20
> JFYI, PVS-Studio 7.19 reports:
>=20
> sound/core/pcm_misc.c	409	warn	V560 A part of=20
conditional expression is always false: !pat.

Sorry, I assumed (wrongly!) that when we have

static const struct pcm_format_data=20
pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] =3D {
	[SNDRV_PCM_FORMAT_S8] =3D {
		.width =3D 8, .phys =3D 8, .le =3D -1, .signd =3D 1,
		.silence =3D {},
	},
	[snip]
	/* FIXME: the following two formats are not defined properly yet=20
*/
	[SNDRV_PCM_FORMAT_MPEG] =3D {
		.le =3D -1, .signd =3D -1,
	},
	[SNDRV_PCM_FORMAT_GSM] =3D {
		.le =3D -1, .signd =3D -1,
	},

pointer "silence", and then "pat", must be NULL.

I'd better read again how fields of global struct variables are initialized=
=20
:-(

Thanks for this finding,

=46abio

>=20
> I haven't fully validated the finding, but it appears to be legit,
> since the pointer variable (as opposed to the contents behind the
> pointer) is always non-null, hence !pat always evaluating to false.
>=20
> If the above is true, then the patch likely hasn't introduced any
> regression, but also likely hasn't fixed the original KASAN problem.
>=20
> Or are there alternative views?
>=20
> BR, Eugeniu.
>=20



