Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9EB427FE6
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:52:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C08D21687;
	Sun, 10 Oct 2021 09:51:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C08D21687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852351;
	bh=F14LAZ5jqaxfaU/ag+TPbVvCnSAdqLSx6tcdh+GnXGg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BVodjQMx++KOd4Myt521c/xsFXGU97pTW2HS4xmSaSwZFkqwWwtEObZ0fWl13LzO+
	 VZSt21B5rvTqrH9kohgCGSI0i8KcmISN2Su1DNrFoKx+1duFZPdQ/ODYmhWaUmJh/0
	 HdX0utsgjb3Xb8tLfK3Fqq8HQs8LvuKRAoXVbx10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F26F804FD;
	Sun, 10 Oct 2021 09:49:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B55A0F8027D; Fri,  8 Oct 2021 02:25:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60CCFF80130
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 02:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60CCFF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H2EWLDQb"
Received: by mail-lf1-x12f.google.com with SMTP id x27so31812457lfa.9
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 17:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JAxiMV4e9IES0WCDs6Kf/JEV24J6hZNfBu2CFV/CZ38=;
 b=H2EWLDQbJMkvJFlEtT/t+4WfNlZc7NvJHo8UPbbJ1Vgbxqw1zgW/utCv8dE+C4j49v
 eRaUM/uUDYAAtqTT9zZ6cO/QOPY6Q9op105OnCcvkka1Ud/ImZRuHbaLnqaZ5di4DqOI
 J3B4z71Zr5KxukkUSg7Gzh5ouX1G6QAQzEB9vG3G57VvisVPVIRn4B9OQlStCvioIHES
 i69id2Xo6RpVEjTBgXc7ELWI2NXT0PUDIZC9AtB4nahgKjQeWMUwfU6+V9LDBr1hbS2j
 ZgEVTRSg41W4bNF9q4mPv4ux6C1EdgifKc2Oo1jh/oLVdiC9pOlp2bgveFA5atsHDKtj
 +kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JAxiMV4e9IES0WCDs6Kf/JEV24J6hZNfBu2CFV/CZ38=;
 b=VWDXuZMjqzFiq5yLuFWDWb/EdxKm+PQni8lETk3xC08CsCPeAmZynbG7c4j7IkCp9y
 Te1YRQ6eh6CCg0IiIKQwmts0RGoX1qR8P/jVv3kab/6apee2AmRk0nybKW8t2UcD8ymu
 nCXIIxKEGVub+WCuFx8NyIr8pNAwWHqy03O7p3oP5d02x8Axs2xhjev9fNFrru2EH8oc
 ExEyfLkMS3H038rUtJkkxY0eberyZcMi9zqiXP2/a8clV3T9CYfoI2RXrrfbHYwOGCHo
 iEmHBN9nAbZw911lltIltSCG+HNvH5sJpuuBGjYDeAnE1utcq+QGAit8EFVBSVNxgetp
 eADg==
X-Gm-Message-State: AOAM530JZ+XvpIsFFUL4g5mfdFW9ybFap62HJKgzRC9LQh2MZ7vNxXSI
 rTTkONNjorAsWpKKoako9YX+o4lC5AyYWF9myCU=
X-Google-Smtp-Source: ABdhPJw/svHxQv1lF1Ihe6ehtlvQgm5Y7g4LCz8pevcaSeUqmDAJlLh+5VmaHLXuE1rESNw8nmRkAdd6U4+igSErhSQ=
X-Received: by 2002:a05:651c:1610:: with SMTP id
 f16mr63513ljq.415.1633652716880; 
 Thu, 07 Oct 2021 17:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
 <YVw7vbpu4TS+7Su8@sirena.org.uk>
 <CADiBU39dvKS_a5FDgw9yMVFe8Uycn6bfjGwBWq+7MN_DdxkL1g@mail.gmail.com>
 <YVxFMaPhZdAFniMa@sirena.org.uk>
 <CADiBU3_TuHKiVG-r1TG-8WK_tW2GXi4VuqkidPwTyebOgE60OA@mail.gmail.com>
 <CADiBU3-4F-FdJxaa4Qp4xmUD3vsA=6u5_ojwDSr8zrDuW8JbXg@mail.gmail.com>
 <CADiBU38zCZk_P-q8BtbPfdeSacUF7LOvQYUFgvidbWZwcLY=wA@mail.gmail.com>
 <YV76ByQWKvKNOvF0@sirena.org.uk>
In-Reply-To: <YV76ByQWKvKNOvF0@sirena.org.uk>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 8 Oct 2021 08:25:05 +0800
Message-ID: <CADiBU3_2me9xxBxCy5oT6KxiC2J+TrsY-EzyXXcJ_F2mtm+oJQ@mail.gmail.com>
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=887=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Oct 07, 2021 at 10:44:49AM +0800, ChiYuan Huang wrote:
> > ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=886=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:47=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=88=
5=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:39=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > > Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:29=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> > > > > > > I would expect this to be done through the regulator bindings=
, they
> > > > > > > would allow the driver to query the supply voltage.
>
> > > > > Please don't take things off-list unless there is a really strong=
 reason
> > > > > to do so.  Sending things to the list ensures that everyone gets =
a
> > > > > chance to read and comment on things.
>
> > > After contacting our HW RD, to support DVDD 1.8V not just SW config,
> > > also HW connections.
> > > To get only DVDD supply voltage is not enough to meet the HW design.
> > > The property seems indeed and need to be used by user's HW connection=
.
>
> > > Can this property to be kept?
>
> > After thinking, This property name may be improper.
> > I think this change depends on HW external circuit for lowv application=
.
> > Currently, I'm modifying the V3 change, this property name also affect
> > the property parsing code change.
> > May I directly change the name to 'richtek,dvdd-lowv-application' and
> > submit the patch v3?
>
> I still don't understand why you wouldn't describe this through the
> regulator bindings, those exist to describe the physical supplies ont he
> board and their constraints.

Not to oppose your comment, from the initial idea, I'm just thinking
'how' to make the user easy to use.
But if this way  is more flexible, I'll change it to check the
regulator voltage.

This will be put in patch v3.
Thanks.
