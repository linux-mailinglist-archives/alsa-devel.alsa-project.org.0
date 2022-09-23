Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C12635E765A
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 10:59:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6D820C;
	Fri, 23 Sep 2022 10:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6D820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663923550;
	bh=HojcwP0javbKhpGvdwYvvMIBYQZE3Xeo/wFOgWUndY8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebHtP9xJhEko/rkxFIgrITf3UR5+sfJK8meF5X8Q4vAIyzlN3X5HymX1WUzzNTu/I
	 WQxCOa1oMRVRdjv5oX3LcrQFAjosJUr8pGUvya6NjedIn2KkRnYXbPx7PwBmLYTl33
	 DRl4Gd7mggON5uamhe6t9lmqfALH7IrmEniwAIN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA56FF804D1;
	Fri, 23 Sep 2022 10:58:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02D20F804AC; Fri, 23 Sep 2022 10:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D03ECF80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 10:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D03ECF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="iD16nnr+"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B8481660223B;
 Fri, 23 Sep 2022 09:58:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663923484;
 bh=HojcwP0javbKhpGvdwYvvMIBYQZE3Xeo/wFOgWUndY8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iD16nnr+RBRce4iSEjLfgXsSPpjxVUhKVYNDIXj/tboj1LMFvkL2WS4pBlSJH/Wj3
 JIzxEDdPjGy0cQxcs/wWIQwfxLLn3KpQ3DWI0EHTSJ+DM0sgJuYpQQTTooQjBC5ync
 V+jtcIxZWGSJwPBpRmWLzSCC4EIFR7EigEopN26wCAZxAsUsMzqMCZnaL3Of4+yfIL
 45wDe9NSPnTFsVNdDOHEOlgT1imX6pPELEQPQKDUpdbv4sMj5gyYgGAbbGYGgpq7TR
 5dL9kwI+BZSq/5PU8wd7MWc66JnIOTlQzF7TIe/EEZF+jA4FfCNKU5arfF2gZL95jb
 RMyhMhX7rjMiA==
Message-ID: <c8205995-5398-6b23-7e35-c441c42232d1@collabora.com>
Date: Fri, 23 Sep 2022 10:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 6/6] ASoC: mediatek: mt8186-rt5682: Expose individual
 headset jack pins
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
References: <20220922235951.252532-1-nfraprado@collabora.com>
 <20220922235951.252532-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922235951.252532-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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
> However, currently, the mt8186-rt5682 driver exposes a single kcontrol
> for the headset jack, so userspace isn't able to differentiate between
> the two events.
> 
> Add a definition for the headset jack pins, so that a separate jack
> kcontrol is created for each one, allowing userspace to track and handle
> them individually.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


