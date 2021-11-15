Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920C456099
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:35:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0589117E9;
	Thu, 18 Nov 2021 17:34:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0589117E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253336;
	bh=zO8rrj1Vi14Uipx7unEIoASJvIGIajWvOMxp9QEDdrg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RahtDg9mpCTWO1aM1TkBcw2tjWmdptdxYnzDxL5uINKkqBUXDECSAqf9o5w53LE+n
	 /JiyCoyELCN0MW6LLp3N9g6LW5r0kfEXsxoOLfYIwttyjZcRgn0ttnFhgMlnIzbhnu
	 DmGWt7SggoSWwRx0R85R7azYzmWbC9yNIBjIzfK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D17DF804EC;
	Thu, 18 Nov 2021 17:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CE3CF8027D; Mon, 15 Nov 2021 10:56:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7F58F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F58F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pS0ejTv+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30E7861BF8;
 Mon, 15 Nov 2021 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636970151;
 bh=zO8rrj1Vi14Uipx7unEIoASJvIGIajWvOMxp9QEDdrg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pS0ejTv+o5S0A78mbmJ7yuvuLRvB9d4xUmNuDZkoNE6OFFDakUf4rUvAzBprhdror
 c/bShp5CLYeQozZylztfdFxkqVWVq+5ygYNbn+4A0s2ze6/IhIUKtVg/V7FX57xSK9
 o+TBkdXts4C2lwVOyzZSJbu6XtvG/R75Me0SQNeR4Q87t1+Qhokvme1DEyAn+zBc7+
 nJMjetgrrqNxHehwqI7KLrMF3IzGgf4PNgOkpTsytZe7548iWlWgbHxmlfyaqoC8CS
 sUf/B2fdljsPIZbKzs7tinYeZ8/8ttY26uNUOwdT55UgKOo0wK/ocgfuCEg3N311BC
 phUkTUj1HGMig==
Message-ID: <b04bb9803d59d26e4f32adc9518d0ec1a9456273.camel@kernel.org>
Subject: Re: [PATCH 03/11] mmc: bcm2835: stop setting chan_config->slave_id
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Date: Mon, 15 Nov 2021 10:55:42 +0100
In-Reply-To: <20211115085403.360194-4-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-4-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

On Mon, 2021-11-15 at 09:53 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas

