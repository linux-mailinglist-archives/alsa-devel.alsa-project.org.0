Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6CD328672
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 18:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B048F1687;
	Mon,  1 Mar 2021 18:10:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B048F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614618686;
	bh=9Ha4Du/dgRRbdlKl/xS4CkQS5tqUNk0ysr4V+o1C2eY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTu/7L2nJZv5LcgKNEW08W+5fbr9vAHCg1WoUhFphTb7lwx2jSaxe2Q/924GBjfnh
	 6+ZZB25GbpVTSVtt6RzbMz5WgWdVv8eeA9pUmOMdCL90YNReIkc3IZ65KfeyGYdN0Y
	 ntBnoz+tZHM6YDiruQtF1actL3uZg1E70gf+m/RE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D804F8010B;
	Mon,  1 Mar 2021 18:09:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2C6BF8010B; Mon,  1 Mar 2021 18:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B2E2F8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 18:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B2E2F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="MlIKc0va"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=tdr23ctYIjaSovyzCrlydLo8hJiZD6TcVuVzx8JMj0k=; b=MlIKc0va3pxSmyS1RSEDvO35fD
 bQ8phkHe4gntkak3qfJfjxhYLX3d7PnQzdoCJG4iQHt549TayZ9h/g13m/zbR0/P/3rtWTK+BajOb
 eWFx+NDDAjNdXxX4zKwkMk4FKLttPqzCNxcmDRTJwqpLeI6a186Aey4B10FyGmSHZGerP68k5EPQy
 C1G8dAulciA1MMsrQ01pt9rrDsNZs/3SqmHuPiP2+dULEy6ag7i2BJE1mI4GWb3MJ+2N3Ot2IU4we
 xDIhs133VVhaYCoOXRrul43eeFiHsh08SXZw9QRYqMiruV5qo0DgCxnD+hx8gfJtfUmQLefmuWzUJ
 Y3Rmj/zQ==;
Received: from [2601:1c0:6280:3f0::3ba4]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGm2y-0006Ie-At; Mon, 01 Mar 2021 17:09:28 +0000
Subject: Re: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 pierre-louis.bossart@linux.intel.com, oder_chiou@realtek.com,
 perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com, mgross@linux.intel.com,
 Mario.Limonciello@dell.com
References: <20210301093753.16300-1-Perry_Yuan@Dell.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6123db00-8a4e-ff1e-d4be-c3fa2558d379@infradead.org>
Date: Mon, 1 Mar 2021 09:09:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301093753.16300-1-Perry_Yuan@Dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On 3/1/21 1:37 AM, Perry Yuan wrote:
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 91e6176cdfbd..e20f79389a39 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -491,6 +491,23 @@ config DELL_WMI_LED
>  	  This adds support for the Latitude 2100 and similar
>  	  notebooks that have an external LED.
>  
> +config DELL_PRIVACY
> +	tristate "Dell Hardware Privacy Support"
> +	depends on ACPI
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on DELL_LAPTOP
> +	depends on LEDS_TRIGGER_AUDIO
> +	select DELL_WMI
> +	  help

The "help" keyword should be indented only with one tab. Drop the 
2 additional spaces for it.

> +	  This driver provides support for the "Dell Hardware Privacy" feature
> +	  of Dell laptops.
> +	  Support for a micmute and camera mute privacy will be provided as
> +	  hardware button Ctrl+F4 and Ctrl+F9 hotkey.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dell_privacy.


-- 
~Randy

