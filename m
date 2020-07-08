Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A8921809D
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 09:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC5B15E5;
	Wed,  8 Jul 2020 09:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC5B15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594192620;
	bh=QQWIvI3n12sxZJM84qe1D1kbLSnuodSVm3lx9h7j1Kc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tAX3VqcHkldGEEYb6QJlOgYv9LFclZ8ijymNJ1MAWfDRNk649TKtPMolKEbeJSEi/
	 lRcVY3SV/Qf4KxyvoW5q3vNHfP/Fv5CeqiYhwbchiqcIDrzJunGctADmXhDOXhgbOx
	 t/2xgqKIfbQCB1DCliX33ooLSasOXXMNtg6oC+Vg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F0D4F8015D;
	Wed,  8 Jul 2020 09:14:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDDE7F8015C; Wed,  8 Jul 2020 09:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4662F8015C
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 09:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4662F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZUr5Nh3e"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9138920760;
 Wed,  8 Jul 2020 07:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594192472;
 bh=QQWIvI3n12sxZJM84qe1D1kbLSnuodSVm3lx9h7j1Kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZUr5Nh3emr2d2VtZ2uByDWFbDxUJImapQ+PSRi8vyafxckqk7hQOULPWzThpBrrGk
 HDt8tk064wrZO6HWaGga4Y8ZV/rdNmEzGad3ToB2zg2NrwpBfL62HmKHtrRsAQlmgM
 Txwt+Q/sDXNyOg6MVuMyhpoWVuA8yFMzYkuKVRX8=
Date: Wed, 8 Jul 2020 09:14:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] regmap: add missing dependency on SoundWire
Message-ID: <20200708071428.GA353107@kroah.com>
References: <20200707202628.113142-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707202628.113142-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 "open list:REGISTER MAP ABSTRACTION" <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
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

On Tue, Jul 07, 2020 at 03:26:28PM -0500, Pierre-Louis Bossart wrote:
> CONFIG_REGMAP is not selected when no other serial bus is supported.
> It's largely academic since CONFIG_I2C is usually selected e.g. by
> DRM, but still this can break randconfig so let's be explicit.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/base/regmap/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
> index 0fd6f97ee523..1d1d26b0d279 100644
> --- a/drivers/base/regmap/Kconfig
> +++ b/drivers/base/regmap/Kconfig
> @@ -4,7 +4,7 @@
>  # subsystems should select the appropriate symbols.
>  
>  config REGMAP
> -	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
> +	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SCCB || REGMAP_I3C)

Any reason you didn't add it to the end of the list instead of adding it
to the middle?

