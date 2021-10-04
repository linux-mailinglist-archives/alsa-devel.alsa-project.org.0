Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E22D4211AB
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 16:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF1CB83B;
	Mon,  4 Oct 2021 16:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF1CB83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633358533;
	bh=OwUzOnAHfIAimiZW257is8horZdEJv7U4E4M0X0yaNQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iLf+HWirEz9WX72YdlzKLrdLKGCWsqOfiHGf35BvDNG2Bu/KJU/00/Gaewedcrmi0
	 scGbp/5xIUNqGVELVVz5GRlZhAsE/Z/mMupPP1UT0DEYrtpDGf+YLpQlAZtF+V6MoD
	 HnUrX2bQuIQAIRe+YsVgd8yuSXI8wbNJEJ8bUpQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4724CF80229;
	Mon,  4 Oct 2021 16:40:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 116D3F80240; Mon,  4 Oct 2021 16:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0414AF80171
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 16:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0414AF80171
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="224221930"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="224221930"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:39:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="544317384"
Received: from aoki-mobl.amr.corp.intel.com (HELO [10.212.121.50])
 ([10.212.121.50])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 07:38:57 -0700
Subject: Re: [PATCH 1/4] ASoC: nau8824: Fix NAU8824_JACK_LOGIC define
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20211002211459.110124-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c4bac1d3-b72e-fc51-c201-b4e0df97d108@linux.intel.com>
Date: Mon, 4 Oct 2021 09:22:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211002211459.110124-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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



On 10/2/21 4:14 PM, Hans de Goede wrote:
> The NAU8824_JACK_LOGIC define was wrong, for active high jack-detect
> to work bit 1 needs to be set, rather then bit 0.
> 
> The correct bit was found in the Android kernel source dump for
> a Cyberbook T116 tablet; and this was also tested on that same tablet.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  sound/soc/codecs/nau8824.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
> index 1d7bdd8e0523..6e61405f623b 100644
> --- a/sound/soc/codecs/nau8824.h
> +++ b/sound/soc/codecs/nau8824.h
> @@ -197,7 +197,7 @@
>  /* JACK_DET_CTRL (0x0D) */
>  #define NAU8824_JACK_EJECT_DT_SFT	2
>  #define NAU8824_JACK_EJECT_DT_MASK (0x3 << NAU8824_JACK_EJECT_DT_SFT)
> -#define NAU8824_JACK_LOGIC		0x1
> +#define NAU8824_JACK_LOGIC		(0x1 << 1)
>  
>  
>  /* INTERRUPT_SETTING_1 (0x0F) */
> 
