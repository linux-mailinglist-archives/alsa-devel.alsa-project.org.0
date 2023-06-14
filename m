Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C1672FACF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 12:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8596C1;
	Wed, 14 Jun 2023 12:26:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8596C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686738458;
	bh=rHhi//0DexlG3Dm2fQiKBaAn5pi9D6uWskgBFUDstuw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BUlwgmQYyQf4hnlLhElK4FQKelQmeGobalSVbBHrJOroJlt0GihBddybTEXh3EuAm
	 iUmT+dcbmLwB5HF3ROmYENNGUckssD48tyGynvTiONtkVQWpmBYOhgaFvbloFkZ9t7
	 rjzIMc0OY1kJuntISHr4pIDLpIygwNogkVaaaets=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 225B8F80093; Wed, 14 Jun 2023 12:26:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C559EF80132;
	Wed, 14 Jun 2023 12:26:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 219FDF80149; Wed, 14 Jun 2023 12:26:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4C4FF80130
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 12:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C4FF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rM+vkk+T
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88DBF63DBA;
	Wed, 14 Jun 2023 10:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C02C433C8;
	Wed, 14 Jun 2023 10:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686738374;
	bh=rHhi//0DexlG3Dm2fQiKBaAn5pi9D6uWskgBFUDstuw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=rM+vkk+TMffotpfcTthxxQ1AOJC1i8LWvIP1X6jT5ed3HHqh+84p3rWQcOjGARKgd
	 CzsZqxFf4NZ05GPzfvlemRE3p9/XGLWpm80pD7aMpMnIOgIQAqgAbFDFf0IgKtSrv8
	 F9mEGMEVC6aAeUGxklqueGyVsBXHvf8G/jUleHAxHvNUHLCieJ3CL3DelfzfweqGlY
	 a0nfZsuVJZ8qWHnOjcf8iPQSU1z5dScOobfbj28Se8XTaF62ydb38C1ulKeIEmPLnF
	 Tv1i1Z34CutsWL4SLQhPYezKEx9CW0MYg3b8VQtRphMVE8/TvZoyyRVO4+nsFcgmyy
	 FkUQ4Z+/7aasA==
Message-ID: <645989de-7a61-29e7-9cf8-f473b9b384fe@kernel.org>
Date: Wed, 14 Jun 2023 12:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt79xx-afe: add audio afe
 document
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>, "renzhijie2@huawei.com"
 <renzhijie2@huawei.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "perex@perex.cz"
 <perex@perex.cz>, =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?=
 <Jiaxin.Yu@mediatek.com>
References: <20230612105250.15441-1-maso.huang@mediatek.com>
 <20230612105250.15441-8-maso.huang@mediatek.com>
 <d9cd1ff3-b537-1481-9453-5b3683d30fed@kernel.org>
 <14913cbb87981eed6f8b72f9e659ed3e25958320.camel@mediatek.com>
 <d6289232-6276-a2d3-c059-1edcef6a1b6f@kernel.org>
 <a338bf978dfa0af84a6728ab66dc51e45a20c7c4.camel@mediatek.com>
 <4305b7f0-bbc8-f913-d9b1-d7b492df7ef4@kernel.org>
 <0977c72a4f63132104736b9de8aa8246abb34894.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <0977c72a4f63132104736b9de8aa8246abb34894.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CK6QPGB72434PC42U55UQOIPSPPO4KZK
X-Message-ID-Hash: CK6QPGB72434PC42U55UQOIPSPPO4KZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CK6QPGB72434PC42U55UQOIPSPPO4KZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/06/2023 11:19, Maso Huang (黃加竹) wrote:
> On Wed, 2023-06-14 at 10:21 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 14/06/2023 09:37, Maso Huang (黃加竹) wrote:
>>>>>> I already saw AFE, why it cannot be part of existing bindings?
>>>>
>>>> Can you answer this?
>>>>
>>>
>>> Did you mean mtk-afe-pcm.txt?
>>> If yes, I'll modify mtk-afe-pcm.txt to yaml format, and add mt7986
>> to
>>> its compatible list.
>>>
>>
>> No, I meant mediatek,mt8188-afe.yaml.
>>
>> Aren't you working on some old tree? If so, please don't...
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> AFE is common name for our audio hardware, and the design might be
> different for soc, like clock.
> 
> And the design is the same for mt7981/mt7986/mt7988.
> Is it better to create a new dtbinding file mediatk,mt7986-afe.yaml?

Is it different? That was my question whether it can be part of existing
bindings.

Best regards,
Krzysztof

