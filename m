Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35870422780
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 15:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62C31679;
	Tue,  5 Oct 2021 15:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62C31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633439534;
	bh=VdbWKqkSi8C76mefS5o/H0dvAw+MefDXh5ZnCzEh50U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIahmNAfMG4sRq4EQcyIgWbpHjqvrkdh52l7BxdsU6t14jSIrzUGx1dss8Pmz+u+v
	 i9cpQl/KeHNQO2rrlSW8u9yp9LgK5TZCqVM2vEgcaG+SfPDar8JvTD0PcL8yD0y5H1
	 UOBGGy3c2s6pMQpobU7Jcl1fnFOacah6kUoUeiDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44348F8028B;
	Tue,  5 Oct 2021 15:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A01C3F8027D; Tue,  5 Oct 2021 15:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A197BF8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 15:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A197BF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="289239044"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="289239044"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 06:10:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="523764251"
Received: from emccutch-mobl.amr.corp.intel.com (HELO [10.212.34.81])
 ([10.212.34.81])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 06:10:42 -0700
Subject: Re: [PATCH v2 1/3] ALSA: pcm: introduce INFO_NO_REWINDS flag
To: Takashi Iwai <tiwai@suse.de>
References: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
 <20211004162423.85323-2-pierre-louis.bossart@linux.intel.com>
 <s5h8rz8ez3s.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c62b3749-c5ea-7b1e-2831-272c8a14d3ac@linux.intel.com>
Date: Tue, 5 Oct 2021 08:10:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5h8rz8ez3s.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
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



On 10/5/21 1:59 AM, Takashi Iwai wrote:
> On Mon, 04 Oct 2021 18:24:21 +0200,
> Pierre-Louis Bossart wrote:
>>
>> When the hardware can only deal with a monotonically increasing
>> appl_ptr, this flag can be set. In case the application requests a
>> rewind, snd_pcm_rewind() will not return an error code but signal that
>> the appl_ptr was not modified.
> 
> This modification itself is fine, but I guess that application may
> still move the appl_ptr directly via SNDRV_PCM_IOCTL_SYNC_PTR ioctl.
> We need to verify the backward move there, I suppose?

Sorry Takashi, I wasn't able to fully follow your question.

In the previous version, I had an explicit check to see if the appl_ptr
was modified by a rewind, but you mentioned this would be broken for
32-bit devices due to the use of the 'boundary'. I really have no idea
how we can detect a rewind in this configuration, so  if you are asking
to detect when the appl_ptr is modified through some other means (which
I didn't get) we will have the same problem, won't we?

see the initial thread here:

https://lore.kernel.org/alsa-devel/de5e91c6-5f0e-9866-a1c2-0943b4342359@linux.intel.com/
