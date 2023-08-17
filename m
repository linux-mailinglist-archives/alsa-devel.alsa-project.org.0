Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343677F420
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 12:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A289284C;
	Thu, 17 Aug 2023 12:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A289284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692267141;
	bh=3RaqEP+vLeMjjAbSGJ6G0q+wuMuIJ4jZC6Z2mk7VAhA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tZU/DgHfXhIeNYWsCOcBYvhi9NBFx7brXhkG479+PPWKwHdFjM/LvfKX/ncfd6Bqr
	 y7rCDdsMt2kuN7ktqCLPcJrINKcs8YOaWCD8l2bUQhxQ92GHVxfD/j6eW0BALNLFsN
	 fc9CRLF93a9jIqrjDpoRuWy0X4NwwNSo30ezpNfA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 377B0F8059F; Thu, 17 Aug 2023 12:10:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3880F8057A;
	Thu, 17 Aug 2023 12:10:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 384A6F8016D; Thu, 17 Aug 2023 10:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-8.2 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A445F800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 10:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A445F800D1
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RRJCQ1Zslz1GDRq;
	Thu, 17 Aug 2023 16:32:18 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 17 Aug 2023 16:33:39 +0800
Message-ID: <64abb3f8-3134-65a4-a56f-a405e40079ad@huawei.com>
Date: Thu, 17 Aug 2023 16:33:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next] ALSA: pcmtest: Drop unnecessary error check for
 debugfs_create_dir
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, Takashi Iwai <tiwai@suse.de>
CC: <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
References: <20230817063922.282746-1-ruanjinjie@huawei.com>
 <87bkf6w4go.wl-tiwai@suse.de>
 <021dc4f3-f544-237d-489f-2296c574ec62@huawei.com>
 <1182f6ea-f303-04f3-e19a-b8cb041252e3@gmail.com>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <1182f6ea-f303-04f3-e19a-b8cb041252e3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-MailFrom: ruanjinjie@huawei.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RBTEYKQDT6BZDYTRXMO5OALWO3FFPP5M
X-Message-ID-Hash: RBTEYKQDT6BZDYTRXMO5OALWO3FFPP5M
X-Mailman-Approved-At: Thu, 17 Aug 2023 10:10:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBTEYKQDT6BZDYTRXMO5OALWO3FFPP5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2023/8/17 16:30, Ivan Orlov wrote:
> On 17.08.2023 11:03, Ruan Jinjie wrote:
>> So the error check is necessary!
> 
> Yeah, it is. As Takashi already mentioned, debugfs in this case is the
> way how the driver communicates with userspace (forwards flags, receives
> filling patterns, etc.), so it is vital part of the driver.
> 
>>
>>>
>>> Maybe we should add a dependency on CONFIG_DEBUG_FS in Kconfig?
>>
>> I think it's ok!
> 
> It sounds like a great idea. Ruan, would you like to do this? If not, I
> will take it on.

Yes, I'd like to. I'll send it sooner. Thank you very much!

> 
> -- 
> Kind regards,
> Ivan Orlov
> 
