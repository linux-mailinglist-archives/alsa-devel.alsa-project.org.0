Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D25D29BD3B
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 17:48:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A101690;
	Tue, 27 Oct 2020 17:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A101690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603817283;
	bh=lbnIl8C60QZBbT8nZixp+Y+angODHnT0IKUKHxucKpc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzmrY3rz4IkoEVFhwSBk+lRScQ9cromoSzBrzMsaxY7A5w8L7ozsogKHMKFDhdukp
	 +eZyuboGiXNg5UZENDEB3QSGy0wIPzlQyGw6w8Jtat4RGLcT+f3pxCTnM15IC8RjuL
	 U2Os+fjQwXb0nAwGV5mDMz48MICZkOyPRoMbuIlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7903CF80240;
	Tue, 27 Oct 2020 17:46:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A11F80240; Tue, 27 Oct 2020 17:46:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D906F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 17:46:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D906F80086
IronPort-SDR: UpbYbX6jFgRwO7MecpBYnj9rHFt/FvZjoqGNILKmY4YCE62M7j1+nFufSXpcVe7b3xyyb5Ktk8
 x98vtGu1Onzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="168245815"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="168245815"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:46:11 -0700
IronPort-SDR: uplTI+FdS/8Zy2oa802eVL8155PjTeCFJb07xaLqtb3MHOhG5H48R+VfEXdfaf30+Ve++1rM5z
 gP9lbZqpCLEA==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="318289168"
Received: from bretdavi-mobl2.amr.corp.intel.com (HELO [10.209.106.41])
 ([10.209.106.41])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:46:10 -0700
Subject: Re: [PATCH 1/2] ASoC: soc-compress: tidyup STREAM vs COMPRESS
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87wnzcfnkk.wl-kuninori.morimoto.gx@renesas.com>
 <87v9ewfnj9.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <699d5b33-d88f-ba08-7d63-61ec9fbdc5d8@linux.intel.com>
Date: Tue, 27 Oct 2020 11:05:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87v9ewfnj9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 10/26/20 8:51 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_runtime_activate() and
> snd_soc_dai_digital_mute() need SNDRV_PCM_STREAM_xxx
> instead of SND_COMPRESS_xxx.
> 
> These are bug but nothing happen because these are same value.
> 
> 	enum {
> 		SNDRV_PCM_STREAM_PLAYBACK = 0,
> 		SNDRV_PCM_STREAM_CAPTURE,
> 		...
> 	};
> 
> 	enum snd_compr_direction {
> 		SND_COMPRESS_PLAYBACK = 0,
> 		SND_COMPRESS_CAPTURE
> 	};
> 
> This patch tidyup it.


Could we use this instead:

enum snd_compr_direction {
	SND_COMPRESS_PLAYBACK = SNDRV_PCM_STREAM_PLAYBACK,
	SND_COMPRESS_CAPTURE = SNDRV_PCM_STREAM_CAPTURE
};

Or remove this duplication completely and get rid of snd_compr_direction?

I find it odd to convert two things that had no reason to be different 
in the first place.

