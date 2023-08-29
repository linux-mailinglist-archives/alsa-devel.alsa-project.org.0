Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A6A78C728
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541DAE12;
	Tue, 29 Aug 2023 16:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541DAE12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318658;
	bh=YgsBHhGpxW7Rx578n52mAjTmxjIU+d5czq2QT25rQzo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gve5te/NfKAj/chXIdmBXBazFxY9anfjAPoTn+VuN8cV0FFW10EsbQzIjNNoDOGH4
	 5BQrVbRDQbajyMcT3ZXEf/RSbhR+J28geBdIwbugZarFYpmqMY+E5Sc75zclq93FKy
	 JOVddqW5joIhR9fhe70YeZDCCLkrbu/n8l2I/hZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AD6CF800D1; Tue, 29 Aug 2023 16:14:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0639F8023B;
	Tue, 29 Aug 2023 16:14:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3B99F80158; Tue, 29 Aug 2023 09:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=NICE_REPLY_A,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A93EEF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 09:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A93EEF80094
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 51E66809C;
	Tue, 29 Aug 2023 15:04:24 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 15:04:24 +0800
Received: from [192.168.125.128] (113.72.145.245) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 29 Aug
 2023 15:04:23 +0800
Message-ID: <599bfee8-1928-0d4f-6d88-5d1996b2a450@starfivetech.com>
Date: Tue, 29 Aug 2023 14:59:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1] ASoC: dwc: Fix the warnnings about JH7110 ops
To: Takashi Iwai <tiwai@suse.de>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Walker Chen <walker.chen@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
References: <20230829033658.225713-1-xingyu.wu@starfivetech.com>
 <877cpewdvh.wl-tiwai@suse.de>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <877cpewdvh.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.145.245]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DC3AE2UPXPRQNTHBJLFQ6FP74AAOHZUW
X-Message-ID-Hash: DC3AE2UPXPRQNTHBJLFQ6FP74AAOHZUW
X-Mailman-Approved-At: Tue, 29 Aug 2023 14:14:49 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DC3AE2UPXPRQNTHBJLFQ6FP74AAOHZUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/8/29 14:40, Takashi Iwai wrote:
> On Tue, 29 Aug 2023 05:36:58 +0200,
> Xingyu Wu wrote:
>> 
>> Add a check of CONFIG_OF before the JH7110 ops to fix the warnings
>> that the JH7110 ops are defined but not used when CONFIG_OF is disabled.
>> 
>> Fixes: 1a512d13837a ("Add I2S support for the StarFive JH7110 SoC")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202308250433.nhzrhYEo-lkp@intel.com/
>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>> ---
>> Hi Mark,
>> 
>> This patch fixes the issue about the warning of JH7110 ops when CONFIG_OF
>> is disabled. So add a check of CONFIG_OF before defining JH7110 ops.
>> 
>> Thanks,
>> Xingyu Wu
> 
> The very same fix went already in my sound.git tree, commit
> 8d2a0cdf5229.
> 
> 
> thanks,
> 
> Takashi

Great, please ignore this patch.

Thanks,
Xingyu Wu
