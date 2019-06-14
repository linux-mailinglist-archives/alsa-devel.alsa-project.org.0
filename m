Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB804519C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 04:04:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDECD1854;
	Fri, 14 Jun 2019 04:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDECD1854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560477843;
	bh=/SpFtSON0ZiKG83+/bIUY4UrUyFw65IYkYYO1ZQkaaU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvFLi3ERhAThVGWkC6UWOkTeC3+zqxhtFESKV4h/k0qU6P8ynIb4vJJJJZbwqC3Iv
	 Y9iQb2wZNkrp4Jyz+/iF1OKznY5EZoqH3xto5nfwjKHJqqCSTHPCfxwUcjY70/nvih
	 cD2v9zcP6UtyQrenE2s7GKcUOCTW3Cg6zIwb8q+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3819F896E0;
	Fri, 14 Jun 2019 04:02:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D273F896E0; Fri, 14 Jun 2019 04:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HTML_MESSAGE,PRX_BODY_78,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 846ABF80764
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 04:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846ABF80764
Received: from NTHCCAS02.nuvoton.com (nthccas02.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id C85421C80DED;
 Fri, 14 Jun 2019 10:02:04 +0800 (CST)
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCCAS02.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Fri, 14 Jun 2019
 10:02:04 +0800
Received: from [10.4.60.63] (10.4.60.63) by NTHCML01A.nuvoton.com (10.1.8.176)
 with Microsoft SMTP Server (TLS) id 15.0.1130.7;
 Fri, 14 Jun 2019 10:02:04 +0800
To: Mark Brown <broonie@kernel.org>
References: <20190610024029.12193-1-KCHSU0@nuvoton.com>
 <20190610034040.12629-1-KCHSU0@nuvoton.com>
 <20190613112042.GJ5316@sirena.org.uk>
From: AS50 KCHsu0 <KCHSU0@nuvoton.com>
Organization: AS50, Nuvoton Technology Corp.
Message-ID: <cb856871-aa10-d67d-4900-823578f2f40e@nuvoton.com>
Date: Fri, 14 Jun 2019 10:02:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190613112042.GJ5316@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.4.60.63]
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, cychiang@google.com, WTLI@nuvoton.com,
 lgirdwood@gmail.com, yuhsuan@google.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com, Cheng-Yi Chiang <cychiang@chromium.org>, mhkuo@nuvoton.com
Subject: Re: [alsa-devel] [PATCH] ASoC: nau8825: fix fake interruption when
	booting
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 6/13/2019 7:20 PM, Mark Brown wrote:

On Mon, Jun 10, 2019 at 11:40:40AM +0800, John Hsu wrote:


There is no pull-up resistor at IRQ line where it connects from
the codec to SoC. When booting, the signal of IRQ pin will keep low



On some specific system?


No, not really.
The ISR is made for active low. The setup decreases the risk of
system damage, in case the hardware has no pull-up resistor.



Please don't send new patches in the middle of old threads, it makes it
hard to spot them and work out what the current version is.


I understand. Thanks for reminding. Sorry for a little pushy.





===========================================================================================
The privileged confidential information contained in this email is intended for use only by the addressees as indicated by the original sender of this email. If you are not the addressee indicated in this email or are not responsible for delivery of the email to such a person, please kindly reply to the sender indicating this fact and delete all copies of it from your computer and network server immediately. Your cooperation is highly appreciated. It is advised that any unauthorized use of confidential information of Nuvoton is strictly prohibited; and any information in this email irrelevant to the official business of Nuvoton shall be deemed as neither given nor endorsed by Nuvoton.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
