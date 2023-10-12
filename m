Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771917C7186
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 17:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1644A836;
	Thu, 12 Oct 2023 17:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1644A836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697124686;
	bh=ZtcSIbjB2WpeZfQRyCvdpc+0MAvoSIsAVFQJFGWoAZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dLt8QYQMYNxqjNDFNtwoFBJsf9X0pAhBB2FtZtMKcrH7ygWQgtpYz75assc+aBbUO
	 FIzQ+oGzXqwBtVat1MYzyWNJVuv4gnZaj0NccJaMYWpOYtkhc1zJ95hkHWdr7H4Ure
	 YjVAQwkOG1YdBBj9xonMk7SSx6HDspxgGseXPrmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A3FEF8019B; Thu, 12 Oct 2023 17:30:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E7F3F8027B;
	Thu, 12 Oct 2023 17:30:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98D0EF802BE; Thu, 12 Oct 2023 17:30:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBD58F80130
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 17:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBD58F80130
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sNlqy8im
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AA24FB824CA;
	Thu, 12 Oct 2023 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F77C433C8;
	Thu, 12 Oct 2023 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697124617;
	bh=ZtcSIbjB2WpeZfQRyCvdpc+0MAvoSIsAVFQJFGWoAZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sNlqy8imXhwlW5ogqsGatXLJh6x3ULy2dxsaSxs56ggFVkTV6XlGelwtvmknbj7Xu
	 ShUCZ/8OXslZolbuuvyrBlxLrcJ01GSlmz7CSJEaxf3rAcgbPMbnfuFHufU09E90RW
	 5ApYEGyJHTTls7cFvAibnKaw6QYJ/MgybICMj+V6qAR0vsGzNnF3N6loiEvhXeakbo
	 Tc8RBxaMuLt9cw9IyN5cmf2yVbPk/7zrWOf/NIL+18Z146Hj24oQ+EZR236LNiKgxH
	 rW8s1EpB9lyTQA3S/nGP0hy8u95XFa9UJYnNgK7IXnZV4NIWHKMv5YsKgXN/Jehq6j
	 lkrAiKBqcY2gw==
Received: (nullmailer pid 821925 invoked by uid 1000);
	Thu, 12 Oct 2023 15:30:12 -0000
Date: Thu, 12 Oct 2023 10:30:12 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, davem@davemloft.net,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
 olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
 fabrice.gasnier@foss.st.com, andi.shyti@kernel.org, ulf.hansson@linaro.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 hugues.fruchet@foss.st.com, lee@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, arnd@kernel.org, richardcochran@gmail.com,
 Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-p
 .hy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
Message-ID: <20231012153012.GA698406-robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
 <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
Message-ID-Hash: 6DIC2PYQS3AAIFGN4A7L7QSWJ46XHYOD
X-Message-ID-Hash: 6DIC2PYQS3AAIFGN4A7L7QSWJ46XHYOD
X-MailFrom: rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6DIC2PYQS3AAIFGN4A7L7QSWJ46XHYOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 11, 2023 at 10:49:58AM +0200, Gatien CHEVALLIER wrote:
> Hi Rob,
> 
> On 10/10/23 20:42, Rob Herring wrote:
> > On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
> > > ETZPC is a firewall controller. Put all peripherals filtered by the
> > > ETZPC as ETZPC subnodes and reference ETZPC as an
> > > access-control-provider.
> > > 
> > > For more information on which peripheral is securable or supports MCU
> > > isolation, please read the STM32MP15 reference manual.
> > > 
> > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > ---
> > > 
> > > Changes in V6:
> > >      	- Renamed access-controller to access-controllers
> > >      	- Removal of access-control-provider property
> > > 
> > > Changes in V5:
> > >      	- Renamed feature-domain* to access-control*
> > > 
> > >   arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
> > >   arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
> > >   arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
> > >   3 files changed, 1450 insertions(+), 1377 deletions(-)
> > 
> > This is not reviewable. Change the indentation and any non-functional
> > change in one patch and then actual changes in another.
> 
> Ok, I'll make it easier to read.
> 
> > 
> > This is also an ABI break. Though I'm not sure it's avoidable. All the
> > devices below the ETZPC node won't probe on existing kernel. A
> > simple-bus fallback for ETZPC node should solve that.
> > 
> 
> I had one issue when trying with a simple-bus fallback that was the
> drivers were probing even though the access rights aren't correct.
> Hence the removal of the simple-bus compatible in the STM32MP25 patch.

But it worked before, right? So the difference is you have either added 
new devices which need setup or your firmware changed how devices are 
setup (or not setup). Certainly can't fix the latter case. You just need 
to be explicit about what you are doing to users.


> Even though a node is tagged with the OF_POPULATED flag when checking
> the access rights with the firewall controller, it seems that when
> simple-bus is probing, there's no check of this flag.

It shouldn't. Those flags are for creating the devices (or not) and 
removing only devices of_platform_populate() created.

> of_platform_populate() checks and sets the OF_POPULATED_BUS flag.
> Maybe that is my error and the firewall bus populate should set
> OF_POPULATED_BUS instead of OF_POPULATED. Is that correct?

Shrug. Off hand, I'd say probably not, but am not certain.

Rob
