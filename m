Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB6714A79E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jan 2020 16:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E59A783D;
	Mon, 27 Jan 2020 16:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E59A783D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580140764;
	bh=RdeHDUuarnTpFc1mcTRIp8COc2Y6EdlvxswQPpa4oj4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BV2rWgqyj3SlmNwa99hf3nZcX225+anWvDeRha02tui9rjXiogzfUgo73zI/y284m
	 m3q5og0zq+CTHekuGbIxEtTi3T8m7c+VFjMKsXKV2jnaEmcnFzEz6tnZUxM1CSdnGN
	 VpjimTJSUy2NaWHvA8LJJSriNXdn3jZvc7lyKc64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8468F8021E;
	Mon, 27 Jan 2020 16:57:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4366F80085; Mon, 27 Jan 2020 16:57:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA37BF80085
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 16:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA37BF80085
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 07:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,370,1574150400"; d="scan'208";a="223277221"
Received: from vvaddepa-mobl.amr.corp.intel.com (HELO [10.252.204.5])
 ([10.252.204.5])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jan 2020 07:57:32 -0800
To: Takashi Iwai <tiwai@suse.de>
References: <20200124213625.30186-1-pierre-louis.bossart@linux.intel.com>
 <20200124213625.30186-4-pierre-louis.bossart@linux.intel.com>
 <s5hpnf7251e.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8749c7b5-c3c3-aff7-ada7-2a4ab422dc94@linux.intel.com>
Date: Mon, 27 Jan 2020 09:08:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hpnf7251e.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 3/7] ASoC: SOF: core: release resources on
 errors in probe_continue
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/25/20 4:39 AM, Takashi Iwai wrote:
> On Fri, 24 Jan 2020 22:36:21 +0100,
> Pierre-Louis Bossart wrote:
>>
>> The initial intent of releasing resources in the .remove does not work
>> well with HDaudio codecs. If the probe_continue() fails in a work
>> queue, e.g. due to missing firmware or authentication issues, we don't
>> release any resources, and as a result the kernel oopses during
>> suspend operations.
>>
>> The suggested fix is to release all resources during errors in
>> probe_continue(), and use fw_state to track resource allocation
>> state, so that .remove does not attempt to release the same
>> hardware resources twice. PM operations are also modified so that
>> no action is done if DSP resources have been freed due to
>> an error at probe.
>>
>> Reported-by: Takashi Iwai <tiwai@suse.de>
>> Co-developed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Bugzilla:  http://bugzilla.suse.com/show_bug.cgi?id=1161246
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> This deserves for Cc to stable, as the bug already hits on both 5.4
> and 5.5 kernels.
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

Patch 2 would need to be Cc:'ed to stable as well, otherwise this patch3 
will not apply.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
