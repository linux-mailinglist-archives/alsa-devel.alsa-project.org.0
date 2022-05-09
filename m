Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342851FC5A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 14:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD6218DD;
	Mon,  9 May 2022 14:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD6218DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652098378;
	bh=VbPh6mRdGjQDsMFyGe0Cb6Spbdh6LVTG4V6bxyqtnPk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxrbtV5U+ryaoH1Pq7y3WA/NHRh1sMsEf/BQ8uhqtChQQMep5Y1/3S2AFm8lhCPKa
	 dT26K85qTnIhOm5EsHjEmYBdnlVWX//JZUF13LsjMh33JabgWdVWj6RapEjLlMFBdB
	 //4mh2V0zMF36HwXaX3cSKkAGpAN4fMxfLDlow7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5DE2F80511;
	Mon,  9 May 2022 14:12:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB49F80510; Mon,  9 May 2022 14:12:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48428F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 14:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48428F8014C
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kxg250Jr4zGphW;
 Mon,  9 May 2022 20:09:01 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 9 May 2022 20:11:47 +0800
Subject: Re: [PATCH v2] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
To: Mark Brown <broonie@kernel.org>
References: <20220507021424.12180-1-yuehaibing@huawei.com>
 <YnkAAx3VAXCMFOTn@sirena.org.uk>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <3ba32c96-eec3-61a0-aece-d161d8db24ac@huawei.com>
Date: Mon, 9 May 2022 20:11:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <YnkAAx3VAXCMFOTn@sirena.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
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

On 2022/5/9 19:50, Mark Brown wrote:
> On Sat, May 07, 2022 at 10:14:24AM +0800, YueHaibing wrote:
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1639:32: warning: ‘mt8195_mt6359_max98390_rt5682_card’ defined but not used [-Wunused-variable]
>>  1639 | static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card = {
>>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This doesn't apply against current code, please check and resend (it
> looks like you have additional patches in your tree, am doesn't know the
> base SHA1s?).

Sorry, will rebase on next-20220509 ab
> 
