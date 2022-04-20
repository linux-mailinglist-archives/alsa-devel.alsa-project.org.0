Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9B50B929
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCE817DC;
	Fri, 22 Apr 2022 15:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCE817DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635551;
	bh=+3+iUSZkc63MIfi9vurIZ9WsBYSqquT26xYWO1Anj0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHkmAQG+1mS7XCg0/hp9O6bs9DUNh3FMevZOKb3F6tfxrMVs9gWzB5V9Id96iuhL1
	 w2rqvbEXAeL8M+v6lkIaEBcAhoM98TzAMfl3L5zFikIj1XaljsEqntzZYW4D/AmFbI
	 JJfuFnIClp3pe+tctqlwdiBrUgN9xRvYHSehDIDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C515F8085D;
	Fri, 22 Apr 2022 15:32:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93B76F80125; Wed, 20 Apr 2022 16:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A9B2F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 16:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A9B2F800F8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64A5B61647;
 Wed, 20 Apr 2022 14:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FF4C385A0;
 Wed, 20 Apr 2022 14:46:58 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:46:56 +0200
From: Greg KH <greg@kroah.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 14/41] serial: 8250/omap1: include linux/soc/ti/omap1-soc.h
Message-ID: <YmAc4KTQbgJVT2GY@kroah.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-15-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-15-arnd@kernel.org>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 tony@atomide.com, Linus Walleij <linus.walleij@linaro.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
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

On Tue, Apr 19, 2022 at 03:36:56PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As a preparation for cleaning up the omap1 headers, start
> including linux/soc/ti/omap1-soc.h directly so we can
> keep calling cpu_is_omap1510().
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
