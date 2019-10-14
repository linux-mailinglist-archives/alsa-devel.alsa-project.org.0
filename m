Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DDED673B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 18:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 118081671;
	Mon, 14 Oct 2019 18:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 118081671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571070279;
	bh=RUsBPnECJD1ZcJMctCE8kHlbMfvbs5QlVMwRB2IaXjY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KbCw8XUrfOtMcxHphA0ujMK3coKGsICERWjFUuwMpH4qD4i++/LKaTKkd2QkiKGeK
	 sQYwj8ooYf74ah2IPHTVn+AGxUb/BqWigqjbU1EZHCxLLEWZBxw/KP+6I3rO6zoK5C
	 kbYyhtpQT0SQ6/ai0CCO9OQk+uVIrp2YsUVa5xUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4AC7F8036C;
	Mon, 14 Oct 2019 18:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00106F80362; Mon, 14 Oct 2019 18:22:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B39AF8011D
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 18:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B39AF8011D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 09:22:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="195034776"
Received: from kmsmsx157.gar.corp.intel.com ([172.21.138.134])
 by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2019 09:22:34 -0700
Received: from pgsmsx106.gar.corp.intel.com (10.221.44.98) by
 kmsmsx157.gar.corp.intel.com (172.21.138.134) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 15 Oct 2019 00:22:33 +0800
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.51]) by
 PGSMSX106.gar.corp.intel.com ([169.254.9.243]) with mapi id 14.03.0439.000;
 Tue, 15 Oct 2019 00:22:33 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp
 sclk early
Thread-Index: AQHVeDPt+TrcGokx5EWZxsNB/Hvyd6dGQ3IAgBOM4uCAAAPwAIAAj5ZA
Date: Mon, 14 Oct 2019 16:22:32 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C740316234@PGSMSX108.gar.corp.intel.com>
References: <1569919250-24472-1-git-send-email-brent.lu@intel.com>
 <1569991858-24293-1-git-send-email-brent.lu@intel.com>
 <CF33C36214C39B4496568E5578BE70C740314038@PGSMSX108.gar.corp.intel.com>
 <5cb82600-71a2-53c8-21b6-a1171cae41ad@linux.intel.com>
In-Reply-To: <5cb82600-71a2-53c8-21b6-a1171cae41ad@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMTA2YTkwZGMtOGMwOS00MDViLWJlOGMtZDJlMTY1ZGJmNTExIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQUN2Sm1VTk5ubHhDR2ZKa2YrRTNDOFJOMHlMdGZuQmdPdmlEZ1lZazlWZ2x1U1FXWkcyd2NITmp4clhkXC9JM3AifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, "broonie@kernel.org" <broonie@kernel.org>, "M,
 Naveen" <naveen.m@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp sclk
 early
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

> >
> > Hi Pierre-Louis
> >
> > This is the v2 patch based on your previous comment to remove
> > unnecessary function calls. The order in Kconfig is also rearranged.
> > Please let me know if this patch is ok. Thanks.
> 
> I don't see a v2?

Sorry I forgot to use --subject-prefix option when making the patch
file. Should I submit a new one with v2 prefix?

Regards,
Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
