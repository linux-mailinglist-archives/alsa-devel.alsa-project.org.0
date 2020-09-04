Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0275225D76F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 13:34:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C951AFF;
	Fri,  4 Sep 2020 13:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C951AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599219268;
	bh=h2W63zVDXu8pwB9p8M776HYZ+F4dO2ZacYGeSzQWl3s=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOv6ubHjJX3Jda4LofLQaAE4Q6Lb4KOi4BEFY6RgRK9gPGFsJfS5ujdPhehU4Z09H
	 xqxakYAOOxS0lwNwQ2retXuxuL1K98SWVtTdLuYHkZdLAImbrsDa+Zl/tRKIhHRlrq
	 cgtSWbBMuOKJyFwL6ouqAgWPb9UkfqmazKgQnBc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A50AEF800F0;
	Fri,  4 Sep 2020 13:32:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CF6BF8024A; Fri,  4 Sep 2020 13:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C3B3F801DA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 13:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3B3F801DA
IronPort-SDR: JKLerZ/9N/uzS2rV3xjmN9J6ynz9rPTlK/qEo3kaFvvyUv4QPr8qLNU+NkrFh07HmBniVChS6e
 53T3gaeh5bWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="145459299"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="145459299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:32:37 -0700
IronPort-SDR: mKzi/gYOxqnwmHnrHLCgnuM3Yqx0XB14c2bYf6AbHq7La6od1MQOEBUqeDM2kBEOFTqxppsenk
 yac2mI0ShehQ==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="447280784"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:32:35 -0700
Date: Fri, 4 Sep 2020 14:31:18 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>, Rander Wang <rander.wang@intel.com>
Subject: Re: [PATCH] ALSA: hda: release resource when snd_hdac_device_init
 is failed
In-Reply-To: <s5hpn7484sf.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2009041427570.3186@eliteleevi.tm.intel.com>
References: <20200902154229.1440489-1-kai.vehmanen@linux.intel.com>
 <s5hpn7484sf.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Hey,

On Wed, 2 Sep 2020, Takashi Iwai wrote:

> On Wed, 02 Sep 2020 17:42:29 +0200, Kai Vehmanen wrote:
> > When snd_hdac_device_init is failed, the codec is released by kfree
> > immediately without releasing some resources. The vendor_name should
> 
> It's released via put_device() and this should call the release
> callback, default_release(), and it contains all those kfree()'s and
> pm_runtime_*().
> 
> Could you double-check whether it's really missing?

ack, thanks for spotting. put_device() indeed calls the default release,
so this patch is not correct.

Rander, can you check as well this matches with the scenario you were 
looking at?

Br, Kai
