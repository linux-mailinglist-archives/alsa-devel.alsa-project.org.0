Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F81BD72C
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 10:23:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3ED1688;
	Wed, 29 Apr 2020 10:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3ED1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588148618;
	bh=9YrQOHDbmJnPKKTvmQG5p/Lai5qrrvsqVUCdrarGgC0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=khQ6h0tbor5hQnQXNRaC4ArHiXLv2ns/as2YO7Vq+raIG6OzdCM3vKe6ToFnQHMV/
	 bGoqd8G1mfc1Pj1hbEKxIvZ5x2VfJdGsjAtfPEq2LgB/OSs4+opsHrP07b1EXyTYdV
	 cAweIgnTVqmf7wbGmJCknGjvz6xY0YYRhgZpzf4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 762B1F80232;
	Wed, 29 Apr 2020 10:21:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF932F8022B; Wed, 29 Apr 2020 10:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96907F800D2;
 Wed, 29 Apr 2020 10:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96907F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I9pcgC8T"
Received: by mail-wm1-x342.google.com with SMTP id h4so979210wmb.4;
 Wed, 29 Apr 2020 01:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YrQOHDbmJnPKKTvmQG5p/Lai5qrrvsqVUCdrarGgC0=;
 b=I9pcgC8TZZt5Kg0A7T7Sj2GX1f3NndD9VL3+SitseYmNYZCHbW4qyQbSaIhgJ2k8F9
 A4I/PYoz9MXS1mMf5mMtKKa8odnpWVMfBdSeYkjsmyccvPIjsyDG2KvoZckg84yWXCAT
 Y6BibMgeLOuRP5/QlCmQbtJbOwX2chmzcYD+0bKcOGgb2Jv2xrHxrCh8hYEH2YHJ6vF/
 6YBdsXb5KcdSrNCXK005EXZs+/4NDKa0kcEOmgHV35NNBcB18QblhsCRsehmWumsgBh4
 CE+724OEI0a1mlv9maOUA39PwHvLs1bBqHnYrym3q5oe0JXZlwl/nIpAO6g3UoDq/rNh
 SFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YrQOHDbmJnPKKTvmQG5p/Lai5qrrvsqVUCdrarGgC0=;
 b=QlPC0rUVKVRFb6+dO/Bft+iw1J8m44eMtlMSE9faGIckgjOHF8RGc8qM/wdIKuCQuC
 X6z0ozgYqWiB4RaG8K0lCNzUkeA5sj+ir2KDxgwxLzUi7oP3ZynJ9yjDeugGh91fBgki
 wltc8NGkkn0FoGfKAKGuIVTd+0rhVdy1QWKnNIdF4qtfyfhDBuvZ0llHSpmob3aSLRgT
 1F+hSU/7cnJH9ox0T2HDNHpdUP4989Rb9kHhrPE8QRKpZ93MPY4XBsu0NPCp0x1gHauf
 mTbfuApgl8YLkPJ/sYD20RBp8q/qFTedB+P8zX6ciO+GIaFPZ6VNiPI+JtvdYtb2mOsp
 b+Kw==
X-Gm-Message-State: AGi0PuZgh89VFBIusRpT3dT5vhbOt5ebHxrzxfoT8onH6eAEGmkOeuJp
 bdwAOSH+YXSu6PrRg06OAp4wtYYrzCwdWPCOZlc=
X-Google-Smtp-Source: APiQypKGkoXSNV8IrqXx0pbjTev2ByLg0A0Y8YCXnburHa1C62WyWY3/obBJqfCR72hvN1/GNuPReGW+qHxhMBIIIcs=
X-Received: by 2002:a1c:9948:: with SMTP id b69mr1828574wme.44.1588148507074; 
 Wed, 29 Apr 2020 01:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200428212752.2901778-1-arnd@arndb.de>
 <6b39fbba-c65d-2c02-14bf-11c2d00547af@linux.intel.com>
 <CAK8P3a24whg2RhJE3Vf5u3EWy+wvFqhXdp7EQZuQx0shPsMARw@mail.gmail.com>
 <f91c9a68-7641-beb8-a23e-bd1b9b8d0acb@linux.intel.com>
 <b784c008-7094-05cb-6200-6b246ff39bb8@linux.intel.com>
In-Reply-To: <b784c008-7094-05cb-6200-6b246ff39bb8@linux.intel.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 29 Apr 2020 11:21:35 +0300
Message-ID: <CAEnQRZCr0NAfx4UGcd3v6Cr5bZpUmQg5VCG9OA=aj=4uJX0qOg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: sort out Kconfig, again
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 sound-open-firmware@alsa-project.org
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

Hi Arnd, Pierre,

Thanks for looking at this.

> >>> Thanks Arnd, do you mind sharing your config?
> >>
> >> https://pastebin.com/HRX5xi3R
> >
> > will give it a try, thanks!
> >
> >>> We noticed last week that
> >>> there's a depend/select confusion might be simpler to fix, see
> >>> https://github.com/thesofproject/linux/pull/2047/commits
> >>>
> >>> If I look at the first line I see a IMX_DSP=n which looks exactly like
> >>> what we wanted to fix.
> >>
> >> Yes, I think that fix addresses the build warning as well, but looking
> >> more closely I don't think it's what you want: If you do this on
> >> a config that has the IMX_DSP disabled, it would appear to the
> >> user that you have enabled the drivers, but the actual code is still
> >> disabled.
> >
> > Are you sure? we added a select IMX_DSP, so not sure how it can be
> > disabled?
>
> I just tested Arnd's config with the patch we came up with for SOF
> (attached) and it makes the unmet dependency go away and builds fine.
> the problem is really using select IMX_DSP if it can be disabled by
> something else. My proposal looks simpler but I will agree it's not
> necessarily super elegant to move the dependency on IMX_BOX into SOF, so
> no sustained objection from me on Arnd's proposal.
>
> Daniel, this is your part of SOF, please chime in.

I would go in favor of Arnd's patch as it gets rid of exposing
IMX_MBOX into SOF.
The code will be fine even IMX_DSP=n, because the exported functions
used by SOF have dummy implementations in case IMX_DSP is not selected.

One concern is that we could end up in a case where IMX_DSP={y|m} but
IMX_MBOX=n.

Technically this is not possible because IMX_DSP depends on IMX_MBOX. So,
one cannot generate such a .config file from menuconfig interface.

You can add my:

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
