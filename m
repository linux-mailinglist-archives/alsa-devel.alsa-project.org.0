Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE026780C8
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:04:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3DB912AE;
	Mon, 23 Jan 2023 17:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3DB912AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674489868;
	bh=GFijjW7lR2HML5rXSl3aNY/6L0A+D+DedtGWDxxyrn8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SBCMbdFef7cZ8OaQhAPecx6YBgL1f8g38Tgsfgrfyqcy/brmHoryPYuacmx4IODhG
	 5VMwMztllTz77B517BotSzAE4TBWvpPHZwN0H039YBCKnIhr6qeyaEjAW6NaELNs9n
	 PDgMkrQOtVXw7SKSaJsFKJ9P/hmS2huWUlPJXQB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 328B4F80132;
	Mon, 23 Jan 2023 17:03:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 827F7F804C2; Mon, 23 Jan 2023 17:03:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4F66F801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F66F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JB9Aduly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674489807; x=1706025807;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GFijjW7lR2HML5rXSl3aNY/6L0A+D+DedtGWDxxyrn8=;
 b=JB9AdulyoYp7XxoOvmCosm1QmHdpphiWxFYa16urGIUpGjl1K1wnYw7H
 dhbRn7r63j5xCt3ynh0ZHKNWTZqj1sXKl9g5qKnFodLhQcFntGKCh0lU+
 ZSJjOuy87JMdJHYcWrAqL4mXRMCdfvag3I/xMFvx3uHj+C67HzS53c6Af
 yKACTw/Z/sQ7L6YQI8n+sM/OwPtOV0bh6Arkl+E7OhOnkI52t6vy/cx6P
 0BIEdqlDv0DYsAkxrGB/uXP/WJpCkvtYSk+Xobav/FL93GZ+VcOkt/91f
 rH4cxysgUaZm3iivz41KPbR9lRf7x9o9BmB3kpiqLyHX7GUbgp9tl6yru g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305732220"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="305732220"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:02:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804235055"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="804235055"
Received: from rgrachek-mobl.amr.corp.intel.com (HELO [10.212.113.123])
 ([10.212.113.123])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:02:43 -0800
Message-ID: <268823a3-f453-a38b-3fd7-500306675890@linux.intel.com>
Date: Mon, 23 Jan 2023 10:02:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 8/8] Docs/sound/index: Add missing SPDX License
 Identifier
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, SeongJae Park <sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
 <20230122213650.187710-9-sj@kernel.org> <875ycxr7qv.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <875ycxr7qv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/23/23 02:10, Takashi Iwai wrote:
> On Sun, 22 Jan 2023 22:36:50 +0100,
> SeongJae Park wrote:
>>
>> Add missing SPDX License Identifier for sound documentation index file.
>>
>> Signed-off-by: SeongJae Park <sj@kernel.org>
> 
> Acked-by: Takashi Iwai <tiwai@suse.de>

Isn't GPL-2.0 deprecated? It should be GPL-2.0-only, no?

https://spdx.org/licenses/GPL-2.0.html

https://spdx.org/licenses/GPL-2.0-only.html

> 
> 
> thanks,
> 
> Takashi
> 
>> ---
>>  Documentation/sound/index.rst | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
>> index 5abed5fc6485..7e67e12730d3 100644
>> --- a/Documentation/sound/index.rst
>> +++ b/Documentation/sound/index.rst
>> @@ -1,3 +1,5 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>>  =============================
>>  Sound Subsystem Documentation
>>  =============================
>> -- 
>> 2.25.1
>>
