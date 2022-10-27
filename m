Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D49C60FA86
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 16:37:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD0822F2A;
	Thu, 27 Oct 2022 16:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD0822F2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666881456;
	bh=YX3+dAZyM+hPoq4NUY7Nf//cJ/p1JRqJiGGTie6F7GI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CafbbxPjxt1esTI7Hk4gbdCnVhgfQ86YUs+9HWwVadXtbrHNiVWST1S59tii1FkAA
	 kQV9LKk6GYs5rBFNsS44f6GiKN01pLXLUb6/gurqAyyy+qrKEr6kAIJ7gWkJjVnXa7
	 J2BQkjVp2KkPGGlx7QyxNZQWqYSPmcr5FMRNiWG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19013F80496;
	Thu, 27 Oct 2022 16:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10044F80095; Thu, 27 Oct 2022 16:36:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB765F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 16:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB765F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="OpxeoDGD"
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9232166028E8;
 Thu, 27 Oct 2022 15:36:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666881393;
 bh=YX3+dAZyM+hPoq4NUY7Nf//cJ/p1JRqJiGGTie6F7GI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OpxeoDGDZGKCCzDEz8rBV+Oi97nVmRZA8hazKDB2IPC4iFaSvMu7s8ZaM7Jk8OD1N
 dRorTKNdfoiJNBTTFffh3b6ey51VoOyU+r5qO/8xwlUOfqfsBOTghOSOvHRx6W0mAh
 cqXI5xjC5tuDkv85nExx5COO0c9FMtEa7/bab54vSlFwXlzv6NF832RvFLfnymtiuP
 diXs+sWLXuCT8ee4fAAdHdLRIvjHbfH+qZDx4QVJzbLkDi3Cf+i4o3x5uGAYCpxq9U
 sWgMH/AAgGLl71lJkJaFOmr/zAEcr00DH7uxuNaeklkhMyU5PEr0P/H3X5baleAjLl
 ky0sWIhlmuJwg==
Date: Thu, 27 Oct 2022 10:36:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: realtek, rt5682s: Add AVDD and
 MICVDD supplies
Message-ID: <20221027143627.nbbketezqunkclxh@notapiano>
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-3-nfraprado@collabora.com>
 <CAGXv+5HJo5x2ieOegmv5vkfh+rTevdR_fri-7PeK+Gd+GXVjNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HJo5x2ieOegmv5vkfh+rTevdR_fri-7PeK+Gd+GXVjNw@mail.gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Tue, Oct 25, 2022 at 01:12:49PM -0700, Chen-Yu Tsai wrote:
> On Mon, Oct 24, 2022 at 3:01 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > The rt5682s codec can have two supplies: AVDD and MICVDD. They are
> 
> The actual chip also has LDO1_IN (for digital core and charge pump)
> and DBVDD (for I/O). However in the Chromebook designs these two
> and AVDD are all provided from the same power rail, through separate
> filter banks.

What about rt5682 (no s), does that chip also have these same supplies?

Also, since you already gave the purpose of these other supplies, could you also
tell the purpose of AVDD, MICVDD and (for rt5682) VBAT? That way I could add
some description for them in the binding.

Thanks,
Nícolas

> 
> Neither does the datasheet specify the ordering of AVDD, DBVDD, and
> LDO1_IN for power sequencing, just that three should be toggled together.
> 
> Should we model these? Or wait until some design actually splits these?
[..]
