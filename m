Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1AB54AF53
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 13:31:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56E87174A;
	Tue, 14 Jun 2022 13:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56E87174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655206288;
	bh=leaJ6nAwYGCUQkEJ5zBa1gi1CWbeyJ95WTvA1eeFRSc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beVUY045PWrG0MmwYGDRYs5MgPE4mTJXLcqsOiXetPtMQzK1T2P5BA9z0MB7Iojm8
	 bl+JWgUIQpQ36Y/+R9Y+eQmAwxIpQNSLSITPAQMuEOKgh7KjkemoQuZAFOdPu3idUP
	 kEsltyCwNalUI1tcGn94supw4yvV3u8LsKsngO+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA72F80165;
	Tue, 14 Jun 2022 13:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD06F800E1; Tue, 14 Jun 2022 13:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99F77F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 13:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99F77F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MtIL12FT"
Received: by mail-wr1-x42c.google.com with SMTP id h5so10906618wrb.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6fDkQC8ZKVocu1dwyc/psG+b89yWGBNWOILFDwfgnUw=;
 b=MtIL12FTuJLbgfojZkdiHK2wuuXZukt1C8rtMBGRtkseg9nG3Dl2xlSUSmBKiGHiHW
 KrDSL0uDk0ugVeO/B/S3mFMfpN3TQqMrq+ZxAmF8h9OpeoVU06DBJ8C0IAdo3mm1uhP2
 HMJgbIsqRADUfnNYNC6p1e+v2kR/Jd/E3b9Kbt2ked5zeQaYXcquj5bEZdCDBYXmlFwz
 IQvPcqIXnDQwYyvoShiDS5RQbXpmfAvMIX5HZiqo3MfYq3n42B2aw4Oqy4ED03baNz+J
 geycRa52J5H6Rf4W5rmzI+NEOP7TEqP1rwYXTfPwZpu9FJ+QjbJ+17H6/HhAHLuM7K3m
 wZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6fDkQC8ZKVocu1dwyc/psG+b89yWGBNWOILFDwfgnUw=;
 b=HBY82ETzqn2Iad5bR1jf3jwepaCxGkNoqMynLJqC6nzPSbmJEKGmt/qfyc5ChJgTkR
 KvrITHiYn/L9pLfHb6HgOssaDGQxBDV89J6aWDOUb1gmOCEv7+9mnCadMp7Qrv2Y+bXZ
 7KdXiDrEtAmJjyP9zMtsvZAmoMQEiFWcHS87UuzdMcQCvh/dIOMRH4SCXaBdZ5z+B7ad
 gLrlZ9Yqq51REYBQWbqmcTnXJS+X5eagpaq2QR6FXuclps9enO4LFObvS77e2ZylHg4A
 J53+lfRXFtkcIM5uqBaJGL2WGQMYTWVCyE97jUvYz5rETbqvT0mKSMeHfWXp8kyyix71
 Q/1w==
X-Gm-Message-State: AJIora/Wy0va0BfcGmaqINQ6qXyFp2ql1bAb5d8BnEz8nlN5VvNKMZX6
 7NxfW+nJkJLfDd2Ufqs95Lw=
X-Google-Smtp-Source: AGRyM1tIevNzKqQswlssBhpM+Qg3bjIy5LYWxiEf8JjfuqQgiwc3BcJ8GkK4jB1BXhhGtLPilyTKBA==
X-Received: by 2002:a05:6000:a10:b0:21a:14e2:794 with SMTP id
 co16-20020a0560000a1000b0021a14e20794mr4573888wrb.428.1655206216031; 
 Tue, 14 Jun 2022 04:30:16 -0700 (PDT)
Received: from opensuse.localnet (host-87-16-96-199.retail.telecomitalia.it.
 [87.16.96.199]) by smtp.gmail.com with ESMTPSA id
 i8-20020adffc08000000b0020c5253d8d0sm11365134wrr.28.2022.06.14.04.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 04:30:14 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: Test for "silence" field in struct
 "pcm_format_data"
Date: Tue, 14 Jun 2022 13:30:13 +0200
Message-ID: <8079585.T7Z3S40VBb@opensuse>
In-Reply-To: <87y1xzplj1.wl-tiwai@suse.de>
References: <20220409012655.9399-1-fmdefrancesco@gmail.com>
 <2245197.ElGaqSPkdT@opensuse> <87y1xzplj1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: alsa-devel@alsa-project.org, Eugeniu Rosca <roscaeugeniu@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com,
 Mark Brown <broonie@kernel.org>, naveenkumar.sunkari@in.bosch.com,
 Eugeniu Rosca <erosca@de.adit-jv.com>
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

