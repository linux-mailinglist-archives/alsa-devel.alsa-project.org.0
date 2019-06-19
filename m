Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36DC4B68E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 12:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681FC16A0;
	Wed, 19 Jun 2019 12:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681FC16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560941791;
	bh=144ojhUajoFLvZW/VXYm6ZCtjlqHKDsqGJOif+Iz8oI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aeMuV1933V7zIocMzBkY/O3r3xDicLn8XBIi64O62/LRh5GnLqzuXzb0hvZEk/vIE
	 S10e/eq6Y6DzreQkOhadikmIG7Z7s4os0IryCnajqm7EbT5JCHjEEMoXJmG6rnI/Pf
	 BlwfFqQ/kNitlq7KKQ7c90nGt8QWGD3XiNcD7xwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF979F896DA;
	Wed, 19 Jun 2019 12:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4603EF896B8; Wed, 19 Jun 2019 12:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECA00F80C87
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 12:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA00F80C87
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 03:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="162018927"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2019 03:54:34 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Jun 2019 03:54:35 -0700
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 19 Jun 2019 03:54:34 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.87]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.89]) with mapi id 14.03.0439.000;
 Wed, 19 Jun 2019 18:54:32 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Mark Brown <broonie@kernel.org>, Bard liao
 <yung-chuan.liao@linux.intel.com>
Thread-Topic: [PATCH v2 1/2] ASoC: Intel: sof-rt5682: add MCLK support for
 BYT platform
Thread-Index: AQHVJmZEEvNbBigTq0qQq/PDA+36maaiRiiAgACHTuA=
Date: Wed, 19 Jun 2019 10:54:32 +0000
Message-ID: <567A313375B6F043A9BE3A1D9B8C6E7F0B45F65E@SHSMSX101.ccr.corp.intel.com>
References: <20190618181539.9169-1-yung-chuan.liao@linux.intel.com>
 <20190619104831.GQ5316@sirena.org.uk>
In-Reply-To: <20190619104831.GQ5316@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjZiNGM1YjctNGU5NC00MzUxLWJhYzAtYjgxMWUzODZmNWM0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMFNYdjluTlwvNU9jWnloN1VFNGZ3TnFYaE5vajNjQ1RYM0xuNVY4elE1OXRlMUJxenQrSWxXNnpGVkVCNWtua1oifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: Intel: sof-rt5682: add MCLK
 support for BYT platform
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

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Wednesday, June 19, 2019 6:49 PM
> To: Bard liao <yung-chuan.liao@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; tiwai@suse.de; 
> liam.r.girdwood@linux.intel.com; pierre-louis.bossart@linux.intel.com; 
> Liao, Bard <bard.liao@intel.com>
> Subject: Re: [PATCH v2 1/2] ASoC: Intel: sof-rt5682: add MCLK support 
> for BYT platform
> 
> On Wed, Jun 19, 2019 at 02:15:38AM +0800, Bard liao wrote:
> > From: Xun Zhang <xun2.zhang@intel.com>
> >
> > The sof-rt5682 machine driver currently uses BCLK on BYT/Minnowboard 
> > platform. The MCLK signal is available since the Turbot revision, so 
> > enable MCLK on BYT/Minnowboard Turbot platform.
> >
> > Signed-off-by: Xun Zhang <xun2.zhang@intel.com>
> > Signed-off-by: Bard liao <yung-chuan.liao@linux.intel.com>
> > ---
> 
> If you've got an ack or other tag for a patch you should carry that 
> forward to new postings unless there's some reason to remove it.

Sure. So
Patch 1 and 2

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
