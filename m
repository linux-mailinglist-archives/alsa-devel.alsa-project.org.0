Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A226ED04C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 16:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B84F47;
	Mon, 24 Apr 2023 16:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B84F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682346424;
	bh=eFlCU0Del0RTLEHmShM3wCEhfAT6JWSzmw4JDSAq5Ts=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Km1G7HAKExbMvJAYk+I1reoiN47FZEpHFHJgC7FS/O1Ayq0lHkWz1p14fY0I1AvFT
	 R3R8/708TJyRI0OzJ8wdoPlH5UgwcDfcs6jV0dNmBdH36l6Xdidi9wcOiU1OvWoUhV
	 0KjvK96ZfnWFwjugkuV9co7YB+quJrdHVvbBO7YY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC43F8052D;
	Mon, 24 Apr 2023 16:25:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F1D6F8018A; Mon, 24 Apr 2023 05:22:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-7.2 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C915DF80104
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 05:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C915DF80104
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1951B807B;
	Mon, 24 Apr 2023 11:21:13 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Apr
 2023 11:21:13 +0800
Received: from [192.168.125.124] (113.72.145.137) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Apr
 2023 11:21:12 +0800
Message-ID: <607f3604-056c-6f3a-b154-0f298b870811@starfivetech.com>
Date: Mon, 24 Apr 2023 11:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] riscv: dts: starfive: add tdm node and sound card
To: Conor Dooley <conor@kernel.org>
References: <20230420024118.22677-1-walker.chen@starfivetech.com>
 <20230420024118.22677-5-walker.chen@starfivetech.com>
 <20230421-dropper-upstage-200ae7e47092@spud>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230421-dropper-upstage-200ae7e47092@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.137]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y6GVVMTY3QBRUC4DWH45THGL2SEMDDCX
X-Message-ID-Hash: Y6GVVMTY3QBRUC4DWH45THGL2SEMDDCX
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:25:41 +0000
CC: Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6GVVMTY3QBRUC4DWH45THGL2SEMDDCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/4/22 0:50, Conor Dooley wrote:
> Hey Walker,
> 
> On Thu, Apr 20, 2023 at 10:41:18AM +0800, Walker Chen wrote:
>> Add the tdm controller node and sound card for the StarFive JH7110 SoC.
> 
> Is this one of these waveshare things + a visionfive 2?
> https://www.waveshare.com/wm8960-audio-hat.htm

Hey Conor,
I'm glad to receive your comments.

Now we are using this board + VisionFive2 :
https://wiki.seeedstudio.com/ReSpeaker_2_Mics_Pi_HAT/

> 
> I'm a bit lost as to why this needs a whole new board, should it not
> just be an overlay that you can apply to the existing dts?
> 
> Taking this to an extreme, should I expect to see a new devicetree for
> everything RPi hat that you decide to use with a VisionFive 2?

For your response, I did some thinking. Because wm8960 codec is not integrated
 on the VisionFive2 board, perhaps using overlay is a better way.

> 
> Also, it'd be nice to provide a Link: to where someone can find more
> info on this combination of items. Google for "wm8960 visionfive 2"
> gives me nothing, nor does "starfive audio card" etc.
> 
> Thanks,
> Conor.
> 
>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---

Best regards,
Walker