On marted=C3=AC 14 giugno 2022 12:49:38 CEST Takashi Iwai wrote:
> On Tue, 14 Jun 2022 12:43:16 +0200,
> Fabio M. De Francesco wrote:
> >=20
> > On marted=C3=AC 14 giugno 2022 11:58:51 CEST Eugeniu Rosca wrote:
> > > Hello Fabio, hello All,
> > >=20
> > > On Sa, Apr 09, 2022 at 03:26:55 +0200, Fabio M. De Francesco wrote:
> > > > Syzbot reports "KASAN: null-ptr-deref Write in
> > > > snd_pcm_format_set_silence".[1]
> > > >=20
> > > > It is due to missing validation of the "silence" field of struct
> > > > "pcm_format_data" in "pcm_formats" array.
> > > >=20
> > > > Add a test for valid "pat" and, if it is not so, return -EINVAL.
> > > >=20
> > > > [1] https://lore.kernel.org/lkml/
> > 000000000000d188ef05dc2c7279@google.com/
> > > >=20
> > > > Reported-and-tested-by:=20
> > syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com
> > > > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > > > ---
> > > >=20
> > > > I wasn't able to figure out the commit for the "Fixes:" tag. If=20
this=20
> > patch
> > > > is good, can someone please help with providing this missing=20
> > information?
> > > >=20
> > > >  sound/core/pcm_misc.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
> > > > index 4866aed97aac..5588b6a1ee8b 100644
> > > > --- a/sound/core/pcm_misc.c
> > > > +++ b/sound/core/pcm_misc.c
> > > > @@ -433,7 +433,7 @@ int snd_pcm_format_set_silence(snd_pcm_format_t=
=20
> > format, void *data, unsigned int
> > > >  		return 0;
> > > >  	width =3D pcm_formats[(INT)format].phys; /* physical width */
> > > >  	pat =3D pcm_formats[(INT)format].silence;
> > > > -	if (! width)
> > > > +	if (!width || !pat)
> > > >  		return -EINVAL;
> > > >  	/* signed or 1 byte data */
> > > >  	if (pcm_formats[(INT)format].signd =3D=3D 1 || width <=3D 8) {
> > >=20
> > > JFYI, PVS-Studio 7.19 reports:
> > >=20
> > > sound/core/pcm_misc.c	409	warn	V560 A part of=20
> > conditional expression is always false: !pat.
> >=20
> > Sorry, I assumed (wrongly!) that when we have
> >=20
> > static const struct pcm_format_data=20
> > pcm_formats[(INT)SNDRV_PCM_FORMAT_LAST+1] =3D {
> > 	[SNDRV_PCM_FORMAT_S8] =3D {
> > 		.width =3D 8, .phys =3D 8, .le =3D -1, .signd =3D 1,
> > 		.silence =3D {},
> > 	},
> > 	[snip]
> > 	/* FIXME: the following two formats are not defined properly yet=20
> > */
> > 	[SNDRV_PCM_FORMAT_MPEG] =3D {
> > 		.le =3D -1, .signd =3D -1,
> > 	},
> > 	[SNDRV_PCM_FORMAT_GSM] =3D {
> > 		.le =3D -1, .signd =3D -1,
> > 	},
> >=20
> > pointer "silence", and then "pat", must be NULL.
>=20
> Oh right, those are missing ones.  I haven't realized that those
> formats are allowed by PCM OSS layer.
>=20
> Practically seen, those formats have never been used in reality, and
> we may consider dropping them completely to plug such holes...
>=20
Does it imply that my argument is correct or my "fix" can't yet catch those=
=20
missing ones?

Besides the question above, I want to notice that we have one more /* FIXME=
=20
*/ entry...

/* FIXME: the following format is not defined properly yet */
	[SNDRV_PCM_FORMAT_SPECIAL] =3D {
		.le =3D -1, .signd =3D -1,
	},

If you want I can get rid of those three entries if you confirm they can=20
safely be deleted. In a second patch I can also remove that unnecessary=20
check for valid "pat".

Please let me know.

Thanks,

=46abio



