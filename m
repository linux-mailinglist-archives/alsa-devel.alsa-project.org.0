Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1140C336F01
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 10:37:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A243F1825;
	Thu, 11 Mar 2021 10:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A243F1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615455473;
	bh=CPJ7Z92u4tB3WRFBfpndqD8CxYVAWhvBbb+3dU0HClA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfJnFRXsRYWTwm7HEo39SweIfM3k7gj1XGuQcALYeRi2UK/QS4j0ybCFuYyv1AKJe
	 BADn0AZ2HbsMVVHa5S0Hoh3HvanhRvEK+kEVI9ox0r3P1vDB3klS+0hv4SsCd/V2rT
	 fUhNL+FCX7RzZmrCdNaZCk8GY3/XJHMdAeu/4Iyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D39F80256;
	Thu, 11 Mar 2021 10:36:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B08B4F80227; Thu, 11 Mar 2021 10:36:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE864F8010D
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 10:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE864F8010D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BBF4AB8C;
 Thu, 11 Mar 2021 09:36:05 +0000 (UTC)
Date: Thu, 11 Mar 2021 10:36:03 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-core: fix DMI handling
Message-ID: <20210311103603.0bc952b6@endymion>
In-Reply-To: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
References: <20210310193928.108850-1-pierre-louis.bossart@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org, Jon Hunter <jonathanh@nvidia.com>
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

On Wed, 10 Mar 2021 13:39:27 -0600, Pierre-Louis Bossart wrote:
> When DMI information is not present, trying to assign the card long
> name results in the following warning.
> 
> WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
> 
> The initial solution suggested was to test if the card device is an
> ACPI one. This causes a regression visible to userspace on all Intel
> platforms, with UCM unable to load card profiles based on DMI
> information: the card devices are not necessarily ACPI ones, e.g. when
> the parent creates platform devices on Intel devices.
> 
> To fix this problem, this patch exports the existing dmi_available
> variable and tests it in the ASoC core.
> 
> Fixes: c014170408bc ("ASoC: soc-core: Prevent warning if no DMI table is present")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/firmware/dmi_scan.c | 1 +
>  sound/soc/soc-core.c        | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index d51ca0428bb8..f191a1f901ac 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -166,6 +166,7 @@ static int __init dmi_checksum(const u8 *buf, u8 len)
>  static const char *dmi_ident[DMI_STRING_MAX];
>  static LIST_HEAD(dmi_devices);
>  int dmi_available;
> +EXPORT_SYMBOL_GPL(dmi_available);
>  
>  /*
>   *	Save a DMI string
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 16ba54eb8164..c7e4600b2dd4 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1574,7 +1574,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
>  	if (card->long_name)
>  		return 0; /* long name already set by driver or from DMI */
>  
> -	if (!is_acpi_device_node(card->dev->fwnode))
> +	if (!dmi_available)
>  		return 0;
>  
>  	/* make up dmi long name as: vendor-product-version-board */

Fine with me.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
