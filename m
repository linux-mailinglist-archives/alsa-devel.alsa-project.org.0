Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E8254B3B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 18:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE0017E9;
	Thu, 27 Aug 2020 18:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE0017E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598547250;
	bh=ioySzM567hgVMfEdApVrSSQs+w2YYTUujl/DTEYGC58=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TW0DJ9DBglj6+GpjRH1KqHlQHM4CNivAw6DHfGeO5NqRVUqiDwnp8tWRW7hpLPz+t
	 yMVLRXEpKWMEkIpbZSt1301m7K92efgnteOAGOelVcnC1jh5u285BeIvnujI/tehnm
	 N3Eq8HlagUU9BWjS9EstMiwvo5UMnf2VD7fkwrqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0590F802DB;
	Thu, 27 Aug 2020 18:50:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E17F4F8025A; Tue, 25 Aug 2020 14:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H4, RCVD_IN_MSPIKE_WL, SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF9B4F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 14:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF9B4F800D1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0DE891BA80540EF3079A;
 Tue, 25 Aug 2020 20:57:25 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.103) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 25 Aug 2020 20:57:15 +0800
Subject: Re: [PATCH 1/2] ASoC: fsl: imx-es8328: add missing kfree() call in
 imx_es8328_probe()
To: Mark Brown <broonie@kernel.org>
References: <20200825120531.1479304-1-yukuai3@huawei.com>
 <20200825120531.1479304-2-yukuai3@huawei.com>
 <20200825121102.GF5379@sirena.org.uk>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <4b0147df-b773-6c04-ff08-0bbc8b668f5f@huawei.com>
Date: Tue, 25 Aug 2020 20:57:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200825121102.GF5379@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.103]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 27 Aug 2020 18:50:46 +0200
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 yi.zhang@huawei.com, festevam@gmail.com, s.hauer@pengutronix.de,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, yukuai@huawei.com, shawnguo@kernel.org, xobs@kosagi.com,
 shengjiu.wang@gmail.com, linux-arm-kernel@lists.infradead.org
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


On 2020/08/25 20:11, Mark Brown wrote:
> On Tue, Aug 25, 2020 at 08:05:30PM +0800, Yu Kuai wrote:
>> If memory allocation for 'data' or 'comp' succeed, imx_es8328_probe()
>> doesn't have corresponding kfree() in exception handling. Thus add
>> kfree() for this function implementation.
> 
>> @@ -151,7 +151,7 @@ static int imx_es8328_probe(struct platform_device *pdev)
>>   	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
>>   	if (!comp) {
> 
> The allocation is being done using devm_ which means no explicit kfree()
> is needed, the allocation will be automatically unwound when the device
> is unbound.

Hi,

Thanks for pointing it out, I'll remove this patch.

Best regards,
Yu Kuai

