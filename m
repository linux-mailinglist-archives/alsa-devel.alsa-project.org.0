Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53B4E14CD
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 10:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59FC41673;
	Wed, 23 Oct 2019 10:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59FC41673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571820899;
	bh=8zi/bmfUgcLvjXS+jroHx4W0zTAjbHt3TITgVNjnWDs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0HpS/Ij0I8lKIG0W2QnlzrOsLVxhqkbp0NFNOjnUbgqVD61euxIwo4Ae41U5YegZ
	 BqedpmKlIWXPl0dBH1ZcA7QHIgVD1qCQDefq1xu/GnJAtN2IJFbKhW9ZI13YYhwrdp
	 KdN5NM3qzYDwHGvq25fNlZQiSGmliiRzHnqSPG34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A170AF803D7;
	Wed, 23 Oct 2019 10:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C0AEF80368; Wed, 23 Oct 2019 10:38:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57642F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 10:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57642F80274
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DB97AD32800C05640DB2;
 Wed, 23 Oct 2019 16:38:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 23 Oct 2019
 16:38:33 +0800
To: Tzung-Bi Shih <tzungbi@google.com>
References: <20191023063103.44941-1-maowenan@huawei.com>
 <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
From: maowenan <maowenan@huawei.com>
Message-ID: <1d948ec1-69e4-735f-c369-80d2b28e0eaa@huawei.com>
Date: Wed, 23 Oct 2019 16:38:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wX7-tn-rXeKqnPtp74tU5cLxhJwF6XZ_jeQX-tnAfvO5g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.177.96.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Oct 2019 10:52:26 +0200
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



On 2019/10/23 16:32, Tzung-Bi Shih wrote:
> On Wed, Oct 23, 2019 at 2:31 PM Mao Wenan <maowenan@huawei.com> wrote:
>>
>> If SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=y,
>> below errors can be seen:
>> sound/soc/codecs/cros_ec_codec.o: In function `send_ec_host_command':
>> cros_ec_codec.c:(.text+0x534): undefined reference to `cros_ec_cmd_xfer_status'
>> cros_ec_codec.c:(.text+0x101c): undefined reference to `cros_ec_get_host_event'
>>
>> This is because it will select SND_SOC_CROS_EC_CODEC
>> after commit 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV"),
>> but SND_SOC_CROS_EC_CODEC depends on CROS_EC.
>>
>> Fixes: 2cc3cd5fdc8b ("ASoC: mediatek: mt8183: support WoV")
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  sound/soc/mediatek/Kconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
>> index 8b29f39..a656d20 100644
>> --- a/sound/soc/mediatek/Kconfig
>> +++ b/sound/soc/mediatek/Kconfig
>> @@ -125,7 +125,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
>>         select SND_SOC_MAX98357A
>>         select SND_SOC_BT_SCO
>>         select SND_SOC_TS3A227E
>> -       select SND_SOC_CROS_EC_CODEC
>> +       select SND_SOC_CROS_EC_CODEC if CROS_EC
>>         help
>>           This adds ASoC driver for Mediatek MT8183 boards
>>           with the MT6358 TS3A227E MAX98357A audio codec.
>> --
>> 2.7.4
>>
> 
> Just realized your patch seems not showing in the list
> (https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/thread.html).
> I have no idea why.
> 
I receive below message after I post, do you know why?
'''
Your mail to 'Alsa-devel' with the subject

    [PATCH] ASoC: mediatek: Check SND_SOC_CROS_EC_CODEC dependency

Is being held until the list moderator can review it for approval.

The reason it is being held:

    Post by non-member to a members-only list

Either the message will get posted to the list, or you will receive
notification of the moderator's decision.  If you would like to cancel
this posting, please visit the following URL:

    https://mailman.alsa-project.org/mailman/confirm/alsa-devel/574c24ad00f4d1aefc802a8a4b2c5fbda710e4e9
'''

> .
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
