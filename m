Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D12EB9B8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 07:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123611672;
	Wed,  6 Jan 2021 07:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123611672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609912861;
	bh=aovVTGHsEd7lpXJVZ9UJHQBManE8+HoTxC4a8R17IOA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c4gogd820TXpSXe0ku1mAjgbEfX1wxAnaVKNOn7B1LJbfIABa27jnOMUxAds3CE+Q
	 GzshQwQxmCdvroXjPN+dsQTpec8bWmbZ4bttIkpEBBan3zltVrHaQlrprnBJs65imi
	 cVee+QF10oaG6J51MTy46FZ1xm+ba5ajIg0YnZ50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E235F800FD;
	Wed,  6 Jan 2021 06:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0099FF80166; Wed,  6 Jan 2021 06:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28A65F800E3
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 06:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28A65F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lk96XD1U"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C3EE22C9F;
 Wed,  6 Jan 2021 05:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609912745;
 bh=aovVTGHsEd7lpXJVZ9UJHQBManE8+HoTxC4a8R17IOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lk96XD1UnD3J5cm6LohB5oiOdNiupt0I0ZH09obXQ6As9gwszNIRMM9Tfpq9TfkHy
 USJuXkhzct4kvsvqNfc8SKyDfR0Bz8t/FzcrleQhfnoo5MvxhaI/4RVxrOcRQrGUs4
 rwSv4nwWkd2FncsvdYYXVVfJanwV000Uv5nw2Zf+b/hGPLlKdAQulg/o9ku7oxdexJ
 0M9k0D+9jHy6lNkZJ8Q6Octcb9pHd5/SHLhNSlg1nOHR2jc2G9SXc3wTtyruvGJ3a9
 fNwovDud6iHJmgER3ICyx108/BcwEwTQfiduUHoWl1TJ58eICjD1HxUnNuUBPTMkA5
 hv0hO+OtRggQA==
Date: Wed, 6 Jan 2021 11:29:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org
Subject: Re: [PATCH v2 5/9] regmap: sdw: use _no_pm functions in
 regmap_read/write
Message-ID: <20210106055901.GL2771@vkoul-mobl>
References: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
 <20201209053459.5515-6-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201209053459.5515-6-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

HeY Mark,

On 09-12-20, 13:34, Bard Liao wrote:
> sdw_update_slave_status will be invoked when a codec is attached,
> and the codec driver will initialize the codec with regmap functions
> while the codec device is pm_runtime suspended.
> 
> regmap routines currently rely on regular SoundWire IO functions,
> which will call pm_runtime_get_sync()/put_autosuspend.
> 
> This causes a deadlock where the resume routine waits for an
> initialization complete signal that while the initialization complete
> can only be reached when the resume completes.
> 
> The only solution if we allow regmap functions to be used in resume
> operations as well as during codec initialization is to use _no_pm
> routines. The duty of making sure the bus is operational needs to be
> handled above the regmap level.

You okay these going thru sdw tree..?

> 
> Fixes: 7c22ce6e21840 ('regmap: Add SoundWire bus support')
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/base/regmap/regmap-sdw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/regmap/regmap-sdw.c b/drivers/base/regmap/regmap-sdw.c
> index c92d614b4943..4b8d2d010cab 100644
> --- a/drivers/base/regmap/regmap-sdw.c
> +++ b/drivers/base/regmap/regmap-sdw.c
> @@ -11,7 +11,7 @@ static int regmap_sdw_write(void *context, unsigned int reg, unsigned int val)
>  	struct device *dev = context;
>  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>  
> -	return sdw_write(slave, reg, val);
> +	return sdw_write_no_pm(slave, reg, val);
>  }
>  
>  static int regmap_sdw_read(void *context, unsigned int reg, unsigned int *val)
> @@ -20,7 +20,7 @@ static int regmap_sdw_read(void *context, unsigned int reg, unsigned int *val)
>  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>  	int read;
>  
> -	read = sdw_read(slave, reg);
> +	read = sdw_read_no_pm(slave, reg);
>  	if (read < 0)
>  		return read;
>  
> -- 
> 2.17.1

-- 
~Vinod
