Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F8E150A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 11:02:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9E061658;
	Wed, 23 Oct 2019 11:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9E061658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571821334;
	bh=T9sGVx/p8vK40PLt7vrpi1Nl3naOSKTV7206TRKRDX8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRMu2JZwY5BUPe4ss6M76TOa5YlA95X7FuZAKS7EEwFpM/n4yAsbA6eLqs6pJoSYu
	 TS5tRek5qqzMjcuLjX5wcvLsYlpPDO8hJzea+4Nfm8pVeUq9smrt2+MKifXzDkwUge
	 f8pMTOPllD6W24wHtGm3zNzaba6onoNbfOUAL5FM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AEBF80368;
	Wed, 23 Oct 2019 11:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B72EBF80368; Wed, 23 Oct 2019 11:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D718BF80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 11:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D718BF80274
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4D523CDCC9D6B47E0DAC;
 Wed, 23 Oct 2019 17:00:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 17:00:10 +0800
To: Tzung-Bi Shih <tzungbi@google.com>
References: <20191023063103.44941-1-maowenan@huawei.com>
 <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
 <1d948ec1-69e4-735f-c369-80d2b28e0eaa@huawei.com>
 <CA+Px+wXgXkmVYboPcrhOWkAwRB2ygLDLi+TN9xw2awUZKMhCJA@mail.gmail.com>
From: maowenan <maowenan@huawei.com>
Message-ID: <8ed955f7-a629-d438-f421-28aaa363532d@huawei.com>
Date: Wed, 23 Oct 2019 17:00:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXgXkmVYboPcrhOWkAwRB2ygLDLi+TN9xw2awUZKMhCJA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
Cc: linux-arm-kernel@lists.infradead.org, ALSA
 development <alsa-devel@alsa-project.org>, kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yuehaibing@huawei.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?U2h1bmxpIFdhbmcgKOeOi+mhuuWIqSk=?= <shunli.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, tglx@linutronix.de,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: mediatek: Check
	SND_SOC_CROS_EC_CODEC dependency
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2019/10/23 16:49, Tzung-Bi Shih wrote:
> On Wed, Oct 23, 2019 at 4:38 PM maowenan <maowenan@huawei.com> wrote:
>> I receive below message after I post, do you know why?
>> '''
>> Your mail to 'Alsa-devel' with the subject
>>
>>     [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency
>>
>> Is being held until the list moderator can review it for approval.
>>
>> The reason it is being held:
>>
>>     Post by non-member to a members-only list
> 
> I don't exactly know.  But I got similar messages when I first time
> sent mail to the alsa-devel.
> 
> Have you subscribed to alsa-devel mailing list?  I guess it is fine to
> wait maintainers to proceed your patch.
> 

OK. Thanks.

> .
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
