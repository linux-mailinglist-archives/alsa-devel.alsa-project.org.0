Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D74429BBF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 05:09:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EBFF168F;
	Tue, 12 Oct 2021 05:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EBFF168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634008162;
	bh=J4/xTGLbAtwjE0t0pDMTzyFDDHExkPkZh3ooYqTtuFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NN2UxwMH5jJquNhZKpBhJdY2hDVX3hPSrdUTjSQQdwhtB8SErCkzBG3RbOgkrz3nL
	 oftAzd2mAKm0PEmbWYjxI9HKJJc6ffQJVIvMSy2F75kKl+ShnYzFewA02ff+ZKKWZL
	 VwJZ0j9WfLUcJWmWlceMIx2wh/lTMfVvTCOlrHxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE19F80245;
	Tue, 12 Oct 2021 05:08:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45946F80212; Tue, 12 Oct 2021 05:08:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC240F800CB
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 05:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC240F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H9QwPe1G"
Received: by mail-oi1-x22a.google.com with SMTP id u69so14787159oie.3
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 20:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vVvBHngaWKoiA0++47ZxjHijX6w95ry8pBLW3rnsyKM=;
 b=H9QwPe1Ga5lUz1oYHLYo1JXPU/nYvZOAWkRMgEQdMGj79GPeGqm9vTqS2PhYSElTeb
 dKUQWF04Fo4hEOu/O+5K+8jO3EE0iteMyFjRNi+8yvHdvvSwEwLRLY1xuFAF5TeY1OHr
 zXcrXJtpIye4HG2gHbsswu78EUWdqXmH3sSpfJwQkBf9AAQ/8igFUaNx1fCGhb/JWeUy
 xyhtmsrfkwBjtnsLO0hFN376XVyHwckh5ohEZ6S2OVK4QqX941k2w9M1n5mjbzE1S04K
 vu/VnFoSLCmetvsOswr7gR8QR6QnDW7LAmV5DMAgzHmKKpHWAEU7wKeFbEUa4Hy4cYP7
 ofBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vVvBHngaWKoiA0++47ZxjHijX6w95ry8pBLW3rnsyKM=;
 b=48Ul9jc59OUJYlpqMk29bgtK12JhbofE+7z2MDizMoPH3EYyrsKnR1V4lm3oHig76j
 JpdILU3ZPFQDnCYy7kY1wc/EMyoce6GH0OuFfSSPPa8E0UZ/WmWCIgQ+m0wPpnhE4pF4
 OgIFk6b2WG/ChThHAeTPNihZpdFKxNtfQs2PwsIwU6aXX4qo/ft2kAxXT3lVzUeJbKpF
 Qf/COS3hxeA8roiyGaUX6Zqir1898qE0KNBdiK7iYQLKKLYSQ6SsXEWJomZ4xFsbCqC5
 le9+0tOWM6BE2s5FEOpT9UIMMh76+6rXC2OZ+zxYiD08MfVPNMuDJ3ulKgyta3kPFxQl
 5f8Q==
X-Gm-Message-State: AOAM531/HFMWXmGERAlo+gYsSasVKGIDFTtCpuIzBr0D4E72EnIWM2S8
 Sf+5ITvJ5A1QOUylJD+WU1iaEhpmGXoJDO9bkMM=
X-Google-Smtp-Source: ABdhPJxgyBjsHO8t4SthfXn3vCmil4DtjN9T0E5geL0LHORC7tvbOOtT5ExBRj+csc1mPr5d7b3pBuGYbtFvoCflkE8=
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr1838200oia.95.1634008075820; 
 Mon, 11 Oct 2021 20:07:55 -0700 (PDT)
MIME-Version: 1.0
References: <1633668612-25524-1-git-send-email-u0084500@gmail.com>
 <1633668612-25524-3-git-send-email-u0084500@gmail.com>
 <YWA+ykStTEyzRbEy@sirena.org.uk>
 <CADiBU3-X5n3b-ZUCFf48C=5oD6RC1E9MD+M6demMLoHzZ3CEBA@mail.gmail.com>
In-Reply-To: <CADiBU3-X5n3b-ZUCFf48C=5oD6RC1E9MD+M6demMLoHzZ3CEBA@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 12 Oct 2021 11:07:43 +0800
Message-ID: <CADiBU39SKqSULSesj060a62YpMp1hD9ftfMPGtdcbOyZh8iPrw@mail.gmail.com>
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

ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=8812=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8810:47=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=888=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:51=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Fri, Oct 08, 2021 at 12:50:12PM +0800, cy_huang wrote:
> >
> > > +static const struct snd_kcontrol_new rt9120_snd_controls[] =3D {
> > > +     SOC_SINGLE_TLV("MS Volume", RT9120_REG_MSVOL, 0, 2047, 1, digit=
al_gain),
> > > +     SOC_SINGLE("SPK Gain", RT9120_REG_SPKGAIN, 0, 7, 0),
> >
> > Volume controls should end in Volume even if they don't have TLV
> > information so applications know how to render them.  I'll fix
> > this up as I apply.
>
> It's not linear mapping analog gain and cannot use the TLV as you said.
> Mappling table is listed like as below
> 0 -> 6dB
> 1 -> 8dB
> 2 -> 10dB
> 3 -> 12dB
> 4 -> 13dB
> 5 -> 14dB
> 6 -> 15dB
> 7 -> 16dB
>
> Do I just need to change it to 'SPK Gain Volume' to present this control =
item?
> Or is there any table mapping for the nonlinear TLV information?

Finally found there's 'DECLARE_TLV_DB_RANGE' that can meet the requirement.
I will fix this by the tlv db range and naming it to 'SPK Gain Volume'.
If there's any changes still needed, please feel free to let me know.
