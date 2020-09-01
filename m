Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39502259363
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 17:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD9DB17EF;
	Tue,  1 Sep 2020 17:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD9DB17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598973936;
	bh=0pCcKFPGtE+3IwEjZukfHUt7q9ugEDmvyxkE+c9e/jg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YHAusDKYb470Q2x115+DXLE40P2cOFmbHHhVvrjbbt8KLs55iDn0ciETytPjujapY
	 Jor6DmyKZPSte9ZrKN83ualqoPykUFvTL9j02TW/g5FT7nkRKPwljmFylGY1WjSzLy
	 1y4nqPIEvo72kYNEvHflgWkIqDDWp+6pVanV+yFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0AFEF801EB;
	Tue,  1 Sep 2020 17:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 425F6F8025F; Tue,  1 Sep 2020 17:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B121DF801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 17:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B121DF801DA
IronPort-SDR: fh5drYk/LBK/OhbpgOgmpzzSsCPBY8YBZXPBcOnmr+kyI8L9+lZf6dUiwahwREwwX06Y159X5V
 +jO2Ha3OfCxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="175235894"
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="175235894"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 08:24:14 -0700
IronPort-SDR: 527JFTp2w2VWRSuYsdiewbONKbXlpZ0Q4tcfT7RThBvL1lRiwXIEmF3S/O8sC03K9XqyD45jN3
 Fi53rZ/g1W8g==
X-IronPort-AV: E=Sophos;i="5.76,379,1592895600"; d="scan'208";a="477241599"
Received: from irinav-mobl2.ger.corp.intel.com ([10.214.227.58])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 08:24:10 -0700
Message-ID: <026aa0fd558b8b91a67a868a25eb84d8749101b7.camel@linux.intel.com>
Subject: Re: [bug report] 'ASoC: Intel: haswell: Power transition refactor'
 and PulseAudio
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, Christian Bundy
 <christianbundy@fraction.io>
Date: Tue, 01 Sep 2020 16:23:58 +0100
In-Reply-To: <28ee99bc-fe27-9111-893b-1cb000067a7c@intel.com>
References: <9bc5b3ac-87a0-4d7c-abfd-2407db90d310@www.fastmail.com>
 <28ee99bc-fe27-9111-893b-1cb000067a7c@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: zwisler@google.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 2020-09-01 at 13:33 +0200, Cezary Rojewski wrote:
> On 2020-08-31 11:55 PM, Christian Bundy wrote:
> > After upgrading to Linux 5.8 I discovered an audio issue on my
> > device that was introduced in
> > 8ec7d6043263ecf250b9b7c0dd8ade899487538a [0]. I used 'git bisect'
> > to identify the commit that introduced the bug and have confirmed
> > that reverting the commit resolves the problem
> > 
> > Reproduction:
> > 
> > 1. Play any audio via PulseAudio.
> > 2. Observe that the audio output is fuzzy and choppy.
> > 
> > I can use programs like mpv to play audio without PulseAudio, and
> > the audio is fine, but as soon as I open a process that uses
> > PulseAudio it will ruin the audio output for all processes
> > (including mpv) until I reboot.
> > 
> > I'm using a 2015 Chromebook Pixel ("Samus") and have confirmed this
> > problem with a friend who has the same device.
> > 
> > Is there anything I can do to help debug this instead of sending a
> > patch to revert the commit?
> > 
> 
> Hello Christian,
> 
> Thank you for report! Issue is a known one to us and has already
> been 
> addressed by:
> 
> 	[PATCH v4 00/13] ASoC: Intel: Catpt - Lynx and Wildcat point
> 	https://www.spinics.net/lists/alsa-devel/msg113762.html
> 
> waiting for final dependency to be merged (Andy's resource-API
> changes, 
> as Mark already added the SPI ones) so v5 with review changes can be 
> provided. Shouldn't be long before this gets merged. As consequence, 
> /haswell/ ceases to exist.
> 

Please also don't forget that the new BDW HW register programming flows
need to be shared as common code with the SOF BDW driver.

Thanks

Liam

