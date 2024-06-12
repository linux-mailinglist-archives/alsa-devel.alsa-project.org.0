Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C636190780C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D9C214F2;
	Thu, 13 Jun 2024 18:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D9C214F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295372;
	bh=3wDlt0rm1YoJeMtoYXnJF3HN3gpF6lAx5EVTQ33RwdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nlNPTJnbKj2dJfk+eBsQ5s5ec0Tvu3UGgpZVTgUbSLQoVQ7/AR7InJPZmg6D9zbsx
	 SGKdqyClzyyzT4v9ARArzB/Dlhb4TrComoH6Ud6BK9MOM8ZcrZf5N8yR2UBtpzjOcq
	 wOZOqwm/n/6mqJmEHOCJwbnmcWlfBF/UHqfrDytY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A16BF899B0; Thu, 13 Jun 2024 18:05:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A01F899B4;
	Thu, 13 Jun 2024 18:05:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9738F8057A; Wed, 12 Jun 2024 09:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70DA7F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 09:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DA7F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=jrLb5m/D
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6aedd5167d1so10584436d6.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718178547;
 x=1718783347; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLcH5YJaXuB/7MGBHEHfOlicw3pcEYZxxPQWbcZpzrg=;
        b=jrLb5m/DXBoYFwvBY85Sagy4ienH9I0/+FGQxrlekkMeH+xxbsWwZys3dnD5LB0Ndd
         P4njfjSVNMuAuMPQ6Ma3e1Frqeq9hy+b7rjpWtv5xvxEKxcuA9HNXUbqez7bYfWye6sD
         YDbF5G818qHPBIcqV+Oxi+w9KcmbqnehrVd1tuvLy+IDqB+0JC0jlOlyovsBthXiNO9b
         og8mOYrTFtIl0lwAymMc91v9f35YRLBZtUuAFJjmGxdLa9wLVWWUMWuOyGMQ+O0SIbWt
         d5b/n1inv6w8cUO41To+B7uKUdjQnSfz0lPJpmlhMnIkM2nryO9QZHUAWX24LNhjleal
         dHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178547; x=1718783347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLcH5YJaXuB/7MGBHEHfOlicw3pcEYZxxPQWbcZpzrg=;
        b=CfEDBmU6BB9IG8NxVHg58sHrusbMO0f5xS8UXEMTcRGwa1G8dU673EFnBCASfciiFg
         fp/WFRI1M20bdf3/47TbaNnvhPwZi/G4+aLL1C3ddcj9xwiOPJbkhmBbBRoOOBDSTSzJ
         z3dMP7jZDRSE/bda/MleGvwjadmSjseRwxtBL6o9NZsiRqqwAgUjzpwxNejAacb/JktS
         4YnkjvZ0i1YmLrUTARTOdP0DilQojztRJx2/zUjq94cGTonUu3sTQm/QGgOxs5FtexIU
         RonxUyz7IW21VDOWCWydkV/kHNgd25lOdBkSh5OZbteHK+DmouLhV3NkSRQNugy47mtE
         D01A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyb2hUBk8j10lcXATscORdwKC53yDoTvcopem8SH/XqRWvMZuo/YJ2KHH5YMUeFpWrMsszWzNDUFN+l1J14u43IbzvIFqXlDQHN6c=
X-Gm-Message-State: AOJu0YxwbwAy97IIXwgsMVqAgfgD7asvq8WAV//bmnMMHbiMIyHX+x8U
	enNKmXTr6HmW2LryvyX9s36xnlNDeosoiVX/ihYOQ4AkLsAuXxt1tPiylkCbWk8J7C0hfuHQA5o
	+vi8FhCBgt5CNC+bxn/hod+wRlYygIk1kIUNtZQ==
X-Google-Smtp-Source: 
 AGHT+IFeCV50FnVEaMqclrtqDNFKqc6xUL0MAu5JUv82YAmzpGH5pe7N5VXTefcxSlBdNwkvmPPJIXMcRjw3+tCTj+0=
X-Received: by 2002:a05:6214:460e:b0:6b0:6b78:e608 with SMTP id
 6a1803df08f44-6b19230ddb2mr12311056d6.31.1718178546635; Wed, 12 Jun 2024
 00:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
In-Reply-To: <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 09:48:55 +0200
Message-ID: 
 <CAG+cZ06kf-n339XHnOiOzSECNkxVLYVw5UvtiWZwkDx5VFHa8A@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XWBJ6Y6RCCF3B4G7VETIMMHXIPEQDTLL
X-Message-ID-Hash: XWBJ6Y6RCCF3B4G7VETIMMHXIPEQDTLL
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:05:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWBJ6Y6RCCF3B4G7VETIMMHXIPEQDTLL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 11, 2024 at 12:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index aacccb376c28..7616f61d6327 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8909,6 +8909,13 @@ S:     Maintained
> >  F:   sound/soc/fsl/fsl*
> >  F:   sound/soc/fsl/imx*
> >
> > +FREESCALE SOC LPC32XX SOUND DRIVERS
> > +M:   Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +L:   linuxppc-dev@lists.ozlabs.org
> > +S:   Orphan
>
> Not sure if we want it in the first place. Why would we like to support
> orphaned drivers? Sorry, if there is no one to care about it, then it
> should not be merged.
>
I contacted Nautel Ltd they agreed to maintain this driver so I will add
J.M.B. Downing <jonathan.downing@nautel.com>
as a maintainer.

> > +static int lpc32xx_i2s_remove(struct platform_device *pdev)
> > +{
> > +     return 0;
> > +}
>
> You did not respond to comment about this. Drop.
I will remove empty functions

--
Piotr Wojtaszczyk
Timesys
