Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283921A20C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 16:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B271685D;
	Thu,  9 Jul 2020 16:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B271685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594304695;
	bh=8v00HsesZ/yoYMitcpoPiDdEOdjfr31bHEWutYYi8K0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N15ovTFljG10lKcsetdFA5p1x4GqSE1EmJAjL8ZhPotFOQvEJr13N269tmXYqiOCC
	 0Csw6QC/OZGspK6LqreBG3hglyPeAA49mAygcLYFDI/PxWUQdoelyD/y6BfEs/VfaX
	 TLqVgsK6Z/u9O8ZrZR/F4tATDj937fXFcLUuhlIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD7BAF80274;
	Thu,  9 Jul 2020 16:22:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F807F8015A; Wed,  8 Jul 2020 10:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 693BDF8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 10:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693BDF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bkd31+YW"
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4AF3F21D6C;
 Wed,  8 Jul 2020 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594197575;
 bh=8v00HsesZ/yoYMitcpoPiDdEOdjfr31bHEWutYYi8K0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Bkd31+YWVBIlAFY4FlWJxPEhsQ74gF6+5bz7FTW7rX6YdEmb7DOxScpZ5fpCpQyR5
 4s7TLJiKrCIYiIl0/s+h/eSDg7AEuK5/U2Pe9B2wLCASLFFZZfFp0Q5d2OncsmdpLN
 t3qnU58t3IRftZ6jTGHtfFcZ0tg529c6Y1AF6S48=
Subject: Re: [PATCH v2 14/28] ASoC: samsung: pcm: Demote half-documented
 kerneldoc header
To: Lee Jones <lee.jones@linaro.org>, broonie@kernel.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
References: <20200707143742.2959960-1-lee.jones@linaro.org>
 <20200707143742.2959960-15-lee.jones@linaro.org>
From: Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <f85a033f-b435-2611-5be5-1c83edf8cd42@kernel.org>
Date: Wed, 8 Jul 2020 10:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707143742.2959960-15-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 09 Jul 2020 16:22:25 +0200
Cc: alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 Jaswinder Singh <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 7/7/20 16:37, Lee Jones wrote:
> Ideally the author or someone 'in the know' should come back and
> provide the remainder of the documentation.  Until the kerneldoc
> checkers have been satisfied, let's just demote the header to a
> standard comment block.

Thanks for the patch Lee, Pierre-Luis Bossart has already corrected the 
documentation by adding missing entries in patch:

[PATCH v3 03/13] ASoC: samsung: pcm: fix kernel-doc

> Fixes the following W=1 kernel build warning(s):
> 
>   sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'lock' not described in 's3c_pcm_info'
>   sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'sclk_per_fs' not described in 's3c_pcm_info'
>   sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'idleclk' not described in 's3c_pcm_info'
>   sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'pclk' not described in 's3c_pcm_info'
>   sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'cclk' not described in 's3c_pcm_info'

--
Regards,
Sylwester
