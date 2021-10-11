Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471042980E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 22:18:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E405C16CD;
	Mon, 11 Oct 2021 22:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E405C16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633983492;
	bh=nY4R0OZrHGo/gt+cirdAwOg/Ev0m534bKt+tpS4V174=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZ/yvI9nd+Pc+uWrJZ+nUpTVWqMjBZjLsJj0vY7DCQ+5SZs2CIfXZKgWWrKWpqw1I
	 qzEYUZv+CVobk7cYzS+kJNpOiyIXAMdzMh/9xGMVRg6b0AyKa4ucMb0ucPnL0rJs3b
	 psEd77nHjC8caFTARyC/kwGxAOslyAnzv0TrJjmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44087F8025B;
	Mon, 11 Oct 2021 22:16:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 530F1F80269; Mon, 11 Oct 2021 22:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8003F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 22:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8003F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="exgVyxRQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=TSceSFstAJbjHmDbs5vrAYSm5th2+WEa7Fev24Zvqj8=; b=exgVyxRQBnFIK7xTgvWhs3Hnss
 zBvrOsJ7wzVwGj3ryDqugEhU7QyvRrvyaceUm9KVlGFJE0c2VAT55SKE7tkTEAJmHOua1xAd0YnDA
 +qrbuVPMzhZ3vEXBFQ6IOk//kI7I5Rw3d9vedk1gknPto+WE3LB61PdfjMozxSqUjo4p58WS4ji/J
 XTkuaZpjWbA6GN770WshsLuXQ+oJxRVuxUD5opsg3lGN8gpcGLqXkpjcSh0nhwz7Mb8BTVlNiv6m3
 k7wwjkQUj2UB7Brp2uSj+G1Ta5OcyIqqWRPhzCcqRG+DoouBydTOC6ei43INCjP4bcE6zy+4Vhma/
 ZbEVWsoA==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma1ir-00AaCX-Ka; Mon, 11 Oct 2021 20:16:33 +0000
Subject: Re: [PATCH v2 1/8] ASoC: amd: Add common framework to support I2S on
 ACP SOC
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
 <20211011154452.76849-2-AjitKumar.Pandey@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8f025871-fe7b-6224-cb54-26dd6d3def11@infradead.org>
Date: Mon, 11 Oct 2021 13:16:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011154452.76849-2-AjitKumar.Pandey@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com
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

On 10/11/21 8:44 AM, Ajit Kumar Pandey wrote:
> We are using legacy way of exposing dais and DMA configuration that
> requires separate driver modules for various ACP SOC with almost
> similar hw configuration. Moreover the legacy approach requires
> separate I2S and DMA module platform devices registration and need
> machine specific quirk to control various I2S endpoints. Add generic
> dai driver and platform driver for I2S controller on ACP hw block.
> This common framework can be used by various ACP platform devices
> that shares common specs.
> 
> Signed-off-by: Ajit Kumar Pandey<AjitKumar.Pandey@amd.com>
> ---

> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> new file mode 100644
> index 000000000000..6b993074e2c4
> --- /dev/null
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +# This file is provided under a dual BSD/GPLv2 license. When using or
> +# redistributing this file, you may do so under either license.
> +#
> +# Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
> +#
> +
> +config SND_SOC_AMD_ACP_COMMON
> +	tristate "AMD Audio ACP Common support"
> +	select SND_AMD_ACP_CONFIG
> +	help
> +	  This option enables ACP support on AMD platform.
> +
> +config SND_SOC_AMD_ACP_I2S
> +	tristate
> +
> +config SND_SOC_AMD_ACP_PCM
> +	tristate

Hi,
I don't see anything that tells us what "ACP" is.
Please add that somewhere -- either in the Kconfig file or
at least in the commit description.

thanks.

-- 
~Randy
