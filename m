Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD24A20F495
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 14:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 427201677;
	Tue, 30 Jun 2020 14:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 427201677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593520046;
	bh=tBG4Y67HY9RaAbhHgoPyqRy7pXl3sqz81ZybqKQF7zg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KvqO+CaVncuP/QMzEhiX7PkzvLkjZ2EgLR1O2QbGzOV3Bsi6YuqN3xDNzT31xB7T7
	 aVYxB/2rbbQmsO++GMNXhcjxIOnNpIiFjpIby25was+V2/UGPjKd8nx8wC4m17GLU9
	 k+EaMT1PGDf2R7n7h4D1+VgfOy6sOwcTYcfpOi7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60CFEF8022D;
	Tue, 30 Jun 2020 14:25:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11D91F80135; Tue, 30 Jun 2020 14:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E528F80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 14:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E528F80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TkNiPKMZ"
Received: by mail-wr1-x443.google.com with SMTP id k6so19932483wrn.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DKp9Nig/j/7keZ9L6sA0WoP4aqa2toVj2wDOC+5WIA8=;
 b=TkNiPKMZKSQij63jXXSo1yraoN+I7fpF5Kox95iPN+LtbBZ6DhFHKSiCRbeXwLtuMN
 02dj/nPJtU9uMmZhmZ2DMnPWHLprmJieARM0boueH30dW0b/jfZSYoGlbCFE/XBzQTZm
 Gx1L55p6c+3kPEkXPXV7/rVe2AnU9EgX1EUt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DKp9Nig/j/7keZ9L6sA0WoP4aqa2toVj2wDOC+5WIA8=;
 b=YmAk4Kg5VoGyCJZw0E/tnpam6t0uQUprK/NgY4NFrVqig6AS81YgdhOPpU61gUhuZ8
 4aaRv+UPT6p2vjteGJVUl+OCBHNIQhrDnkG2jpOi6zLSwgOOg1U6Kz00BQgADQ4LUC6N
 mwLC5wd8VMWbqOm1oQ0XdhLhSPXjD79PPpDl/BfSNp09+qap38XwrmgdhsjoGykNgLiH
 ODyNvz1FWRc5kHdhFKBUTyLCvkf2nCRdUQF27ut0QfjvuKGd1b6NgcjCvUz7chnyKZ02
 RGmFgVUEhbKiINAhA+VF/AMlhRVll25SK5p9soKGUeHfEig5A0svh1NnAt1XkcpuUbfh
 ElFg==
X-Gm-Message-State: AOAM532EhwBLTyxFGHHJUrGNWggzhdLzE67nNMFEsqFN0MUs7h8kQgc7
 nmT34wQseB8pncGsINKxUjRH4fOzJAoXPc0WQpDQ0A==
X-Google-Smtp-Source: ABdhPJwBRO0RaFXe4pmI1aoc68TeIq0rkX6/UbgE7jgcWx0uiJzy9YLgKqI9zbqBs3S9N/NewWqnC9j3pJHAUMzoihw=
X-Received: by 2002:a5d:4002:: with SMTP id n2mr22955538wrp.255.1593519938980; 
 Tue, 30 Jun 2020 05:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200630091615.4020059-1-yuhsuan@chromium.org>
 <20200630104047.GD5272@sirena.org.uk>
In-Reply-To: <20200630104047.GD5272@sirena.org.uk>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Tue, 30 Jun 2020 20:25:28 +0800
Message-ID: <CAGvk5PqqMKikj46yfvNYdiQ=3cWoHVLBgQKGOPs5iuoFWUBs=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rockchip: add format and rate constraints on rk3399
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B46=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, Jun 30, 2020 at 05:16:15PM +0800, Yu-Hsuan Hsu wrote:
> > S8 and S24 formats does not work on this machine driver so force to use
> > S16_LE instead.
>
> > In addition, add constraint to limit the max value of rate because the
> > rate higher than 96000(172000, 192000) is not stable either.
>
> What is the source of these restrictions - are they due to the component
> devices?  If they are then the component devices ought to be setting
> suitable constraints themselves.

I'm not sure why it happened. But I guess it is not the issues on those
components because they work normally on other machine drivers.
Because this driver is old and lacks maintenance, I think we can just
filter some unstable formats. Actually, those formats are very rarely
used as well.
