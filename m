Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 792FA8D1FE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 13:18:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00D29166D;
	Wed, 14 Aug 2019 13:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00D29166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565781537;
	bh=Y63twqcI3ZrZOXS5gpgDa3j1fr5MKYkrQGbjgWbZJvw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XU7x32NGPMjjFfUBu78iWkOkRy0Rml+/uQqSFgTbDpUWKKY/Gvuww/h5XsaY0QWFZ
	 2+D0+ZiSLtHXChGNh4nZCOnQkbVcaqXP7QKwBWZHC5FcegTap3iMv9jazjfBQdQN5i
	 PyUDx84tIUEmc8zsHizUk2J16YD4e1wM25Yd+U98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6577BF80268;
	Wed, 14 Aug 2019 13:17:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE736F80214; Wed, 14 Aug 2019 13:17:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69704F8015A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 13:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69704F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NBBp8OKe"
Received: by mail-lj1-x244.google.com with SMTP id t3so15887866ljj.12
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpg3G9Etz4OvVx8IFQ1AOlUEfhUeo6540gz6ahfkyQc=;
 b=NBBp8OKeUdGlXRspVtZwJ2kI+diM9Z8irDSmvjLWSlMQywy/iDOLn5EcBHgEfSEWxr
 Z2gSzonKyTcHG6gUnhDnB1eFo5D5hXbbe48aL8blx8qICeJOJG8HVwjowH+quM8P/I/T
 K8l3T2I4tweMSQsWBChGVUVmZv5DTbaiwPmTLhOSryHxcpofpxwl2R3CzHblxmzkHGkq
 Q2FicIyvRL7qxuNyoHosJXKcHXfvp3GBmjbwa6oH2WhVOST71ON2vFfOSbdwvAvsGBwj
 EYi3RdP2gOM5cwR5tzZ2+qYjCX1QILUBZ1Ye9xl/cpDjh+HiMDNy7uRm/AtVZ6BmOehf
 f+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpg3G9Etz4OvVx8IFQ1AOlUEfhUeo6540gz6ahfkyQc=;
 b=ios64Y9OmoOI3o8/LrZPRCQeQlFovxuYK3i/eQ9RD+XTo17ec651ag/k8FQTiYSbbn
 Okkom1TEiRdSxj2YOeKlCKga+g6AfiUsm0NcscK9I9Pvvp7e+DW2YwMy7btl1xzNl6jO
 GUjB4LfNPa8GIWxFT4ih4Ex3eHJLtusCkE1oHHRlfRePAEZwKOtRGdFlMQS4WLI5Nk+1
 3crPY1n4E8MWrO40sIBYbJM5OFSfe42TQtU69LfWxif85CADSOYKnqGujSO9gTtvnxq9
 2iyDQO/ymY+KIUh/0SWW3bf5Y8OGmxQYcfczYVGPbb0jXJhYal6ahIjztRO2QzsAFjYq
 1qCQ==
X-Gm-Message-State: APjAAAVLVv9r2LXjdfpNf4I1oN1Ctr9iD1hZeXIrgBxWijABSGu0HwBp
 Hd0WqvrhPU4LYF6zHg5oWItsyuGPZR9FPJZZASM=
X-Google-Smtp-Source: APXvYqym+y7qghCuVZ7uMfBL4Y09yZokgyk/DRxedzjSbW1CvgLMDhOhWj6uS4zbGCv6Y9EwZB1FMZYrLmlojOLTh1s=
X-Received: by 2002:a2e:978e:: with SMTP id y14mr10027268lji.10.1565781422625; 
 Wed, 14 Aug 2019 04:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-13-codekipper@gmail.com>
 <20190814072046.metavychqvhuohwy@flea>
In-Reply-To: <20190814072046.metavychqvhuohwy@flea>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 14 Aug 2019 13:16:51 +0200
Message-ID: <CAEKpxBk4H=N-SVzXpAGkF79xmOhczOmKpJ7rJ9Js9vquw_QE7Q@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v5 12/15] ASoC: sun4i-i2s: Add multi-lane
	functionality
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

On Wed, 14 Aug 2019 at 13:08, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Wed, Aug 14, 2019 at 08:08:51AM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > The i2s block supports multi-lane i2s output however this functionality
> > is only possible in earlier SoCs where the pins are exposed and for
> > the i2s block used for HDMI audio on the later SoCs.
> >
> > To enable this functionality, an optional property has been added to
> > the bindings.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
>
> Wasn't the plan to support only stereo for now?
Stereo HDMI can be introduced on the H3 and later if we get the first
three patches
merged. Post those patches is the work to get multi-channel working.
>
> Either way, that property should be documented.
I can do this...but I'm thinking we should bang our heads together to
find a solution
that we all agree on...especially if we're considering multi-channel
tdm support.
Thanks,
CK
>
> Maxime
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
