Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C6EE2D5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 15:48:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504B4175F;
	Mon,  4 Nov 2019 15:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504B4175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572878908;
	bh=6jCLX+JdbezzK4dTJULuWOFw6orsia/aNZu7Ju/oXIM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pKxu3D14fJARegB7/xvqiKstKqYcLsXUk0WiUbn74TZz1wkgmM+T8HtQBjS83Whyh
	 H1UMp0Lue996r7gLFiJ0rTd0nLHDTZuWYK86HJesfDnEPNGLVBiNlGQ3MpUO+MSlN8
	 Egm0uXkBhmI6t7a46VDSPiez3iLaUs+6awqYKDV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21399F80636;
	Mon,  4 Nov 2019 15:46:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB911F80634; Mon,  4 Nov 2019 15:46:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A457F803F4
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 15:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A457F803F4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 06:46:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="191769663"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga007.jf.intel.com with ESMTP; 04 Nov 2019 06:46:01 -0800
Received: from orsmsx163.amr.corp.intel.com (10.22.240.88) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 4 Nov 2019 06:46:01 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.1.210]) by
 ORSMSX163.amr.corp.intel.com ([169.254.9.158]) with mapi id 14.03.0439.000;
 Mon, 4 Nov 2019 06:46:01 -0800
From: "Zhi, Yong" <yong.zhi@intel.com>
To: Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
Thread-Topic: [alsa-devel] [PATCH] ASoC: max98373: Fix calls to free_gpio()
Thread-Index: AQHVkNcTlpbRGR1/7k6Ri3pLp0WTSqd7hPoAgAAD/AD//5F+cA==
Date: Mon, 4 Nov 2019 14:46:00 +0000
Message-ID: <C193D76D23A22742993887E6D207B54D4E62C623@ORSMSX106.amr.corp.intel.com>
References: <1572628130-16955-1-git-send-email-yong.zhi@intel.com>
 <5a2369b1804db60da9ee10d4a2fa0688ff9f1222.camel@nxp.com>
 <20191104131754.GE5238@sirena.co.uk>
In-Reply-To: <20191104131754.GE5238@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWM0MjcxNWYtN2UyZC00ODRiLWEwM2UtN2NiMmU5OTYxNzRiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicTZqd3YzYzErcG1ySFJKR1NyKzFtRG1LbnR2c1R6TnBUMWVXMXpsaWkxWGt1b2dmYWRUYXJ2SGZBYVZcL2xJaXoifQ==
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "ryans.lee@maximintegrated.com" <ryans.lee@maximintegrated.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: max98373: Fix calls to free_gpio()
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

Hi, Kai, Daniel and Mark, 

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, November 4, 2019 7:18 AM
> To: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: pierre-louis.bossart@linux.intel.com; Zhi, Yong <yong.zhi@intel.com>;
> Nujella, Sathyanarayana <sathyanarayana.nujella@intel.com>;
> ryans.lee@maximintegrated.com; alsa-devel@alsa-project.org
> Subject: Re: [alsa-devel] [PATCH] ASoC: max98373: Fix calls to free_gpio()
> 
> On Mon, Nov 04, 2019 at 01:03:38PM +0000, Daniel Baluta wrote:
> > On Fri, 2019-11-01 at 12:08 -0500, Yong Zhi wrote:
> > > Don't Call free_gpio() when request_gpio() fails, call it at error
> > > paths to avoid resource leak.
> 
> > Uosing devm_gpio_request will make the change cleaner.
> > What do you think?
> 
> Yes, that's even better.

Acked, will use devm version which is more elegant, thanks for the code review. -Yong 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
