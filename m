Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBE5B3C8A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 18:01:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 049A316A0;
	Fri,  9 Sep 2022 18:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 049A316A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662739303;
	bh=bpanKMcGFkBYV6st9DBUsGsPDkFJEwsyaU/gGDRgWJ0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hlLmzCzsLNGuNutpozTpcR56bp4DGi/5RmduCAJe+NlAgeS5QG9btpKoAkIMo0T8l
	 JWjlCQFP1E19RljtCaS27E+BRUvx6P6QxV2Bxp0957Ex0Rx4Pz2tUXG3/8YEaF7lHg
	 w5RYGY0lbD8V+SdpmYeG/8JmdR+ixlGX9R7DT8F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92899F804AE;
	Fri,  9 Sep 2022 18:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F4AAF8016C; Fri,  9 Sep 2022 18:00:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52837F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 18:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52837F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hwBsppB6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289CQ3NL005944;
 Fri, 9 Sep 2022 11:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=BDK97odaVpX6TQUImAXmUK3Yd76BvsUS+r2Lf6t1i7U=;
 b=hwBsppB6qm5lRlDtvIqesYgr2e3wUftdBZxNTOzw1tGC4QqssqR0BB6hsdu5o1NeT3Ll
 /UXjIYfehb0TcGc3xs323S72SMTo0id9Lwl5/7kcOW6II58kzLs1ETKbJ6jxw3jaJxRM
 YjF9WcX9H7YrgRYG1ecpd1prm7IEv1tcy380brlG0cEGdrQk2xxtgxBzINS0Z0PJiep5
 fyimrx/GQXKcxh5Q4lSUPkrk4n8hqldgrX2pKZ0lmWiWVjCRy3gVoHTz8oNzp/ycbJbd
 +lbQHs7zuozbBQoKBD4LkzSIgf83qYiww+C+yXxmbn6vXp7mWgTx+H+TLeTFs02CnUiY YQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3jc4b2hthu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 11:00:41 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Fri, 9 Sep
 2022 11:00:39 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Fri, 9 Sep 2022 11:00:39 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 819B32C5;
 Fri,  9 Sep 2022 16:00:32 +0000 (UTC)
Message-ID: <bc87a8a6-63bb-fc77-adf3-2a64890cf86e@opensource.cirrus.com>
Date: Fri, 9 Sep 2022 17:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 07/10] ASoC: cs42l42: Split I2C identity into separate
 module
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <20220909135334.98220-8-povik+lin@cutebit.org>
 <aabae52f-8230-f837-c17a-59d781b5af62@opensource.cirrus.com>
 <5C349ED8-BD51-40BA-BD02-A44FBBEF9C52@cutebit.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <5C349ED8-BD51-40BA-BD02-A44FBBEF9C52@cutebit.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kz-BnFP64S45rZ1mrXuEjoXEZrbJvfxB
X-Proofpoint-ORIG-GUID: Kz-BnFP64S45rZ1mrXuEjoXEZrbJvfxB
X-Proofpoint-Spam-Reason: safe
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, devicetree@vger.kernel.org,
 - <patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, David Rhodes <david.rhodes@cirrus.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob
 Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 James Schulman <james.schulman@cirrus.com>, Matt Flax <flatmax@flatmax.com>
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

On 09/09/2022 16:44, Martin Povišer wrote:
> 
>> On 9. 9. 2022, at 17:40, Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>
>> On 09/09/2022 14:53, Martin Povišer wrote:
>>> +static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
>>> +{
>>> +	struct device *dev = &i2c_client->dev;
>>> +	struct cs42l42_private *cs42l42;
>>> +	struct regmap *regmap;
>>> +	int ret;
>>> +
>>> +	cs42l42 = devm_kzalloc(dev, sizeof(*cs42l42), GFP_KERNEL);
>>> +	if (!cs42l42)
>>> +		return -ENOMEM;
>>> +
>>> +	regmap = devm_regmap_init_i2c(i2c_client, &cs42l42_regmap);
>>> +	if (IS_ERR(regmap)) {
>>> +		ret = PTR_ERR(regmap);
>>> +		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	cs42l42->dev = dev;
>>> +	cs42l42->regmap = regmap;
>>> +	cs42l42->irq = i2c_client->irq;
>>> +
>>> +	ret = cs42l42_common_probe(cs42l42, &cs42l42_soc_component, &cs42l42_dai);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = cs42l42_init(cs42l42);
>>> +	if (ret)
>>> +		cs42l42_common_remove(cs42l42);
>>
>> This introduces a bug that regulator_bulk_disable() is called
>> twice if there is an error.
>>
>> cs42l42_init() was supposed to clean up if it returns an error, which
>> it nearly does, but my original patch is missing the call to free_irq()
>> in the error paths of cs42l42_init().
> 
> Ah! I didn’t inspect it closely enough then, I only ran into the missing
> free_irq.
> 

Yes, that's a bug. I just put a comment on the patch that introduced it.
When I split probe() into two, I accidentally missed out those two lines
to call free_irq().

> Martin
> 
