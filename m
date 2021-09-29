Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B141C87A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 17:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5269216FF;
	Wed, 29 Sep 2021 17:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5269216FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632929520;
	bh=2ZByO7fNkdh88BNmo5N3eYxk1ZraPvbstr1z+I7kTBk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtqeUBL0yzp9GcEpXMQHw/AWuuNcbXVGZcjUGmaGhW29tlACqnco7pCyoRhe96OLr
	 p0poM3CFpygOB2Qg1JaODGuRvUfRsZhZW2yznhr+dAvBwATOc0Sh194zuWmVS8RlAB
	 jLCBVPnCGY/WA6OCe9cKw/D5yQ1arzq7MFNgho5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB67F804E4;
	Wed, 29 Sep 2021 17:30:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF333F801F7; Wed, 29 Sep 2021 17:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19570F80272
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 17:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19570F80272
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225037008"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="225037008"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 08:30:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="588091631"
Received: from ibarchen-mobl.amr.corp.intel.com (HELO [10.209.150.234])
 ([10.209.150.234])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 08:30:12 -0700
Subject: Re: [PATCH v2 0/2] ALSA: hda: Reduce CPU hog with SKL+ position
 reporting
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210929072934.6809-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <76e121e0-c8c2-3da0-d7fc-a96ff2014afd@linux.intel.com>
Date: Wed, 29 Sep 2021 09:54:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210929072934.6809-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Jens Axboe <axboe@kernel.dk>
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



On 9/29/21 2:29 AM, Takashi Iwai wrote:
> Hi,
> 
> this is a v2 patch set for reducing the CPU hog with the HD-audio PCM
> position reporting.  The first patch is almost same, while the second
> patch is added to take back to the position buffer as suggested by
> Pierre.
> 
> 
> Takashi
> 
> v1: https://lore.kernel.org/r/20210910141002.32749-1-tiwai@suse.de
> 
> ===
> 
> Takashi Iwai (2):
>   ALSA: hda: Reduce udelay() at SKL+ position reporting
>   ALSA: hda: Use position buffer for SKL+ again

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

