Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E2971B5
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 07:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7211658;
	Wed, 21 Aug 2019 07:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7211658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566366867;
	bh=6ZaSDQy92TJ05g2wn5ABAgv9ku2d1I9bQPlNKS7ATQE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tegb1smZvwKJ+Acg/ZEH2ZjSsXbGyjs+Pvbjudn+jLmc0Zd4IDn+qjeXXEFPpmyoX
	 lcGH/6yr1Ob5YYi6JDXhqelhueltrkdLW+WTqilNT9ROnWIeLODlJdUROU7af/jHnZ
	 32Uw0hMZ9z5t3Nt3Al+Gi45V40QoAGlI06xR85jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E983F80306;
	Wed, 21 Aug 2019 07:52:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A90E4F80157; Wed, 21 Aug 2019 07:52:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C344FF80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 07:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C344FF80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h571lOuE"
Received: by mail-lf1-x141.google.com with SMTP id 62so836849lfa.8
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 22:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2TIxCfXD2eyh6zMqJFg2GtypILTlpE+TvhurqKYvOlo=;
 b=h571lOuE9rlh6jokPyR7zPtOUmcT0wb5cZZZavJmW/PBnp3LZfPhHObeuyTdEe2dk0
 +SLiwrZFafrspkXS1P35VzI8s1XqPU4YgJOGJ84d7cOsBPlHLhVIrpBJHnYHuad4tnR9
 LC9W2mth3VpWn5RAy56inC04YRNfLAsAYR9E5dzK0xOfdKYvmgM0cOSSZVIGSc7cNb7Q
 iUC8Ic/r2Gqw5H92RKoLhMsjYdRT0oSSI74UyH6Jg6gfMKeBpAo+DYhFw3aWoSVjNQoM
 mYxRyV89+I3hQ0Vl/CZBaKw6KFpw/fmpwyezY9AWSe4VTQ/F19fwdVuhfH+nETxh5Rv4
 8bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2TIxCfXD2eyh6zMqJFg2GtypILTlpE+TvhurqKYvOlo=;
 b=UsVwEHnBachATSKDnTHnv3Gr8Xfva5pGqW9bgEdaYz5aGynigyzgjXhMxh1BbBdaQA
 sd8AB/bjzzzCX1eqV5IzFNTuDpyJotXOjze9bldSw3uhwloJXHEboc+sk/50CxjgAM2m
 S6iTATy8Q4BSnMEkVwLmmYlW/O3mvUt63sw5kXk1X6csPE0a3hXSE9TI7+FQpjTAUAhS
 ifQqHtvATwVuB5D9zBhyRlxhuDu0SHuh/+ykZxxQSJxi/fY0kG7AgTxrZ0hXCFkYFRw3
 v+SKZdUcD+ojPDD862eBgYz1RqOLSuA3t7V6lY/sFngIzoeXPSlOTjN8F6t3l1Z3VkI8
 ZPDQ==
X-Gm-Message-State: APjAAAURElWstJWenhmqeZUNi9HiJuiXAr4UzRpu+NhLRhgjxB1Uwqh3
 FdwsLLyS7MVpyMfvqNkrq2KF08JLJUNdtPPzhEU=
X-Google-Smtp-Source: APXvYqyD9sge8d6nZp1df6LdnHet72hp2VogL583tm9cg6fYFMjjAZbyS0l7gUXxlDHmk9VAXZ4ToWq94s9ugar1QmM=
X-Received: by 2002:ac2:4644:: with SMTP id s4mr17334296lfo.158.1566366755409; 
 Tue, 20 Aug 2019 22:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190814060854.26345-1-codekipper@gmail.com>
 <20190814060854.26345-10-codekipper@gmail.com>
 <CAGb2v65+-OB4zEyW8f7hcWHkL7DtfEB1YK2B1nOKdgNdNqC0kQ@mail.gmail.com>
In-Reply-To: <CAGb2v65+-OB4zEyW8f7hcWHkL7DtfEB1YK2B1nOKdgNdNqC0kQ@mail.gmail.com>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 21 Aug 2019 07:52:24 +0200
Message-ID: <CAEKpxBnxf=iejk887A7qFkzt3BXVxiRS1PeA45aZYR9DsBAU4Q@mail.gmail.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [linux-sunxi] [PATCH v5 09/15] clk: sunxi-ng: h6:
 Allow I2S to change parent rate
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

Thanks....I've added to my next patch series but if you could add it
when applying that would be great.
BR,
CK

On Wed, 21 Aug 2019 at 06:07, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, Aug 14, 2019 at 2:09 PM <codekipper@gmail.com> wrote:
> >
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> > I2S doesn't work if parent rate couldn't be change. Difference between
> > wanted and actual rate is too big.
> >
> > Fix this by adding CLK_SET_RATE_PARENT flag to I2S clocks.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>
> This lacks your SoB. Please reply and I can add it when applying.
>
> ChenYu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
