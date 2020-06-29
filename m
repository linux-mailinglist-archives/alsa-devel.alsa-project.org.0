Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FCF20CD71
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 11:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEF191655;
	Mon, 29 Jun 2020 11:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEF191655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593421672;
	bh=ZKS+okI9KqWCCQim/byB1UijNhCRp3mN7ofh+aGrz5Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0keVbHKI1BMKtwADhmnalZPM6GI1zmdTHVbp7a/SmfqelpK0TdLFbnx30VISHlFF
	 c9pfth9yxF2/h+f71WAJlqvRaOSk5aiyCXlwKduJc1WTT9tib2PS6h9aNS0iloNaEq
	 f+mcVTIUN1v1s5nxdfz7Sur+O3+RVdfKMkEeJ2Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08C64F80217;
	Mon, 29 Jun 2020 11:06:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ECBFF8020C; Mon, 29 Jun 2020 11:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D18AF80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 11:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D18AF80096
IronPort-SDR: inlzV1f0qS4rQ+n7AiDU5Riayo212AI+Vo2V4Q7zO9dgubqrynse3Mw8NMCqEJe+FeqshagcO8
 L4rdVCl7MfIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="163945228"
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="163945228"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 02:05:55 -0700
IronPort-SDR: IHiZZ/2uBuE5q2uzoxtbPOUbIzaP7Wo9/jcAKm7ZJOpzRcmOePKvJX5Ce58yg769rkZSCPsxuC
 /y1DUk+xeuiQ==
X-IronPort-AV: E=Sophos;i="5.75,294,1589266800"; d="scan'208";a="424751636"
Received: from aslawinx-mobl1.ger.corp.intel.com (HELO [10.249.138.39])
 ([10.249.138.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 02:05:52 -0700
Subject: Re: [PATCH v4 1/3] ALSA: compress: document the compress audio state
 machine
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200629075002.11436-1-vkoul@kernel.org>
 <20200629075002.11436-2-vkoul@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <c29b3199-cebd-2153-5530-e75f76aa8b4b@linux.intel.com>
Date: Mon, 29 Jun 2020 11:05:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200629075002.11436-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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



On 6/29/2020 9:50 AM, Vinod Koul wrote:
> So we had some discussions of the stream states, so I thought it is a
> good idea to document the state transitions, so add it documentation
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   .../sound/designs/compress-offload.rst        | 51 +++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
> index ad4bfbdacc83..b6e9025ae105 100644
> --- a/Documentation/sound/designs/compress-offload.rst
> +++ b/Documentation/sound/designs/compress-offload.rst
> @@ -151,6 +151,57 @@ Modifications include:
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
> +  +------------------------------------|          |
> +  |                                    |   SETUP  |
> +  |          +------------------------>|          |<-------------------------+
> +  |          | compr_drain_notify()    +----------+                          |
> +  |          |         or                   ^                                |
> +  |          |      compr_stop()            |                                |
> +  |          |                              | compr_write()                  |
> +  |          |                              |                                |
> +  |          |                              |                                |
> +  |          |                         +----------+                          |
> +  |          |                         |          |   compr_free()           |
> +  |          |                         |  PREPARE |---------------> A        |
> +  |          |                         |          |                          |
> +  |          |                         +----------+                          |
> +  |          |                              |                                |
> +  |          |                              |                                |
> +  |          |                              | compr_start()                  |
> +  |          |                              |                                |
> +  |          |                              v                                |
> +  |    +----------+                    +----------+                          |
> +  |    |          |    compr_drain()   |          |        compr_stop()      |
> +  |    |  DRAIN   |<-------------------|  RUNNING |--------------------------+
> +  |    |          |                    |          |                          |
> +  |    +----------+                    +----------+                          |
> +  |                                       |    ^                             |
> +  |          A                            |    |                             |
> +  |          |              compr_pause() |    | compr_resume()              |
> +  |          |                            |    |                             |
> +  |          v                            v    |                             |
> +  |    +----------+                   +----------+                           |
> +  |    |          |                   |          |         compr_stop()      |
> +  +--->|   FREE   |                   |  PAUSE   |---------------------------+
> +       |          |                   |          |
> +       +----------+                   +----------+
> +
>   
>   Gapless Playback
>   ================
> 

Line containing compr_free (between SETUP and FREE) seems to be misaligned?

If you move prepare to the left and drain in place of drain, it feels 
like you won't need this weird indirection with A
Something like:

 >> +                                             v
>> +         compr_free()                   +----------+
>> +  +------------------------------------|          |
>> +  |                                    |   SETUP  |
>> +  |          +------------------------>|          |<-------------------------+
>> +  |          | compr_write()           +----------+                          |
>> +  |          |                              ^                                |
>> +  |          |                              | compr_drain_notify() or        |
>> +  |          |                              | compr_stop()                   |
>> +  |          |                              |                                |
>> +  |          |                              |                                |
>> +  |          |                         +----------+                          |
>> +  |          |                         |          |                          |
>> +  |          |                         |  DRAIN   |                          |
>> +  |          |                         |          |                          |
>> +  |          |                         +----------+                          |
>> +  |          |                              ^                                |
>> +  |          |                              |                                |
>> +  |          |                              | compr_drain()                  |
>> +  |          |                              |                                |
>> +  |          |                              |                                |
>> +  |    +----------+                    +----------+                          |
>> +  |    |          |    compr_start()   |          |        compr_stop()      |
>> +  |    |  PREPARE |------------------->|  RUNNING |--------------------------+
>> +  |    |          |                    |          |                          |
>> +  |    +----------+                    +----------+                          |
>> +  |          |                            |    ^                             |
>> +  |          | compr_free()               |    |                             |
>> +  |          |              compr_pause() |    | compr_resume()              |
>> +  |          |                            |    |                             |
>> +  |          v                            v    |                             |
>> +  |    +----------+                   +----------+                           |
>> +  |    |          |                   |          |         compr_stop()      |
>> +  +--->|   FREE   |                   |  PAUSE   |---------------------------+
>> +       |          |                   |          |
>> +       +----------+                   +----------+
>> +

but this makes me question PREPARE state, how do you enter it?
