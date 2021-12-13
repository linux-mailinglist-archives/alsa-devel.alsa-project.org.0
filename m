Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C614737CD
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 23:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBB0518C0;
	Mon, 13 Dec 2021 23:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBB0518C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639435488;
	bh=UEBxljg7U0AjxP8YVVrv1TQKitx1bpMVVjCQIvNZxmM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HwwVPit5u30wUjlg/V40C4xAsZ3FCjpdbFItMAwKp/zgJiNIZfc8tOC/H7OaqqfJh
	 9DQ7oIzWVtwy35YDxvM6nzKcrmtaCwgs3LRhsxfR4MYtv6dTPd/0WNTOvYxTvJEN/8
	 fdI5LVYDxGpuKXmaToUlIIinCmxQlo3QsGBQPKFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60834F80229;
	Mon, 13 Dec 2021 23:43:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68E5BF8025F; Mon, 13 Dec 2021 23:43:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 177CCF80229
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 23:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 177CCF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="gtp42DPr"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 7E26C1F44304
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639435424; bh=UEBxljg7U0AjxP8YVVrv1TQKitx1bpMVVjCQIvNZxmM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gtp42DPr62P1xEgyR9Ua5atRu227T9uo7AU0GOjOCcpdQT76gXktGHcEoHfDVKpSm
 G9sbIRXCepQNryY6CwJygV68qXn+qbLbDs2F0RIUrvbim3xazRDRoBTx+0fEfk3JfQ
 5MMwP3aNhLdNnQTZJymmDEt+r5UKlav1XDpH0FwwQWWwkBPNL5syEkmDr3nNSsFc0l
 x79S1m3gYVR9BXAiYlzobKsupboLT4i+G51pLLa901grhOEhxA9DflmEb7EiuhZC6/
 seQl9WwNKCE589LGMiy59wHts1Ulv9mQVyVx0CXwnS5yA8wJUrILquRIEExGCUy92N
 vh51hArjODXrA==
Subject: Re: [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting
 mclk-id
To: Rob Herring <robh@kernel.org>
References: <20211203134930.128703-1-ariel.dalessandro@collabora.com>
 <YbeukcwXQueEquJZ@robh.at.kernel.org>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <f35f34bc-e850-40a8-7d5e-3b783aeeaac8@collabora.com>
Date: Mon, 13 Dec 2021 19:43:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YbeukcwXQueEquJZ@robh.at.kernel.org>
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

Thanks for the review.

On 12/13/21 5:35 PM, Rob Herring wrote:
> On Fri, Dec 03, 2021 at 10:49:26AM -0300, Ariel D'Alessandro wrote:
>> This is a follow up of patchset:
>>
>>     [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
> 
> Link?

Link to the datasheet?

http://www.ti.com/lit/ds/symlink/tlv320aic3100.pdf

> 
>> Sound cards may allow using different main clock inputs. In the generic
>> fsl-asoc-card driver, these values are hardcoded for each specific card
>> configuration.
>>
>> Let's make it more flexible, allowing setting mclk-id from the
>> device-tree node.
>>
>> Ariel D'Alessandro (4):
>>   dt-bindings: sound: Rename tlv320aic31xx-micbias as tlv320aic31xx
>>   dt-bindings: tlv320aic31xx: Define PLL clock inputs
>>   ASoC: fsl-asoc-card: Add optional dt property for setting mclk-id
> 
> 'mclk-id' is not documented.
> 
>>   ASoC: fsl-asoc-card: Remove BCLK default value for tlv320aic31xx card
>>
>>  .../devicetree/bindings/sound/fsl-asoc-card.txt    |  1 +
>>  .../devicetree/bindings/sound/tlv320aic31xx.txt    |  2 +-
>>  arch/arm/boot/dts/am43x-epos-evm.dts               |  2 +-
>>  include/dt-bindings/sound/tlv320aic31xx-micbias.h  |  9 ---------
>>  include/dt-bindings/sound/tlv320aic31xx.h          | 14 ++++++++++++++
>>  sound/soc/codecs/tlv320aic31xx.c                   |  2 +-
>>  sound/soc/fsl/fsl-asoc-card.c                      |  7 ++++++-
>>  7 files changed, 24 insertions(+), 13 deletions(-)
>>  delete mode 100644 include/dt-bindings/sound/tlv320aic31xx-micbias.h
>>  create mode 100644 include/dt-bindings/sound/tlv320aic31xx.h
>>
>> -- 
>> 2.30.2

Regards,
Ariel
