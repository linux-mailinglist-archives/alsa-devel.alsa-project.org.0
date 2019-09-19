Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1FB7DE9
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 17:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861441674;
	Thu, 19 Sep 2019 17:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861441674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568906161;
	bh=C7TWrkU8zu19N9cF2VmcE0GKqfIvv7SbJPLGvE5OCSU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2exj6LRxSHntX7sa7C2NUVP6VguOUaKHlRyk23sZXvEOBcuZIfXEqSabAnAR9CbJ
	 psYutflsQZK1Q5YiODdLuXTX14+CKYnSWtXhLgRXy68m7jy9w7sdPVS1NunD8FePcn
	 TcMSI0KvCVcFFrrDZcei5L17Z8hGUw1Iwzx/iDqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F045AF80307;
	Thu, 19 Sep 2019 17:14:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F093DF80361; Thu, 19 Sep 2019 17:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68AE4F80146
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 17:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68AE4F80146
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-a.us-west-2.aws.symcld.net id C8/C4-25909-04B938D5;
 Thu, 19 Sep 2019 15:14:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRWlGSWpSXmKPExsWS8eIhj67D7OZ
 Yg/MPZC2uXDzEZNG5q5/VovPTEhYHZo8Nn5vYPFoebGX32Pd2GVsAcxRrZl5SfkUCa8bNV2sZ
 C3byVByafYK1gXEJTxcjF4eQwH9GifMvPzNDOC8YJT7f+cEE4exllNizZiNjFyMnB5uAhsT82
 TNZuhg5OEQEkiQ291qAmMwCWhJPu2RAKoQFsiU2/O9kBrFFBHIkTs34wwZhG0msnjWRGaScRU
 BVYntjDEiYV8BS4tHuO2BhIYECifNr7EDCnAI2Ejen7gHbySggJvH91BomEJtZQFzi1pP5YLa
 EgIDEkj3nmSFsUYmXj/+xgoyREFCQuLEhGeIuTYn1u/QhOhUlpnQ/ZIdYKihxcuYTlgmMorOQ
 DJ2F0DELSccsJB0LGFlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGhoDaQu9xCrdRL3SYt3y1OISX
 SO9xPJiveLK3OScFL281JJNjMBYSyloEtrBOHHWG71DjJIcTEqivBs6m2OF+JLyUyozEosz4o
 tKc1KLDzHKcHAoSfAumgGUEyxKTU+tSMvMAcY9TFqCg0dJhFcPJM1bXJCYW5yZDpE6xWjJMeH
 l3EXMHAePzgOSR+YuXcQsxJKXn5cqJc77cRpQgwBIQ0ZpHtw4WGq6xCgrJczLyMDAIMRTkFqU
 m1mCKv+KUZyDUUmYdwbIWp7MvBK4ra+ADmICOsguohHkoJJEhJRUAxP/VMvPPR5B23d+Ygz0e
 di8+CrX0a/SplEMPFO3MTyeIG/6581yeaFDWsZqh0z2f9t97ddpjYYTSTxZivyL2ttsd+i0sE
 YeS1G7tYzlSFbBxb4qvvorrb/l/x6bdCTvfPtnk6tKMfNP1L3O6SjaNjv67V03JsU7s8uyt+z
 sE9QwPGvEIKvXsfCN0mFGLrti/YDdj5Vu/rg4ZWG52Pqo426rpu7PmXDgQe45vX8e84Lqj3+L
 cvy4t2Lu1kvtlwNfJV4S/7J254aJIfvSZ2yeplBY03lg06Q5Bo6XVp95syh4mp3kom6DZ/9Or
 P2/c3XQ/e8Z+geLJqxZ+yVmBl9lkp/ijfopbEsmpLsIpHfunfziqhJLcUaioRZzUXEiAEiPGY
 7IAwAA
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-14.tower-326.messagelabs.com!1568906047!3907!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24363 invoked from network); 19 Sep 2019 15:14:08 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-14.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Sep 2019 15:14:08 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 49027E1A4D2C9A320EDF;
 Thu, 19 Sep 2019 11:14:07 -0400 (EDT)
Received: from reswpmail05.lenovo.com (10.62.32.4) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1591.10; Thu, 19 Sep
 2019 08:14:07 -0700
Received: from reswpmail05.lenovo.com ([fe80::41c7:6219:84e5:c550]) by
 reswpmail05.lenovo.com ([fe80::41c7:6219:84e5:c550%13]) with mapi id
 15.01.1591.008; Thu, 19 Sep 2019 08:14:07 -0700
From: Mark Pearson <mpearson@lenovo.com>
To: Jaroslav Kysela <perex@perex.cz>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [External]  Re: [alsa-devel] alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
Thread-Index: AQHVbvmGfT4V198Yt0etODfCnZfiT6czFmWA
Date: Thu, 19 Sep 2019 15:14:06 +0000
Message-ID: <c1cc53259b784e9f9bdd9ab8230ab605@lenovo.com>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <6449d5f6-959e-4384-4e80-b68171cd8091@perex.cz>
In-Reply-To: <6449d5f6-959e-4384-4e80-b68171cd8091@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.83.152]
MIME-Version: 1.0
Cc: Elimar Riesebieter <riesebie@lxtec.de>
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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
> Too many commmented lines inside without any explanation. The author
> should send the patch with the signed-off-by line. Also, we are working on
> the LGPL to BSD 3-Clause licence change, so it would be nice to indicate the
> agreement with this.
> 
Thanks Jaroslav,

I originally got this file from Ubuntu where they worked with Lenovo when certifying our X1 Carbon Gen7 system with Ubuntu. I believe it originally came from Intel but I will confirm. I hadn't even considered licence issues as there isn't a licence in the file - my bad. 

I'm working my way through the steps to make sure support for our platforms gets into Debian but am new to the process. All pointers would be much appreciated - I'm assuming the two files are going to be generic to all platforms using the whiskeylake processor (and likely over Intel processors?) so the SOF and Intel team likely already have plans for this. 

I can certainly clean up the file and confirm its original providence. 

A dumb question - but what do you mean by the signed-off-by line? I looked for a guideline to submitting bugs on the alsa-project wiki and couldn't find any details. 

Thanks
Mark
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
