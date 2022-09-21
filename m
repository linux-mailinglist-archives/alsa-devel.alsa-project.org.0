Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 708155BFDA9
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 14:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F184086F;
	Wed, 21 Sep 2022 14:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F184086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663762750;
	bh=ZqLHdcmZ3jM1WLgRQfy/dghDg8AblsWqEL1j75mDDJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jij9u10mFJ80NOkm3tXWylSSWvVA523JrEl3tT3/51oi+mCXX91BlRBMNIXbRvRuJ
	 zxbv61x5Rg7BNBfgBuL0rdQU+X7r0d6Ia4t/jESc1ONhpREJN7KlzH/jl8Tz0NyRAa
	 /jW6J2xOYdsodUhjiqcFEmma3FKtsjsxD5ynQjkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49947F80425;
	Wed, 21 Sep 2022 14:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A88C4F800C9; Wed, 21 Sep 2022 14:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86AC8F800C9;
 Wed, 21 Sep 2022 14:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86AC8F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="JgLMbHtr"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9416C6600010;
 Wed, 21 Sep 2022 13:18:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663762681;
 bh=ZqLHdcmZ3jM1WLgRQfy/dghDg8AblsWqEL1j75mDDJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JgLMbHtr14YD0NJw96u62HHbnIPkNyWHmQTWLMe2lDPiHzjbMPk6ds5swVfk8S1Q8
 SLXGwlaKhEetj1yy7nMHlZe95lbBiRNGeIoCnK3BSdL4PvcRy7F2YhtaAkmbMRHlFh
 QaHw5soZow7GVt9GZ4gL0acRAJSS5KmANMqZOa/wr2cRnFOghlk5J5LXClcV5pPKTB
 ic5alO6vUbtxg/hfHepE9R4foLLaZFl+AhRBovlvi6BDBBGFa7HUpxkd/u2Xrn4xL9
 CRrB5jRuHS0RqsHv7EG9A9QbKW3mKukzdLgGT8sj3G2qMyYJI8lG4n13Ox5kgsI6RN
 IiCOX4Z9m3Kog==
Message-ID: <dbe3f7fb-5fae-b147-f824-cd39ba3900ca@collabora.com>
Date: Wed, 21 Sep 2022 14:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: add pcm_pointer callback for mt8186
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com
References: <20220921120239.31934-1-chunxu.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921120239.31934-1-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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

Il 21/09/22 14:02, Chunxu Li ha scritto:
> add pcm_pointer callback for mt8186 to support read
> host position from DSP
> 
> Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>

Hello Chunxu,
Can you please also add this, along with the .pcm_hw_params callback to mt8195.c?

Anyway, for this one:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


