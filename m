Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A963D3F5
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 12:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8AF16FC;
	Wed, 30 Nov 2022 12:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8AF16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669806440;
	bh=Vjz1D7fPn+LzVWFAgAbnGfbzxs0NBWSFhZrWPMUaMg4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AsozUnVC34ZxbyUpHTnTLrsav90gyI6R6ier/1pIj0M9TWyutes42fHqZUtlt33dK
	 PXksninxM0HKrf6R2CAQr7sxkhPNvEoiDO2z8OLo9nabQ2SSu7mKtK8PLmmj919sAc
	 YOgmAtPTwr0c1g0BGI8SjS6nI76SNHoggG9n3qYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E7EFF804E6;
	Wed, 30 Nov 2022 12:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56CE5F8023A; Wed, 30 Nov 2022 12:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AAD8F800B6;
 Wed, 30 Nov 2022 12:06:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AAD8F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="hzb39mNu"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EC84F6602B30;
 Wed, 30 Nov 2022 11:06:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669806372;
 bh=Vjz1D7fPn+LzVWFAgAbnGfbzxs0NBWSFhZrWPMUaMg4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hzb39mNuGctzT/7k70YPp1QxYuB+wbssfrnCGJrdEACeyOXdM7cr0I6i+M4tpCkhu
 3wpsWoiq2PBwE4XqBX6eM9kkrvZwY/FWTogxWcShwDX7TPwPw9LCkHbahD9V60p+4H
 nUKw7F8JLfz8jSdqtxVOgfYHjVxOv090WgVtrl1cqYEDx4aGFYUCiKeNyIzbirR6o9
 KKH/ovphqjoPyng3IQRPm+SwMW8qLqDfDsFIWlMMf62LSf1YCK4U/IQulKE2u8AQsU
 7m3KVhrNO4/7kdmmbLMoBkd+LlHVmrhdAnyU8+gcqBhiHUqWkHK5cB1/2149/tTn00
 1cgJwO13MMoSg==
Message-ID: <90661309-5947-38f2-e4c7-67066658f448@collabora.com>
Date: Wed, 30 Nov 2022 12:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: add shutdown callback
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221127-mtk-snd-v1-0-b7886faa612b@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Il 27/11/22 21:04, Ricardo Ribalda ha scritto:
> If we do not shutdown the peripheral properly at shutdown, the whole system
> crashes after kexec() on the first io access.
> 
> Let's implement the appropriate callback.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

