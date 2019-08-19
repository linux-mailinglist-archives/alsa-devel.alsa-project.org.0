Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3571A94EB4
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2019 22:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A810C1671;
	Mon, 19 Aug 2019 22:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A810C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566245245;
	bh=Db7Q1Zv+87qISq2Q9KEbbfGEdCZCM8ZaqOO8bj0AdxE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uw26you5mmzJuOS1qg6X6EvYAJzaBJhQVdTO6JAQ0607ieFJaQofgPekiiDNM2tym
	 DnSeOeih+m2lj8Lo7xgSOJeL7/BTNSDYffLKrYWIBNxGbzbFwW/k3SGlr9+vLQmCUm
	 NsJJy9Ue0zIyNrQMKtfAZylT6BEd5GmFrxpJ+duc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD510F80307;
	Mon, 19 Aug 2019 22:05:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EBAEF800BF; Mon, 19 Aug 2019 22:05:39 +0200 (CEST)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2DFF800BF
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 21:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2DFF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dDmrjwtj"
Received: by mail-wm1-x341.google.com with SMTP id k1so281743wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 12:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwOmrzIorIXU8gN1nXrGIATHUfw2aXf6c/ATluB8lJ0=;
 b=dDmrjwtj2ICv2BZnWbgOsIeHUkViXbEPJ3dc78gx8PF2Wk/yBpDD8Cy8PntqYm0st0
 hEK6osgfMIU3m2hrKAoqsdbTaDl/0Bub3BFHrR+TiLiQb3iuIRQ7MJP/3zdoxcLB9Wxl
 fRTtAwqSSCZTeYFyUgxvxH5VKHK7DFI9Z9CMr6tnT/DDQE60zQ4DWyVhQ+FgUEnFO/Xs
 vamvxejItuBWZU1++gsdJRRb9Gz4GBSuWOWLV6GrB669l+xCxDBpi7YE6ifPasSYk/fB
 NiUtTPF8zjr8pGAFMiDH8v1Q9Hcsocb/NjRsoodab8D72Wumn7NJ67PvZMO07DULzM49
 BP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwOmrzIorIXU8gN1nXrGIATHUfw2aXf6c/ATluB8lJ0=;
 b=L338ov2dcViJBXQXzM0FjLT+jD44GVAkZuS00N/thCP8VmRP8occPHRZfxZVVuhHVb
 5Xd+cwsOkRw1sKGA53h/ws8nEvHT1p+JNzWmSP3qtlf+VXX1QMUKuY6zNuZw1KWXGFFP
 GBC1qjgjbU0zVVOXQg0LVZG7Gv9/WXSXyrqDcF1bSjBXhP7vMwzbsHArTYDVdamMEOwu
 IzR1lFwfiVmR0f4eAm2F3+U6l29KSHXylLKBGAZ5CC2dCFdZDoCTS/P2tT1KmRQzw9Px
 9PWmucKegN8CIlFhIYKVAu0KHlGbIlGOgZtDWayWFPC1W57tjQCcsFxA1dFNL+hGxPLJ
 hOwg==
X-Gm-Message-State: APjAAAVzBhKUQhKvz5jr3aBQdtKEC4pjnGjlQ4ZMn+chP9J/6Zv6hrdS
 pvYwX8Zq2/XS+mygjsQNGwc0i7wnFuWhvPKuH+E=
X-Google-Smtp-Source: APXvYqz6TEd0zRl8rir6tQIYiVKYuRBqJjzNvSqolSP/89bP7gHMhEzwWaxQUD6XeYY5cB2xPaa9I77B0vbBZN98Ihs=
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr20383727wmc.87.1566243190180; 
 Mon, 19 Aug 2019 12:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190815154500.29090-1-pierre-louis.bossart@linux.intel.com>
 <20190815154500.29090-2-pierre-louis.bossart@linux.intel.com>
 <20190815164942.GB4841@sirena.co.uk>
 <CAEnQRZAM6VkCewfVYysz-NmPNEz-CSe763Cv-kz9kyNjx8uMtQ@mail.gmail.com>
 <20190819134616.GR5999@X250> <20190819192406.GC5563@sirena.co.uk>
In-Reply-To: <20190819192406.GC5563@sirena.co.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Aug 2019 22:32:58 +0300
Message-ID: <CAEnQRZC_YFZJFbbwey8pQcAfUbcKxKjC88i-Zz7sJEG7zbUXGw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Daniel Baluta <daniel.baluta@nxp.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Shawn Guo <shawnguo@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: SOF: Add OF DSP device support
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

On Mon, Aug 19, 2019 at 10:24 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Aug 19, 2019 at 03:46:17PM +0200, Shawn Guo wrote:
> > On Fri, Aug 16, 2019 at 11:43:13AM +0300, Daniel Baluta wrote:
>
> > > Binding documentation together with the actual dts nodes were sent
> > > to Shawn.
>
> > > https://lkml.org/lkml/2019/8/7/682
>
> > > Can you pick 4/5 and 5/5 patches from series above? 1-3 are sent to
> > > Mark to go through to alsa tree.
>
> > I just picked up DTS patch (4/5), but DT bindings should generally go
> > through driver/subsystem tree as preference.
>
> Right, especially so we get domain experts looking at things before they
> are merged.

Mark/Shawn,

So the binding documentation should go through Mark tree right? We
will update the
patchseries and Pierre will sent v2, if I understood it correctly.

Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
