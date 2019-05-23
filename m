Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BB7275F3
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 08:17:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10CC81664;
	Thu, 23 May 2019 08:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10CC81664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558592224;
	bh=qslXSgtq4jPZ/4wves7+y0Xp3SgwGNgAJh+/B5AdFeI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OCRLiK/BPyzONLkQGiCWduYIOcte8ubOq/d8XEgT2YSzK24929H7OMc0iB5Y+oSvK
	 a4S4tgT96ZOjr2IZLCHCj9Qm8KH7I49dllZlBIa8lJ9S1mPy00E9krosXgo6iluhbw
	 4gBGFeanorPxpLW7Ap7n4i115k8gOKa3v/Opek98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D137F89670;
	Thu, 23 May 2019 08:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6421DF89674; Thu, 23 May 2019 08:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A4BCF80C0F
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 08:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A4BCF80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 23:15:10 -0700
X-ExtLoop1: 1
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga006.fm.intel.com with ESMTP; 22 May 2019 23:15:10 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 22 May 2019 23:15:10 -0700
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 22 May 2019 23:15:09 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.7]) with mapi id 14.03.0415.000;
 Thu, 23 May 2019 14:15:06 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: "tiwai@suse.de" <tiwai@suse.de>
Thread-Topic: Add polling mode support on snd_hdac_bus_get_response(),
Thread-Index: AdURLnqvE9iIMrPfR9Cv3w9+09FT/Q==
Date: Thu, 23 May 2019 06:15:05 +0000
Message-ID: <567A313375B6F043A9BE3A1D9B8C6E7F0B43BC9B@SHSMSX101.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTYzMzMxYzktYmI5Mi00NjczLThlZmItZTM0NzY0ZGVjNDFjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiQUloU3kxVmhNMlArVllqSG1xZ2hjeE9KTGZHdlZWc0tvbHBVaHpiN2xcL0tKaEhFb3FXcjFsd21aOGk4aUJkM3kifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Yang, Libin" <libin.yang@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Bossart, 
 Pierre-louis" <pierre-louis.bossart@intel.com>
Subject: [alsa-devel] Add polling mode support on
	snd_hdac_bus_get_response(), 
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

Hi Takashi,

We would like to add polling mode support on snd_hdac_bus_get_response(),
and use it as a workaround for some specific platforms.
Just like azx_rirb_get_response() and azx_create()

	if (chip->polling_mode || do_poll)
			snd_hdac_bus_update_rirb(bus);
and
	if (IS_CFL(pci))
		chip->polling_mode = 1;

However struct azx is a local variable and other driver may have their own chip
structure. Like struct skl and struct sof_intel_hda_dev.
So I am thinking does it make sense to add the polling_mode in struct
hdac_bus? So we can get the polling_mode directly from bus->polling_mode.
Or it makes more sense to create a global chip struct similar to struct azx for
snd_hdac_bus_get_response()?

Thanks,
Bard
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
