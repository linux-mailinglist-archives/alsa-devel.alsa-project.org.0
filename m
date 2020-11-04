Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFFE2A6788
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 16:22:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 441EF166E;
	Wed,  4 Nov 2020 16:22:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 441EF166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604503375;
	bh=wW4627gR/0KtHj9N0cI/530SEFlBbcojL3ZcW0bxm7E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZ+hbTLcu6MF0Kx7NXmTre0C+Tz9isXvx12LavzoIvFxQchxPQpEYbcLlPRm2Nvn5
	 ySEMm3GqJyUBlUU384W6u3bR21spON9KBgilYPylL4Pa9JDy16FQBCReaw47qUkraq
	 9UDqlv+8veJdKzHPkGRRWKbx1meJYNYqJD9VM0dM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DA8CF80234;
	Wed,  4 Nov 2020 16:21:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56B90F80234; Wed,  4 Nov 2020 16:21:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 575EAF8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 16:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 575EAF8015A
IronPort-SDR: AdweKXl4di5ncenqYK0yuVYqDZJWGK2Bq98O5+qhHPOwdv/CLqhKNT1SzENg+FOfPMy3GYWMBV
 27MpdoT6zY6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="230861643"
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="230861643"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 07:21:13 -0800
IronPort-SDR: wu4PgpW5JSn02QzqqBW8WMu6eroQTyZRcxoohyc0qiRESzJWvJZJvK/zxs9skdTGhcXDNABnYP
 V0Y0W/2s1YNg==
X-IronPort-AV: E=Sophos;i="5.77,451,1596524400"; d="scan'208";a="538955755"
Received: from msridhar-mobl1.amr.corp.intel.com (HELO [10.254.96.252])
 ([10.254.96.252])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 07:21:12 -0800
Subject: Re: [PATCH v2] ASoC: rt1015: add delay to fix pop noise from speaker
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
References: <20201104015734.31957-1-jack.yu@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1394e1c8-2634-9344-2203-4454fa0476cd@linux.intel.com>
Date: Wed, 4 Nov 2020 09:21:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104015734.31957-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, tzungbi@google.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


> diff --git a/Documentation/devicetree/bindings/sound/rt1015.txt b/Documentation/devicetree/bindings/sound/rt1015.txt
> index fcfd02d8d32f..da9697c80d2b 100644
> --- a/Documentation/devicetree/bindings/sound/rt1015.txt
> +++ b/Documentation/devicetree/bindings/sound/rt1015.txt
> @@ -8,10 +8,16 @@ Required properties:
>   
>   - reg : The I2C address of the device.
>   
> +Optional properties:
> +
> +- realtek,realtek,power-up-delay-ms

You missed one repetition here.

> +  Set a delay time for flush work to be completed,
> +  this value is adjustable depending on platform.
>   
>   Example:
>   
>   rt1015: codec@28 {
>   	compatible = "realtek,rt1015";
>   	reg = <0x28>;
> +	realtek,power-up-delay-ms = <50>;
>   };

