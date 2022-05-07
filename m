Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD6151E375
	for <lists+alsa-devel@lfdr.de>; Sat,  7 May 2022 04:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65131852;
	Sat,  7 May 2022 04:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65131852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651889261;
	bh=6Dh+yZgkhiSz333bl00fvi5xAGssPpK0s7mcrLZpq4g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lpCxOorC6MQZ5xpPF+Q+ei/W3PJ40xlUJ57s4gWRzCBoEe17THFrpdtfJHjWXXSQG
	 dJDdv7AeQslkjXgmw9QRK6V3KgTx0U++lSTbgCN13BBSUGdU+m5Erx9ZMZlX1M67PO
	 pMgC7OL0g0Two9UuShq2bkbGkOOXjE8JCkMmR2yk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F8EF80253;
	Sat,  7 May 2022 04:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 129C8F80155; Sat,  7 May 2022 04:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D53AF800D3
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 04:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D53AF800D3
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kw9kj2Q2WzhYyc;
 Sat,  7 May 2022 10:05:33 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 10:05:53 +0800
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Fix build warning without
 CONFIG_OF
To: Arnd Bergmann <arnd@arndb.de>
References: <20220506022638.15864-1-yuehaibing@huawei.com>
 <CAK8P3a2iPwOaRgrW6gw+8ZvxwKDROWFtoCz2LLF9RFDuDrEcJQ@mail.gmail.com>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <7204f405-444e-629b-67c5-db10959085ab@huawei.com>
Date: Sat, 7 May 2022 10:05:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2iPwOaRgrW6gw+8ZvxwKDROWFtoCz2LLF9RFDuDrEcJQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 2022/5/6 15:08, Arnd Bergmann wrote:
> On Fri, May 6, 2022 at 4:26 AM YueHaibing <yuehaibing@huawei.com> wrote:
>>
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1639:32: warning: ‘mt8195_mt6359_max98390_rt5682_card’ defined but not used [-Wunused-variable]
>>  1639 | static struct mt8195_card_data mt8195_mt6359_max98390_rt5682_card = {
>>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1634:32: warning: ‘mt8195_mt6359_rt1011_rt5682_card’ defined but not used [-Wunused-variable]
>>  1634 | static struct mt8195_card_data mt8195_mt6359_rt1011_rt5682_card = {
>>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8195/mt8195-mt6359.c:1629:32: warning: ‘mt8195_mt6359_rt1019_rt5682_card’ defined but not used [-Wunused-variable]
>>  1629 | static struct mt8195_card_data mt8195_mt6359_rt1019_rt5682_card = {
>>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> These variables is only used with CONFIG_OF, move it into the ifdef block.
>>
>> Fixes: 86a6b9c9dfff ("ASoC: mediatek: mt8195: add machine support for max98390 and rt5682")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> It's generally better to remove the #ifdef rather than expanding it,
> there is no need to
> save a few bytes on kernel builds of this driver that disable
> CONFIG_OF. Just drop
> the of_match_ptr() macro as well.

Sure, will do that in v2.
> 
> 
>         Arnd
> 
> .
> 
