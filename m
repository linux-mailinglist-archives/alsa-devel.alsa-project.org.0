Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44489816A3E
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 10:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B2FDF1;
	Mon, 18 Dec 2023 10:52:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B2FDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702893166;
	bh=JibR4Llu/V6vJ2eVJD82/As0MXd0LHlRPjZ+x7EV2dk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QnyeVqneWWt5xaKgw1YE+QMHB6n2d93CyZFuUe80Tghxotg80e0w/DCNfrFtccjO6
	 /OH9xpLbQK+/ZyHCRJrydLCWACXFEVxsxOx1E5aTqadRDQEK98Lwkwm9sIDokyD+WB
	 C2GHeYs9pMV/1wQuDwEroUpOL3gCoFnbaXX4UJWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3539F805C4; Mon, 18 Dec 2023 10:52:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC975F805BD;
	Mon, 18 Dec 2023 10:52:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3003FF805AA; Mon, 18 Dec 2023 10:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6DA1F805A1
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 10:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6DA1F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LXp53MOr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 17A60B80B0D;
	Mon, 18 Dec 2023 09:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0B9C433C8;
	Mon, 18 Dec 2023 09:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702893111;
	bh=JibR4Llu/V6vJ2eVJD82/As0MXd0LHlRPjZ+x7EV2dk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LXp53MOrNNDX1PT7ZHKynD/Od/5XmEc0o/RutAOdCMxB+bEur+98HI/fBUHxM6mmz
	 RmRyxM+qBwpsLG2HsKIpQMkGlM/NmXBgtT5lcKPELou4+ZpDNsp4Pn6qRjJ+UtmC71
	 4PdNp/3mJovyJ5K5sWr/GH9w8og9UW8QgGDmgXtlryKslzMskXND4p3q4+I8ackgRI
	 uP5wYztWiGh/UwtYGRH196qEcMbLSTxY7SiGQdFwnuYNb6lNUld1UBmtmO/f32tIE6
	 BjPR0HW1r6oTFo+2wwgNpwxJSJuNoqYhy7pq7pv8LCFvPsTDBk5Gs5m079REa4EWoJ
	 nMwq4wUdRtr+g==
Message-ID: <66caf181-dc54-4161-81db-e77932c33327@kernel.org>
Date: Mon, 18 Dec 2023 10:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 10/10] ASoC: bindings: fsl-asoc-card: add compatible for
 generic codec
Content-Language: en-US
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: shengjiu wang <shengjiu.wang@gmail.com>, Xiubo Lee <Xiubo.Lee@gmail.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
References: <20231215144005.934728-1-elinor.montmasson@savoirfairelinux.com>
 <20231215144005.934728-11-elinor.montmasson@savoirfairelinux.com>
 <d095614a-071c-4ee8-8e47-5bf073aaabea@kernel.org>
 <299362992.190017.1702892951148.JavaMail.zimbra@savoirfairelinux.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: 
 <299362992.190017.1702892951148.JavaMail.zimbra@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XDUIJNXVLPBGIDLHKMS5FGPP5XBWWM64
X-Message-ID-Hash: XDUIJNXVLPBGIDLHKMS5FGPP5XBWWM64
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDUIJNXVLPBGIDLHKMS5FGPP5XBWWM64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/12/2023 10:49, Elinor Montmasson wrote:
> Hello,
> 
>>> Add documentation about new dts bindings following new support 
>>> for compatible "fsl,imx-audio-generic". 
>>
>> Please use subject prefixes matching the subsystem. You can get them for 
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory 
>> your patch is touching. 
> 
> I saw that most of the commits use "ASoC: dt-bindings:" prefix, but

This one, plEASE.

> commits related to "fsl-asoc-card.txt" use "ASoC: bindings:" prefix.
> Should I follow the general style or the file style ?

General style.

...

>>> The compatible list for this generic sound card currently: 
>>> @@ -48,6 +51,8 @@ The compatible list for this generic sound card currently: 
>>>
>>> "fsl,imx-audio-nau8822" 
>>>
>>> + "fsl,imx-audio-generic" 
>>
>> Generic does not look like hardware specific.
> 
> Even if our end goal is to use it with the S/PDIF controller, this new
> support can be used with different hardware that doesn't
> require a codec. Thus, we don't really want to specify "spdif" in it.
> 
> Is this compatible string not suitable ?
> Should we rename it to something else, like "fsl,imx-audio-no-codec" ?

Maybe Mark or Rob will help here, but for me "imx-audio" is just way too
generic.

Also, you add several new properties, so I really expect either
converting old binding to DT schema first or adding new device in DT
schema format.

Best regards,
Krzysztof

