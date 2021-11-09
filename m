Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B96FF44AEE9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 14:40:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 444AB1655;
	Tue,  9 Nov 2021 14:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 444AB1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636465232;
	bh=uzRp8vCN25ahFTDWjwEjpeTfKpC5L49vieZ5b7ldAJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDFvls/+Y7dly1oENa+d2aZAvU93A1uH9PRfT4p+e2IaRVXnkCn+P893fXfrbhHh5
	 fXtTZftvXkHU8zqLzjU5DCqJf5FuisN5c2LwmCmHS++OD0b1ohzico2lkx7YmzeiP8
	 iAlhIBxuVCIuj/BtPTWRainBA6c1/serFfLQ3IrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1145F800C1;
	Tue,  9 Nov 2021 14:39:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22993F802D2; Tue,  9 Nov 2021 14:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D16A4F800C1
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 14:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D16A4F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="amJfQ8sH"
Received: by mail-lj1-x22a.google.com with SMTP id s24so36338190lji.12
 for <alsa-devel@alsa-project.org>; Tue, 09 Nov 2021 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xf2lmT83dSNiE9eWoGnGn4bhukTvP6d6+kM7Kc5CSqo=;
 b=amJfQ8sHmRSWmPUArZTLQgn5LsrKQ3Iz9PAqbKRjFJpXbf+kZpMG6JSvCpmru6i7Rd
 supmpPHjE8ZTeFLsO8zkQmFLqRA6qpil0n5vTTnEVu+BWFDVuFo4HDC2AtMhX9/XpoJg
 QEzzNuL1CD0AEWInEWjMkWz6sbLRj/qqj3NSkdwEmfKi+uwiJLPz1CyR8avIX884fQYD
 Uld/5FlkCls2GOKfZ0YXgvI5peWZTTrtJLVhUWwPy9yMp2aq3kjLKVlFwQQ92jOMlR98
 VqjDIvuTfaUad4WKoH6o8hhEK/upQXqobvJRL8cbE/pF9dT0TL0J6tMAb4QxeJkJO9fr
 Fk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xf2lmT83dSNiE9eWoGnGn4bhukTvP6d6+kM7Kc5CSqo=;
 b=jCmxq0MWgeZiEGK8/6dqo2j/ucDDASQ4gipc1GoseB5+C8aX2e/yNmAyL39EArHUFq
 u2/m7Aphiqxm4syd0hCDIoZPPWR2JIxEr66rXdmsTSaLT75sUEtLqgDZmo/fkU3L28WV
 JJgRgkOaWfvTXCh43ZfI6p74e5TI1ol5OsElnDlKTY8lR5pPvziW6pDrcFEFTm5kDR5I
 r768lty0uRp9Qvx3KWdsYVLgBSghmwZuFmec7jKJMd2VL5fkehNIpLNdOEuGnRlxZGsh
 5ui0C6TdntYJ+botkiEJlyis6wBG0KKGZYHEFnTP6P3443FN7+7UGb2RwGkWTUDlHGIq
 q04w==
X-Gm-Message-State: AOAM5339pV6w7X/O2g4axWCMY2vtJ4unoY9cYtCsPR3HDtgiX3x9Kg9Q
 XhUsaWt67Dw5YF82IryTz2KFNmd+PyjDZeYupQc=
X-Google-Smtp-Source: ABdhPJwp/3yR0aKJzyyxnYPME8tdzmJXZFeiF4l88QOLnGXZJ0FpMU2lEfm3EzN+wCWR9J78xt3O+jujs2yYlAiq3d0=
X-Received: by 2002:a2e:890d:: with SMTP id d13mr7561859lji.396.1636465136748; 
 Tue, 09 Nov 2021 05:38:56 -0800 (PST)
MIME-Version: 1.0
References: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
 <1636439024-15877-2-git-send-email-u0084500@gmail.com>
 <YYp2+gqjn6+M/hZ7@sirena.org.uk>
In-Reply-To: <YYp2+gqjn6+M/hZ7@sirena.org.uk>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 9 Nov 2021 21:38:45 +0800
Message-ID: <CADiBU38kyx6hA-xPp-EH34YmvDfXRtOBr3Zuzj2Yc7Sx+HJWcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt9120: Update internal setting and fix auto
 sync problem
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.com, cy_huang <cy_huang@richtek.com>,
 allen lin <allen_lin@richtek.com>
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B411=E6=9C=889=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:26=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Nov 09, 2021 at 02:23:43PM +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > - Update internal setting to fix issue.
> > - Disable auto sync if fs is divided by 48.
>
> Please submit one patch per change, each with a clear changelog, as
> covered in SubmittingPatches.  This makes it much easier to review
> things since it's easier to tell if the patch does what it was intended
> to do.  When splitting patches up git gui can be helpful, you can stage
> and unstage individual lines by right clicking on them.

OK, I'll split it with two changes to make it more clear.
