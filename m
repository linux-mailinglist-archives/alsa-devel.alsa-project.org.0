Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC47533AC7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 12:42:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87CAA1672;
	Wed, 25 May 2022 12:42:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87CAA1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653475378;
	bh=xXH5hN96WvbdMWEtdR67xyJ1Nu1XNE5YBoILGq7ZbpQ=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iyTV6r1lpwcB9oH4/aYKnqzJxQzqRsHXol22gtYalqiGkLS95Vk2T/DTLkxhVUpqZ
	 mqmJvDIkMc8sLq1ZIEcnQTicHuNGCjGzB1VmR/K0JMsVlQ6SuHcoGN5bgKnJ5q3Es3
	 46uRV9aPbYAspGAirjLOkpo0ls8ZmjrQ//mAZI4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CC06F80100;
	Wed, 25 May 2022 12:42:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E43FF8016D; Wed, 25 May 2022 12:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E2AF80116;
 Wed, 25 May 2022 12:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E2AF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="GPVM261L"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2683B1F448AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653475310;
 bh=xXH5hN96WvbdMWEtdR67xyJ1Nu1XNE5YBoILGq7ZbpQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=GPVM261LD27yCOCRgYPXMlzrkHAEPhQ89rHcxGYniANEaVsJsymLMyx1CwnD76jpo
 DKUEjtN2qnR1ESBC9BhZ91Cz3avwwyzhdQOKDeGAN4ErtgF4V+kDIVXQ509uW/hWRT
 0xQOmuokQ8lvqgdR4sbjbkYIZ8Cu5dSj3RiGucUWNhQsjZ7fApWtBR45VVX974yrkO
 B198tAeJ+Bi6SVYt0liqgvPrEnbkDwhSSA0CytvrGumQjHCVw9Wwn1rMA6IW28wSr3
 vD9MSPkDBGuwCPyg6z0PbGGA9aMIGw4IP34+jTqIjCM2bphQ1dFtp6er0RXBtnZCy9
 Kfk2xShk+Gj8Q==
Message-ID: <ae47e12b-396c-a5a0-2da2-2010237fbbc2@collabora.com>
Date: Wed, 25 May 2022 12:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol interface
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
 <20220407130338.28939-2-allen-kh.cheng@mediatek.com>
 <54d6c0ff-d93c-0506-4db9-3852c69211ab@collabora.com>
In-Reply-To: <54d6c0ff-d93c-0506-4db9-3852c69211ab@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

Il 25/05/22 12:39, AngeloGioacchino Del Regno ha scritto:
> Il 07/04/22 15:03, Allen-KH Cheng ha scritto:
>> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
>>
>> Some of mediatek processors contain
>> the Tensilica HiFix DSP for audio processing.
>>
>> The communication between Host CPU and DSP firmware is
>> taking place using a shared memory area for message passing.
>>
>> ADSP IPC protocol offers (send/recv) interfaces using
>> mediatek-mailbox APIs.
>>
>> We use two mbox channels to implement a request-reply protocol.
>>
>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
>> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
>> Reviewed-by: YC Hung <yc.hung@mediatek.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/firmware/Kconfig                      |   1 +
>>   drivers/firmware/Makefile                     |   1 +
>>   drivers/firmware/mediatek/Kconfig             |   9 +
>>   drivers/firmware/mediatek/Makefile            |   2 +
>>   drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
>>   .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>>   6 files changed, 239 insertions(+)
>>   create mode 100644 drivers/firmware/mediatek/Kconfig
>>   create mode 100644 drivers/firmware/mediatek/Makefile
>>   create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>>   create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
>>
> 
> Gentle ping for this one, as it's getting stale... and it's ready.
> 
> To add context, this driver is *really* necessary, as support for it
> is added in the MT8195 ASoC SOF driver as a platform device [1], and the
> necessary memory regions are coming from the mediatek,mt8195-dsp [2] driver.
> 
> [1]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/sound/soc/sof/mediatek/mt8195/mt8195.c?h=next-20220525#n389 
> 
> 
> [2]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml?h=next-20220525#n61 
> 
> 
> Cheers,
> Angelo


I'm sorry, ignore me, another version of this one was already merged.

