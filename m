Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E934D9C06
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 14:20:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C6D82C;
	Tue, 15 Mar 2022 14:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C6D82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647350430;
	bh=KBc4Aujoo1XQDCjrBFgZKWdDskak3aNfGrunHc/KcHI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VnroU/NYstm9YFc6gyozR3EX/MAQjH5hu/odb6Vz//R8ZipCZQrEnYezsb49NBFAR
	 b0jDKErOyQksHjX5Cp2XWXMtdxLStOGQORfRat2qA8I5kdvaMalUkHsrgIpbkcI5zl
	 rjuFfiXtq3ryjutxsF9eSsKyx36Y9jTCudZa/WR4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3888AF80095;
	Tue, 15 Mar 2022 14:19:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCA7F80095; Tue, 15 Mar 2022 14:19:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B96AF800FF
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 14:19:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B96AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="BteBlx9S"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1276C1F43FB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647350354;
 bh=KBc4Aujoo1XQDCjrBFgZKWdDskak3aNfGrunHc/KcHI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BteBlx9Save0tBUDlrZL+Dhk/GRQ/FhCA0YV7AJ81xpeUyW/s2lgLiGa0w56eF/zm
 Fhab1w7mm0Syq/1Q+S9Ug7SbhsKwGOnxG5bbaz5uqplp8SUewnXhPrN5RBowPIdipi
 Wmj+aZLoCAy7UlIgpaJrsnNSzQdLINFJQqeQ8FJKfbbVwECvqRIzN8wdkQEwjd/3FT
 5ERI6uXHaA1EizH8LhgcP9J7swA0d6cKuWglRHWYJiONRxzT/p9OeiyAjXg1EmCoHt
 FRJBxkMspgCbHtMBVu1nxChP/UP4EUzUJFYmLWGiJGQKUe9V2VSWRN0SLK9T4liAuW
 O4/ZL+7Kl3F9w==
Message-ID: <8aa94e65-0a3c-47dc-44d2-60d5dc996cf0@collabora.com>
Date: Tue, 15 Mar 2022 14:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 10/19] ASoC: mediatek: mt8186: support tdm in platform driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-11-jiaxin.yu@mediatek.com>
 <3c7c6e67-072c-6377-05bd-1b5baa579666@collabora.com>
 <YjCRZTu8AkYI0JVR@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YjCRZTu8AkYI0JVR@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Il 15/03/22 14:15, Mark Brown ha scritto:
> On Mon, Mar 14, 2022 at 11:39:11AM +0100, AngeloGioacchino Del Regno wrote:
>> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
>>> Add mt8186 tdm dai driver.
>>>
>>> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>>> ---
>>>    sound/soc/mediatek/mt8186/mt8186-dai-tdm.c | 695 +++++++++++++++++++++
>>>    1 file changed, 695 insertions(+)
>>>    create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
>>>
>>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c b/sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.


I'm sorry Mark, I usually do that, but this time it appears that for
some reason I forgot to delete the context on top of my reply, and ended
up deleting only the one on the bottom of it.

I'll pay more attention to that next time.
Sorry again.
