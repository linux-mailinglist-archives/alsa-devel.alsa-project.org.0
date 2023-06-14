Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBA72F7B5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 10:22:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077646C1;
	Wed, 14 Jun 2023 10:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077646C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686730966;
	bh=BsZTuutCh856RNx2ULjyPLPmt60hHYf1LHHBx8Asvps=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=iVyHyid/PzbLV9RgO6hoLCDE/M8TsrIyj0rfuYm+sW4vnAzHh41rLQmTeuIXS1xb4
	 GRnTcrNUd+f46Rs9bdZrW3uVjMbZkR/Ovx3G8guQP0gkQsrcQsYk1fVzBAlef1Pv+I
	 pC+wP4y8plXeuyNYAjqQVGMzkPy0ZTof329fhOHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E7CDF80130; Wed, 14 Jun 2023 10:21:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13BAFF800BA;
	Wed, 14 Jun 2023 10:21:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26905F80149; Wed, 14 Jun 2023 10:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5FDBF800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 10:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5FDBF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XVbYYO51
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A8B563725;
	Wed, 14 Jun 2023 08:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD29C433C8;
	Wed, 14 Jun 2023 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686730883;
	bh=BsZTuutCh856RNx2ULjyPLPmt60hHYf1LHHBx8Asvps=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XVbYYO51Ng/2pKNt9wStnde63CQuf2l/cTiEPovF7pJkCDxinWf6S20QgOVhdvXlE
	 I4VGXrHkKO3hCGOGg2LWBX//g2pM2NPBmgKWPWabLjthjYCXbgsvoRxFfKXxHX8Qsl
	 +kf4Gp0jp7EZ899zLKQxtUHg7t+YOyyGcUgnYyHXHNjALSxyuWWmgX2C1eD+yFpUy5
	 N6gzpghgjBLJAH40idTDMxEAFvVyPJeraKkHK80XRt1Wy3+kXK+YCOMgpLshRwTIE1
	 Ra58PT/oKsRPFEDKbNUp9Zos3YruNtsLwiU4Q+ouB/Wwe5n+atW1wLW769h9f7S+Be
	 SoDA2vxuBsP9A==
Message-ID: <4305b7f0-bbc8-f913-d9b1-d7b492df7ef4@kernel.org>
Date: Wed, 14 Jun 2023 10:21:14 +0200
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
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <a338bf978dfa0af84a6728ab66dc51e45a20c7c4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NIJNVDFVZ6FUO74ZQS3WWU7Y4M2OSAZS
X-Message-ID-Hash: NIJNVDFVZ6FUO74ZQS3WWU7Y4M2OSAZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIJNVDFVZ6FUO74ZQS3WWU7Y4M2OSAZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/06/2023 09:37, Maso Huang (黃加竹) wrote:
>>>> I already saw AFE, why it cannot be part of existing bindings?
>>
>> Can you answer this?
>>
> 
> Did you mean mtk-afe-pcm.txt?
> If yes, I'll modify mtk-afe-pcm.txt to yaml format, and add mt7986 to
> its compatible list.
> 

No, I meant mediatek,mt8188-afe.yaml.

Aren't you working on some old tree? If so, please don't...

Best regards,
Krzysztof

