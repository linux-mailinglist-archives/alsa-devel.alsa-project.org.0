Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397DC3374D9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 15:03:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBCEA1838;
	Thu, 11 Mar 2021 15:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBCEA1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615471381;
	bh=DCVbkTVdJ9vsoRjDTN0oauw6rLhg2qAkC/SLOqajA9A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dGtBhFf8t0o0323at4fNu5UsmXpeEcOfnHEztlX70nHbEaV9BnazCBpv1jWEpc2E4
	 IXqncaxdTKt3vCQvSrvzJBHjej2w3IF4//d13Q+QNW9Yu6lmsqlaQTcnBRn0HeR0yF
	 F76ASWJeAM/7i47EN9yVZ9JlkZr/AlVfWFx//hAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 023A4F80256;
	Thu, 11 Mar 2021 15:01:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4404CF80227; Thu, 11 Mar 2021 15:01:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6503EF800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 15:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6503EF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EUqHqJRc"
Received: by mail-pl1-x631.google.com with SMTP id e2so4976243pld.9
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 06:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJF95wh7Vf1iAu9VFx4eXo/tjVyufB4h+2uhaVD9LE8=;
 b=EUqHqJRcYFF9PqkBg9cKdXfdahh8QTsY8St9qL7peDpXwxY2mvvuSvCVEtsO1QPCfG
 pztIhwh3ZUcsaaaa0Ts9d1RTaGcSkLRCfP35DzGfGUTUbeEARwh5y8MMQm80rhHZtnBk
 jiZZPQgR5eALIyYAlwI6lDe+kzVAKiWr8OatF/y9ZzTbRbETiyzKvplnd3IHhgSkDKeM
 b1X+kaNKneczbbfJoPEVq1Zdh6Oq0bB+2byPtG6x8dQiiCWtnQETrpFIPwd2bn5m2hM+
 /sTWfnyHeg+8Ir01nhgSbF+RZMS73L3qZI78xd7H6IpY8omiDwjX4C4qNmskYEYPXMig
 ChFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJF95wh7Vf1iAu9VFx4eXo/tjVyufB4h+2uhaVD9LE8=;
 b=DsblzOuv+NVZE0KjZvEmqr9IZHCSc0ay6E+CD6vknR0OMe0T7UVIZ/2nsAhbxWkOCT
 ZuHaXMQD6y6XlytMFx2J+lsJ+FX+tcaXY6u0T8CNCNosRPH+oL0Xai+PKaK191lOaAQd
 ID2lTApcK/V8vyJgr9THTF5zXR8As6RyiNja0F0GhCksw0aj0KwbHMFENGu8N9eh+b/k
 fd4ghg0nIaMswsEzjBIwcjCg0NhrIeX9iHeFdNZEq2X5+nVSAJDCoPsZTsqoteukRMOR
 kx6V5zP3uAOCdGrJDyE1cAzjRYxmkvoOCIMx8dZ2VV+gJHj0rp2pectDjbDd3+SRrC2w
 fwlA==
X-Gm-Message-State: AOAM532IRXYrfT9/83l8xz7WX2BOi2bIitEUotVYKruRal5OnQCQbnm+
 iuec750SVVt/8BKPwpI7DxpXBhFFWFA1vEZ15/4=
X-Google-Smtp-Source: ABdhPJxZjrZHaMw8TojuQopQn/Ngqmtn7yVuKwSmGnaHZAqHscmhqJ2iTgbYrq/3wgwhtdxCCsumdDjRuVo/maTZpFk=
X-Received: by 2002:a17:902:ee02:b029:e6:5397:d79c with SMTP id
 z2-20020a170902ee02b02900e65397d79cmr8139769plb.21.1615471273960; Thu, 11 Mar
 2021 06:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210311132748.81071-1-andriy.shevchenko@linux.intel.com>
 <s5hr1klvmp3.wl-tiwai@suse.de>
In-Reply-To: <s5hr1klvmp3.wl-tiwai@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Mar 2021 16:00:57 +0200
Message-ID: <CAHp75VcjwzPOrxVhou-0i4-87X3VGAY6NqVaS=kdy3mPMOUtvQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ALSA: hda/realtek: Sort alphanumerically the
 HDA_CODEC_ENTRY() entries.
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Thu, Mar 11, 2021 at 3:36 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 11 Mar 2021 14:27:48 +0100,
> Andy Shevchenko wrote:
> >
> > Sort alphanumerically the HDA_CODEC_ENTRY() entries for better maintenance.
> > No functional change implied.
> >
> > Note, that HDA_CODEC_REV_ENTRY() goes after HDA_CODEC_ENTRY() as per
> > default value in the latter macro.
>
> This breaks the matching rule.  Please put the HDA_CODEC_REV_ENTRY()
> before the HDA_CODEC_ENTRY().

Oh, indeed. What I was thinking about... :-)
Thanks!

-- 
With Best Regards,
Andy Shevchenko
