Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7951F1D06
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 18:14:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 543081665;
	Mon,  8 Jun 2020 18:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 543081665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591632896;
	bh=UXGCYA/wgHoaYGp8XiH6ZD+aiufpeWkA6t3NFGs5Soc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFwqavwtQ1TaQDkQBzTzjtpBez2GhZo4CmSZClg0xjRPhCeamQCOKZ2mh4BVJQHSE
	 jb+nwIz3lVj/vraFmaiA7euPN5PzVIGWoNvJuG+oigqLTqOP4rsDrf6DkAQxvmFW0S
	 dSK4m1Zb1ChOhjujst3V2MIk2kMEaUkx26s0O45E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B40AF8021E;
	Mon,  8 Jun 2020 18:13:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C93F8021C; Mon,  8 Jun 2020 18:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B400F80125
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 18:13:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B400F80125
IronPort-SDR: 89A3ecnEmaSJlH0pirEeGeltM2Of9eb1rxQGkmmILCFCIElTlwKPIGn46vST5EyiSdsLbI+e3u
 e/Q/dutUG5pg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 09:13:00 -0700
IronPort-SDR: 7HYIE2zVcBPLrCU2IXLFeSUaGEitbtp6H9liBvuvTkGsbxPnj655gAJjyFG/AY4WXevfJn4jvU
 2Oo0lDW2Uq8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,487,1583222400"; d="scan'208";a="446779802"
Received: from ravindra-mobl1.amr.corp.intel.com (HELO [10.251.13.163])
 ([10.251.13.163])
 by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 09:12:59 -0700
Subject: Re: SOF 1.5 release on FTP server
To: Paul Dann <pdgiddie@gmail.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <CALZj-VpLECyDaBeHcowTnCcufLVaPyr7Xxii+PbkrwGn9kYU+w@mail.gmail.com>
 <bc8420df-3fbe-2d7c-3c3a-dcf7455eeca8@perex.cz>
 <CALZj-VoLtoNbPZ1evLYqTxEg7XaTiEjgdB+WLE7duLfxF2ohLA@mail.gmail.com>
 <15e6517a-6be2-d5cd-c5d7-37a5122bd96e@perex.cz>
 <alpine.DEB.2.21.2006011723250.3787@eliteleevi.tm.intel.com>
 <CALZj-VoJ0tMNyD6aZyLdBWYD3meWaqKjo-1wQww0wk1En2nqwQ@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3fea0c1d-9e85-2d84-d7bd-4e07a7d3496b@linux.intel.com>
Date: Mon, 8 Jun 2020 08:28:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CALZj-VoJ0tMNyD6aZyLdBWYD3meWaqKjo-1wQww0wk1En2nqwQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 6/7/20 3:13 PM, Paul Dann wrote:
> On Mon, 1 Jun 2020 at 15:45, Kai Vehmanen <kai.vehmanen@linux.intel.com> wrote:
>> Paul, I can confirm the sof-bin is the definitive location to get
>> the SOF binaries.
> 
> Many thanks both for confirming the new source. I notice that the old
> FTP package contains the following .ri and .ldc files that are not
> present in the new Github repo:

It's a clean-up indeed.

> sof-hsw

No longer supported (and no commercial platforms known to use the DSP)

> sof-imx8

This would need to be provided by NXP. Each company is responsible for 
providing the firmware for their platforms.

> sof-jsl

Not fully supported upstream, but indeed we need to check this one. Liam?

> sof-kbl
> sof-skl

Not supported.

> sof-sue

I don't think this was ever supported outside of Intel

> I'd just like to double-check that shipping the new package without
> these files won't lead to reduced functionality?

we'll check this JSL (JasperLake) firmware but for existing platforms 
this looks fine.
