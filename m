Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98601D59FA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 05:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FB56166B;
	Mon, 14 Oct 2019 05:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FB56166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571023828;
	bh=V0Egbow9X1ICcTkqEos32sNn8utII7+8xT1L9eDfIII=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSrtALfxFn6nfHgr5o3hswv/Xiqyiv3AnohXDHfAzb5v/oaPeo/kjIfeEBJS5qXAf
	 ugUzJafNGNxXrihdnWSShgNbG/1cliXZBMzosVmNzhzWxuTMNdXUxb9+DuEdihNUZN
	 ZasNdEIH/KhULPUBAMafWsNlklzZOkXBERcTC+ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 915C6F80212;
	Mon, 14 Oct 2019 05:28:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E82CDF80362; Mon, 14 Oct 2019 05:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 755F0F80212
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 05:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 755F0F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="oS6pE20t"
Received: by mail-ua1-x941.google.com with SMTP id b14so4564570uap.6
 for <alsa-devel@alsa-project.org>; Sun, 13 Oct 2019 20:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+uAit0SREJNRiELJ4OKCvBPLbAJm2+Lw1+Tpx2de+40=;
 b=oS6pE20tIbgCYicTcvquerz8XaCIP8j31dhBnlwHxPfDSw5JY1HPPG/O5jzCnVaz3Y
 q8W0P/o8qlWbXq0bJ4Qzd/x7TrY7LTO+ddCYjsz6rxIU4O/CbhQgE3ETbqUj/1bDQKgr
 m0xzry5ha9ZFaCAwnkcC6hWfGHXNk9dldwGBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+uAit0SREJNRiELJ4OKCvBPLbAJm2+Lw1+Tpx2de+40=;
 b=J64L3X2H7XOQXO2MFVBA6eSulKFP+Xh7Kb/DcudPE8naZOUc5gTEh13r91ZxdQ+m6R
 MY3vBHBl1mFnJ7SAcUdhFDOwK7RBQfASuMCDqfuFVf9ngXevxAgQLeaCLdVud3Potcax
 UapC4K+o0blN2l9XS/Dol3WFcsL/fHZ2Lql89FqGROgokr4LDLj0FmhAwtFqx8B4P462
 gr9GrnO8QXUVYmkB8eYdz9pqM5uT9bskzpq2B5f1t0SdYXwPZ/0JPSAFvj6vE0/+j7rL
 no+ui/Rz26diGvX/Qzwt2uW4PaKOAHNIFGveSA8zbgD8UPmVDvDlUcaMGzA9wtlKes/x
 LNwA==
X-Gm-Message-State: APjAAAX9CteWBnOFF4yGRmyN/IYxewjsfVyyGr2hZlsBpnhMjki4gCzh
 HwIT+ZYrDUi+w9UUrgFu1TSBCw8NYjSfx7/2iM5spg==
X-Google-Smtp-Source: APXvYqyuob+/0KvYeM3s1jllOH4ovf5VWr38UfCbu8IYv4MP9Mr0n8q2DWApAP3bugtsf1sl54DYEAwORJrnq+qgk28=
X-Received: by 2002:ab0:2bcf:: with SMTP id s15mr15218344uar.55.1571023711060; 
 Sun, 13 Oct 2019 20:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <8f933cee57fc4420875e1e2ba14f1937@realtek.com>
 <20191008105138.GC4382@sirena.co.uk>
 <CAFv8NwJ+g+ESJJ5JxaLHADhBASKsjTE7pqY=HhcZZcT2Yy+Ygw@mail.gmail.com>
 <20191008110643.GD4382@sirena.co.uk>
 <CAFv8Nw+68LkmCmPnq5+rvf3Ffnh1kRROdjrx=nN8tgMTGEq+xQ@mail.gmail.com>
 <20191008123834.GI4382@sirena.co.uk>
In-Reply-To: <20191008123834.GI4382@sirena.co.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Mon, 14 Oct 2019 11:28:04 +0800
Message-ID: <CAFv8NwJEsxomhg_5yKQ4ajwbPvbCKseQYC_8_iqBosU4LZquVQ@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, SteveS.Lee@maximintegrated.com,
 George.Song@maximintegrated.com, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, jinho.ahn@maximintegrated.com,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 Dylan Reid <dgreid@chromium.org>, "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1011: export r0 and temperature
	config
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

On Tue, Oct 8, 2019 at 8:38 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 08, 2019 at 07:22:17PM +0800, Cheng-yi Chiang wrote:
>
> > The VPD is not part of the codec.
> > It is a binary blob in system firmware where we can store important
> > information per-device.
> > The calibration data is written to RO section of VPD in the factory
> > during calibration step.
>
> Ugh, this is not idiomatic for a DT system :(
>
> > The codec driver is not suitable of reading this information directly
> > because the string format written into VPD is customized per board.
> > For example on cml_rt1011_rt5682.c there are four R0 values for four
>
> The expected model for a DT system is that this stuff should just come
> in through DT properties, if for system design/manufacturing reasons it
> needs to be stored separately then you'd expect it to be merged into the
> main DT by the bootloader or something else earlier on in boot.
>
> > speakers, and one temperature values . So in this case, there are
> > totally 5 values in a VPD dsm_calib key. In VPD, the format is like
> > "dsm_calib"="0x00278F09 0x00251E1B 0x0021AFE6 0x0022720A 0x0000012E"
> > We put all the information into one string to allow arbitrary
> > calibration data needed for smart amp calibration in the future.
> > On other system using smart amp, there might be two speakers, with two
> > temperature values..etc. The format will be changed accordingly.
> > Number of temperature values depends on number of temperature sensor
> > available near the speakers.
> > Since machine driver knows the combination of speakers and the
> > available temperature sensor, we think that machine driver is the
> > better place to put this per-board logic.
>
> I'm not sure why they all need to be in one property?  That's a
> secondary problem though.
Hi Mark,
We did not consider this careful enough when we add this VPD field.
The reason we put them all in one field because we thought that
machine driver should have the knowledge to parse it.
Now that it seems there are various places to parse it:
- coreboot board file
- coreboot device driver
- kernel machine driver
- kernel vpd driver
- kernel codec driver
The parsing becomes a problem, let alone that coreboot does not have
some useful string functions to parse it.
To ease this effort we are going to separate them into different
fields, such that whichever driver wants the data, it can get it
easily with key matching.
Thanks for the suggestion!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
