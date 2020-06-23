Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC6204C38
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 10:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB63173D;
	Tue, 23 Jun 2020 10:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB63173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592900538;
	bh=N6xBdgfy9cybA35PYpnxYo3cgCwij+m9MQXhOo5E9Mc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nDcj275sJhy+gZLb8ufon6c6Nk4TJIenE16P39dYeqlTZR2JzTedia7nZY7PO9CQH
	 hL7FNPk9a135w6rW6/xqN4j4NFHJcqm8gAo04elBo77i7R7+kILRKbuuLLOEai9f2q
	 d2yVnOnOaQ4yKq3kDPREjvDSbZW3UIi/+hq97lA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F07B5F80234;
	Tue, 23 Jun 2020 10:20:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F149EF8023E; Tue, 23 Jun 2020 10:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96F81F8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 10:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F81F8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="jQAMEx/R"
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 05N8JmtT018698
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 17:19:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05N8JmtT018698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1592900388;
 bh=2OjMFHqm51sb9jiQQ2/IvsQGVydM45w2tk+5HJLOKG8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jQAMEx/RAWsgGUFmwgqMwePX2jVmJR/GQ95yuPh0+2Kgbc+7RxuXzqP6AtVWbOaaD
 IMBv0nvDRAs/pUFl3lpc2nwiPX5k95RcxByUNdIwoGVElhwiEJj0JlfOgUBwb4aVa0
 5x34tA0O6EY8eaxwW8BbxSN34hh0m4IjOEYXJWD6q7njwpE2Ry4GCT8J1YwdeTyhIc
 EJ06EGYhWP1Ha5zl+1Bs66PziNiXgq5JE1pr6KbT617yxpz46yT6lhKSGHUbM2LZqV
 AJlenIYzOLbBdqQneXCJYZtdC1vA4Re8tsD5wuls63EMZkYEUaQOkicfXovgrGN/lE
 WwFrD+dyDZsSQ==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id j13so11231290vsn.3
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 01:19:48 -0700 (PDT)
X-Gm-Message-State: AOAM5308on+rkZatT8c9szt492AmhJxOkm3ZYd5Gc28+4QxZHmfkwNI8
 pXOKQtePBuVhNFnmd3CbVioFkcWWYkP3mJN7x5M=
X-Google-Smtp-Source: ABdhPJzw1xkC0RbI+3+8HkPVPBdIKzXE+InrN5h820fsqRCVLZTNnAh2QWLPvuc+9cYaOIGfNhQpEbOvMbALRDnECCU=
X-Received: by 2002:a67:22c7:: with SMTP id
 i190mr19292230vsi.179.1592900387462; 
 Tue, 23 Jun 2020 01:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200622120039.453616-1-yamada.masahiro@socionext.com>
In-Reply-To: <20200622120039.453616-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 23 Jun 2020 17:19:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCCejeFObzvUjzVVp_qXYH59gbxJZx+VQpvO3-196LKQ@mail.gmail.com>
Message-ID: <CAK7LNARCCejeFObzvUjzVVp_qXYH59gbxJZx+VQpvO3-196LKQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ASoC: Convert UniPhier AIO audio system to
 json-schema
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: - <alsa-devel@alsa-project.org>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Jun 22, 2020 at 9:02 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Convert the UniPhier AIO audio system binding to DT schema format.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


'additionalProperties: false' is emitting a warning.

I will add patternProperties
to take care of sub-nodes.

I will submit v2.


-- 
Best Regards
Masahiro Yamada
