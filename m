Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A59816CB0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 22:54:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D647917CE;
	Tue,  7 May 2019 22:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D647917CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557262455;
	bh=y2Kv9FXFwBt+tfaYDCUHaoZM7uutUKNt86rPMD1iqyU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dVAM1xCVz9YlKujpXZ5MITXIAAjtbVexh03tgakb4GbWf44GB9EzCaovmmPZ4dLoK
	 1kKvAeOlWalZJ2KvoJi/y5fDhp4yHzTQVSVE9uRAN5zmiul0Dslwy2KHSW/9XxAmcM
	 tzclojtQ+s769Nsv1q31bc9mlgXp6+tXGDXO/9Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A965DF89682;
	Tue,  7 May 2019 22:52:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC033F89674; Tue,  7 May 2019 22:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CDEFF807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 22:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CDEFF807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ObNA76ck"
Received: by mail-lj1-x241.google.com with SMTP id q10so15578278ljc.6
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EkppjOqhFwW6IRTX5rEpsYgsXGymadylJWUfpsr+6AM=;
 b=ObNA76ck17W0C/AvaqLIKllbti1LD+xrLEE8uISEBPm+2LlbZ62NSxnnliMJIq4wIt
 1CNd6IPwYs2vBcuyfbfjvD2vx9uq0bWicBEZ9szMQkbJzpmoWpODAW0od4E0GIekRAG2
 SrXBzXRgMBJ3btVJw9Nf25NkPofpU/n5jcuxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EkppjOqhFwW6IRTX5rEpsYgsXGymadylJWUfpsr+6AM=;
 b=QNOcoJrtoHz6bXfGuwRFkz4c9nSTzPoUKhyFkGWco9hXTJfcM1YxJh1EGG605OFJNK
 WJ3983j8lES265jm8JiZVMsUBVe50aHjNk2oaNWrDT0ls2UwrdegNWQh2bzPRoT0VY2E
 PPJPOsudGmdQ9SYp4ekokZDf5T4foBBthdPvGnRzOhksEcZ5ssCATeJpnPcpIrY4QW6/
 tARwr/2/6lShFXBsOUfJJzpaKVDK3sMs9mGQAwQ/9grBFPmGBUGRyzC0GovOMwJMrsGp
 U8iNQPHIQMDq8e7q9tJQ3yue7z24BkX+6z1NXbfdv6pCuGWhpQZsa/gu0QrAYRyU++4U
 njcw==
X-Gm-Message-State: APjAAAUDQSv9JhQ/hySQUgp6gHE9pIvUpvdReKWDHwL/yojOsn0ECLDr
 lJozr9JC0LcrsXEWEKt3U/i7ocDefws=
X-Google-Smtp-Source: APXvYqxObxDE4jqH0rHL7g5S+I/MRtDf0D/EDOr66IqPEV7ixEQJmLSUgMdOYmlEKBuNXwNvOmgNLg==
X-Received: by 2002:a2e:81d0:: with SMTP id s16mr18498228ljg.145.1557262343549; 
 Tue, 07 May 2019 13:52:23 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id a14sm2812210lfg.53.2019.05.07.13.52.22
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 13:52:22 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id k18so12838992lfj.13
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 13:52:22 -0700 (PDT)
X-Received: by 2002:a19:1dc3:: with SMTP id
 d186mr17099579lfd.101.1557262341496; 
 Tue, 07 May 2019 13:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190506225321.74100-1-evgreen@chromium.org>
 <20190506225321.74100-2-evgreen@chromium.org>
 <74e8cfcd-b99f-7f66-48ce-44d60eb2bbca@linux.intel.com>
 <64FD1F8348A3A14CA3CB4D4C9EB1D15F30A7C756@BGSMSX107.gar.corp.intel.com>
 <5c42b741-5e5c-ce00-8321-59df1df115f1@linux.intel.com>
In-Reply-To: <5c42b741-5e5c-ce00-8321-59df1df115f1@linux.intel.com>
From: Evan Green <evgreen@chromium.org>
Date: Tue, 7 May 2019 13:51:44 -0700
X-Gmail-Original-Message-ID: <CAE=gft5TeW1h3GAT9Gkwdf8eE_p5aoywveE2ddXgYQ+fET8Sdg@mail.gmail.com>
Message-ID: <CAE=gft5TeW1h3GAT9Gkwdf8eE_p5aoywveE2ddXgYQ+fET8Sdg@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Rajat Jain <rajatja@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, "M,
 Naveen" <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID
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

On Tue, May 7, 2019 at 1:26 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> > On 5/6/19 5:53 PM, Evan Green wrote:
> >>> Add support for Intel Comet Lake platforms by adding a new Kconfig for
> >>> CometLake and the appropriate PCI ID.
> >
> >> This is odd. I checked internally a few weeks back and the CML PCI ID was 9dc8, same as WHL and CNL, so we did not add a PCI ID on purpose. To the best of my knowledge SOF probes fine on CML and the known issues can be found on the SOF github [1].
> >
> > The PCI ID change is seen on later production Si versions. The PCI ID is 02c8.
>
> As I suspected, we are talking about different skews and generations of
> the chipset and a board-level change, not silicon change.
>
> The CNL PCH-LP PCI ID is 0x9DC8, the CNL PCH-H PCI ID is 0xA348 (used
> for CoffeeLake). Both are supported by SOF.
>
> What we are missing are the PCI IDs for CML PCH-LP (0x02C8) and CML
> PCH-H (0x06C8).
>
> Can we respin this patchset to add support for those last two instead of
> just the -LP case?

Sure. So just to clarify, you want the entry for 0x02c8, and you want
an additional entry for 0x06c8 under the same config. Will do.

>
> I'll send a patch to add those IDs for the HDaudio legacy driver for
> consistency.

Actually I've got that change ready to go too, I'm happy to send that out.

>
> Thanks!
> -Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
