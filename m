Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5783746497D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 09:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC002547;
	Wed,  1 Dec 2021 09:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC002547
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638346857;
	bh=XyBN8eo8QmyqlUADBMm+oDNxvUDb+R29sMXAHrTX4G8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjy2yCYsuA7eHmCOGtC1VwcKFz7bgOjQg2TFNeJ7Z+jDs4M/JnjSX9DaL4isjgH2A
	 fBEliE26DUoHJKb2b7OUx1ksUeWXmTOcKr2Afwi1GwnVcmaWKW9tXkXkYE8hOeuah0
	 uEu2fMPJck4g++eQ18kwTMUCnj5Vjgb1FQIhjDOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA593F80249;
	Wed,  1 Dec 2021 09:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 919B9F80246; Wed,  1 Dec 2021 09:19:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A230DF80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 09:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A230DF80121
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=cuibixuan@linux.alibaba.com;
 NM=1; PH=DS; RN=5; SR=0; TI=SMTPD_---0Uz06kv5_1638346762; 
Received: from 30.43.84.33(mailfrom:cuibixuan@linux.alibaba.com
 fp:SMTPD_---0Uz06kv5_1638346762) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 01 Dec 2021 16:19:23 +0800
Message-ID: <28ecff38-462c-450e-44b8-1cf2627f26a7@linux.alibaba.com>
Date: Wed, 1 Dec 2021 16:19:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [PATCH -next] ALSA: Fix oversized kvmalloc() calls
To: Takashi Iwai <tiwai@suse.de>
References: <1638270978-42412-1-git-send-email-cuibixuan@linux.alibaba.com>
 <s5h1r2x50uo.wl-tiwai@suse.de> <s5htuft20y6.wl-tiwai@suse.de>
 <30df3dc3-9160-e14f-16f5-139c63effd30@linux.alibaba.com>
 <s5hmtlkzt2s.wl-tiwai@suse.de>
From: Bixuan Cui <cuibixuan@linux.alibaba.com>
In-Reply-To: <s5hmtlkzt2s.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, inux-kernel@vger.kernel.org
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


在 2021/12/1 下午3:23, Takashi Iwai 写道:
>> But I think we can wait for this patch to be applied whether the problem
>> occurs.
> OK, I wrote a couple of more fixes for covering such cases in OSS
> layer.  Will submit a series later.

Ok.


Thanks,

Bixuan Cui
