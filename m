Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5711D68B796
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 09:43:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CE01E2;
	Mon,  6 Feb 2023 09:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CE01E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675673026;
	bh=9ZLvvMIwzcCdLn0lD2aAUua8JawGII/4z+2nZPG7Ik0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YyJEhrIrD3U+ir76CoChbd5RWDv/wl13cp+VAwJdG/QP4rGm5tEWjOULRVB11tu1Z
	 EHady+1S2pXxHv0tpYaY/itvVC7T1i+qc556JVnbfbSvbHhZhYdJL9SYqg0rGobtK+
	 JwUgbvk0UkIqOMycPt4y1V89WabOzlbd7bTtQkOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF034F804FB;
	Mon,  6 Feb 2023 09:42:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 318CCF804F1; Mon,  6 Feb 2023 09:42:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DB05F800F5
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 09:42:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB05F800F5
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P9KTz41dKzJsJP;
 Mon,  6 Feb 2023 16:40:55 +0800 (CST)
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm100007.china.huawei.com (7.185.36.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 6 Feb 2023 16:42:34 +0800
Subject: Re: [PATCH] ASoC: codecs: es8326: Fix DTS properties reading
To: Alexey Firago <a.firago@yadro.com>, <linux-kernel@vger.kernel.org>
References: <20230204195106.46539-1-a.firago@yadro.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <96c99731-a5e9-778d-24f5-cb42a5c2d840@huawei.com>
Date: Mon, 6 Feb 2023 16:42:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230204195106.46539-1-a.firago@yadro.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, zhuning0077@gmail.com,
 yangxiaohua@everest-semi.com, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 2023/2/5 3:51, Alexey Firago wrote:
> Seems like properties parsing and reading was copy-pasted,
> so "everest,interrupt-src" and "everest,interrupt-clk" are saved into
> the es8326->jack_pol variable. This might lead to wrong settings
> being saved into the reg 57 (ES8326_HP_DET).
>
> Fix this by using proper variables while reading properties.
>
> Signed-off-by: Alexey Firago <a.firago@yadro.com>

Fix tag is needed, it should be 5c439937775d ("ASoC: codecs: add support 
for ES8326")

Reviewed-by: Yang Yingliang <yangyingliang@huawei.com

