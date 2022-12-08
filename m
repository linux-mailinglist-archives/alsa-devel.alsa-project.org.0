Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763BA646809
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 04:55:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C4518D3;
	Thu,  8 Dec 2022 04:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C4518D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670471734;
	bh=EDvejQNT3CsA+5V3d8wu8Usi6kRs8Q+XnpgwH5o1K6o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nsnrW72f79q+LDKVMp2f9R5sGeKv3DScPPHXTEgRN75JlBonuk+TNrqnCshTSVl2S
	 /G4rYDd4CVY/1ERyoLL8uFRqTJX/ecF9/ARyyZrRAltkEcfnpSpG69pRfY0+HOfVLF
	 5JIIIMZfFc/1Qa4TE8KUZhUiwaKQb5iEbpXBQDX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1008FF80559;
	Thu,  8 Dec 2022 04:54:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 991FFF8054A; Thu,  8 Dec 2022 04:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8BC7F804AC
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 04:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BC7F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="LVLudGUr"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 750278363D;
 Thu,  8 Dec 2022 04:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670471664;
 bh=28B4LZ7riZ54291BkOYL+44UAPvwNu1oiDTG1vq6Dnw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LVLudGUrtZLdQyzd7btWWETncl1VK+1/CIQdXlEAzIgoo+vkx8G/so05iWR9XL0aN
 oJ3rJAVrTY6UI/zOa8f+KC1kXiEtsH/g9lypJ7GvprzQjjFMgTZLeMlNP/NEsPdb+p
 FY4TWuxeLVYuLp8Nqmi97OBRDooyzull8RI4rRxyGAxIX5CEeSHmbuQHJSaiWcG7Fy
 IFXYRC+lRFeBiBp19SAvLvpHGGcR+rk6F+jU+dhXT575UZTNXj7O+BgwVieEoHIpFK
 IJAqk8wd/tItn9JGojbzHs6tqL5sEkSK2YgLAUw54ZI2N7hR8c0ZS0ur0hsxpOUMx8
 hQgGBP8UZLZKw==
Message-ID: <adbdb85e-c6b8-918f-add5-0e569e9b343d@denx.de>
Date: Thu, 8 Dec 2022 04:54:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl-sai: Fix mx6ul and mx7d
 compatible strings
To: Rob Herring <robh@kernel.org>
References: <20221104160315.213836-1-marex@denx.de>
 <20221208022151.GA3383136-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221208022151.GA3383136-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

On 12/8/22 03:21, Rob Herring wrote:
> On Fri, Nov 04, 2022 at 05:03:13PM +0100, Marek Vasut wrote:
>> Describe existing used combinations of compatible strings on MX6UL
>> and MX7D, which are backward compatible with MX6SX. Add the missing
>> imx7d-sai compatible string which is used on i.MX7 .
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
>> Cc: alsa-devel@alsa-project.org
>> To: devicetree@vger.kernel.org
>> ---
>>   .../devicetree/bindings/sound/fsl,sai.yaml    | 24 ++++++++++++-------
>>   1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>> index 11aab891288d2..05bad828cc353 100644
>> --- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
>> @@ -18,15 +18,12 @@ description: |
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - enum:
>> -          - fsl,vf610-sai
>> -          - fsl,imx6sx-sai
>> -          - fsl,imx6ul-sai
>> -          - fsl,imx7ulp-sai
>> -          - fsl,imx8mq-sai
>> -          - fsl,imx8qm-sai
>> -          - fsl,imx8ulp-sai
>> -          - fsl,imx93-sai
> 
> fsl,imx93-sai got lost in this patch.
> 
> (found checking for new undocumented compatibles in next with
> scripts/dtc/dt-extract-compatibles)

Fix sent, thanks.
