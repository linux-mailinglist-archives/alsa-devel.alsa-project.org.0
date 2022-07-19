Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585FF578F56
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 02:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A211709;
	Tue, 19 Jul 2022 02:34:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A211709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658190906;
	bh=1MpZCjJHddgFLVS8Jn1dExMGiWuQhQpZ6CvDiiwd69w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKp9Iav81xDuzjXKeKt1cP17fCkuMKA4zr/GctQQY10XvwqY2QbLJT8KZ63LX1sjt
	 IKzbA1Wbgq7kaOEPLRJJBcdi0zueKkOGgwRRfMPHG6jUHsuDaF/WpCAotTBDWzsvCj
	 gWnn9cuvG3lD/zXMaYME2ig7jiPLjNVC5GTwBcZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44FF0F80095;
	Tue, 19 Jul 2022 02:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 400B4F80508; Tue, 19 Jul 2022 02:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7E45F800F5
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 02:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7E45F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gIwUl/Xu"
Received: by mail-ej1-x62f.google.com with SMTP id va17so24399317ejb.0
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 17:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IvxZ+pT9eeB1oLC9gFmEKd/KuQtpynmxv5JFp2p4LmA=;
 b=gIwUl/XuJhRTTGvtNQ0aWFNNZ72RlbJkwCpGM7wO/sSbDoqxUvqlBJWjDWb4nUVxkr
 wA4kzWGIsYd+oyTYPVOyC2ZEirNy56kC6YvoOg+Fu9JlIyx/BhzBlvQ+GB0MbVTk2jEb
 eyBlXAwQJroWvaq2gnY/J8A7Jy+02RK/TtexgA7MBUZK9FnxBH7HPm/OPbZR2kp6FIOG
 BYDIh26pR+njlg0wqOtuaPaePG5L+WBmSIyBqxyMD5dCULrXaEhs9vg/GnJqlYLpsG/y
 w38dp1uD5s55WeggWwrAh2xQxeFiYqJgAS/5mGamYHgRw4gT0je1cudllgWrZEayUSK0
 E39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvxZ+pT9eeB1oLC9gFmEKd/KuQtpynmxv5JFp2p4LmA=;
 b=h/hfRutfvUvUXYaNT97amnIQM5UotGFVRwIv7L9lH1lnkhM/ZNY77H8zSkyzwNxuep
 GqP3Ryg6x8N9spPH9NaLHxlc+8vAgKFP1qxm4W0ZTLaGqUOU4SAa2dEujxwyoVWG0Q/0
 ZQ4oVqQohfElT14oYVKcEjy3v8VNf2FE1eUFQCy/8B6wwS/K0zXKwFSbMLczGR2GOxCE
 U0Fs5oA/hxechL0pGRBiZFotw78mYecabES7lY8/0nx1uEpe+nJkwKiYAZvOaU3ZOqGc
 Y5V1fkkJth5uh7CoUZhZu7WGYo8+cjX7Qx3DDZhtczs9AndShJCH8CZHeodUQ/7Lbh5K
 MJog==
X-Gm-Message-State: AJIora+iqIS0i4lwzc3gKxpOU4uqqZXV47jFBV3t3CpZ35C+Thdzx8X5
 UqCCjr9sWsdrUDOQ5TBt1d9r2HJTbl3ONAx1WLg=
X-Google-Smtp-Source: AGRyM1sRm67nRsWZfFSFhouVBqucc4bOtFjiV6na1gILOaBHlxhxwORoLOL7DxP/wH7oPhk7TCfa/L42Gn4aM8oO2I8=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr28280283ejh.720.1658190836834; Mon, 18
 Jul 2022 17:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220718072144.2699487-1-airlied@gmail.com>
 <97e5afd3-77a3-2227-0fbf-da2f9a41520f@leemhuis.info>
 <20220718150414.1767bbd8@kernel.org>
In-Reply-To: <20220718150414.1767bbd8@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 19 Jul 2022 10:33:45 +1000
Message-ID: <CAPM=9tw6iP3Ti1idrBLTLVX57uYgf79rG2-0ad-fS48z+pXzeA@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: firmware: add driver firmware
 guidelines.
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Wireless List <linux-wireless@vger.kernel.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
 Network Development <netdev@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.sf.net" <dri-devel@lists.sf.net>,
 Dave Airlie <airlied@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

On Tue, 19 Jul 2022 at 08:04, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Mon, 18 Jul 2022 11:33:11 +0200 Thorsten Leemhuis wrote:
> > > If the hardware isn't
> > > +  enabled by default or under development,
> >
> > Wondering if it might be better to drop the "or under development", as
> > the "enabled by default" is the main part afaics. Maybe something like
> > "If support for the hardware is normally inactive (e.g. has to be
> > enabled manually by a kernel parameter)" would be better anyway.
>
> It's a tricky one, I'd say something like you can break the FW ABI
> "until HW becomes available for public consumption" or such.
> I'm guessing what we're after is letting people break the compatibility
> in early stages of the product development cycles. Pre-silicon and
> bring up, but not after there are products on the market?

I'll stick with enabled by default I think, "public consumption"
invites efforts to describe corners of the cloud or other places where
hw has shipped but is not technically "public",

Dave.
