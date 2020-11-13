Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D72B2069
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 17:27:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2759316D7;
	Fri, 13 Nov 2020 17:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2759316D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605284871;
	bh=dZodn/1r134z+7tgqzOfFLsySJ62ZwXYJNNwB1Nx7H8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfBA3LPqAa0nl5OPK+B9Gqd6jSjL73WcIqbyB2cKnl4+CeKh6oLpYBgh0JWkldJNr
	 +vqF1u+FqQm1h9usyQY6TSEoQ4jFpTg0FsiUwVfAHyAK0fngBlfxVKIpv4FpN8AG19
	 uDRRB0ViS8lZ7QrxKuI4SiHtdTb44baDuBjLrJa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6327FF80529;
	Fri, 13 Nov 2020 17:22:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A29BFF804F1; Fri, 13 Nov 2020 17:22:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BC81F804CC
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 17:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BC81F804CC
IronPort-SDR: XypwlgjSjjOL5szuNksAyzTWEylOSN4MjdRgzbfsHsSfhlMiXycEDSov9hF8ILWO11qaUVfutq
 UJnGOKvsux/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="149763871"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="149763871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:21:54 -0800
IronPort-SDR: fE+kGuvUTj2X1nBG3p6/UMk+d69O7oznXPmm/qNU/x9Ok+HkI2Gd0OhV6AtBlqrRsVwxfI1dkc
 JCcEI5kwKxMA==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="339799858"
Received: from rjjumade-mobl.amr.corp.intel.com (HELO [10.209.182.8])
 ([10.209.182.8])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:21:53 -0800
Subject: Re: [PATCH 2/2] ASoC: rt5682: Add a new property to the device tree.
To: Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
 lgirdwood@gmail.com
References: <20201113055400.11242-1-oder_chiou@realtek.com>
 <20201113055400.11242-2-oder_chiou@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <744fbc6c-f2e9-15e2-fef4-9532c87f5d7c@linux.intel.com>
Date: Fri, 13 Nov 2020 08:54:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113055400.11242-2-oder_chiou@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

Couple of typos you may want to fix

On 11/12/20 11:54 PM, Oder Chiou wrote:
> The patch adds a new property to the drice tree for the DMIC clcok driving.

device?

> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>   Documentation/devicetree/bindings/sound/rt5682.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
> index 707fa98d1310..9c5fadb6ac82 100644
> --- a/Documentation/devicetree/bindings/sound/rt5682.txt
> +++ b/Documentation/devicetree/bindings/sound/rt5682.txt
> @@ -44,6 +44,8 @@ Optional properties:
>   - realtek,dmic-delay-ms : Set the delay time (ms) for the requirement of
>     the particular DMIC.
>   
> +- realtek,dmic-clk-driving-high : Set the high drving of the DMIC clock out.

driving?

I must admit I actually don't understand what 'dmic-clk-driving-high' 
means, a clock is by definition dual-phase and we use both rising and 
falling edges for the mics.

Or driving high when idle?

> +
>   Pins on the device (for linking into audio routes) for RT5682:
>   
>     * DMIC L1
> 
