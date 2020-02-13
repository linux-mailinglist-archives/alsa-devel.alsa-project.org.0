Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398715BF9F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:44:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F476169B;
	Thu, 13 Feb 2020 14:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F476169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581601466;
	bh=fFdWUrpCwv+XidQvZ09xi+8O3WCmvKnniiwY5GMhFtI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CGrrKerlAWw7ydX75+LWD/94Q14QCKXsw6JmZ9BBy4az4p0swS5z2IRgI6P/5cBhl
	 InXpSnygB3qmMeYMKANGvJvIlX4+Ytp9h1sZywPTNfIGn8Auivhc+kLjoyYSlyWAz/
	 gdqAs14jWy6F+DmsUgj2G23FV/3EdCeTPlWfhfOo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194E0F8013E;
	Thu, 13 Feb 2020 14:42:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55F38F80145; Thu, 13 Feb 2020 14:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46737F800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46737F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Uy8DZBWT"
Received: by mail-il1-x144.google.com with SMTP id g12so5005161ild.2
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 05:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wYqO+icpSij8aiOwPZBSTkzoUsPfO7QyFrHiJiHWNpw=;
 b=Uy8DZBWThuEkhMkpYU6QmCgoyPRDKtxVVO/uBHS/Xsx4dThFPssBWpdSixjzdKVnhi
 j63mKxLxt1hbyvqEBYnlpwAIAUvgGYZi2WXbr4/rPAdeBYJMPcrKuYJoMTjQFnstZEUA
 kfjeI5OeB5cxReEJJ0wvaI6QaUc89Ulrs/Uogmn+7e6MCWB1k8UHZtq6YkUJxH6OCmF9
 Be1xex9KSHuC9w+69LOYPX6Z35kbHg0yCb2sYRRQnzlIoGfC+e4tyxmqvk6g6lFtLoFr
 dUP/xOjZk6jAW0xQi/XJyS7i3xLgj+uPWDBj+rs0Jdes8I+i5mHFbj6IHyL53XyC6ye1
 JlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wYqO+icpSij8aiOwPZBSTkzoUsPfO7QyFrHiJiHWNpw=;
 b=BZFhz2ixB3gb8hPZS0072oQ4u133RvWnlGLukM31seMDOr8mv3Cm7jiGG4TYRvProA
 ETKpQCb9JCG5+g+YspZjZmEyNnvk0gVMrezA8xRh9RRDmkOzT4h5osqMQYyZhFhrNrmj
 baliwyrwjPWTGgTQyJyyqHZeIPDxOgo/6pLJSas0lcnpMwpNstajXCEKk/UoOirF6rkl
 oKrhvxP9moxxwNJEpLbjWNLnXcua0yVVuRGGTAvKXamq14P4U9GxkdSYtk9VLE1c3BK6
 P2hKlcxsA1I5/vaOYIKYTbObUYqC21nTs8ClNLpTyhCluCnoh8OLi0tVwGJFMZY+Da/Y
 ZWmg==
X-Gm-Message-State: APjAAAUTREUc36Ju0J3fjEfxjD7VO17OZAR0wbQ7JEedJ5/90f6ka69b
 /Xq/qwzm33yXwy5Ux14FHuayv673DnxkjCozw3nHkg==
X-Google-Smtp-Source: APXvYqzXcdGTItpMF5ZnZk9U2FZCTCkS+INTtNXDL5BbMA/l9Xm8BqezDABjPqysGmvJK8/Y9Huh3GJilfOZNl/IcjY=
X-Received: by 2002:a05:6e02:152:: with SMTP id
 j18mr16101714ilr.235.1581601357084; 
 Thu, 13 Feb 2020 05:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20200213032728.199462-1-tzungbi@google.com>
 <20200213112003.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid>
 <20200213122448.GD4333@sirena.org.uk>
In-Reply-To: <20200213122448.GD4333@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 21:42:25 +0800
Message-ID: <CA+Px+wUCaLYrYR_Ff6tJGWaE+w=Nk=4JFJYu8zfT_MXZ2YR+UQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [RESEND PATCH 2/4] ASoC: mediatek: mt8183-da7219:
 pull TDM GPIO pins down when probed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Feb 13, 2020 at 8:24 PM Mark Brown <broonie@kernel.org> wrote:
> we might want to have some general pinctrl integration

I have no idea what it could be so far.  But I am willing to help if
you have some draft ideas.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
