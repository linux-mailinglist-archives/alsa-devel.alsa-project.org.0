Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15960164D4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 15:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B3D117C4;
	Tue,  7 May 2019 15:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B3D117C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557236495;
	bh=NY2MHP8mM9r7simViMV9W9/BA0+iFsz6rfXYWHQ5+Y4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TKASicVifpOR1NwHyUFSzI+S0vBXkwYDYshWuP+jg/c5EhAE4zyfSDSAhfmjbWTw+
	 BGreIKRuYgMmqLD365yt2XF/PUaM5UhzxJxnk73PNCKghxbrHaqENR0RZO0Ny6vSFB
	 tWA51X0B0mTyYxiuyPHHw0Zmjq+4YipN9PtxsO1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E38F89673;
	Tue,  7 May 2019 15:39:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3A14F89673; Tue,  7 May 2019 15:39:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7968BF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 15:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7968BF89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 06:39:43 -0700
X-ExtLoop1: 1
Received: from asakoono-mobl.gar.corp.intel.com (HELO [10.251.159.132])
 ([10.251.159.132])
 by fmsmga005.fm.intel.com with ESMTP; 07 May 2019 06:39:42 -0700
To: Takashi Iwai <tiwai@suse.de>, libin.yang@intel.com
References: <1557210791-20332-1-git-send-email-libin.yang@intel.com>
 <s5hef5airju.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9ff760fb-ce59-337a-0c96-05de394361fb@linux.intel.com>
Date: Tue, 7 May 2019 08:39:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hef5airju.wl-tiwai@suse.de>
Content-Language: en-US
Cc: hui.wang@canonical.com, alsa-devel@alsa-project.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
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



On 5/7/19 3:42 AM, Takashi Iwai wrote:
> On Tue, 07 May 2019 08:33:11 +0200,
> libin.yang@intel.com wrote:
>>
>> From: Libin Yang <libin.yang@intel.com>
>>
>> Some userspace apps, like pulseaudio, may call open, hw_params,
>> prepare to judge whether the pcm is ready or not. Current hdac_hdmi
>> will return -ENODEV if monitor is not connected, which will cause
>> the apps believe the pcm is not ready. Actually PCM for hdmi is ready,
>> even the monitor is not connected.
>>
>> This patch removes the check of monitor presence in hw_params, just like
>> what the legacy HD-Audio driver does.
>>
>> Signed-off-by: Libin Yang <libin.yang@intel.com>
> 
> LTGM,
>    Reviewed-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> 
> thanks,
> 
> Takashi
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
