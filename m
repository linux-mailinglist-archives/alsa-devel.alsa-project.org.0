Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350BB82216C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 19:54:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0395ED9;
	Tue,  2 Jan 2024 19:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0395ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704221651;
	bh=Vex01gXMbe2m6SlvhVKxwa77DuvbhxycdTWGyQjXO08=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oxC5lUaC8pE5eOxd0mJNyHTrA3z5db2tGRhdrft+7p+iqR6NDzkSUCoq0VvU6DU7F
	 GRvggz1HsRkag/01BTj1uQ6GVNNYgtVEtOVIZ1Ps94ggdAkV7QYj+JQ3wttxyx4LPO
	 YMtyTbipMMbNqcG6ZDTzh3CVqH89UuyvGct3gIC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3319AF8085A; Tue,  2 Jan 2024 19:51:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D816FF89627;
	Tue,  2 Jan 2024 19:51:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F8CF8016E; Fri, 22 Dec 2023 11:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DB73F80124
	for <alsa-devel@alsa-project.org>; Fri, 22 Dec 2023 11:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DB73F80124
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4C6C324E2DC;
	Fri, 22 Dec 2023 18:03:37 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 22 Dec
 2023 18:03:37 +0800
Received: from [192.168.125.131] (113.72.145.47) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 22 Dec
 2023 18:03:36 +0800
Message-ID: <11c932a8-5596-4186-9c9d-ec8ca5a6ea35@starfivetech.com>
Date: Fri, 22 Dec 2023 17:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ASoC: Add Cadence I2S controller for
 StarFive JH8100 SoC
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Conor Dooley <conor@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
References: <20231221033223.73201-1-xingyu.wu@starfivetech.com>
 <20231221033223.73201-2-xingyu.wu@starfivetech.com>
 <20231221-saddlebag-tricolor-d02a17d66795@spud>
 <f1210b31-25af-4cbd-b73e-2a72aa6c41bf@sirena.org.uk>
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <f1210b31-25af-4cbd-b73e-2a72aa6c41bf@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.47]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NVEWLCDGJWTO4DYOFO4TSSBBGLGT4HMU
X-Message-ID-Hash: NVEWLCDGJWTO4DYOFO4TSSBBGLGT4HMU
X-Mailman-Approved-At: Mon, 01 Jan 2024 13:18:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVEWLCDGJWTO4DYOFO4TSSBBGLGT4HMU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/12/21 21:58, Mark Brown wrote:
> On Thu, Dec 21, 2023 at 01:53:00PM +0000, Conor Dooley wrote:
>> On Thu, Dec 21, 2023 at 11:32:22AM +0800, Xingyu Wu wrote:
> 
>> > +  cdns,i2s-max-channels:
>> > +    description: |
>> > +      Number of I2S max stereo channels supported by the hardware.
>> > +    $ref: /schemas/types.yaml#/definitions/uint32
>> > +    minimum: 1
>> > +    maximum: 8
> 
>> Mark, is there no common property for this kind of thing? That said,
>> there's one device here so the number is known at present.
>> Another note, this property is not required, so it should have a
>> default.
> 
> I wouldn't expect this to be a property in the first place, as currently
> presented this is specific to a single instance of the IP in a single
> SoC.  In general this is something that is obvious from the compatible
> and doesn't need a property, it's only plausibly useful for Cadence and
> Designware which is a very short list of vendors.

The Cadence I2S can support 8 channels. But on the JH8100 SoC, two instances of this just provide 4 channels to use, one just provides 2 channels, and the other one can provide 8 channels. Should I use the property name of 'jh8100,i2s-max-channels' instead for some special instances on the JH8100 SoC?

Best regards,
Xingyu Wu
