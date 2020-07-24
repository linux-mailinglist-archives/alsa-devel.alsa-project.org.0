Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81A22CEED
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 21:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8140168A;
	Fri, 24 Jul 2020 21:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8140168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595620617;
	bh=5KQ1WmKzCidLjZQN8WjCeZPm47gWSDcRvLDn0Qp0hKg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9T3Luj8BqElzYNvYk2vp2l5xBIRIMzaeQW7r7DSNv6NMSj1u01q3ZskUSG54jjwO
	 gecni8zvEdXzUsL+NDakLyq1eeIFSJ7e+IoCToLpFFymRBbQgO3B/cy0/Cs1FQp/NT
	 GUpL8N+JqTdNGXecLJqiQCkkx8pZHacKjzamZZeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AC9EF800DF;
	Fri, 24 Jul 2020 21:55:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74574F8014C; Fri, 24 Jul 2020 21:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1354F800DF
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 21:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1354F800DF
IronPort-SDR: qYHNOl9RW8V37yyjmaCOVJCxxDFF7JdSS/uqnK4UoswKxoSfXUaSSy+gTIaaUQsv2BPPIcJ3Ji
 JP09zNvG28HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="168904457"
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="168904457"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 12:55:04 -0700
IronPort-SDR: K9HoBDnheYlwXP2NIAqdfWqqtaNbqJ9pv48dA92xjJ0gxc/Ldofx0HulkWkgjkzAvVAXUmML7Y
 zl8OTcA6c1Rw==
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="289090696"
Received: from tuanado-mobl1.amr.corp.intel.com (HELO [10.254.79.47])
 ([10.254.79.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 12:55:03 -0700
Subject: Re: [PATCH] ASoC: core: use less strict tests for dailink capabilities
To: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <1jlfj98gb4.fsf@starbuckisacylon.baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <576823fb-a8a8-1f74-b7e2-d33b734022a7@linux.intel.com>
Date: Fri, 24 Jul 2020 14:05:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1jlfj98gb4.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, broonie@kernel.org
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


> Again, this is changing the original meaning of the flag from "playback
> allowed" to "playback required".
> 
> This patch (or the orignal) does not explain why this change of meaning
> is necessary ? The point I was making here [0] still stands.
> 
> If your evil plan is to get rid of 2 of the 4 flags, why go through the
> trouble of the changing the meaning and effect of one them ?

My intent was to have a non-ambiguous definition.

I don't know 'playback allowed' means. What is the point of using this 
flag if it may or may not accurately describe what is actually 
implemented? And how can we converge the use of flags since in the 
contrary 'playback_only' is actually a clear indication of what the link 
does. We've got to align on the semantics, and I really don't see the 
point of watering-down definitions. When things are optional or poorly 
defined, the confusion continues.

WFIW, my 'evil' plan was to rename 'dpcm_playback' as 'can_playback' 
(same for capture) and replace 'playback_only' by 'can_playback = 1; 
can_capture = 0'. So this first step was really to align them on the 
expected behavior and minimal requirements.
