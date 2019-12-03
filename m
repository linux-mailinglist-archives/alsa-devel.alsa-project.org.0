Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516C110073
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 15:37:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65A01616;
	Tue,  3 Dec 2019 15:36:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65A01616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575383857;
	bh=lRRg45K1FaozDXZf2W7pJRo9Rj/V3GUgKkApOwWDTN0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2vUDtk9KLlrzg54RR4enAcAIFsCI6htlaDpbEOZaZQpbCKqx11gHyc0DQOEw0E0L
	 IDbHI8z1NGCA40vcZ2BbclTe05JuuXido7KqshCt+TtfV5Pp0c/23WCZDbydvlwJG0
	 z9R1nFuixPBombk/fXjC/j7G8eeCdBCNgBGy8H2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A5AF8022D;
	Tue,  3 Dec 2019 15:36:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E807F8022C; Tue,  3 Dec 2019 15:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_29,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB802F80229
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 15:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB802F80229
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 06:36:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="213443837"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
 by orsmga003.jf.intel.com with ESMTP; 03 Dec 2019 06:36:24 -0800
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.12]) by
 PGSMSX105.gar.corp.intel.com ([169.254.4.81]) with mapi id 14.03.0439.000;
 Tue, 3 Dec 2019 22:36:24 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: da7219: remove SRM lock check retry
Thread-Index: AQHVqaw+ii/fH1J6I0CEgpyDBLMztaeno36AgACHg7D//4yFAIAAv3yg
Date: Tue, 3 Dec 2019 14:36:23 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C7403CACC7@PGSMSX108.gar.corp.intel.com>
References: <1575358265-17905-1-git-send-email-brent.lu@intel.com>
 <AM5PR1001MB0994EB497D3BC7D0F4C6FD9080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <CF33C36214C39B4496568E5578BE70C7403CA7B2@PGSMSX108.gar.corp.intel.com>
 <AM5PR1001MB09946C295B8DAD5F9C8D191080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AM5PR1001MB09946C295B8DAD5F9C8D191080420@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDE4YzY5NTYtMmU4NC00YTcyLTgyYjktZDhmNTU4YjY4M2NjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQXVlbWR3VnpZXC9BZzQ4Z1FYcVhxc3hYRFY4ekFaVkc0ZVE0M0xnRXMxNzdtN0lMaXIzVUJMSGpuZ0lRczNYZ0kifQ==
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
> But on platforms where they can enable the WCLK early they shouldn't be
> looping around here for anything like 400ms. In an ideal world when that
> widget is run SRM should hopefully be already locked but the code does
> allow for some delay. Actually, having a long delay also helps show the user
> that something isn't right here so I'm somewhat loathed to change this.
> 
> Even if you do reduce the retry timings what you're still not protecting
> against is the possibility of audio artefacts when SRM finally locks. You want
> this to lock before the any of the audio path is up so I think we need to find a
> way to resolve that rather than relying on getting lucky with a smooth power-
> up.
> 
Hi Adam,

Thanks for the explanation. So the purpose of the code is providing some
timing tolerance for SRM to lock? If so, I would suggest adding warning message
for the lock fail so people have a clue if their design fails the CTS test. Hard to say
if Google further reduces the Cold latency again in the future.


Regards,
Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
