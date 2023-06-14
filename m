Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38DC72F4F5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 08:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05769822;
	Wed, 14 Jun 2023 08:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05769822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686724585;
	bh=u5PKSpPmNVmi2EPSJSrzJB16SUgI6GfaClALRkeVqq0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=d7uk8eWZbZUl3UC+t5jIBECNO7JwZ/CVg3ZlHutkSANsCmBs+S9qDZY+G/1hyEdQ7
	 cLO4m1ifzVDJwOIOeBe2RiJCZw7KGVcNi4QZPyCyr3Ht1nK5NOkeAGkE+gXXvjeekr
	 WtkOP/jl1gOcZnQVEhn079zjpJtzW9uouiRnTECo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB96AF80246; Wed, 14 Jun 2023 08:35:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 858AEF80130;
	Wed, 14 Jun 2023 08:35:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A59F5F80132; Wed, 14 Jun 2023 08:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FE0EF80093
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 08:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE0EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rHhsIloj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F24706184B;
	Wed, 14 Jun 2023 06:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95741C433C0;
	Wed, 14 Jun 2023 06:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686724496;
	bh=u5PKSpPmNVmi2EPSJSrzJB16SUgI6GfaClALRkeVqq0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=rHhsIlojYnPPn7FESMmYDbDhLHV3oLskENEUwFsoKGAc8eS2NTb4i0DxSU+zKRarY
	 xiw1/cHuwvDXvAdWnYvmBFV+OOxaha57M1NH1/bEO5zsLeN2WdMsPWFjgyiaS9cTRL
	 IBJXrjevWGQQFelietXH4JGHnjcMF2JJc+bdIC6ia6vRgfClri+68ItfUt4bBpCNpU
	 gTyM3R83v2Y2AcOmUztBQt+dgMtkfxI568C27/qhAjrG0Jl+HIQWkTrOulkpbFS2gI
	 3DDhYMxSS+Vzm5qobXZ326T8c4DzdGnHsQEdBNhpCH7lpNCTHpRsQu1bwJUNPNgDyT
	 ZB0c65R7XH8Cw==
Message-ID: <d6289232-6276-a2d3-c059-1edcef6a1b6f@kernel.org>
Date: Wed, 14 Jun 2023 08:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt79xx-afe: add audio afe
 document
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>, "renzhijie2@huawei.com"
 <renzhijie2@huawei.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>
References: <20230612105250.15441-1-maso.huang@mediatek.com>
 <20230612105250.15441-8-maso.huang@mediatek.com>
 <d9cd1ff3-b537-1481-9453-5b3683d30fed@kernel.org>
 <14913cbb87981eed6f8b72f9e659ed3e25958320.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <14913cbb87981eed6f8b72f9e659ed3e25958320.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MBSQ5BLFXMKDHDDOQGJIZJLHXESPB22H
X-Message-ID-Hash: MBSQ5BLFXMKDHDDOQGJIZJLHXESPB22H
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBSQ5BLFXMKDHDDOQGJIZJLHXESPB22H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/06/2023 05:17, Maso Huang (黃加竹) wrote:
> On Tue, 2023-06-13 at 10:51 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  
>> On 12/06/2023 12:52, Maso Hunag wrote:
>>> From: Maso Huang <maso.huang@mediatek.com>
>>>
>>> Add mt79xx audio afe document.
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary
>> people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you
>> base
>> your patches on recent Linux kernel.
>>
> 
> Hi Krzysztif, 
> 
> Thanks for your review. And sorry for missing some necessary
> maintainers.
> What's your suggestion, resend these patches again with them, or add
> them back in v2 patch?


You need to fix the patch anyway, so use get_maintainers.pl in v2. I
don't understand why you Cc here many unrelated people but not the
actual maintainers which get_maintainers.pl asks you to Cc!

> 
>>>
>>> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
>>> ---
>>>  .../bindings/sound/mediatek,mt79xx-afe.yaml   | 102
>> ++++++++++++++++++
>>>  1 file changed, 102 insertions(+)
>>>  create mode 100644
>> Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
>> b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-afe.yaml
>>> new file mode 100644
>>> index 000000000000..11ef1cfdf49b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-
>> afe.yaml
>>> @@ -0,0 +1,102 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/mediatek,mt79xx-afe.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek AFE PCM controller for MT79xx
>>
>> 79XX sounds weird. Are you sure you are not using wildcards (which
>> are
>> not allowed)?
>>
> 
> We would like to use mt79xx for mt7986/mt7981/mt7988 series.
> Or is it better to just use mt7986 for this series?

You cannot use wildcard. Get some internal review of your patches prior
to submission to mailing list.

https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst

> 
>>> +
>>> +maintainers:
>>> +  - Maso Huang <maso.huang@mediatek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: mediatek,mt79xx-afe
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt7981-afe
>>> +              - mediatek,mt7986-afe
>>> +              - mediatek,mt7988-afe
>>> +          - const: mediatek,mt79xx-afe
>>
>> I already saw AFE, why it cannot be part of existing bindings?

Can you answer this?

>>
>> This list is odd. 79xx, 7981? So it is wildcard?
>>
> 
> Yes, it is wildcard for mt7986/mt7981/mt7988 series.
> Is it better to just use mt7986 for this series? 

No wildcards.


Best regards,
Krzysztof

