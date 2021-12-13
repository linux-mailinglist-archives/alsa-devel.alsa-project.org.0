Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8C4737D0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 23:45:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E19818BF;
	Mon, 13 Dec 2021 23:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E19818BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639435518;
	bh=+jzYdtXs7CB4ta79rrB++MGxP0waydJU7QsAh1AmXQo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afqFpo1Rn59O9JdF+F29BEQO2k6Hb7Ew86OPMqKbeNtwFr3JNGPkDT7RpkeM1ix+m
	 D6XqNvAmaNxdsDSnqGEGslSzgTz4TqjZkuizk9TxhOE1JmTRb0iPpGrffnSAAYVqs+
	 oINmdvP5T4+EbBJiCETHGI4XK0GwBSjI49NsKfQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 276B4F802E8;
	Mon, 13 Dec 2021 23:44:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B74F8042F; Mon, 13 Dec 2021 23:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30028F8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 23:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30028F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="lIhD4VLF"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 7A1501F44304
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639435458; bh=+jzYdtXs7CB4ta79rrB++MGxP0waydJU7QsAh1AmXQo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lIhD4VLFF2S6LlIDylVcf8FfHctEQWqmhWUr+LKKcAcmy9YIByC53bq6Eo7A2Q+GW
 G1bDUmwqaSkSoMMnGWD7S/e6cDOqeOaqjRy3Y0GsYOEga5PibX2MJA/dlMIq0VeaB/
 ZFXivb0uRKvsinimGrTPvCG+fml899xWKRTbLvBTdCky2nj1Jo8ZsCBz5eFox/SOO/
 gQ5TwXw9vLjtHFqNIyZPIdvwBwmfSeIjz0Ns+NFWpN0JKasZEHSTlmeHyVaIRVpgh/
 bG7XQVAWqF1hck75vl29HTYXEhYOnlrckapPzQrsKu95krz3dG1cQ2U8xOPYbhvJyh
 lXhvoa6gMND9A==
Subject: Re: [PATCH 3/4] ASoC: fsl-asoc-card: Add optional dt property for
 setting mclk-id
To: Rob Herring <robh@kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
 <20211203134930.128703-4-ariel.dalessandro@collabora.com>
 <Ybeu/1vsUzvAg2Ya@robh.at.kernel.org>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <288a8463-b4dc-80cc-1964-23ef613201c4@collabora.com>
Date: Mon, 13 Dec 2021 19:44:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <Ybeu/1vsUzvAg2Ya@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 michael@amarulasolutions.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

Hi Rob,

On 12/13/21 5:37 PM, Rob Herring wrote:
> On Fri, Dec 03, 2021 at 10:49:29AM -0300, Ariel D'Alessandro wrote:
>> Sound cards may allow using different main clock inputs. In the generic
>> fsl-asoc-card driver, these values are hardcoded for each specific card
>> configuration.
>>
>> Let's make it more flexible, allowing setting mclk-id from the
>> device-tree node. Otherwise, the default value for each card
>> configuration is used.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>  Documentation/devicetree/bindings/sound/fsl-asoc-card.txt | 1 +
>>  sound/soc/fsl/fsl-asoc-card.c                             | 6 ++++++
>>  2 files changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
>> index 23d83fa7609f..b219626a5403 100644
>> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
>> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
>> @@ -82,6 +82,7 @@ Optional properties:
>>    - dai-format		: audio format, for details see simple-card.yaml.
>>    - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
>>    - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
>> +  - mclk-id		: main clock id, specific for each card configuration.
> 
> Ahh, there it is. This change and the header defines should be 1 patch 
> and driver changes another.

Ah, I see. I'll split it and send a patchset v2 for this.

Thanks,
Ariel
