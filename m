Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0770F5A1C04
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 00:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94E72950;
	Fri, 26 Aug 2022 00:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94E72950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661465608;
	bh=ZpkdgljukMvecL8dgUDfn4ptIdOfX7y4FE5jJ/1fyU8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PaOMFQlC0oaAJg3IIh+X/IuPRRK3LSITjQBdAhrHMYqv1Agz70ltZcBhxAqy5sq6q
	 9icLH+ZsiXEhj0SJjrrPbOx59BrlD6dp9PyBzGbgT3NBmCyyRot1mYrklRpSxicFQY
	 UR4VMd98lD4duA8sHn9SSX86LpD4Vro8NcPjAwhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08F7CF80271;
	Fri, 26 Aug 2022 00:12:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB65F8025A; Fri, 26 Aug 2022 00:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 804A9F800BD
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 00:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 804A9F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="CEbKAGvN"
Received: from [192.168.1.90] (unknown [188.27.54.142])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 419056601EB5;
 Thu, 25 Aug 2022 23:12:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661465540;
 bh=ZpkdgljukMvecL8dgUDfn4ptIdOfX7y4FE5jJ/1fyU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CEbKAGvNBIYzi/Ti1LMdKMpobOKF+6xnSWpPY8TtbYhJmhvkUPzXS7TCk15ELaiyG
 RmDBvSGUrPPOP36LARHEo/YqzG0abwAvwOsart9PACe+QmB7OTAoOKXwmFWJeP6iv9
 HVu6iQCvpK2lrY/K65Em5GbxT4qem/A/pT7nsO+OGs0yt6PjK5JtsV+GoZnlGXjHee
 NuBCeHYFUFid+sW5x+baxZ4Q8WyfVflumIRXR7VeKnPtcXzfXCm1ZAom8uo80HB2kU
 BkOO2p21RGzk7QYBIJtUP4nRtZoJ9UedFi0R5Vg8zcnHjTp4A4CBB5ad/CumusXZo3
 Bh6D/yQ4w7z/A==
Message-ID: <1d0bd2ec-ce27-02fa-b538-4636ca9ac289@collabora.com>
Date: Fri, 26 Aug 2022 01:12:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ASoC: wm_adsp: Silent parsing error on loading speaker
 protection fw
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20220823133347.919706-1-cristian.ciocaltea@collabora.com>
 <20220825124715.GM92394@ediswmail.ad.cirrus.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20220825124715.GM92394@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vlad Karpovich <Vlad.Karpovich@cirrus.com>, linux-kernel@vger.kernel.org
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


On 8/25/22 15:47, Charles Keepax wrote:
> On Tue, Aug 23, 2022 at 04:33:47PM +0300, Cristian Ciocaltea wrote:
>> The tracing capabilities for the speaker protection fw enabled via
>> commit c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker
>> protection FW") are not be available on all platforms, such as the
>> Valve's Steam Deck which is based on the Halo Core DSP.
>>
>> As a consequence, whenever the firmware is loaded, a rather misleading
>> 'Failed to parse legacy: -19' error message is written to the kernel
>> ring buffer:
>>
>> [  288.977412] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware version: 3
>> [  288.978002] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: cs35l41-dsp1-spk-prot.wmfw: Fri 02 Apr 2021 21:03:50 W. Europe Daylight Time
>> [  289.094065] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Firmware: 400a4 vendor: 0x2 v0.33.0, 2 algorithms
>> [  289.095073] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 0: ID cd v29.53.0 XM@94 YM@e
>> [  289.095665] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: 1: ID f20b v0.0.1 XM@170 YM@0
>> [  289.096275] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Protection: C:\Users\ocanavan\Desktop\cirrusTune_july2021.bin
>> [  291.172383] steamdeck kernel: cs35l41 spi-VLV1776:01: DSP1: Failed to parse legacy: -19
>>
>> Update wm_adsp_buffer_init() to *not* report the ENODEV error when the
>> firmware type is WM_ADSP_FW_SPK_PROT.
>>
>> Fixes: c55b3e46cb99 ("ASoC: wm_adsp: Add trace caps to speaker protection FW")
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>   sound/soc/codecs/wm_adsp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
>> index cfaa45ede916..7514fc03b468 100644
>> --- a/sound/soc/codecs/wm_adsp.c
>> +++ b/sound/soc/codecs/wm_adsp.c
>> @@ -1602,7 +1602,7 @@ static int wm_adsp_buffer_init(struct wm_adsp *dsp)
>>   	if (list_empty(&dsp->buffer_list)) {
>>   		/* Fall back to legacy support */
>>   		ret = wm_adsp_buffer_parse_legacy(dsp);
>> -		if (ret)
>> +		if (ret && (dsp->fw != WM_ADSP_FW_SPK_PROT || ret != -ENODEV))
>>   			adsp_warn(dsp, "Failed to parse legacy: %d\n", ret);
> 
> Fixing this for a single firmware probably doesn't really make
> the most sense, if we are treating buffers as optional these days
> I guess really the best solution would be to make this either an
> info and slightly rephrase the message or make it a dbg message.

Indeed, I have just submitted v2 for a more generic handling of the issue:

https://lore.kernel.org/all/20220825220530.1205141-1-cristian.ciocaltea@collabora.com/

Thanks for reviewing,
Cristian

> Thanks,
> Charles
