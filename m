Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20B21964B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 04:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D581E15E0;
	Thu,  9 Jul 2020 04:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D581E15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594261987;
	bh=X4Ooh2TepNDU2kUT7eH6cJMYnCAo6DGOXFEWrYUpDzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmphiYqdhoIH0QuiA/ZrqPE0ayIzuAevgT/ke+oZh6mpK/sTAkvKReUflJ+V7lqBR
	 Yi/MXNjK0eCJO3j5vTF8lyj7aIFrXAUyzvu1tP6NmtFdHlH+mcnRtN8DmalgZaUktm
	 wpnkSmjomvczZKoTuwiZa1HnzJpcbUVwK4ETTTRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AED2F80117;
	Thu,  9 Jul 2020 04:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCE1EF80216; Thu,  9 Jul 2020 04:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D65F800AE
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 04:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D65F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LHgaqoAT"
Received: by mail-il1-x141.google.com with SMTP id a6so715119ilq.13
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 19:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1aFB8ecB2wmH9T4OAlgM3uPIr3+7dTGswq2KZGud10=;
 b=LHgaqoATqobXsJ823bt6UbEz6EFOF6myqOpjQDAnwqhgXKl07w4nHw+JB03BZYlt2X
 BNH+dH0z6LmpBnHFCumuSMuAdzaEP7M5WsxWs3gQu7DQ7dgritCm3xWZ+CHEUxizjiLP
 WTPrkPBuUAeyMQ64PvdBWCyu2vQkgWzCqizQH0GOGKHXYvYJaNuKqcM1H8eMJwBOmZRF
 7abA8/E8d+8fydzTVcEVQ7JMm7doNMOrPww7G/vZcmpETvsROzdtGumcGiL1jGG5x2QH
 YlRQ0q/flSV88Gf7LJiNjzISn/9i6uirwLeNNQJGZuXCHNK41ap2wqMgSIyGoNq1RLMV
 bJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1aFB8ecB2wmH9T4OAlgM3uPIr3+7dTGswq2KZGud10=;
 b=J3VLo9a95ndgl72PHv+ROVRIXf9s2iybjNf3maop7SkfogCxTq1o2X+snfNzSo061K
 NRhwqfYxeeVJZQVanbMxQK7FnuM2pwChfysViNM4n0oMX/v2Jmt9bu35sgaLzhWpY+KU
 V/pPQ8ExnnReSs4AaoF4dIkPW3zjq3SV+UQ5fBXAiSpzob/bPH5shn0ZofoeobTA9z4r
 ic1h6+ZTtoew4bG8ds8NG+HekPTYitfWU5BjyyhHvv0aSLY3JofU8Zd6lfmEfSSaNwVS
 KrsfrvT2T0Y+jw2Iauf72lsbv6uuGQF59Y5TapHIiBHL1lf3fSLqkJO6wxXKifUVHcq1
 HgYA==
X-Gm-Message-State: AOAM532oshW+oDergy/+m7bgEfV6wfjgt/1vquUDummQ11gflQvC1/BW
 8+9XA/ME2HlYcpVu0CXwdRxKjrUdx8RaezqD3ViccQ==
X-Google-Smtp-Source: ABdhPJycmG2v/dMRqlo4y4LjYnpAsyQqnOVG2LTg3fO1f0wSLY2ig+oxacWew56SN7C4tQMpaHBJFn2jujQh0be0RaI=
X-Received: by 2002:a92:dd02:: with SMTP id n2mr44851812ilm.257.1594261875306; 
 Wed, 08 Jul 2020 19:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200708113233.3994206-1-tzungbi@google.com>
 <159422758800.28431.1053466753613230176.b4-ty@kernel.org>
In-Reply-To: <159422758800.28431.1053466753613230176.b4-ty@kernel.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 9 Jul 2020 10:31:04 +0800
Message-ID: <CA+Px+wXPoW-VU-SXSZoBdMY7zSxWf3qxWJZGOE2hT4riwT8XtA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for
 rt1015
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>,
 Rob Herring <robh+dt@kernel.org>
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

On Thu, Jul 9, 2020 at 1:00 AM Mark Brown <broonie@kernel.org> wrote:
>
> [1/3] ASoC: mediatek: mt8183: sort header inclusions in alphabetical
>       commit: 4dae01c2e5df7beb8dfd5deb9560e42f19d3cfb7
> [2/3] ASoC: mt8183: add compatible string for using rt1015
>       commit: ab1ba5252f611c0efabca5fca81f5717445da47b

I am curious about the 2nd patch's title.  Did you change it from
"dt-bindings" to "ASoC" intentionally?

I am trying to avoid using the wrong title prefix next time.
