Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D049A7F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DDFD1730;
	Tue, 18 Jun 2019 09:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DDFD1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560842762;
	bh=bNO8mhOAyrZI90LhhbIWCmfYeM/Ha6Ad+2IrHLwfScY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnyX9obd3ss5oPu1ME6X3nV9w4/1h/aqFakwJcBNwVS6cN+a02OAM+QUE8Iss/G6r
	 wrY0cOTCdVGBjH9j3EAdGcVE+iEEyGPkpJ9t3ATyeYsoTRpVU6i8KGdLE6H5L+ShZE
	 SNoogPAhys84BbLnUceeog/DRvSRReMp8WD4GmrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE97F8971C;
	Tue, 18 Jun 2019 09:24:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DFCF896F4; Tue, 18 Jun 2019 09:24:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D166F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D166F89682
Received: by mail-lj1-f196.google.com with SMTP id s21so11987447lji.8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 00:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vww4gF/9h7dDeufpKWDU6hTs9TyDrRL/grObKHzNy0Q=;
 b=kTnO4vjqxRQZwgJPy1lhipwY8BD+JwfeLuETluNrQYPSGFzAHRw/thqe6TgEGU3ME8
 FqQ0dQtzyBTrdK/cBiSpPc4AqTQdmoGOTxHf/ADGf4mrZl5Sd906vuLLk1Z2HtKevOpF
 gnHd9CodEzQ0nxzI80vcoKzHAPACAnJFRUvHziphlJQSxQiewEeRbGUtGW8MgPVQopZN
 DQ8HqjcfqJrwusT3rMCF3pGWHWnUa4VUjeDzjIHCmu/mAR4k20527t/wzfzBKzDxUz+T
 AYV5tZldJik76zTIPJQOaCYCioiMIfgYHE1gF2X5SPbV3DXBUKs8dw1h6EYI27ujoAUm
 mqMw==
X-Gm-Message-State: APjAAAVC1ydMxZj/177tGp18mX/g3ZTNWWagCXOyqcN2byA9Rzi+L5Ek
 kbdAGRCWyS6s9J0gI+TEcGRRoAUiJHsXa7vwqyE=
X-Google-Smtp-Source: APXvYqyhbIZwb3rY0t46VAbU/ee00LM6NJrGGTiQk8GC3qtaQCqHwgfE8FknXhKhY/vvUxzPbvE+4f9B6QySz3NFGNA=
X-Received: by 2002:a2e:b0f0:: with SMTP id h16mr38257300ljl.21.1560842651347; 
 Tue, 18 Jun 2019 00:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190617144048.5450-1-geert+renesas@glider.be>
 <20190617151335.GW5316@sirena.org.uk>
In-Reply-To: <20190617151335.GW5316@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2019 09:23:58 +0200
Message-ID: <CAMuHMdXqSL6h6uk15hm9nvG3PsODRvAxbqGJD_x=pBBhgNKYMw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Add missing newline at end of file
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

Hi Mark,

On Mon, Jun 17, 2019 at 5:13 PM Mark Brown <broonie@kernel.org> wrote:
> On Mon, Jun 17, 2019 at 04:40:48PM +0200, Geert Uytterhoeven wrote:
>
> >  sound/usb/bcd2000/Makefile         | 2 +-
>
> This isn't ASoC but I'm just going to go ahead and apply it on the basis

You're right, sorry for missing that.

> that it's trivial and more trouble than it's worth to split or anything
> like that.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
