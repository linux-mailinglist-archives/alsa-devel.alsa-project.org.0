Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2435D15D33F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 08:56:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A061679;
	Fri, 14 Feb 2020 08:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A061679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581667004;
	bh=pUR7yZkFqwVpj2i4Ie447uHP1oj5FAd2uV+g638eG78=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKlsNToizLFhpz2eXdE3qRPhLxj3L7Z1GZg5ejPBuQ9hI9V10hJuwt0ZCXxeTsOdw
	 idaDhAQP4/fquDsZak0skI63BPfpBm2UvLQnUS/H6dKWKCthx98nViWUV+3aZcn6gW
	 UzThtnYZBYP1MHnpVWgUGASvU5YeKPRpPCSNFD1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C123F80234;
	Fri, 14 Feb 2020 08:54:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93E66F80228; Fri, 14 Feb 2020 08:54:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F278BF80158
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 08:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F278BF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nO8VWAnq"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C21F024673
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 07:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581666876;
 bh=uUqCY41ymz6hiHKzFlEzisjq83c9h686/Ry4dcKtL8o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nO8VWAnq6enkWoVO1KQOYen9dfbnv11SjtbXp+5e9AWrErsEw2EGJzm9oxQUQQj5b
 GTGWK9hnefBoQm7ycijq0ujxWXUHB2dkpOXCXZq69cSbfBPP9lVazagzVCiSWZnZRh
 JiDRfIdqXWtwoYtPWpK9YWF4OeGkaWHDqt9+6+t0=
Received: by mail-lj1-f178.google.com with SMTP id y6so9664777lji.0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 23:54:35 -0800 (PST)
X-Gm-Message-State: APjAAAXz7/dEbGFoBpH6NBfnqS5v51u/miRJoqCGI3qhVa5qR32MiHGs
 Kn226g7y25wa7LjIhlAbLQ5jBgeS27LZAZf4maw=
X-Google-Smtp-Source: APXvYqxYBogvyVwCKY0O00NON1CcUeROLB0hSLARDR8eSX50Ch0burvTbanjgmW65jT/Dd4xwcQQTYXH4O/btXWthPQ=
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr1196010lji.256.1581666873795; 
 Thu, 13 Feb 2020 23:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20200210061544.7600-1-yuehaibing@huawei.com>
 <9351a746-8823-ee26-70da-fd3127a02c91@linux.intel.com>
 <be093793-3514-840a-ff2f-4dc21d8ee7f1@huawei.com>
 <CAEnQRZDWFgXocRJxtc2e7McRCAtod6-GwPJaVMdb4ymBZgSD1w@mail.gmail.com>
 <CAJKOXPcxL2vpWGwO1OL9Vv0g6hzbW-AyGJNn=7Yq2iy10_cbhg@mail.gmail.com>
 <CAEnQRZBgpcLz29PG6pY_6xaULO6siGumqrsO0gRReMRwUOqW2w@mail.gmail.com>
In-Reply-To: <CAEnQRZBgpcLz29PG6pY_6xaULO6siGumqrsO0gRReMRwUOqW2w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 14 Feb 2020 08:54:21 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfv6-wALd6NcyQaWTXCv0SYpfM2W7hpZk8u9cZjcZC=VQ@mail.gmail.com>
Message-ID: <CAJKOXPfv6-wALd6NcyQaWTXCv0SYpfM2W7hpZk8u9cZjcZC=VQ@mail.gmail.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Yuehaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: SOF: imx8: Fix randbuild error
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

On Thu, 13 Feb 2020 at 22:12, Daniel Baluta <daniel.baluta@gmail.com> wrote:
> >
> > Visible symbols usually should not be selected. The same with symbols
> > with dependencies. The docs have this rule mentioned.
>
> You mean if module X depends on module Y, we shouldn't use select?
> But this exactly what this patch does :).

There are two different cases (hints against using select):
1. select A, if A is a user-visible (possible to select) option,
2. select only A if A depends on B (and B is kind of independent).

These cases are discouraged.

> The problem here is that when X depends on Y, and X=y and Y=m
> when we try to compile X if get an error because we cannot find a symbol from Y.
>
> I think if X depends on Y, and X is forced to "y" then also Y should
> be forced on "y".

If X is bool, then depends should be =y.
If X is tristate, then probably you need something like:
    depends (Y!=m || m)

There is also solution like:
config CEPH_FSCACHE
    depends on CEPH_FS=m && FSCACHE || CEPH_FS=y && FSCACHE=y
but it works if the upper-level option (CEPH_FS) is a tristate.

Best regards,
Krzysztof
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
