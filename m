Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00703163050
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 20:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6EF1696;
	Tue, 18 Feb 2020 20:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6EF1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582054720;
	bh=FwualbKSOHm3cyJtn6HnQb5kw3QAv6vrK5lhH63WMQg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mi5qZdXpTrHIBlXwGgdOKmgQjvJmA8VnSPQJ4/+y3o5ZsdOU6AeY9h/gaglx++nFK
	 LFoGXI5o00kAQ2Xt8iuqcS5E0T8Rt5aLOGN6dpg8gtZ5SzXxN3ltuRlAdChxf2Lhxm
	 7fhVvt34iZmUET3Ki4qFCGfh62lXp+lt/LnwsDkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91FB7F80135;
	Tue, 18 Feb 2020 20:36:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BE5DF80148; Tue, 18 Feb 2020 20:36:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D01BF80135
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 20:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D01BF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YZhSVFOm"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01IJanDR118725;
 Tue, 18 Feb 2020 13:36:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582054609;
 bh=GgHMMWikXXitKD/AGrzFrLxAIGAeZxrL9hb7kQz+ZSg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YZhSVFOmjDz6ndBizA8kSE/cB2eldFw/YkD/OS2oFAHCiSetLl6MStsRdtQmlzWlm
 mPoL+9T94d05owL3GwqPNR/OqW6j1lssh/LZOJFxNBJfdU7WOUS+UWkvPC7fvNFi1a
 2Qj+OHEF1/Hrb6+qvcO9qDSoyBISATQkOVEqgoAA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01IJan0T081014
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Feb 2020 13:36:49 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 18
 Feb 2020 13:36:48 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 18 Feb 2020 13:36:48 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01IJamdF019213;
 Tue, 18 Feb 2020 13:36:48 -0600
Subject: Re: [PATCH v2 2/2] ASoC: tlv320adcx140: Add the tlv320adcx140 codec
 driver family
To: Mark Brown <broonie@kernel.org>
References: <20200218172140.23740-1-dmurphy@ti.com>
 <20200218172140.23740-3-dmurphy@ti.com> <20200218192321.GN4232@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <0faf0bfe-6186-59d0-e800-8523a33044dc@ti.com>
Date: Tue, 18 Feb 2020 13:32:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218192321.GN4232@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

Mark

On 2/18/20 1:23 PM, Mark Brown wrote:
> On Tue, Feb 18, 2020 at 11:21:40AM -0600, Dan Murphy wrote:
>
> A couple of very small things, otherwise this looks good:
>
>> +	if (unlikely(!tx_mask)) {
>> +		dev_err(component->dev, "tx and rx masks need to be non 0\n");
>> +		return -EINVAL;
>> +	}
> Do you really need the unlikely() annotation here?  This is *hopefully*
> not a hot path.

I was copying the code from tlv320aic3x.c as suggested by one our audio 
guys here in TI.

I can remove it if you desire

>
>> +static int adcx140_codec_probe(struct snd_soc_component *component)
>> +{
>> +	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
>> +	int sleep_cfg_val = ADCX140_WAKE_DEV;
>> +	u8 bias_source;
>> +	u8 vref_source;
>> +	int ret;
>> +
>> +	adcx140->supply_areg = devm_regulator_get_optional(adcx140->dev,
>> +							   "areg");
>> +	if (IS_ERR(adcx140->supply_areg)) {
> You should really do the request and defer at the I2C level, that avoids
> running through the whole card initialization repeatedly when the device
> isn't ready.  Basically try to do all resource aquisition at the device
> level and then use it at the card level.

Ack.  Makes more sense to do it in the I2C probe.

Dan

