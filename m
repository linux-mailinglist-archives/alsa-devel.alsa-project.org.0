Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CA33A0B0
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8180015E4;
	Sat,  8 Jun 2019 18:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8180015E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012138;
	bh=vBwfncCr/B9+ZFKFNMwc3KnLafSkSkPw+XcNNN2AGpw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qny+EBBsqen4qJtwZBVvQNp3sg9GwYU+gSY+damPWSWoKBYQrWKvqNYqRQjIEGwHH
	 azhBHREG6QdsZADQPXH4yNBH63QjOdfuCUE1wVMhpkJJWsZo2ufVQwYq2Jmf48TVTL
	 byq3OcY7FBEhK4R3smW8K18hc7izyZgx2lDKRWdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56A70F89710;
	Sat,  8 Jun 2019 18:39:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A42E9F896F7; Tue,  4 Jun 2019 09:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from filter04.hostcontrol.com (filter04.hostcontrol.com
 [5.157.86.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8203F80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 09:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8203F80054
Received: from [5.157.86.17] (helo=webmail-us2-yh01.yourhosting.nl)
 by filter04.hostcontrol.com with esmtp (Exim 4.89)
 (envelope-from <willemromkes@rose-es.nl>)
 id 1hY3fO-0003qA-6s; Tue, 04 Jun 2019 09:15:34 +0200
Received: from _ (localhost [IPv6:::1])
 by webmail-us2-yh01.yourhosting.nl (Postfix) with ESMTP id DB5B24586E0;
 Tue,  4 Jun 2019 09:15:28 +0200 (CEST)
Received: from mail01a.alfen.com ([92.64.175.146])
 via mail01a.alfen.com ([92.64.175.146]) by webmail.us2.yourhosting.nl
 with HTTP (HTTP/1.1 POST); Tue, 04 Jun 2019 09:15:28 +0200
MIME-Version: 1.0
Date: Tue, 04 Jun 2019 09:15:28 +0200
From: Willem Romkes <willemromkes@rose-es.nl>
To: Codrin.Ciubotariu@microchip.com
Organization: Rose Engineering Services
In-Reply-To: <155857e2-1fbd-f154-5316-a4426a74b7b4@microchip.com>
References: <8d2cb6d3212c82c5b1430dc5e13c79c1@rose-es.nl>
 <155857e2-1fbd-f154-5316-a4426a74b7b4@microchip.com>
Message-ID: <089a90e9c111e7a8bdd2b0d57ce05ea4@rose-es.nl>
X-Sender: willemromkes@rose-es.nl
User-Agent: Roundcube Webmail
X-Remote-Browser: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0)
 Gecko/20100101 Firefox/67.0
X-Originating-IP: 92.64.175.146
X-RoundCube-Server: webmail-us2-yh01.yourhosting.nl
X-Originating-IP: 5.157.86.17
X-SpamExperts-Domain: out.hostedox.com
X-SpamExperts-Username: 5.157.86.17
Authentication-Results: hostcontrol.com;
 auth=pass smtp.auth=5.157.86.17@out.hostedox.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0WF37iHSchYgKnNGmAxHYR+pSDasLI4SayDByyq9LIhVO7o/mkMnZTe+
 aODunw7ZykTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3KA3cw1J65cwSoj5qE1x3r4xzv
 L33JtnMaEpy1xmt900a0EktcRh/qR/MdvA9f1tjAwzAKmOz5yp/Fzg2ZpvN8BXzQCZfCmDFO7p8r
 brhof+tFZ9Cs2/f+pDxTvQoAaLByzGv0m4lC3sMQmcFI+/JnFkkolOTFML5N3rwgT/vCedCEQY3n
 6mqkXcs9aV/zzo2KiZxo8QGBI/Sd7ZEOglxE5vP+Fj7IYIKEeIf2UrpGmTZp0ugtZlkw9p/AQdIE
 0knwqxNq2x6ZGoHd8jLhzKkCSIgKyEWnnpk3TSoBsqHH8iZY4iedii5TS5Cer+5peBUk071nk5ze
 NA2Y8By34NoXIV6HNEMJ4fLINP1heXvlujc+EX7LXnIbKpjoQ7b2aCdGmJ4jp2IEK1+tbyRLmkZA
 x/PF3GUV+KdBBqrnCX8j0Gi8Ksk+aedMfNWSnJswrtlNJjFNRpcZwFFhFmVD3qfA5TKO14DCsdqZ
 Zc6iu8G5JsXcG6hsRQZiAIgw+z837AqgX7ewI8e1h7RITgN14BHmGVt/ReJ9MfhzzmbKTH7wI9GE
 U1utNskUAORCV2WFZX0jv0Ts3MxV1cJ0YGKBVsYo2VeIvqlZdI7T24bXVk2Q61kphQdd0jgwrcK3
 bbhJq9pyVMZOq3K2yuzyfgONwYnI/mh/oiSBx8mt6nsX60vLm1YTKgAQriuw1aTia+0Fz1FRhWPS
 5rCwisa/BQLhiuybU0w9LUZfl7b/8HrhZ+zknieqTkn0vKtTlqfK1N2T78zyxaLKNTDjTCxJthrv
 tAlx0iub+zLPVv6PaOLwXKWE6Px+pvlHhV6a5QjptwQBGybQXYomp7ujh41hIcWQ8HYS4WxBc6u0
 QBTDbEB/hV9r9TeDl9+AMsSJDcUCUZHuO2jX9DbQWTHztn1qdSXCnE2JZTKO14DCsdqZZc6iu8G5
 JsWwIgD/xDehea09OpnwSuobamwN2fJ4nYmpvo0vR8reAJanfcoq9IsR6l/OZb9VMEM=
X-Report-Abuse-To: spam@filterapi.hostcontrol.com
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, nicolas.ferre@atmel.com
Subject: Re: [alsa-devel] atmel SSC DSP A mode
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Codrin, 

Thank you for responding. 

We are using the tlv320aic3107 with the tlv320aic3x codec driver. You
are correct that we could use DSP B mode. but the atmel_ssc_dai driver
doesn't support DSP B mode. On the other hand, the tlv320aic3x driver
does support DSP A mode where it just applies an offset of one bit. 

I have continued investigating this issue and I think the whole issue is
caused by our soundcard driver setting the SND_SOC_DAIFMT_IB_NF in the
DAI format, which is correct if I refer to figure 25 of the tlv320aic33
datasheet and the tlv320aic3x driver. The atmel_ssc_dai driver however
doesn't check on this and has the clock settings hard-coded and in the
current master branch it expects you to use SND_SOC_DAIFMT_NB_NF
instead. It would be a good idea to add support for the different
SND_SOC_DAIFMT_xB_xF DAI formats to the atmel_ssc_dai driver.

Best regards, 

---
Willem Romkes
 Rose Engineering Services 

 		M
 		06-48013381

 		E
 		willemromkes@rose-es.nl

 		I
 		www.rose-es.nl

On 03-06-2019 18:05, Codrin.Ciubotariu@microchip.com wrote:

> On 03.06.2019 13:19, Willem Romkes wrote: 
> 
>> *
>> *
>> 
>> Hi,
>> 
>> We are using linux-at91 and lately I have been working on adding support 
>> for a custom soundcard, a dual tlv320aic3x codec on SAMA5D3 platform. 
>> This soundcard uses DSP A mode.
>> 
>> We are facing audio issues: When we playback a WAV file with a sine 
>> wave, the codec outputs far from a clean sine wave. The problem I think 
>> is that the CKI settings for the TMCR register isn't set correctly. 
>> see commit 20cf2603b122bf71fb54def1de6a2ad73d5ddb0b
>> Author: Bo Shen <voice.shen@atmel.com>
>> Date:   Fri Jan 30 17:38:42 2015 +0800
>> 
>> ASoC: atmel_ssc_dai: fix the setting for DSP mode
>> 
>> When SCC work in DSP A mode, the data outputs/inputs are shift out on
>> falling edge, the frame sync are sample on the rising edge.
>> 
>> Reported-by: Songjun Wu <songjun.wu@atmel.com>
>> Signed-off-by: Bo Shen <voice.shen@atmel.com>
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> 
>> diff --git a/sound/soc/atmel/atmel_ssc_dai.c 
>> b/sound/soc/atmel/atmel_ssc_dai.c
>> index e691aab..35e44e4 100644
>> --- a/sound/soc/atmel/atmel_ssc_dai.c
>> +++ b/sound/soc/atmel/atmel_ssc_dai.c
>> @@ -502,7 +502,7 @@ static int atmel_ssc_hw_params(struct 
>> snd_pcm_substream *substream,
>> rcmr =    SSC_BF(RCMR_PERIOD, ssc_p->rcmr_period)
>> | SSC_BF(RCMR_STTDLY, 1)
>> | SSC_BF(RCMR_START, SSC_START_RISING_RF)
>> -                       | SSC_BF(RCMR_CKI, SSC_CKI_RISING)
>> +                       | SSC_BF(RCMR_CKI, SSC_CKI_FALLING)
>> | SSC_BF(RCMR_CKO, SSC_CKO_NONE)
>> | SSC_BF(RCMR_CKS, SSC_CKS_DIV);
>> 
>> @@ -517,7 +517,7 @@ static int atmel_ssc_hw_params(struct 
>> snd_pcm_substream *substream,
>> tcmr =    SSC_BF(TCMR_PERIOD, ssc_p->tcmr_period)
>> | SSC_BF(TCMR_STTDLY, 1)
>> | SSC_BF(TCMR_START, SSC_START_RISING_RF)
>> -                       | SSC_BF(TCMR_CKI, SSC_CKI_RISING)
>> +                       | SSC_BF(TCMR_CKI, SSC_CKI_FALLING)
>> | SSC_BF(TCMR_CKO, SSC_CKO_CONTINUOUS)
>> | SSC_BF(TCMR_CKS, SSC_CKS_DIV);
>> 
>> @@ -546,7 +546,7 @@ static int atmel_ssc_hw_params(struct 
>> snd_pcm_substream *substream,
>> rcmr =    SSC_BF(RCMR_PERIOD, 0)
>> | SSC_BF(RCMR_STTDLY, START_DELAY)
>> | SSC_BF(RCMR_START, SSC_START_RISING_RF)
>> -                       | SSC_BF(RCMR_CKI, SSC_CKI_RISING)
>> +                       | SSC_BF(RCMR_CKI, SSC_CKI_FALLING)
>> | SSC_BF(RCMR_CKO, SSC_CKO_NONE)
>> | SSC_BF(RCMR_CKS, ssc->clk_from_rk_pin ?
>> SSC_CKS_PIN : SSC_CKS_CLOCK);
>> 
>> For both the TCMR and RCMR the CKI is set to SSC_CKI_FALLING, but I 
>> think for the TCMR the CKI should be set to SSC_CKI_RISING. See datasheet:
>> 
>> TCMR CKI: "1: The data outputs (Data and Frame Sync signals) are shifted 
>> out on Transmit Clock rising edge. The Frame sync signal
>> input is sampled on Transmit clock falling edge."
>> 
>> RCMR CKI: "0: The data inputs (Data and Frame Sync signals) are sampled 
>> on Receive Clock falling edge. The Frame Sync signal out-
>> put is shifted out on Receive Clock rising edge."
>> 
>> Setting the CKI in TCMR to SSC_CKI_RISING to fixes our issues.
> 
> Hi Willem,
> 
> It this DS of the codec you are using?
> http://www.ti.com/lit/ds/symlink/tlv320aic33.pd [1] 
> 
> Are you using the DSP mode described in figure 25 DSP Serial Bus Mode 
> Operation? If yes, then you should use the DSP_B mode...
> 
> Thanks and best regards,
> Codrin
 

Links:
------
[1] http://www.ti.com/lit/ds/symlink/tlv320aic33.pdf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
