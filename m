Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97B52EE5B
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 16:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EECA31726;
	Fri, 20 May 2022 16:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EECA31726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653057724;
	bh=QnszhtvhouVRGGtJ1BImAOgQzjjpIeBfd01w+p8YnwU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9GqiPPDR9FG+uE4JdpABwmNDg+da7XMbrpsDlUjJGim1CtCeeg545W92yhwx1oGt
	 cP55EjDI47JN8x68lVa8+fItN/ea26HjlK4BNgihcpIxZsvqnFd3fCa0KbUE6CRe6E
	 nkyzuVYLwtx3IHUyxcEkSNFZ3zfUtcqKsuYNliPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AB74F800F0;
	Fri, 20 May 2022 16:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63361F8019D; Fri, 20 May 2022 16:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 421F5F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 16:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 421F5F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CfMKxuAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653057657; x=1684593657;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QnszhtvhouVRGGtJ1BImAOgQzjjpIeBfd01w+p8YnwU=;
 b=CfMKxuABVBcJpVcaDToUeaJK2RX+JulCj4BrWYMydBdjt/z57pB9ckbV
 FTaYc7flh4AsXPB59VhVxZi0FbqyEVxOQLxvfp3j/4r9xuMIwJZLqCpBg
 kpIvI2iDra4W2eAT+0PRFDEXNvUyimcs7jiCaSyBeusPhN7r4LuEbZZwx
 KKWD5qIIzs88cIiqF+2BDhXgmS5FrCQrcGuNLUZckDF0f6Rs/Bbo/h4Ye
 SlP6LFJ5LRzC/2w5tFY/r0pHRAUs9EEScXWH0/bomHdh5Vyvb1fJWP8Dk
 hhO/rxMprIYxPplZBsawfsdRIQOZMmH3QRmeTgjF5wPlXEvKVArOHyL21 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="254681907"
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="254681907"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 07:40:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,239,1647327600"; d="scan'208";a="599251940"
Received: from vphopper-mobl.amr.corp.intel.com (HELO [10.252.133.54])
 ([10.252.133.54])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 07:40:52 -0700
Message-ID: <9fb8fad5-74f7-f6ae-95e0-f1c181532a71@linux.intel.com>
Date: Fri, 20 May 2022 09:24:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: rt1308-sdw: add the default value of register 0xc320
Content-Language: en-US
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20220520090205.25857-1-shumingf@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220520090205.25857-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com,
 bard.liao@intel.com, pierre-louis.bossart@intel.com
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



On 5/20/22 04:02, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The driver missed the default value of register 0xc320.
> This patch adds that default value to avoid the error messages
> when the driver went to suspend mode already.
> 
> BugLink: https://github.com/thesofproject/linux/issues/3651
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/codecs/rt1308-sdw.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
> index c5ce75666dcc..6668e19d85d4 100644
> --- a/sound/soc/codecs/rt1308-sdw.h
> +++ b/sound/soc/codecs/rt1308-sdw.h
> @@ -140,6 +140,7 @@ static const struct reg_default rt1308_reg_defaults[] = {
>  	{ 0x3008, 0x02 },
>  	{ 0x300a, 0x00 },
>  	{ 0xc003 | (RT1308_DAC_SET << 4), 0x00 },
> +	{ 0xc000 | (RT1308_POWER << 4), 0x00 },
>  	{ 0xc001 | (RT1308_POWER << 4), 0x00 },
>  	{ 0xc002 | (RT1308_POWER << 4), 0x00 },
>  };
