Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F357DD7E
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 11:32:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9184188B;
	Fri, 22 Jul 2022 11:31:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9184188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658482365;
	bh=9obwjyJ+1wqQsOOAQX4IrPl0kRLwK1h9fBoLG2aAqiM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a/8ZTQvcdGfHdt+ZHF5+M5Y2YjXyp+lnXxWd6Ww7+M1iqFGoIgnIq6fl7bniAMWzj
	 wrYeaGv3RRkZzXp4aErViEkKz+GBPvo9OwLW5jNW/HxGcNfCf7pPvNkkLF0iuCy01F
	 s+AMAT5aAWVZ72HUJmxPWG3m1bODekS6x71L3yhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0630F80279;
	Fri, 22 Jul 2022 11:31:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CEEF80166; Fri, 22 Jul 2022 11:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18F0F80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 11:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18F0F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="l3PSKczO"
Received: from [192.168.1.90] (unknown [188.24.146.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AF9506601AC4;
 Fri, 22 Jul 2022 10:31:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658482298;
 bh=9obwjyJ+1wqQsOOAQX4IrPl0kRLwK1h9fBoLG2aAqiM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l3PSKczOCoLazgjcsNJNtecODu4S6sAk81ATcCpFYL0WSlXGIgZek6RBG8yztZrdl
 NXE44gTSUW3GEGBBfA7PyJo+yJq8kV6e3GOqwNWiY4wliTWAUvlRf461tKbuurEUIJ
 Q5iqa7Hwex73+/ygO4YDeCzyhGTRxw9vp4rbEx+1uhH6Zm8NmtEoHTMKPtHMquszqe
 6wEA6vWN06QWUGXC7anZszlFIxZGuZDdauuAs40iOMn2Kr1GwJBX75Vo7nsjz5GkFb
 99YiyaRUalLbk1yM2sA2FiDTMFPvnyF7c49jcDxebruggP/YYYtIRE2u8lnc0fMATE
 90NzI5SssYHwg==
Message-ID: <c0fa7b9f-8f0b-da2c-5cd9-550df0b695c8@collabora.com>
Date: Fri, 22 Jul 2022 12:31:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: amd: vangogh: Use non-legacy DAI naming for cs35l41
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20220721233227.1459374-1-cristian.ciocaltea@collabora.com>
 <20220722090532.GF92394@ediswmail.ad.cirrus.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20220722090532.GF92394@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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


On 7/22/22 12:05, Charles Keepax wrote:
> On Fri, Jul 22, 2022 at 02:32:27AM +0300, Cristian Ciocaltea wrote:
>> Unlike most CODEC drivers, the CS35L41 driver did not have the
>> non_legacy_dai_naming set, meaning the corresponding DAI has been
>> traditionally registered using the legacy naming: spi-VLV1776:0x
>>
>> The recent migration to the new legacy DAI naming style has implicitly
>> corrected that behavior and DAI gets now registered via the non-legacy
>> naming, i.e. cs35l41-pcm.
>>
>> The problem is the acp5x platform driver is now broken as it continues
>> to refer to the above mentioned codec using the legacy DAI naming in
>> function acp5x_cs35l41_hw_params() and, therefore, the related setup
>> is not being executed anymore.
>>
>> Let's fix that by replacing the obsolete DAI name with the correct one.
>>
>> Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
> 
> Although sorry just noticed you might want to double check the SHA
> here, I think the upstream one is 129f055a2144.

You are right, thanks for noticing!
I've done some rebasing/bisecting operations and I forgot to recheck the 
original commit.. I've just sent v2.

Regards,
Cristian

> Thanks,
> Charles
