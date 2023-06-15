Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 959DA731969
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 14:59:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800CD6C1;
	Thu, 15 Jun 2023 14:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800CD6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686833996;
	bh=6rG0n+MCvKMJZeSH/oBsEjwwf9EMDZdOJDuWIvdHiC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uzWY+33C+mQlvbkV1oDdgvVaCpE4Hlpikfyuqvx8FQCSzDGSEjPQQMrRMUwDaEItU
	 qNyIEFgPXWGodxYz4l/QBOVSJk0hfwkoZDZfK9C8ROhBQ1/Cw5XoXZFFQz7VHmB6Gl
	 0DdhO4dabb9rpVYkSk/rlWWhzBNanIXA2zEtnkDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F79F80246; Thu, 15 Jun 2023 14:59:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F870F80093;
	Thu, 15 Jun 2023 14:59:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2943F80149; Thu, 15 Jun 2023 14:59:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B34C4F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 14:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B34C4F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=AAHpVA88
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 184CE86262;
	Thu, 15 Jun 2023 14:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1686833937;
	bh=CoPVgQejVWEK8px9zanv04a/R6+DcHZDe3wrnocLwGk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AAHpVA885KlCXOwz0Bca2C/rd5sN5PwLAUepIQ81rOIbuVSUX5T8x+Yz5N9Gv1tlp
	 oynjcSho88nicLdLLN24CqNj5asv7194aWpb4w8CXMt03EB7ZrVNr/D1xc+ZLett1v
	 DSM9GY9OjweZIKz3bBUitqVwHLWeRUYtNlsbRfRbEOdogpEV0cqxXAAD4Ow3XAm7KG
	 5jodOIHak6BS3IrFQnW6L4I2J31+I1OnV/zjrRfy/qyKDQGJnfIK7CplcWETGuFwdZ
	 ZzlnY2O1xX2eLpgy6a2Uh41/ZkRNfbJZmzUzOcj+xa0X4FyIway/sWP26vMK7hHinY
	 lXlRz5i2230Bg==
Message-ID: <664102f3-e963-531a-5e39-b556ca132ece@denx.de>
Date: Thu, 15 Jun 2023 14:58:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ASoC: dt-bindings: audio-graph-card: Expand 'widgets'
 documentation
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org
References: <20230606175951.215740-1-marex@denx.de>
 <d40f2c63-0b8a-425e-90a9-dd8f552ba782@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <d40f2c63-0b8a-425e-90a9-dd8f552ba782@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: UVCPXSFQ5WOMDZ737UZAO3QSVGQXW5GK
X-Message-ID-Hash: UVCPXSFQ5WOMDZ737UZAO3QSVGQXW5GK
X-MailFrom: marex@denx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVCPXSFQ5WOMDZ737UZAO3QSVGQXW5GK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/6/23 20:25, Mark Brown wrote:
> On Tue, Jun 06, 2023 at 07:59:51PM +0200, Marek Vasut wrote:
> 
>> Document the encoding of 'widgets' property to avoid confusion.
> 
>>     widgets:
>> -    description: User specified audio sound widgets.
>> +    description: |
>> +      User specified audio sound widgets.
>> +      Each entry is a pair of strings, the first being the type of
>> +      widget ("Microphone", "Line", "Headphone", "Speaker"), the
>> +      second being the machine specific name for the widget.
> 
> This looks sensible to me, I don't know if there's a way we can get the
> tooling to validate either the length or (ideally) the widget type
> strings?

It seems there is no way to do validation of every two elements for 
lists with variable number of elements.
