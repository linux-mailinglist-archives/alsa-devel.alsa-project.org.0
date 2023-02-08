Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DF68F788
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 19:55:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B879E83B;
	Wed,  8 Feb 2023 19:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B879E83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675882540;
	bh=xTtM9WlSf7bwExmahb6XOjPHbEjpNPb+C9ZLErT3mV8=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uEKw0+nfEt4vaQo1znXIrqMfdhqX3Czmj8zITgGxMKLTgK2jXyQ+wA7z9sfK39sTo
	 zAhmIIdN5JYmv9nF33rgd+VuXNZkRWUY0mAlMBrWD9oG0OWryEmcXd1A04ozJMz5hh
	 mrfVOQeSfK2HMLLW11PoJfPMlgQ9Ac8u2OnoTbws=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EF04F8010B;
	Wed,  8 Feb 2023 19:54:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7999DF8012B; Wed,  8 Feb 2023 19:54:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B3ECF80017
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 19:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B3ECF80017
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kJN28Uve
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC2A617B8;
	Wed,  8 Feb 2023 18:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CB21C433D2;
	Wed,  8 Feb 2023 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675882473;
	bh=xTtM9WlSf7bwExmahb6XOjPHbEjpNPb+C9ZLErT3mV8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kJN28UveNEt23ZFALxkKRAduymcXqKXXhl5ZE6krYfbalb6HMbzHo9qeVzvcHI7Wm
	 H7S6jcL16vD7PqCbUM676t6Ujn2JFJPW6F8SYQEY0t+JColJ5tdmzL8HnmWP59Mv+N
	 h1XG21jruiC7Pqu0lZhIHvhdf8KfE3r2XiOfPuEIw7UtbGW+1gt8cYhRh3sZd6iQB0
	 OKQT0joBdQfoYqU3AXs0x+0ro+BNaKQvYiFcCdFS93pX8FTqdLs62iSLZQceti8ikH
	 8vqlPouh7hbFMq94LAL+5Wj+RTZZwiFzYMUZ+IE2R0duumYDsHSZLH3uCg57RDgxC5
	 5i80rfFHy/R9Q==
Date: Wed, 8 Feb 2023 19:08:33 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH v3 4/6] bus: stm32_sys_bus: add support for STM32MP15
 and STM32MP13 system bus
Message-ID: <20230208190833.532cd60c@jic23-huawei>
In-Reply-To: <d6c659d8-2e5c-cb60-d950-685c4ba319e2@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
	<20230127164040.1047583-5-gatien.chevallier@foss.st.com>
	<20230128161217.0e79436e@jic23-huawei>
	<d6c659d8-2e5c-cb60-d950-685c4ba319e2@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FDJJXAC3MMCNJJUN7J7GVFN7GO5JJH2F
X-Message-ID-Hash: FDJJXAC3MMCNJJUN7J7GVFN7GO5JJH2F
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com,
 vkoul@kernel.org, olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
 mchehab@kernel.org, fabrice.gasnier@foss.st.com, ulf.hansson@linaro.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDJJXAC3MMCNJJUN7J7GVFN7GO5JJH2F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 7 Feb 2023 15:12:23 +0100
Gatien CHEVALLIER <gatien.chevallier@foss.st.com> wrote:

> Hi Jonathan,
> 
> On 1/28/23 17:12, Jonathan Cameron wrote:
> > On Fri, 27 Jan 2023 17:40:38 +0100
> > Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:
> >   
> >> This driver is checking the access rights of the different
> >> peripherals connected to the system bus. If access is denied,
> >> the associated device tree node is skipped so the platform bus
> >> does not probe it.
> >>
> >> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> >> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>  
> > 
> > Hi Gatien,
> > 
> > A few comments inline,
> > 
> > Thanks,
> > 
> > Jonathan
> >   
> >> diff --git a/drivers/bus/stm32_sys_bus.c b/drivers/bus/stm32_sys_bus.c
> >> new file mode 100644
> >> index 000000000000..c12926466bae
> >> --- /dev/null
> >> +++ b/drivers/bus/stm32_sys_bus.c
> >> @@ -0,0 +1,168 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> >> + */
> >> +
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/device.h>
> >> +#include <linux/err.h>
> >> +#include <linux/io.h>
> >> +#include <linux/init.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_platform.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +/* ETZPC peripheral as firewall bus */
> >> +/* ETZPC registers */
> >> +#define ETZPC_DECPROT			0x10
> >> +
> >> +/* ETZPC miscellaneous */
> >> +#define ETZPC_PROT_MASK			GENMASK(1, 0)
> >> +#define ETZPC_PROT_A7NS			0x3
> >> +#define ETZPC_DECPROT_SHIFT		1  
> > 
> > This define makes the code harder to read.  What we care about is
> > the number of bits in the register divided by number of entries.
> > (which is 2) hence the shift by 1. See below for more on this.
> > 
> >   
> >> +
> >> +#define IDS_PER_DECPROT_REGS		16  
> >   
> >> +#define STM32MP15_ETZPC_ENTRIES		96
> >> +#define STM32MP13_ETZPC_ENTRIES		64  
> > 
> > These defines just make the code harder to check.
> > They aren't magic numbers, but rather just telling us how many
> > entries there are, so I would just put them in the structures directly.
> > Their use make it clear what they are without needing to give them a name.
> >   
> 
> Honestly, I'd rather read the hardware configuration registers to get 
> this information instead of differentiating MP13/15. Would you agree on 
> that?

Sure, if they are discoverable even better.


