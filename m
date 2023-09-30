Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 668D47B3FC0
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 11:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43193DF3;
	Sat, 30 Sep 2023 11:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43193DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696066794;
	bh=IvpiOG/bGE3T67kaLiqC3a217xhno8NefOjxFtDtAkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NeznFsnq2EWcP/ATmls6uehWLiRocxe94YfKa5eZx2fC2G3V9+uvaNP6M5Giwav5U
	 rNWGgUT4qT1j/DwwkM/jGHuRxRT9VL2CuZAi4GuLKOn6kSuP3BAm+t3ruAFyEGquvu
	 b3i/i5iWq4C46HwroTtze3OVe27a76RYmqYAD1B8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3310F801D5; Sat, 30 Sep 2023 11:39:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 223F2F8016A;
	Sat, 30 Sep 2023 11:39:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B831EF801D5; Sat, 30 Sep 2023 11:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3471F8007C
	for <alsa-devel@alsa-project.org>; Sat, 30 Sep 2023 11:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3471F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=WaJVTLBe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 22AB0B80185;
	Sat, 30 Sep 2023 09:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27E9C433C7;
	Sat, 30 Sep 2023 09:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696066728;
	bh=IvpiOG/bGE3T67kaLiqC3a217xhno8NefOjxFtDtAkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaJVTLBeni9ABYwJGH6p5NdtU/RU11lfOkq4o8gQbfieAj6Xnu0oPttIzCz/pyfLD
	 zfTdBg1nNBQgV/qTj+JiGRQfkYtvcqEH6wKhSQRy3qHNAswsL8/wJRZIiqy/KwH3qN
	 XJnhdlMtd5WJtvr9+PF0pxAhe4SXcD3e669r7MFw=
Date: Sat, 30 Sep 2023 11:38:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.com,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>, llvm@lists.linux.dev,
	alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] device property: Replace custom implementation of
 COUNT_ARGS()
Message-ID: <2023093029-balmy-shrewdly-3e3d@gregkh>
References: <20230920153819.2069869-1-andriy.shevchenko@linux.intel.com>
 <CAKwvOd=7vk2HKOpgVrRd2RtKSF9tXPqbVmN+5teLTNoBy4BWVg@mail.gmail.com>
 <CAKwvOdkbcUh+tmsNcT4nCzFY37WbAUdjHJ62qNe=p8SetaQNTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAKwvOdkbcUh+tmsNcT4nCzFY37WbAUdjHJ62qNe=p8SetaQNTQ@mail.gmail.com>
Message-ID-Hash: TGIJCEU5SOBZLT6DVJW3VEXWWETC2SXL
X-Message-ID-Hash: TGIJCEU5SOBZLT6DVJW3VEXWWETC2SXL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGIJCEU5SOBZLT6DVJW3VEXWWETC2SXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 29, 2023 at 09:10:11AM -0700, Nick Desaulniers wrote:
> On Wed, Sep 20, 2023 at 9:50 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Sep 20, 2023 at 8:38 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Replace custom and non-portable implementation of COUNT_ARGS().
> > >
> > > Fixes: e64b674bc9d7 ("software node: implement reference properties")
> > > Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Closes: https://lore.kernel.org/r/ZQoILN6QCjzosCOs@google.com
> >
> > Thanks for the patch!
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1935
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
> > Of course Linux would have a macro for this!  I should have known.
> > Trying to wrap my head around it. Awesome
> 
> (resending as text/plain)
> 
> Can someone pick this up for linux-next?
> 
> CI for linux-next has been red for days over this.

Will do, give me a chance to catch up...

greg k-h
