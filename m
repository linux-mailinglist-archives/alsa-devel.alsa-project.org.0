Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527B6904BB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 11:27:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B38C851;
	Thu,  9 Feb 2023 11:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B38C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675938463;
	bh=eHmPGXHNcPrTmMdQR0QDsjblTVBOeO8w5mDS6XIEA3U=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oMbscivV6QdfYScCSnLPnbdkJHnyURR+KHepyub2bJ9hrPDKI3Yw01LNLqB5+pVfY
	 SkaYhR4yqwiXWzOt64F1cMIVtuTQDT29/pvHXb6NLQe9iPWBbLdoz5N5LUXT+K4imY
	 bwFGXxwAXMMWddpdGucK5oFooHxCcXqzEG/yGMkE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EEF4F800B8;
	Thu,  9 Feb 2023 11:26:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B338F800E4; Thu,  9 Feb 2023 11:26:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC2C8F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 11:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC2C8F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=VuOEMjMf
Received: from [192.168.86.246]
 (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B7A0A66020BA;
	Thu,  9 Feb 2023 10:26:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675938399;
	bh=eHmPGXHNcPrTmMdQR0QDsjblTVBOeO8w5mDS6XIEA3U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VuOEMjMfqMpDKVUM6/ks3zjKObkU0jXs2lXmRc3TeIVqVZeglz7WfHD4lD7cKTOg0
	 KAdg/X01ricApYBBMR6MxIGqM7pMDTxlY8hh2nCFXiPH/HHKzKRx1Iin1HBHZejmH1
	 v31bD+G2zX1AIsBZLvmUAAwhLWzbGC6P+YV5y/ow0V3MPbnCc/ha28N9egpUW0Ec4i
	 +SW3LTU8sIB/bHcjM4E4kpceaaK4R3lCJBm/o0W7UDky9z0gZsVl13lbydI1EWMfjF
	 3KHfJsH3WMBgvspGKYf/WmLmaLEDtC4qGM43ZeBDR4qFPYplxQQTR6QKXWNPJ9o1/P
	 PdMjR1aIdzZFw==
Message-ID: <a6601fb7-284b-f51a-25a5-09b7733fd5f6@collabora.com>
Date: Thu, 9 Feb 2023 10:26:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 4/4] ASoC: cs35l41: Document CS35l41 shared boost
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230209083726.1337150-1-lucas.tanure@collabora.com>
 <20230209083726.1337150-5-lucas.tanure@collabora.com>
 <9b20bdb2-64e0-4888-e8df-fdf1b021c445@linaro.org>
Content-Language: en-US
From: Lucas Tanure <lucas.tanure@collabora.com>
In-Reply-To: <9b20bdb2-64e0-4888-e8df-fdf1b021c445@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UJWC7VPMNYOO5LTHBMSADP3ASNECOYOC
X-Message-ID-Hash: UJWC7VPMNYOO5LTHBMSADP3ASNECOYOC
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJWC7VPMNYOO5LTHBMSADP3ASNECOYOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09-02-2023 08:53, Krzysztof Kozlowski wrote:
> On 09/02/2023 09:37, Lucas Tanure wrote:
>> Describe the properties used for shared boost configuration.
>> Based on David Rhodes shared boost patches.
> 
> No improvements in subject, I asked twice for it. What does the command,
> I gave you, print?
> 
Should be
ASoC: dt-bindings: cirrus,cs35l41: Document CS35l41 shared boost

ok?

>>
> With fixed subject:
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

