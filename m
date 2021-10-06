Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B28AD427FDF
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E1A168D;
	Sun, 10 Oct 2021 09:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E1A168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852249;
	bh=VyoIHXIO4ysCd+45F8KVHQNtoKEHTrIn4V0egiL1wlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lZZnqUC48v8DIanhA7/GyIDwhZAr9lpWlVlbeKn/+QhcdaE+jkFpptg3X1Pt6TYUW
	 XEmBt6+AdKIWu+mtrx02R6C0XiJucJQWtlr0RvdhEDOSkU2Uye9gGOtJ9cRNTWaVLf
	 RXrcx4byzAuD01f538Leo6UnqCIAKze+048Yht9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC8CF800F0;
	Sun, 10 Oct 2021 09:49:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F68F80240; Wed,  6 Oct 2021 10:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57ACEF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 10:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57ACEF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kofkwor/"
Received: by mail-lf1-x12c.google.com with SMTP id m3so7390503lfu.2
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qt1MU2rBHUcCG/itiqLGGGuQT3zd/XSnIPDfOKn/Ios=;
 b=kofkwor/Exw5fvZpgw8RKXo87GQ0UtBlNV5skI9mNMtOZVBYKg7R9sHNw1qy8RCy9K
 YQHGCMGVX/3a8t0XVF1JQ7x6YugN3L9s2+PSQCGpox9gTc1sQNXCrLLLQVpiiXxCrXW0
 KDPv+9k/5mwYlsYqFTLbKu7TzygRe273QRv8gexRDvoyHI1Z7VCybp2ucN6/XFeaQALJ
 rkDUpc7VnBDkOWPplETX4Xt3OrqiQw+h558dDb4GXRlDd50fyU+1W+7bvezdsrG8ygmg
 19mkkyGaD3IEtb5Oft/QGYZDBvq/T7+05fs64GSZrQu+yZ5XWMLYIWdF3T+o1gVzxikp
 iJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qt1MU2rBHUcCG/itiqLGGGuQT3zd/XSnIPDfOKn/Ios=;
 b=XZQJEwPPu5u6ss2Y9ozF7PveuISegd/cT9pvvKij6AVJbiSbZl6EoSG53CyBHAtLQ8
 X6bX6o/EI6osEfrLcrQMUbHJfEMOrSy8xrmoVD1TuwjNs7le1mzRtpvyH7WbVRFr29qN
 VfjlqgwCA08qG8FrAMQHP3ZX3qwM7rgqDPtnq1mLJE1UrjAkOg4yGripBpLIPjfSc6UY
 QW/k09GkZ25dm5sP+IVNSO1CyouAp5Q3pp1FDsFzTpuMaieVCAE8ItLYQuuJOsUdKbrq
 ymxg07AV0oxMz98WidsbgvzGllz0xSM7aLND84I2WMBXeMhmIecBeiRlt9y39iRG/8g8
 Litw==
X-Gm-Message-State: AOAM530dXeY5rg8Qed4fXBOk4m+jZ3Q8nlZP3TtywiFxuAitAkhxIyd3
 8fdzrdPHlFMiFAGEDXpU8POmXtrAMzusPVIZynut26LG
X-Google-Smtp-Source: ABdhPJxaeki3renWBs16/PtlBC3PGa0bzgH87pk9l6BVmGBv7CtNn1ORXziCn/HrbNw8V2syQmhIs6DqrrcmCLa6b7E=
X-Received: by 2002:a05:6512:12c9:: with SMTP id
 p9mr8839455lfg.345.1633510049583; 
 Wed, 06 Oct 2021 01:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
 <YVw7vbpu4TS+7Su8@sirena.org.uk>
 <CADiBU39dvKS_a5FDgw9yMVFe8Uycn6bfjGwBWq+7MN_DdxkL1g@mail.gmail.com>
 <YVxFMaPhZdAFniMa@sirena.org.uk>
 <CADiBU3_TuHKiVG-r1TG-8WK_tW2GXi4VuqkidPwTyebOgE60OA@mail.gmail.com>
In-Reply-To: <CADiBU3_TuHKiVG-r1TG-8WK_tW2GXi4VuqkidPwTyebOgE60OA@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Wed, 6 Oct 2021 16:47:18 +0800
Message-ID: <CADiBU3-4F-FdJxaa4Qp4xmUD3vsA=6u5_ojwDSr8zrDuW8JbXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: rt9120: Add initial bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:49:29 +0200
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

Hi, Mark:
ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:29=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Tue, Oct 05, 2021 at 08:25:43PM +0800, ChiYuan Huang wrote:
> > > Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=887:49=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > > On Tue, Oct 05, 2021 at 09:16:54AM +0800, cy_huang wrote:
> >
> > > > > +  richtek,use-dvdd-1p8v:
> > > > > +    description: Indicate DVDD 1P8V is used, default for 3P3V or=
 5V design
> > > > > +    type: boolean
> >
> > > > I would expect this to be done through the regulator bindings, they
> > > > would allow the driver to query the supply voltage.
> >
> > > It's more like as the I/O pad voltage.
> > > Must be the same as I2C and I2S signal high level.
> > > It depends on the application SOC design.
> > > From my understanding, not all application SOC I/O voltage uses
> > > regulator interface.
> >
> > It doesn't really matter what the SoC is doing here, you can always add
> > regulator support to your device - you'd be requesting the supplies to
> > your device, if the SoC doesn't request the supplies that go to it that
> > doesn't really make a difference to what your driver does.
> >
> > Please don't take things off-list unless there is a really strong reaso=
n
> > to do so.  Sending things to the list ensures that everyone gets a
> > chance to read and comment on things.
>
After contacting our HW RD, to support DVDD 1.8V not just SW config,
also HW connections.
To get only DVDD supply voltage is not enough to meet the HW design.
The property seems indeed and need to be used by user's HW connection.

Can this property to be kept?
> Sorry, my fault.
> I just noticed the mail not reply all. Loop all again.
