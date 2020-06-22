Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB60B20386F
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5546216C9;
	Mon, 22 Jun 2020 15:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5546216C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592833767;
	bh=WGhIFVPE2/6UqnmyD9L0Hs7mfKtPp0cpQqwJkZhSvK8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RHlJ5Ig0QBh0IXhfCtPeYwsL/Buu65Bu5d5lUxB7gCpagK/WlJedPkKNZURvvrQdS
	 UpRVte6gkzDTFHliPeG6oZ2VvBIuxgmYAFnvr4GDaqh7tU8Mi4eIFDCKc//F+k/zrm
	 YmMrwwV9PBJezp32AZDOyX7nxvwExlcFKtd7ZeYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89FDDF80246;
	Mon, 22 Jun 2020 15:47:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B354FF8010E; Mon, 22 Jun 2020 15:46:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F33CAF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F33CAF8010E
IronPort-SDR: iAM3+yjMGtMCYX09ohaF03Je0Tfnsb/izAu2MU8AeaQll5wjIwxiTsrd/HLP31chOKPOGIsHx4
 +UEv0q6T4CGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="208960443"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="208960443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 06:46:44 -0700
IronPort-SDR: dKvK79inM4zSyJRZ2y4dBvRyTrKxultGjoc1LegHMIjo5FMhForkLdK7G7mqNZbzCgxwofb1wm
 vSlRraV+aGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="262971334"
Received: from agsoto-mobl.amr.corp.intel.com (HELO [10.251.3.142])
 ([10.251.3.142])
 by fmsmga007.fm.intel.com with ESMTP; 22 Jun 2020 06:46:43 -0700
Subject: Re: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200622065811.221485-1-vkoul@kernel.org>
 <20200622065811.221485-2-vkoul@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <800a2632-b263-500f-707e-c1ce94ce92d4@linux.intel.com>
Date: Mon, 22 Jun 2020 08:28:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622065811.221485-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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



On 6/22/20 1:58 AM, Vinod Koul wrote:
> So we had some discussions of the stream states, so I thought it is a
> good idea to document the state transitions, so add it documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   .../sound/designs/compress-offload.rst        | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
> index ad4bfbdacc83..6f86db82298b 100644
> --- a/Documentation/sound/designs/compress-offload.rst
> +++ b/Documentation/sound/designs/compress-offload.rst
> @@ -151,6 +151,58 @@ Modifications include:
>   - Addition of encoding options when required (derived from OpenMAX IL)
>   - Addition of rateControlSupported (missing in OpenMAX AL)
>   
> +State Machine
> +=============
> +
> +The compressed audio stream state machine is described below ::
> +
> +                                        +----------+
> +                                        |          |
> +                                        |   OPEN   |
> +                                        |          |
> +                                        +----------+
> +                                             |
> +                                             |
> +                                             | compr_set_params()
> +                                             |
> +                                             v
> +         compr_free()                   +----------+
> +  +-------------------------------------|          |
> +  |                                     |   SETUP  |
> +  |           +------------------------>|          |<---------------------------------+
> +  |           | compr_drain_notify()    +----------+                                  |
> +  |           |                              |                                        |
> +  |           |                              |                                        |
> +  |           |                              | compr_write()                          |
> +  |           |                              |                                        |
> +  |           |                              v                                        |
> +  |           |                         +----------+                                  |
> +  |           |                         |          |                                  |
> +  |           |                         |  PREPARE |                                  |
> +  |           |                         |          |                                  |
> +  |           |                         +----------+                                  |
> +  |           |                              |                                        |
> +  |           |                              |                                        |
> +  |           |                              | compr_start()                          |
> +  |           |                              |                                        |
> +  |           |                              v                                        |
> +  |     +----------+                    +----------+  compr_pause()  +----------+     |
> +  |     |          |    compr_drain()   |          |---------------->|          |     |
> +  |     |  DRAIN   |<-------------------|  RUNNING |                 |  PAUSE   |     |
> +  |     |          |                    |          |<----------------|          |     |
> +  |     +----------+                    +----------+  compr_resume() +----------+     |
> +  |           |                           |      |                                    |
> +  |           |                           |      |                                    |
> +  |           |                           |      |                                    |
> +  |           |                           |      |          compr_stop()              |
> +  |           |                           |      +------------------------------------+
> +  |           |       +----------+        |
> +  |           |       |          |        |
> +  +-----------+------>|          |<-------+
> +     compr_free()     |   FREE   |  compr_free()
> +                      |          |
> +                      +----------+
> +

Sorry, this confuses me even more...

a) can you clarify if we can go from running to free directly? is this 
really a legit transition? There's already the option of doing a stop 
and a a drain.

b) no way to go back to SETUP from PREPARE? What happens if the app 
never starts but want to tear down the resources?

c) no way to stop a paused stream?
