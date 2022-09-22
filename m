Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5255E64CD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Sep 2022 16:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B07C11EF;
	Thu, 22 Sep 2022 16:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B07C11EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663855915;
	bh=TRFbPqxLjzBnnRuOCvs2z9tXxp7atOEkeLU6sHlD8YU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vEY6hwEGRZfZl8OYQAF46oXgib8yHfsSkXyZJUKZy5CSoRDwzLm2yR1SVKS/vWdzN
	 rPYQXSmQYqNHw5Tm63PIH3hvN113ke3syzaz/rmlVx7KSNUhnK09DYK4nPlUU3BiYX
	 UEKSqB69OeddttNeHZN+51z7D4Hel60Hyy4QMA98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1692CF8030F;
	Thu, 22 Sep 2022 16:10:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 052AEF80107; Thu, 22 Sep 2022 16:10:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CBEAF80107
 for <alsa-devel@alsa-project.org>; Thu, 22 Sep 2022 16:10:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CBEAF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="CxncZmHM"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E089D6602226;
 Thu, 22 Sep 2022 15:10:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663855851;
 bh=TRFbPqxLjzBnnRuOCvs2z9tXxp7atOEkeLU6sHlD8YU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CxncZmHMmvJEFr47r1L2iLmzqZ6K/ReKW1iYT8vOzF88RAlJRHAyRpucfkUqZlCU4
 Ajpzu48dd3cJyhGPrAOdgwv2dzeLBjo/+/+6JnZZivUPaCXlPetWhYa+SzYcR0OXgw
 ozNqeBeszz/ytO+5hUT00f6rUJNoWC2tCV1/V19Uu9tosPk7Ok7AmxDStWcSiWuRxK
 MStKSKGriOOaQ2bW6lR9Eu0IkLM8swgd+emBPBN8EVDGV5i/8TQ1PA5i0ouOGbOq3l
 37kypuWk60yKQz10gaVkiIUX8hd+2aR31u/a8FYLH84+vtQVtTn6TGySpqMCW4k37u
 bYz0fknrWd5Bg==
Message-ID: <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
Date: Thu, 22 Sep 2022 16:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead
 of custom ops
To: Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com> <YyxjZ9nCBdVovkVs@sirena.org.uk>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YyxjZ9nCBdVovkVs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

Il 22/09/22 15:30, Mark Brown ha scritto:
> On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:
> 
>> snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure whether
>> it would introduce any side effect or not.  Perhaps Trevor could
>> provide some suggestions.
> 
> If it does it should be to fix isues rather than introduce new
> problems - I suspect the other operations just don't work
> currently.

 From my upstream tests, this didn't introduce any issues, that's why I've
sent this patch.

In any case, let's check with Trevor, just as to be extremely sure, but please
use an upstream kernel for eventual tests, as there are quite a bit of changes
between 5.10 and current upstream.

Cheers,
Angelo
