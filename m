Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE5250B94C
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2551185C;
	Fri, 22 Apr 2022 15:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2551185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635855;
	bh=yPcgKn7+VM0lcH+ZbeTVmHNXEMBQkHRpFUGHrVbAfn4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQUZLbcCLaeyFivZVyZ7WnKgIo7US21qZOm0/N+3+nYVnfxNNnSfLbQ9+EHgZUqQM
	 X1eB58Hm82x998qauGI87ByDrBgqR44epjBMlm7LD7Ep2KGVMAThPGxVFlTrZa7MxS
	 j9H1xnWHoyfO30fDSAD1us1oDN+11S3Bn5CaXbzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE25F80C7F;
	Fri, 22 Apr 2022 15:32:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 930DAF80245; Fri, 22 Apr 2022 07:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40A23F80134
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 07:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A23F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DGjFcWT+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B71761D77;
 Fri, 22 Apr 2022 05:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39416C385A4;
 Fri, 22 Apr 2022 05:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650606942;
 bh=yPcgKn7+VM0lcH+ZbeTVmHNXEMBQkHRpFUGHrVbAfn4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DGjFcWT+dCRf+1Ea0UMpZB3BVhFT/mpAUOufRi+F5d42Ebw210evImcesBdkmAE2y
 CojO/L6OwQvvebeoVE6qvReZ7g9PFW9JuEYpetmtjtso83DunufiLr8qgO9O0+FFpn
 GVMccx8ynEYfHuCvjETmo3HW7xzHr3OoSppx9O2wdR3ZEn7HcEdKmSQap5o8e+7dTD
 jgWGncxQTYOOsaLGuI90Mu9fT+ymfCNsIJoAsUtWTNfNAgWP+0rLmO96CJ3OGjOTNi
 cMc2mOyUFIDdlFfXV8S9TmUlpmywWyXsJfWmlDXPjEEw4JKcA8ShoftvG9yEz9x4qA
 iPnvfq7oG+4Qw==
Date: Fri, 22 Apr 2022 11:25:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 20/41] dma: omap: hide legacy interface
Message-ID: <YmJDWYcBN5+MWe91@matsya>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-21-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-21-arnd@kernel.org>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
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
 Kevin Hilman <khilman@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On 19-04-22, 15:37, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The legacy interface for omap-dma is only used on OMAP1, and the
> same is true for the non-DT case. Make both of these conditional on
> CONFIG_ARCH_OMAP1 being set to simplify the dependency.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
