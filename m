Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAF69C51
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 22:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24C031675;
	Mon, 15 Jul 2019 22:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24C031675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563221237;
	bh=OEzxmmM9hb6v/zJZxtSNye2lACppA4m+WrtS1bKI4wA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1MFjB0wo/SpUejMxKqPQTpqnMpdHifMWWVSyzFM4U1RWJL0nwTV8gMTufkJrcWcB
	 yEQpBDefaJMrq3DycURafET4QVQid1RMGMXAH81SmU43ZiWk5DWlCYFujJ5FTmo5+9
	 f9DnN88e5cLTTy3wilWmn0lFEqxTCfR/pP3Pr1X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FBC5F80368;
	Mon, 15 Jul 2019 22:05:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0407FF80367; Mon, 15 Jul 2019 22:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DC99F800C6
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 22:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DC99F800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 13:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,494,1557212400"; d="scan'208";a="161191775"
Received: from dtmeier-mobl2.amr.corp.intel.com ([10.252.200.9])
 by orsmga008.jf.intel.com with ESMTP; 15 Jul 2019 13:05:19 -0700
Message-ID: <243bf2494a73284addfdd2b5c46d3ae89ec7cfcd.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 15 Jul 2019 13:05:15 -0700
In-Reply-To: <20190715193525.GB4503@sirena.org.uk>
References: <20190707235633.7114-1-ranjani.sridharan@linux.intel.com>
 <7fc6fdf3461c8faff4d853f80e282f3830a04724.camel@linux.intel.com>
 <20190715193525.GB4503@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [RESEND PATCH v2] ASoC: SOF: Intel: hda: Make
 hdac_device device-managed
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

On Mon, 2019-07-15 at 20:35 +0100, Mark Brown wrote:
> On Mon, Jul 15, 2019 at 08:27:55AM -0700, Ranjani Sridharan wrote:
> 
> > This patch is needed for the module load/unload stress tests for
> > the
> > Intel platforms with SOF. Could you please help review it?
> 
> Please don't send content free pings and please allow a reasonable
> time
> for review.  People get busy, go on holiday, attend conferences and
> so 
> on so unless there is some reason for urgency (like critical bug
> fixes)
> please allow at least a couple of weeks for review.  If there have
> been
> review comments then people may be waiting for those to be addressed.
> 
> Sending content free pings adds to the mail volume (if they are seen
> at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the
> patches
> anyway, so sending again is generally a better approach though there
> are
> some other maintainers who like them - if in doubt look at how
> patches
> for the subsystem are normally handled.
Understood, sorry for the noise. I just wasn't sure about what the
reasonable response time to expect was. I will check back in a week's
time.

Thanks,
Ranjani
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
