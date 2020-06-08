Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3106C1F219B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 23:47:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6EF8166E;
	Mon,  8 Jun 2020 23:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6EF8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591652878;
	bh=GeSYFTKJCAVsejlHsEPGVX5vw1iu0Q+XhpyUiECawUI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pj5hyzboWYdwID3qk8Zv/WlNvN51yksfW7rBsmecMrFEqMz3iOhMUIDBCCchY8wn7
	 e79YJCGg8VMzZNFCqII+/EvxfckiVaC5TRRPq5JaZ87LQsCrmpOmq7EePmpEKOno1n
	 VVfPCWvxaHZLhNXZnlJDkzEcnzCFeAHBePrdyZnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75396F8021C;
	Mon,  8 Jun 2020 23:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D653F8024A; Mon,  8 Jun 2020 23:45:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5238F801EB
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 23:45:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5238F801EB
IronPort-SDR: nVrzPZYPMFbS9bb9WmoWExUI+c9ZCjS+79rDRCINRQhXjjMCFthX9WwOdUqdYjIrS2NILqJlWu
 u4ij6Fj9Gdtg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 14:45:14 -0700
IronPort-SDR: IVz2kX9KpFHPC3Q2DPv7qDtUv0n3ZFWjE91FYCNE7d3hb1CNju5sADW6wixshELY8Os7utcM9A
 i4ryDcv1JHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,489,1583222400"; d="scan'208";a="446893881"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO [10.254.104.56])
 ([10.254.104.56])
 by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 14:45:14 -0700
Subject: Re: [PATCH 1/3] bytcr-rt5640: Fix DMIC1 not working when connected
 over AIF2
To: Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>
References: <20200608202142.92894-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e32752b3-ad5c-6e63-51fb-a202956bc1f4@linux.intel.com>
Date: Mon, 8 Jun 2020 16:44:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608202142.92894-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 6/8/20 3:21 PM, Hans de Goede wrote:
> The RT5640 codec has 2 ADC-s which are caled the Stereo ADC and the
> Mono ADC (even though the mono ADC seems to be stereo too?). The Stereo
> ADC is connected to the AIF1 interface of the codec and the Mono ADC
> to the AIF2 interface.
> 
> Almost all X86 BYT/CHT design use the AIF1 interface, but a few models
> use the AIF2 interface. For this reason the IN?-InternalMic.conf bits
> not only select/enable the microphone input on the Stereo ADC, but
> also on the Mono ADC, so that the analog mic. inputs also work in devices
> using the AIF2 interface.
> 
> Before this commit DigitalMics.conf was only setting up the DMIC input
> on the Stereo ADC and not on the Mono ADC, causing DMIC1 to not work
> when connected over AIF2.
> 
> This commit adds selecting / enabling DMIC1 on the Mono ADC.
> This fixes the internal microphone not working on the Toshiba Encore WT10A.
> 
> Note that for devices which use the AIF1 interface this is a no-op since
> the AIF1 interface is not connected to anything, there is no complete
> chain so DAPM will not enable any of the elements in the chain.

Sounds good to me.

For the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   ucm2/codecs/rt5640/DigitalMics.conf | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/ucm2/codecs/rt5640/DigitalMics.conf b/ucm2/codecs/rt5640/DigitalMics.conf
> index 503c4a9..fdd412f 100644
> --- a/ucm2/codecs/rt5640/DigitalMics.conf
> +++ b/ucm2/codecs/rt5640/DigitalMics.conf
> @@ -6,6 +6,9 @@ SectionDevice."Mic" {
>   	]
>   
>   	EnableSequence [
> +		cset "name='Mono ADC MIXL ADC2 Switch' on"
> +		cset "name='Mono ADC MIXR ADC2 Switch' on"
> +		cset "name='Mono ADC Capture Switch' on"
>   		cset "name='Stereo ADC MIXL ADC2 Switch' on"
>   		cset "name='Stereo ADC MIXR ADC2 Switch' on"
>   		cset "name='Internal Mic Switch' on"
> @@ -13,6 +16,9 @@ SectionDevice."Mic" {
>   	]
>   
>   	DisableSequence [
> +		cset "name='Mono ADC MIXL ADC2 Switch' off"
> +		cset "name='Mono ADC MIXR ADC2 Switch' off"
> +		cset "name='Mono ADC Capture Switch' off"
>   		cset "name='Stereo ADC MIXL ADC2 Switch' off"
>   		cset "name='Stereo ADC MIXR ADC2 Switch' off"
>   		cset "name='Internal Mic Switch' off"
> 
