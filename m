Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1B2230C6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 03:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1570A1660;
	Fri, 17 Jul 2020 03:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1570A1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594950675;
	bh=foDOjP7B37latWV+2AtpKNyyb1oYEaS0LieX03as2Oo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebYr9JVTTWQ81L/P58N6+l1t2r2YXHPphCLgyh4GATN09uHatKaygXsu0lpIU+Ulg
	 6elojYe1u3idtGXg44UEhmGPb8asaid4ML2I4Rp9HeH5suhq1MK2VdOXjZIpeZP8c+
	 M7eXq/7gYjSyPyVWF+t4AIwg5gb+th4YrdeAQ9nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0ACF800E4;
	Fri, 17 Jul 2020 03:49:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1DA6F80217; Fri, 17 Jul 2020 03:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B04A5F800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 03:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B04A5F800E4
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6E78924D9B1F4BEE533D;
 Fri, 17 Jul 2020 09:49:20 +0800 (CST)
Received: from [10.174.179.105] (10.174.179.105) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 17 Jul
 2020 09:49:15 +0800
Subject: Re: [PATCH] ASoC: meson: add the missed kfree() for
 axg_card_add_tdm_loopback
To: Jerome Brunet <jbrunet@baylibre.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <khilman@baylibre.com>, <kuninori.morimoto.gx@renesas.com>
References: <20200716132558.33932-1-jingxiangfeng@huawei.com>
 <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Message-ID: <5F11039A.7040308@huawei.com>
Date: Fri, 17 Jul 2020 09:49:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.105]
X-CFilter-Loop: Reflected
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2020/7/16 21:29, Jerome Brunet wrote:
>
> On Thu 16 Jul 2020 at 15:25, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
>> axg_card_add_tdm_loopback() misses to call kfree() in an error path. Add
>> the missed function call to fix it.
>>
>> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
>> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
>
> Thanks for fixing this.
> Maybe it would be better to use the devm_ variant for the name instead ?

Ok, I'll send a v2 with this change.

Thanks for your review.
>
>> ---
>>   sound/soc/meson/axg-card.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
>> index 89f7f64747cd..6eac22ba8b99 100644
>> --- a/sound/soc/meson/axg-card.c
>> +++ b/sound/soc/meson/axg-card.c
>> @@ -121,8 +121,10 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
>>   		return -ENOMEM;
>>
>>   	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
>> -	if (!dlc)
>> +	if (!dlc) {
>> +		kfree(lb->name);
>>   		return -ENOMEM;
>> +	}
>>
>>   	lb->cpus = &dlc[0];
>>   	lb->codecs = &dlc[1];
>
> .
>
