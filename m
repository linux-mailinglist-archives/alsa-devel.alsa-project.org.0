Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FB67554D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 14:15:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E73AD3289;
	Fri, 20 Jan 2023 14:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E73AD3289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674220506;
	bh=tTcucmqTi7LlYmPEvzxygOmSwJB9buMex3WF6mGRPyg=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l2O8FjK+ZxlXOrjvHfdq3DUEq5bBwAnRtUYzuumgrXwtY6dK3e7YEkypv/0CKhjz2
	 BsrdfDy2UJFAdHzC08EN1MZXqjcowky7uSpfMjlp/RUwk9POOsDLFME+8Zr0LODiN0
	 c+AtHCMSuDGziwNpmV5lRpRyraLukwFzKb+aia2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9391F80246;
	Fri, 20 Jan 2023 14:14:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB7FDF8026D; Fri, 20 Jan 2023 14:14:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8AA1F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 14:14:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8AA1F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C9bv1YWd
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5B35C240004;
 Fri, 20 Jan 2023 13:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1674220442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttRLjpJX7+bPZySHlgrLI4SdZs2FLcJbSnATZxL8sq4=;
 b=C9bv1YWdcNmayF8fuRXHTOmKZ1v7FdA5eJ9fPnhkC3tciKtXV+cTZ9UNKo7kezA72ewWTf
 Pfiwe0hgRbT3XeqN/23Ki4PMTvndZfCUneutZFCTgqfefGHlNG/AxTkIXu5YUAxLNbknU7
 BiAgZXQ5mRSPxBmFERMTTxKY4lYV7YPo9cCRKafI2vqVgKCVTXC6poqPLkxRmiB5lV5Npe
 R4dGk5SrZu3F/GmIqoXRUz/nM5lAHGRjaaBRQSWJZP4lps8xtxH7fYB60ZoMgYg+Tqp4M+
 ibdsE1vST+qzulQ2riNCGHHyRsiAe04qAXkhD+jzH8DtHR3IPq8owQOmIle1iA==
Date: Fri, 20 Jan 2023 14:13:59 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: Add support for the Renesas
 IDT821034 codec
Message-ID: <20230120141359.4606b617@bootlin.com>
In-Reply-To: <Y8qFPBEYJ1gH/Ycv@sirena.org.uk>
References: <20230120095036.514639-1-herve.codina@bootlin.com>
 <20230120095036.514639-3-herve.codina@bootlin.com>
 <Y8qFPBEYJ1gH/Ycv@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On Fri, 20 Jan 2023 12:12:44 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Fri, Jan 20, 2023 at 10:50:35AM +0100, Herve Codina wrote:
>=20
> > +static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
> > +				    struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct soc_mixer_control *mc =3D (struct soc_mixer_control *)kcontrol=
->private_value;
> > +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kc=
ontrol);
> > +	struct idt821034 *idt821034 =3D snd_soc_component_get_drvdata(compone=
nt);
> > +	struct idt821034_amp *amp; =20
>=20
> > +
> > +	amp->gain =3D val;
> > +	ret =3D 0;
> > +end:
> > +	mutex_unlock(&idt821034->mutex);
> > +	return ret; =20
>=20
> _put() methods should return 1 if the value changed to generate
> events - if you use the mixer-test selftest it'll spot this and
> other issues for you.
>=20

Thanks for pointing this. I will look at mixer-test and fix the _put()
methods return code in v3.

> Otherwise this looks fine.

Thanks for the review.

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
