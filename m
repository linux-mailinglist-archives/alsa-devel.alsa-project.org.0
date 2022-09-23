Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE0E5E7660
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 11:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF58851;
	Fri, 23 Sep 2022 10:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF58851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663923626;
	bh=fuqDTgj8aGeCVVCERoOqsketaTXL7x9L7oDYcKO5Kas=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2nnR69wRe/e+SRyr3dY7OlWaa0faRhhfJGsUpbZuBz+eI0S6wjH5edFNNr9zL5r8
	 qSigBGhFhszMIx+U6cfE5PjL3Kfe+iabfz6gHT7SBzHvfaMzqdcShk0mivH8MXYxTY
	 fzLG5yUeA1vHYEXw9s579Mnat/TPSt/CkyUS1pIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F9EF80551;
	Fri, 23 Sep 2022 10:58:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58E24F80558; Fri, 23 Sep 2022 10:58:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBABAF8053C
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 10:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBABAF8053C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="HQW5S2m5"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 327CF660223C;
 Fri, 23 Sep 2022 09:58:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663923496;
 bh=fuqDTgj8aGeCVVCERoOqsketaTXL7x9L7oDYcKO5Kas=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HQW5S2m5CuWeUACCNWwwXnsmPXSLHbtrAibfrVjT5uSt8FgRemJ3QHaG4J3/M6xar
 DZCh6ckfcK7cV0mcELEM3XC+FufRYEKqoKJYa2F8I0SIdl1v27K0MnVCIs9id5PW7L
 SLRo9kUgvTb72oALQioRpST22ge7cdMO/pHtTtBTX4DVJXZsF1Tj04EBQzJfb3nSa6
 fwKWp70tItEA9FybuHyefC+l5QK9aAYxa/1roAxbRFkwWDQMxYlGBZnvDeNC4pvRbe
 epP5DFFpmL+azixuKvMdvGA8PQEQw6g3/4IwOyJprC5xlUxdlUm7IQIrKTOqq4Tv5q
 QxES9mCCdegiA==
Message-ID: <df06e77d-617c-2b0c-d168-aa876e80aa4b@collabora.com>
Date: Fri, 23 Sep 2022 10:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/6] ASoC: mediatek: mt8192-mt6359: Expose individual
 headset jack pins
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-2-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-2-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
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

Il 23/09/22 01:59, Nícolas F. R. A. Prado ha scritto:
> The rt5682 codec is able to distinguish between two event types:
> headphone insertion/removal and headset microphone insertion/removal.
> However, currently, the mt8192-mt6359 driver exposes a single kcontrol
> for the headset jack, so userspace isn't able to differentiate between
> the two events.
> 
> Add a definition for the headset jack pins, so that a separate jack
> kcontrol is created for each one, allowing userspace to track and handle
> them individually.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[On MT8192 Asurada Spherion Chromebook]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

