Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF09D63A4
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 15:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877641654;
	Mon, 14 Oct 2019 15:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877641654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571059174;
	bh=Q/Vu+UirsIFatq4k9IKxElGutlnsmOH3bQul3FsINtg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oXKjY2Td7TLkewKIUStixPRM4yZEiezkCJAsPiVnovnXGiz3QQTs48aS19Xx6c5sF
	 9RuA3IJZqxk9hI6pK1yrjzJn1Cphggy1BeKdlvYbJyxH7RPpkqcBL1yC1w7tXdM5t5
	 AGwgiDdrcN5TaDwScPxOhL6NLW3UeGa/shMY5yEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA8CF80369;
	Mon, 14 Oct 2019 15:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4B26F80362; Mon, 14 Oct 2019 15:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F764F8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 15:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F764F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lmyZHsUc"
Received: by mail-wr1-x441.google.com with SMTP id p4so3829234wrm.8
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bNk6gqWx11OOhEP9GqPiQBYiSq/mKMHVb0ftn5rUsng=;
 b=lmyZHsUcdj2TAh2Ku7rl+sBqGSaKDTkWn8rYvnKY6lqqIsvOSW+PvmcdinS2G5QAix
 +My/z2in8mwhBB8eTT7x+n2GTQ7qibNqsrWBJvf8mT/+sSi9jO4FNa/oKtMGjSR44r4D
 kYrwqqLNJMVwfF0j/dLnCee4Oq3e+SS4RSDK8TJFUyqmhtoKJ00/qQPcD9L65sG5/Oh8
 l7EHaa6UcHP8ysuqkO4AMEMX10ec8fQYt7mNHcyuhZNjskQDVSug24kuJeZtj4FsGdwH
 Kvv/vC9dqvpf+c3sT7hd99YxZWM38YnTNOLW04oQRQ2q6DuDxXN3ceZqi/ZE1+/tLd1T
 scGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bNk6gqWx11OOhEP9GqPiQBYiSq/mKMHVb0ftn5rUsng=;
 b=NyZP9WrJt4FgIgai65MoIAyaQavQBNE+LW7vXIpvPw21HK2OSK2o1xr9uDUb6A4X9n
 6j0Q4UP7QvMQK/cQAHnwxE4KOsAbIw75gL3EILB4TeL0tL0M03kEwPEVkAvcJz11oaEt
 vUUGRbZXFOTkfZlmKAZEcRp46430cJnMAiuSuHa/T88oXvQ+9B3bgyzt1WCu8Nvknfhg
 Iv7Uz5FJWUivJmehhk4jnfK4to6KcpSNGwPNao7ekZX/mr+KfA4x/gDq8R4vEWKFytnp
 WmAjQsza3c8st5oD9GI/ilyPDelz7UtxADoJLs2M/kjc/k/RwywYl05Y+MTclDqVY4or
 bucw==
X-Gm-Message-State: APjAAAVfIJRwKCNIvkv943FuInyd/2+0sPO4exe3EBpKHkM7knt0KwjN
 4miJIA644SKq1w7AJEMMUF/5tYHPJ18c6KRZdvw=
X-Google-Smtp-Source: APXvYqxe2p4+Y3j5MCodZuoPV/55GLoK4DLo48VukFjuDothWxik42DQe7BCSwlbtr9vj2b6iR1WdDfFZkBDVIQROVk=
X-Received: by 2002:adf:a141:: with SMTP id r1mr26206376wrr.122.1571059063332; 
 Mon, 14 Oct 2019 06:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191013190014.32138-1-daniel.baluta@nxp.com>
 <20191013190014.32138-3-daniel.baluta@nxp.com>
 <20191014115635.GB4826@sirena.co.uk>
In-Reply-To: <20191014115635.GB4826@sirena.co.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 14 Oct 2019 16:17:31 +0300
Message-ID: <CAEnQRZDbXZUhix_aR_DCUzFn1NYz1Zh7MxW5uwnuycps9PNohw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Laclavere <jerome.laclavere@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Guido Roncarolo <guido.roncarolo@nxp.com>
Subject: Re: [alsa-devel] [RFC PATCH 2/2] ASoC: simple-card: Add
 documentation for force-dpcm property
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

On Mon, Oct 14, 2019 at 2:57 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sun, Oct 13, 2019 at 10:00:14PM +0300, Daniel Baluta wrote:
>
> > This property can be global in which case all links created will be DPCM
> > or present in certian dai-link subnode in which case only that specific
> > link is forced to be DPCM.
>
> > +- force-dpcm                         : Indicates dai-link is always DPCM.
>
> DPCM is an implementation detail of Linux (and one that we want to phase
> out going forwards too), we shouldn't be putting it in the DT bindings
> where it becomes an ABI.

Hi Mark,

I see your point. This is way I marked the patch series as RFC. I need to find
another way to reuse simple-card as machine driver for SOF.

thanks,
Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
