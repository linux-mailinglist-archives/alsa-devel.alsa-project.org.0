Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498C432456
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 18:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8DAF1849;
	Mon, 18 Oct 2021 18:57:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8DAF1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634576322;
	bh=dxF2FdH6bSALDGa53yP8Z8h/P+LbivPEhybLtD8+lDE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rm7LIJ86O6WVgFNwsc2t+BHXC0GoGY0kd/jH7dnoj33zNmr+qTHqVJ79goJzBoqpK
	 w0w2467GSCTX4V21loFuSHEAC4YY4X+PYH4oFAI9GKZxknGw/lzzU75YaQcGeQtqwp
	 jY4NdIp/Vjbe/H0niOX/4MKlq3BhDSTv8ujTy6Fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B73CF80159;
	Mon, 18 Oct 2021 18:57:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0849F80224; Mon, 18 Oct 2021 18:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31D25F80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 18:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31D25F80159
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="215222675"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="215222675"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 09:57:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="489518249"
Received: from dsardana-mobl.amr.corp.intel.com (HELO [10.209.189.174])
 ([10.209.189.174])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 09:57:15 -0700
Subject: Re: [PATCH v3 4/4] ASoC: SOF: Intel: add .ack support for HDaudio
 platforms
To: Takashi Iwai <tiwai@suse.de>
References: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
 <20211015195932.224925-5-pierre-louis.bossart@linux.intel.com>
 <s5hzgr85c6v.wl-tiwai@suse.de>
 <97cd3a79-bf2a-bb1a-7da1-89bc8bac2c13@linux.intel.com>
 <s5hilxu4898.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ef4981bf-b935-77f1-00cb-9ac31a3e1fdd@linux.intel.com>
Date: Mon, 18 Oct 2021 11:57:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hilxu4898.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 P9ter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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




> I mean only about the use EXPLICIT_SYNC flag.  There has been already
> an info flag SYNC_APPLPTR, and this should suffice for your purpose.
> In a nutshell:
> 
> EXPLICIT_SYNC = disable both control and status mmaps
> SYNC_APPLPTR = disable only control mmap

Humm, are you sure Takashi? it's been a long time since we discussed
this and your initial direction was to disable both?

To quote your own words from
https://lore.kernel.org/alsa-devel/s5hfug51g0x.wl-tiwai@suse.de/

"In mmap mode, we transfer data on the mmap
buffer, and update appl_ptr via mmap control.  Both are done without
notification to the driver (which is intentional for avoiding the
context switching).

So we want to disable this optimization and always notify to the
driver.  Disabling mmap status/control is the straight hack as it
falls back to ioctl and then the driver can know the change."

I really don't mind changing, I don't have enough background on this,
just wanted to make sure that disabling the control mmap is sufficient
on paper before we re-run tests. Thanks!
