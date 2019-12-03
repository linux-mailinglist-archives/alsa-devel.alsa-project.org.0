Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796FE110157
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 16:33:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1DD1660;
	Tue,  3 Dec 2019 16:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1DD1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575387222;
	bh=hsL1gRmcXeYWdFK+leIFbvyZLqTFYsHv3Hfb76ag9BM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpuWXkppscnqIc0wpyXDMFJP0Z2ovmsz8RA7qGgM5SR/iVSuxzFvAOHJqe6BumYmJ
	 GBaE+GQatjT45JbMWoo8BuqKoDZHpx17lWdqby0LHwLRGDDAg2M80tMKkFjFR4BOjI
	 5ne2E+TY04OHlNgXHfq6UiKf9Bmh/X46DF9JFe4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E0BF80228;
	Tue,  3 Dec 2019 16:31:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDB9FF80227; Tue,  3 Dec 2019 16:31:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53244F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 16:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53244F800B4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 07:31:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="213443780"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
 by orsmga006.jf.intel.com with ESMTP; 03 Dec 2019 07:31:43 -0800
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.12]) by
 KMSMSX156.gar.corp.intel.com ([169.254.1.162]) with mapi id 14.03.0439.000;
 Tue, 3 Dec 2019 23:23:03 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: remove SRM lock check retry
Thread-Index: AQHVqaw+ii/fH1J6I0CEgpyDBLMztaeno36AgACHg7D//4yFAIAAv3yg//+DfwCAAIgLEA==
Date: Tue, 3 Dec 2019 15:23:03 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C7403CAFAE@PGSMSX108.gar.corp.intel.com>
References: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
 <AM5PR1001MB0994EB497D3BC7D0F4C6FD9080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CA7B2@PGSMSX108.gar.corp.intel.com>
 <AM5PR1001MB09946C295B8DAD5F9C8D191080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CACC7@PGSMSX108.gar.corp.intel.com>
 <AM5PR1001MB0994921AE80726BAC59C552B80420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM5PR1001MB0994921AE80726BAC59C552B80420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTQ4ZmU3YWEtZDJmZi00M2YyLTg3MGUtZDE4YWFkMWMxMjVhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaEh6N2FXOTE3R3JwNDVFWlFJdlFCNEs1WHZHZWpyb0U1d0JmT0JcL1dyaDNvQ3JFMEhRaFBxK0tMK2g4TFVWeTIifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: remove SRM lock check retry
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


> 
> Yes, that's right. I have put in a request with our HW team to again clarify
> timings, but still awaiting feedback.
> 
> The driver already warns via the kernel logs when SRM lock fails as follows:
> 
> 	dev_warn(component->dev, "SRM failed to lock\n");
> 
> What else do you think is needed?
> 

Hi Adam,

Let's say that the SRM locks in the second loop. The 50ms delay was applied
but there is no kernel log message about it because the value of srm_lock is
already true when exiting the loop. If we can print every SRM lock fail before
msleep() call, it would be a helpful for people resolving timing issues like Cold
latency.

do {
	pll_status = snd_soc_component_read32(component, DA7219_PLL_SRM_STS);
	if (pll_status & DA7219_PLL_SRM_STS_SRM_LOCK) {
		break;
	} else {
		++i;
		dev_warn(component->dev, "SRM failed to lock, retry in 50ms\n");
		msleep(50);
	}
} while (i < DA7219_SRM_CHECK_RETRIES);


Regards,
Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
