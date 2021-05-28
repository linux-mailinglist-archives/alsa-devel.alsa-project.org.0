Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C80839430E
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 14:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C7116D8;
	Fri, 28 May 2021 14:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C7116D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622206630;
	bh=wGJF/2btJJ4l36Oy70ZiWT0lX3fopOARIIgoe4CQJmk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atEShMeQWQ1MYj3tadMkoyUcqdMP2gjLwYP+4tXHCPdx08RXzWxqrUrLqXA7JPtLs
	 ar+PCpzkuLmCndTtob9v1CxJFpTyDEmNRtgKbOiL7wnM7F1R34YNATrtYJm2WZ8+9Z
	 rU2Ausj8TJyAtLmlb4ttlgClQ/v54P9ZdYEuUtRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD9DF8013A;
	Fri, 28 May 2021 14:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9398EF804AC; Fri, 28 May 2021 14:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bitmer.com (49-237-179-185.static.tentacle.fi [185.179.237.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE21F8013A
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 14:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE21F8013A
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142]
 helo=[192.168.1.42])
 by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jarkko.nikula@bitmer.com>)
 id 1lmc1R-000691-6Y; Fri, 28 May 2021 15:55:29 +0300
Subject: Re: [PATCH -next] ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
To: YueHaibing <yuehaibing@huawei.com>, peter.ujfalusi@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20210528063033.19904-1-yuehaibing@huawei.com>
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <4e8da5c2-9a9e-c0a9-f944-8e0e9f30f47e@bitmer.com>
Date: Fri, 28 May 2021 15:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210528063033.19904-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On 5/28/21 9:30 AM, YueHaibing wrote:
> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
