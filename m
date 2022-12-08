Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D586468F0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 07:12:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B4B718CE;
	Thu,  8 Dec 2022 07:11:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B4B718CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670479931;
	bh=rCzAUyg60+PXKT5Cc2WKvf2NTlg6c6AwejMMDSQ80dE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1CpMCgVcEm0QJeKEt6nNg+7rFapREB4+G4XBNnALyti7o9WTP0/t+wgv1BajBeyE
	 pbPCTTK7Sf4TKt1D+q4Otr264N0A9SSKBobLFNzyfv4OdepLq9Uk4tH7l4LW9KbIq0
	 MxyJmOIdGWpr8NnAJoLVnII/LNM/sjZ8XZqgD4Uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49C65F80121;
	Thu,  8 Dec 2022 07:11:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EACDF8020D; Thu,  8 Dec 2022 07:11:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0010EF80121
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 07:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0010EF80121
Received: from kwepemm600017.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NSNzg4g81zmWLC;
 Thu,  8 Dec 2022 14:10:07 +0800 (CST)
Received: from [10.174.176.131] (10.174.176.131) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Dec 2022 14:10:57 +0800
Message-ID: <803c31e1-5e33-2a96-835c-420815a6e7a5@huawei.com>
Date: Thu, 8 Dec 2022 14:10:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] ASoC: rockchip: spdif: Add missing
 clk_disable_unprepare() in rockchip_pdm_runtime_resume()
To: Mark Brown <broonie@kernel.org>
References: <20221205024317.2422223-1-wangjingjin1@huawei.com>
 <Y5Cb/1kRQVOrOT0Q@sirena.org.uk>
From: "Wangjingjin(KERNEL)" <wangjingjin1@huawei.com>
In-Reply-To: <Y5Cb/1kRQVOrOT0Q@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.131]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Right，will fix in v2
Thanks for review.

在 2022/12/7 21:58, Mark Brown 写道:
> On Mon, Dec 05, 2022 at 10:43:17AM +0800, Wang Jingjin wrote:
>> The clk_disable_unprepare() should be called in the error handling of
>> rockchip_pdm_runtime_resume().
>>
>> Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
>> Signed-off-by: Wang Jingjin <wangjingjin1@huawei.com>
>> ---
>>   sound/soc/rockchip/rockchip_pdm.c | 1 +
>>   1 file changed, 1 insertion(+)
> 
> The subject line says this is a fix for the S/PDIF driver but the patch
> is for the PDM driver and I see you sent a separate fix for the PDM
> driver.
