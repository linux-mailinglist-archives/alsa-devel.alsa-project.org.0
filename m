Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAAC49B3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 10:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03F0167F;
	Wed,  2 Oct 2019 10:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03F0167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570005557;
	bh=/dpRJilCq8LDhWLvlevlvugRNHE7+TuDWGX9lTI9tDk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olv37y++ApShX3ECjW51TPpyv52AIyjPmcr5AW7Lq9kqTPBEq9jTkgXPpKJd6Jzni
	 83Wq8+zRjEHZ7PoxuAhvb+wakoV1t/6QR6ljhsBGeR80ug5eJ+f5GHHZpyaXco1KuE
	 +MxtDMAEAk3fly5y/RRNC2/o48ndzbE6rJTwFFHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F8F1F804CB;
	Wed,  2 Oct 2019 10:36:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 374E8F80528; Wed,  2 Oct 2019 10:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9565F8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 10:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9565F8036E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H/cyj4XQ"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 737A1206C0;
 Wed,  2 Oct 2019 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570005409;
 bh=Fz3G6JDNACXQd2RhNujXk869SixEzsjL+NkZV4Cq0F8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H/cyj4XQuDZuUnYggEFCdOaT7QbbspwnS2Z+e4L/x6JPny9+x8KuJ/grHK9Tcn3UG
 uZ24/Ko13j82XZps2OqX7mJDgI6Q8bz6dllZ73XqRfTJWv899MzPCAJPs5Bp7oTX6s
 RVq3R17S8RhweG9EeeoVQrCLW6iZmAJivn5SeHWE=
Date: Wed, 2 Oct 2019 10:36:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Suchanek <msuchanek@suse.de>
Message-ID: <20191002083646.GB1687317@kroah.com>
References: <20191002081717.GA4015@kitsune.suse.cz>
 <91e2fc425e0dea92d7f131da890e52af273de36c.1570005196.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91e2fc425e0dea92d7f131da890e52af273de36c.1570005196.git.msuchanek@suse.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 2/2] soundwire: depend on ACPI || OF
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

On Wed, Oct 02, 2019 at 10:33:30AM +0200, Michal Suchanek wrote:
> Now devicetree is supposrted for probing sondwire as well.
> 
> Fixes: a2e484585ad3 ("soundwire: core: add device tree support for slave devices")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  drivers/soundwire/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index c73bfbaa2659..c8c80df090d1 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -5,7 +5,7 @@
>  
>  menuconfig SOUNDWIRE
>  	tristate "SoundWire support"
> -	depends on ACPI
> +	depends on ACPI || OF
>  	help
>  	  SoundWire is a 2-Pin interface with data and clock line ratified
>  	  by the MIPI Alliance. SoundWire is used for transporting data
> -- 
> 2.23.0
> 


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
