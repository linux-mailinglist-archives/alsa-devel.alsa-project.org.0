Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5E729D5D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E3E1DF4;
	Fri,  9 Jun 2023 16:52:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E3E1DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322382;
	bh=neOBnhJPaaPb1ivhRmmnvumdfCbwHGG7NGRGFyq3bQw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UEiNH6DuvB5tOIloc9GXC0TWU2tyWa/mLr9aRJWyypHtvqXuH3GOCipdYNgLI7TKM
	 UGk5ZGbGnyYLUuQkxFdKrfUNrMMPnUe8yyQm9h5xWgEKhlmSrDJ0/aa2zwgjKo0HAT
	 q4JDoa6EYxF51oCkHYI4PzS9qas7xJQ6Nu3xszj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A804CF80641; Fri,  9 Jun 2023 16:47:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5D79F80638;
	Fri,  9 Jun 2023 16:47:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4918F80199; Thu,  8 Jun 2023 14:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65856F80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 14:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65856F80155
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id ADAD624E21A;
	Thu,  8 Jun 2023 20:17:03 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 20:17:03 +0800
Received: from [192.168.125.124] (183.27.98.122) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 8 Jun
 2023 20:17:03 +0800
Message-ID: <1eab400c-b568-3042-ebb6-e8244dee0149@starfivetech.com>
Date: Thu, 8 Jun 2023 20:17:02 +0800
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
 <7db1d08e-8310-8876-4ed8-36d6e53ab8bf@starfivetech.com>
 <c974d0c7-b091-4d5c-b73c-1b6584eb823a@sirena.org.uk>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <c974d0c7-b091-4d5c-b73c-1b6584eb823a@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.122]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OT6LODDXJAYNFF3NVEHWA6V6HWRUL2IR
X-Message-ID-Hash: OT6LODDXJAYNFF3NVEHWA6V6HWRUL2IR
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OT6LODDXJAYNFF3NVEHWA6V6HWRUL2IR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/6/8 18:50, Mark Brown wrote:
> On Thu, Jun 08, 2023 at 06:43:09PM +0800, Walker Chen wrote:
>> On 2023/6/8 18:15, Mark Brown wrote:
> 
>> > I can't find the comments you're referring to in there.
> 
>> You should see the following comments in the link above:
> 
>> > +       #define CLKPOL_BIT              5
>> > +       #define TRITXEN_BIT             4
>> > +       #define ELM_BIT                 3
>> > +       #define SYNCM_BIT               2
>> > +       #define MS_BIT                  1
> 
>> Instead of these *_BIT defines as plain numbers you can defined them using
>> BIT() macro and use macros in place instead of
> 
> The usual pattern is to have defines for both the shift and the mask,
> not just one.

OK, I see. It's not necessary to make these changes.
Thanks.

Best regards,
Walker
