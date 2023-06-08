Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D83729D59
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85F33DF1;
	Fri,  9 Jun 2023 16:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85F33DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322360;
	bh=6YGwRwEEjx3lGQFneK0OW37Lfsk0sAclHnKga5gKbeE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EeKBnh64JKy199H1UC0Z3kAQc7MYmnXRqCDe1xAawFSI9yVH1R1wnm7aBXKEigq+8
	 Isk4Y97NA6xGVs3o00LtJHIYQY5MiGTjSoDQoGsp1ZzBbgD29P+RWJsm9PSkOHsJvm
	 DRTNqhpClHT/YiG+q2FbvIvPjS3Apz7ayV61+T6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09FAFF80630; Fri,  9 Jun 2023 16:47:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B974F8062F;
	Fri,  9 Jun 2023 16:47:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC2A1F80199; Thu,  8 Jun 2023 12:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA49AF800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 12:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA49AF800ED
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2A4EB8284;
	Thu,  8 Jun 2023 18:43:11 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 18:43:11 +0800
Received: from [192.168.125.124] (183.27.98.122) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 18:43:10 +0800
Message-ID: <7db1d08e-8310-8876-4ed8-36d6e53ab8bf@starfivetech.com>
Date: Thu, 8 Jun 2023 18:43:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] ASoC: starfive: Cleanup and fix error check for JH7110
 TDM
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: Claudiu Beznea <Claudiu.Beznea@microchip.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai
	<tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
References: <20230607081439.1517-1-walker.chen@starfivetech.com>
 <3eb7ffc5-a16a-4ac2-93a0-260f7cb1f81c@sirena.org.uk>
 <d941ac20-e8b3-cb13-4258-3a9a86e978d3@starfivetech.com>
 <fbbc0963-fba5-4178-b886-fbb35c0c8df2@sirena.org.uk>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <fbbc0963-fba5-4178-b886-fbb35c0c8df2@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.122]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: K5RKCYDNGFND6NOAOUX2DPE4Q4XXBAMY
X-Message-ID-Hash: K5RKCYDNGFND6NOAOUX2DPE4Q4XXBAMY
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5RKCYDNGFND6NOAOUX2DPE4Q4XXBAMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/6/8 18:15, Mark Brown wrote:
> On Thu, Jun 08, 2023 at 10:15:03AM +0800, Walker Chen wrote:
>> On 2023/6/7 19:44, Mark Brown wrote:
> 
>> >> -		  (tdm->rx.wl << WL_BIT) |
>> >> -		  (tdm->rx.sscale << SSCALE_BIT) |
>> >> -		  (tdm->rx.sl << SL_BIT) |
>> >> -		  (tdm->rx.lrj << LRJ_BIT);
>> >> +	datarx = (tdm->rxwl << 8) |
>> >> +		  (tdm->rxsscale << 4) |
>> >> +		  (tdm->rxsl << 2) |
>> >> +		  TDM_PCMRXCR_LEFT_J;
> 
>> > I'm not sure this change to use numbers here is a win - the _BIT
>> > definitions look fine (I might've called them _SHIFT but whatever).
> 
>> This is Claudiu's advice. Using the macro BIT() to replace these definition of *_BIT, 
>> it will result in big changes in the code.
> 
> I'm questioning doing a change at all.
> 
>> Please refer to previous comments:
>>  https://lore.kernel.org/all/143e2fa2-e85d-8036-4f74-ca250c026c1b@microchip.com/
> 
> I can't find the comments you're referring to in there.

You should see the following comments in the link above:

> +       #define CLKPOL_BIT              5
> +       #define TRITXEN_BIT             4
> +       #define ELM_BIT                 3
> +       #define SYNCM_BIT               2
> +       #define MS_BIT                  1

Instead of these *_BIT defines as plain numbers you can defined them using
BIT() macro and use macros in place instead of

