Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E4876DE
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 12:02:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD9A81661;
	Fri,  9 Aug 2019 12:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD9A81661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565344921;
	bh=Y7WEkUifS9HNbVKIUNYDyYFPXWc7yYUYtNJTfNGa6tM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4f+nvuQUmgCxUlMorqfO3uyRfMzcb3D5YUDiUvRxOJFl9G58FiY9XdCzXYJYvIES
	 eZyjzkx2iWK+bWz4kqZCfUz1LkdCRqsBw0tgYZFLahYKi+czg7oQTh/WzILdO4OZVQ
	 +pB/Yd8aJ7ZpUmVowG1N3t4SFBya2PlilMHxziqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ADA6F80391;
	Fri,  9 Aug 2019 12:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3748F803F3; Fri,  9 Aug 2019 12:00:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74209F801A4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 12:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74209F801A4
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AA1DC8056351D9C7BCC4;
 Fri,  9 Aug 2019 18:00:06 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 9 Aug 2019 18:00:02 +0800
To: Takashi Iwai <tiwai@suse.de>
References: <20190809090620.70496-1-yuehaibing@huawei.com>
 <s5hk1bmhe9t.wl-tiwai@suse.de>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <85696583-655b-06dd-d851-c8bfdaab7924@huawei.com>
Date: Fri, 9 Aug 2019 18:00:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <s5hk1bmhe9t.wl-tiwai@suse.de>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: kstewart@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, rfontana@redhat.com,
 armijn@tjaldur.nl, broonie@kernel.org, allison@lohutok.net
Subject: Re: [alsa-devel] [PATCH -next] ALSA: Au88x0 - remove some unused
 const variables
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

On 2019/8/9 17:35, Takashi Iwai wrote:
> On Fri, 09 Aug 2019 11:06:20 +0200,
> YueHaibing wrote:
>>
>> sound/pci/au88x0/au88x0_xtalk.c:121:28: warning: asXtalkWideCoefsRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:152:28: warning: asXtalkNarrowCoefsRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:175:28: warning: asXtalkCoefsNegPipe defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:183:28: warning: asXtalkCoefsNumTest defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:191:28: warning: asXtalkCoefsDenTest defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:199:28: warning: asXtalkOutStateTest defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:20:20: warning: sXtalkWideKRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:231:28: warning: asDiamondCoefsRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:24:20: warning: sXtalkWideShiftRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:30:20: warning: sXtalkNarrowKRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:34:20: warning: sXtalkNarrowShiftRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:38:28: warning: asXtalkGainsDefault defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:43:28: warning: asXtalkGainsTest defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:48:28: warning: asXtalkGains1Chan defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:67:28: warning: alXtalkDlineTest defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:77:30: warning: asXtalkInStateTest defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:92:20: warning: sDiamondKRightXt defined but not used [-Wunused-const-variable=]
>> sound/pci/au88x0/au88x0_xtalk.c:96:20: warning: sDiamondShiftRightXt defined but not used [-Wunused-const-variable=]
> 
> Some of them are rather a bug, likely the wrong register and data is
> used (left instead of right).  They have to be fixed instead of
> removing.
> 
> And some are indeed unused, but I'd leave them with ifdef or such.
> Such magical values do have some meaning (as the driver code was the
> result from reverse-engineering) and blindly removing it also loses
> the information -- though, the driver is tad old and likely broken, so
> practically seen no big impact.

Agree, just leave them this, Thanks!

> 
> 
> thanks,
> 
> Takashi
> 
> .
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
