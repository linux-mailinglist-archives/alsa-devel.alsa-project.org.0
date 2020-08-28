Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5548256164
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 21:36:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D3F818CD;
	Fri, 28 Aug 2020 21:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D3F818CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598643400;
	bh=IEmPHvkA+z1REpWVKJHMI5dNKpMjsW03J3jnXMWQsYw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2Xn15G38qafd4EP0iNrkQeKcXz6WkuvR6LtDTf7xiiqIwJv1HnmdU6qDBUcYXAPr
	 Gba3oSVf/3gx31MRyOFypRyvzLU8BISFxVTlEE6Ycj2pXQ2FfYvmsRaLko3DWOqL3s
	 ysv/D40JfLHIqKizvLffr1gQAHphSJGTtFlX0IIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79849F800EB;
	Fri, 28 Aug 2020 21:34:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7315BF8016F; Fri, 28 Aug 2020 21:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3226CF800EB
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 21:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3226CF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B1w7k7jy"
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AF5120897
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598643291;
 bh=IEmPHvkA+z1REpWVKJHMI5dNKpMjsW03J3jnXMWQsYw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B1w7k7jyCe/Sh8nqooN21BOrpD3VkGkS/o/36TjeTOG+cjKEC1BfqV7eV6l3RuHD4
 NVDiucsungSSFVFQlEJSNTGQ9p2G9VmjTdhIBDfeIxPTrT5nqYRDeQZxAu3DM07rli
 ZSnkpb4fKKTsetoRCAbiJ1SxMCfqBkiCyAtyVQwA=
Received: by mail-ot1-f53.google.com with SMTP id k20so221596otr.1
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:34:51 -0700 (PDT)
X-Gm-Message-State: AOAM532tDEnAIJhQPGqzSNAF74cyumDrwuM/zLWWFO8d6hStOKcAl0xn
 KmNQAgeRnDBdNzFt1uuoMSH0g5UJVG55i6bQLw==
X-Google-Smtp-Source: ABdhPJzFGvXTUcaXp0hQDnvMMeUZzu/QHSmYBpFoxJjtVwfzrSUAmFhmmQAknImQsGHdQwJmyaicaxzJNOLB2x3ccE0=
X-Received: by 2002:a9d:32e5:: with SMTP id u92mr136998otb.107.1598643290454; 
 Fri, 28 Aug 2020 12:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200826184851.3431531-1-robh@kernel.org>
 <20200826185328.GS4965@sirena.org.uk>
In-Reply-To: <20200826185328.GS4965@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Aug 2020 13:34:39 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+JCpQb=rDqxuhy-ZMDrnMiOKz1HSTta0supjvLVoEWMQ@mail.gmail.com>
Message-ID: <CAL_Jsq+JCpQb=rDqxuhy-ZMDrnMiOKz1HSTta0supjvLVoEWMQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Remove unused 'linux,hdmi-audio'
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Wed, Aug 26, 2020 at 12:54 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 26, 2020 at 12:48:49PM -0600, Rob Herring wrote:
> > The binding was added in 2013 and has had no driver since 2015.
>
> There is the hdmi-codec driver that covers such hardware and would be
> compatible with the binding.  Of course there are no current users so...

I didn't dig into how TI restructured things to not need the binding
anymore, but I'd assume the hdmi-codec is instantiated as part of some
hdmi bridge device rather than being some standalone thing.

Rob
