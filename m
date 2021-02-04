Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A830F124
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 11:47:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5D1A16F8;
	Thu,  4 Feb 2021 11:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5D1A16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612435657;
	bh=lwFYWfjWiJxLem7YlEL88rsvpMSkTuKtD4h1rW/sKnU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gk/23UxNoNSfhzozwWPOldn896faf7xUGqWj67b9Tg5xTtkkoERMvLocB1yxNIbhK
	 PP0px7TkiYadku5YtpUfRkqpFAv4F7H5eb6ExBgI0hH9lKomEHfh7LHcgNC4Ksq05k
	 gnIoavoQ7EDLZnumXqBCwIk3O+5xaDCbBsmg1NWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42026F80154;
	Thu,  4 Feb 2021 11:46:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20C26F80171; Thu,  4 Feb 2021 11:46:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8ADF80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 11:45:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8ADF80152
IronPort-SDR: 2tHzJ3aubsr7XIFOjKXQWPJfXKG/DySu+ZcXQ2RIpThma/11b89Z4LxtYy+BTME0Lbn60UKKIl
 2iqVdA6I67UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="181361927"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="181361927"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 02:45:48 -0800
IronPort-SDR: 3fHxorYYUucdtLDhXJHE8W5EYyQbUtHp3cFirJIqFcmUh71uuSt59z8Kqz4c8W9NqgbnZ9/E+E
 vJz+MtdmxThg==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="372917431"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 02:45:46 -0800
Date: Thu, 4 Feb 2021 12:42:20 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH] ALSA: hda: call ext hda codec link up/down if
 available
In-Reply-To: <s5hzh0k6vpn.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.22.394.2102041239160.864696@eliteleevi.tm.intel.com>
References: <20210204075821.1503539-1-kai.vehmanen@linux.intel.com>
 <alpine.DEB.2.22.394.2102040959490.864696@eliteleevi.tm.intel.com>
 <s5hzh0k6vpn.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org,
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

Hey,

On Thu, 4 Feb 2021, Takashi Iwai wrote:

> On Thu, 04 Feb 2021 09:07:09 +0100, Kai Vehmanen wrote:
> > Takashi and others, this patch is a follow-up to the earlier thread about 
> > hdac link management:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2021-January/179715.html
> > 
> > We have absolutely no calls from sound/pci/hda/ to hdaudio_ext.h before
> > this patch, so I'm wondering if this is the right approach to take. 
> 
> An obvious drawback by this patch is that it'll make the hda-ext code
> always loaded whenever it's enabled, no matter whether it's really
> used or not.
> 
> Maybe adding a new callback (link) in hdac_bus_ops can help?

hmm, that's true. Let me try adding a separate callback and resend for 
review. That will look cleaner in hda_codec.c.

>> It does seem to be the natural path forward and mimics what was done in 
>> e.g. hdac_hdmi. But we want to keep reusing driver code for all HDA 
>> implementations, so adding hdac-ext support to codec drivers seem like the 
>> best path.
> 
> Yes, I find we're heading to the right direction.

Ack, thanks for the quick review.

br, Kai
