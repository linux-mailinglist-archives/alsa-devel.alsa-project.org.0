Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F3BAB1BE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 06:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC54165E;
	Fri,  6 Sep 2019 06:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC54165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567744871;
	bh=XjnC43zLnvxNRMs1qj2eHZBhtUWMoEDt1w+PYkBEQvs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVo58iB0dkP3JP6CbwMfCzlb4pBWYQ7mxR3YUMMUbtkm2h0SV9EzjciW8ZL+BKL5K
	 63Au+i/uXwAueb6hb+U/saMPnUDyuIP4ob8sCDpWmZqiOaHyENbtOYWvVS/+p6iHWh
	 tu+NF4TKKjvxmnhNm5Rmwz3zhjKzAgUBKUE0LY1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09EFFF803D0;
	Fri,  6 Sep 2019 06:39:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 126CAF80394; Fri,  6 Sep 2019 06:39:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE27F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 06:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE27F80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vwwGBNqT"
Received: from localhost (unknown [223.226.32.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A683C2075C;
 Fri,  6 Sep 2019 04:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567744753;
 bh=WnaNo7a02OqVu6NIqH9DB42Dvl60OZUq73g617FYboQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vwwGBNqTbLExFqJXqUY/XKpIX5FhpFyRq+X2og3jTsO61MUZJOaD0bAZbwYTR5l6t
 iXs41ACqEsQwB93ZGOfw3ZKL7rB+PkTHQMqF6Quwl6W72bhW9UWyyd6xBK014m4EUA
 3UNbC5rdlwVt1DxzyqbrAQxkgyDL43bANP9MzdnY=
Date: Fri, 6 Sep 2019 10:08:05 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190906043805.GE2672@vkoul-mobl>
References: <20190905203527.1478314-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905203527.1478314-1-arnd@arndb.de>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: Takashi Iwai <tiwai@suse.de>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: add back ACPI dependency
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

On 05-09-19, 22:35, Arnd Bergmann wrote:
> Soundwire gained a warning for randconfig builds without
> CONFIG_ACPI during the linux-5.3-rc cycle:
> 
> drivers/soundwire/slave.c:16:12: error: unused function 'sdw_slave_add' [-Werror,-Wunused-function]
> 
> Add the CONFIG_ACPI dependency at the top level now.

Did you run this yesterday or today. I have applied Srini's patches to
add DT support for Soundwire couple of days back so we should not see
this warning anymore

> Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/soundwire/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index f518273cfbe3..c73bfbaa2659 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -5,6 +5,7 @@
>  
>  menuconfig SOUNDWIRE
>  	tristate "SoundWire support"
> +	depends on ACPI
>  	help
>  	  SoundWire is a 2-Pin interface with data and clock line ratified
>  	  by the MIPI Alliance. SoundWire is used for transporting data
> -- 
> 2.20.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
