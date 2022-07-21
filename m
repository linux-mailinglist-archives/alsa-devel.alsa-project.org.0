Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1656257D766
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 01:39:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA861654;
	Fri, 22 Jul 2022 01:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA861654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658446766;
	bh=Wii0X0eT8PnAsozKQztMmBols/zMOZtKguDeQ2nyllY=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4xh6D6FM+DjHzcNG7pTAv2MA2IXQzjWQw2DAj5ViHm+3gEBO0P6n/De5ILSGW0rI
	 yQxdWhyFNaZFRz3oHN1S1gMJXuTCSgBeXV9XLq/AVJNAGtI+fd5GQqCo7/8b40csDH
	 FfZtYEeOka94qpyQYLb8mWKZX1RT2fuHYQhHTOWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF27FF800BA;
	Fri, 22 Jul 2022 01:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11D6F8016D; Fri, 22 Jul 2022 01:38:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9991BF80166
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 01:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9991BF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="lmyDiMZm"
Received: from [192.168.1.90] (unknown [188.24.146.105])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 792D16601AB4;
 Fri, 22 Jul 2022 00:38:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658446696;
 bh=Wii0X0eT8PnAsozKQztMmBols/zMOZtKguDeQ2nyllY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=lmyDiMZmBnNmE1DIdTNcLhiap2BBVnK/LiL/y+8317ALyu3DOgNBMDtE+DHzVlHrR
 4nZ2wH8nVvvOJ0QO7i07cqQ3eJ9EPiDETz+WHbbLIrVF279hCS/Ejja5x9PFqn1a/p
 AEJkhX9d4njUZixXpElEN/ma3r3MHfzIsP2MHghHpHQoTl+dNU579kVk8Z6rKwRxa2
 VUDkIB+IfkPwFAmz4Y7NCQQHeJJB5916/VKBRR0exsAmkyqy7+f/LsKSlmvOaxtqZB
 4I02QD2qzXAx+IcpejgGxSioVcCSjS6RbJjx7up13JbwmGSOf3VzIRq0Q9i62mO9xN
 DplOSSe68HxSA==
Message-ID: <9def537b-81ec-c7d8-1e9e-1eb11fc52142@collabora.com>
Date: Fri, 22 Jul 2022 02:38:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: cs35l41: Set the new legacy DAI naming flag
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20220721121454.1378945-1-cristian.ciocaltea@collabora.com>
 <20220721131928.GD92394@ediswmail.ad.cirrus.com>
 <0f413cf5-fadc-6fe8-cadc-2c9526d4a2e2@collabora.com>
In-Reply-To: <0f413cf5-fadc-6fe8-cadc-2c9526d4a2e2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 James Schulman <james.schulman@cirrus.com>, linux-kernel@vger.kernel.org
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


On 7/21/22 17:54, Cristian Ciocaltea wrote:
> Hi Charles,
> 
> On 7/21/22 16:19, Charles Keepax wrote:
>> On Thu, Jul 21, 2022 at 03:14:54PM +0300, Cristian Ciocaltea wrote:
>>> Unlike most CODEC drivers, the CS35L41 driver did not have the
>>> non_legacy_dai_naming set, meaning it uses the legacy naming.
>>>
>>> The recent migration to the new legacy DAI naming style has broken
>>> driver functionality because it is now expected to set the new legacy
>>> DAI naming flag in order to instruct the core subsystem to use the
>>> legacy name format on DAI registration.
>>>
>>> Let's fix this by setting the legacy_dai_naming flag accordingly.
>>>
>>> Fixes: bc949a3b4af3 ("ASoC: core: Switch core to new DAI naming flag")
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>
>> It is really not intended for any CODECs to be using the legacy
>> DAI naming, it was only intended for platform side components.
>> Would be good if you had some details on the affected system and
>> if that could be updated to use the non legacy DAI naming?
> 
> I'm currently testing this on Valve's Steam Deck. Let me also check what 
> would be the required changes in order to switch to using a non-legacy 
> DAI naming.

I have just submitted a (proper) fix:
https://lore.kernel.org/all/20220721233227.1459374-1-cristian.ciocaltea@collabora.com/

Thanks,
Cristian

>> Thanks,
>> Charles
> 
