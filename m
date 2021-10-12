Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6D429BA4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 04:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B4A1690;
	Tue, 12 Oct 2021 04:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B4A1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634006929;
	bh=ZaUYrCHgm6UHoGgGdOiFdHVjxPlGl7ZcLzcdTQVikRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uKDef9HznnTmgxCNtQFXaFjUqcccbH1RJV3ye6D50DbzfOfBG1hr55+Ucq/EGwAHr
	 R//g9+QvfxWz0HU5afaMu/u5OLSdUe9LPAWQ154I92cEVIQGUjQ6fy67Esa1E+Nc+4
	 8fO5q2IW89QZrsDaUzcbXHzuQ3hSSqqmg734KqGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38107F800C0;
	Tue, 12 Oct 2021 04:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D8F4F80212; Tue, 12 Oct 2021 04:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C388F800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 04:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C388F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BPWH55iR"
Received: by mail-lf1-x131.google.com with SMTP id x27so81197093lfa.9
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9O4Co6QBwLVOkBI0LJyrQRb8YZ+pNiYDkLLMY/zEjBE=;
 b=BPWH55iRUxci7MR/86u3p9ZBkTXEiXRs1966jxUBGPt2ZpQBJ6vcQ6djbwnokaj3Xy
 7FakdsnV5ugQuv+YXKBYlCwk8p6QMKe6PKP2iWoYi1anPw3TLAyTb9dKdPhR2891pqjn
 M3gX5JnXK4Y2SPlncSrRAl++Bp5eAuMJVqeD5nF9pJtW256stWh/agix4RBq/tPp5O+M
 qp5l7csNZ6ZfWORQXstkHUKGrYZ+Q9FlAgN3vscsTL7gq+pFcpoKb9mNqkNxw/Djin4d
 tDESlUHAqL8w9eVxuadpbwJvHPt0LzdPOgMDfh6QmYbQ3L6OoJzssneGsstfMiI0F6pQ
 g6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9O4Co6QBwLVOkBI0LJyrQRb8YZ+pNiYDkLLMY/zEjBE=;
 b=cBPaMcleKukgputUk5QVL5vKWF2ET6GbfA8niQYmHUTbdOa0h8VluLm+5OPgqULNAW
 OAguht7Sv50TIscRZ1slxGgccWe/o92+KIsHz8HRsUPKn1zbaeI2ChwMHAUlfbMlvo1z
 T9LgGHY89YNDLbLznZvd/pbW3yuEkXXfL2s/ps+KiiqFRaO3c0S/JHBWgSCEyhRJf2tD
 kFUG5WE/rgbRHOGhrSp6IsDDUgoIeILDlazkpsa+j0/jjWiLGpWGByF37c106r7Wi3/C
 RIT9ql1Nkbc6/7LSl42JthC2FfeQBv6YYy2DQXY2YBheOMnne6p7zLwC4wE0vnOADug+
 0F/w==
X-Gm-Message-State: AOAM533iFN7IHsO85n9wyq/xVwrGDCMziN8qN8MmRV4vlRiLLTc/RI5v
 yemCAaUZXP4vrVqLr+dsfVFfWgBVAMhhFrO2p2Q=
X-Google-Smtp-Source: ABdhPJwL4hjIpyRx3qZJw+omSMkewzzTqEhB8DRkSJ7/FNh1tjRo/86P8DJiEw9D9gEUPczClE18Z9uuXFKUH8TOrBY=
X-Received: by 2002:a2e:9e50:: with SMTP id g16mr20606392ljk.183.1634006836365; 
 Mon, 11 Oct 2021 19:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <1633668612-25524-1-git-send-email-u0084500@gmail.com>
 <1633668612-25524-3-git-send-email-u0084500@gmail.com>
 <YWA+ykStTEyzRbEy@sirena.org.uk>
In-Reply-To: <YWA+ykStTEyzRbEy@sirena.org.uk>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 12 Oct 2021 10:47:05 +0800
Message-ID: <CADiBU3-X5n3b-ZUCFf48C=5oD6RC1E9MD+M6demMLoHzZ3CEBA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: rt9120: Add rt9210 audio amplifier support
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: oder_chiou@realtek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.com, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, allen lin <allen_lin@richtek.com>
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Oct 08, 2021 at 12:50:12PM +0800, cy_huang wrote:
>
> > +static const struct snd_kcontrol_new rt9120_snd_controls[] =3D {
> > +     SOC_SINGLE_TLV("MS Volume", RT9120_REG_MSVOL, 0, 2047, 1, digital=
_gain),
> > +     SOC_SINGLE("SPK Gain", RT9120_REG_SPKGAIN, 0, 7, 0),
>
> Volume controls should end in Volume even if they don't have TLV
> information so applications know how to render them.  I'll fix
> this up as I apply.

It's not linear mapping analog gain and cannot use the TLV as you said.
Mappling table is listed like as below
0 -> 6dB
1 -> 8dB
2 -> 10dB
3 -> 12dB
4 -> 13dB
5 -> 14dB
6 -> 15dB
7 -> 16dB

Do I just need to change it to 'SPK Gain Volume' to present this control it=
em?
Or is there any table mapping for the nonlinear TLV information?
