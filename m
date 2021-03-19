Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E53422B8
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 18:01:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8934B169F;
	Fri, 19 Mar 2021 18:00:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8934B169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616173267;
	bh=v2t/iob1WPNIr/JbfSbdzkaRfjtehgTQ5UQR7NkstHA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFWUEqN3/+xhHqepOa8i9Sw8q7bFreJfOAD3J6gZNppuKSTRpNzgHnCRcY7RPpkCd
	 wQ8rIsQIFgdDxIRp9KHNp9Hk+5zKoApe6cKeq/ThAFrFOXSYsoJLfaxuxvjzTFlfnk
	 MU3G8CIKEmt3wh4fNMSOUkpBFqbRgBLtA/e9e9lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AE3F80430;
	Fri, 19 Mar 2021 17:58:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3678F80254; Fri, 19 Mar 2021 17:58:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D144F800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 17:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D144F800E0
IronPort-SDR: 6eW0wNWmKI0IsySnX6HkYRR7Ug2CrDaeaekHdwmfJe48hM00nGY2WS4PuqYiMe6C7TLMMDUhga
 T3h+TbhiTfFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="190022225"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="190022225"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:29 -0700
IronPort-SDR: K8CaVHAuhQq6PMoKxpssvj+a68B72QDjgalp//VNWxiXUqHsWBYYNf3hd21+P4iE7ytjWu45mL
 ASQnpwOGN4ug==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="406867512"
Received: from dgerstma-mobl.amr.corp.intel.com (HELO [10.212.157.39])
 ([10.212.157.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 09:58:28 -0700
Subject: Re: [PATCH v3 0/7] ASoC: codecs: add wcd938x support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27e19637-b9ea-1adb-46e5-252480a9a353@linux.intel.com>
Date: Fri, 19 Mar 2021 11:09:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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



On 3/19/21 4:29 AM, Srinivas Kandagatla wrote:
> This patchset adds support for Qualcomm WCD938X codec.
> 
> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices, RX and
> TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 7 x TX diff inputs, 8 DMICs and MBHC.
> 
> Even though this device has two SoundWire devices, only tx device has
> access to main codec Control/Status Registers!

That part is a new concept we haven't seen so far with SoundWire 
support, and I added a number of comments in the patches.

It would really help if you could add more explanations on how 
regmap/pm_runtime/gpios/regulators/interrupts are supposed to work with 
such a functional split. Thanks!

> This patchset along with other SoundWire patches on the list
> have been tested on SM8250 MTP device.
> 
> Am planning to send support for MBHC once this driver gets accepted!
> 
> Thanks,
> srini
> 
> Many thanks for reviewing v2.
> 
> 
> Changes since v2:
> 	- fixed dt_binding_check error
> 
> 
> Srinivas Kandagatla (7):
>    ASoC: dt-bindings: wcd938x: add bindings for wcd938x
>    ASoC: codecs: wcd-clsh: add new version support
>    ASoC: codecs: wcd938x: add basic driver
>    ASoC: codecs: wcd938x: add basic controls
>    ASoC: codecs: wcd938x: add playback dapm widgets
>    ASoC: codecs: wcd938x: add capture dapm widgets
>    ASoC: codecs: wcd938x: add audio routing
> 
>   .../bindings/sound/qcom,wcd938x.yaml          |  165 +
>   sound/soc/codecs/Kconfig                      |    9 +
>   sound/soc/codecs/Makefile                     |    2 +
>   sound/soc/codecs/wcd-clsh-v2.c                |  350 +-
>   sound/soc/codecs/wcd-clsh-v2.h                |   16 +
>   sound/soc/codecs/wcd938x-sdw.c                |  291 ++
>   sound/soc/codecs/wcd938x.c                    | 3623 +++++++++++++++++
>   sound/soc/codecs/wcd938x.h                    |  676 +++
>   8 files changed, 5122 insertions(+), 10 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>   create mode 100644 sound/soc/codecs/wcd938x-sdw.c
>   create mode 100644 sound/soc/codecs/wcd938x.c
>   create mode 100644 sound/soc/codecs/wcd938x.h
> 
