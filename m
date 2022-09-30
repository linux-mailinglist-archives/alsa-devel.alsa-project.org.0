Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5325F06B7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 10:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B441663;
	Fri, 30 Sep 2022 10:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B441663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664527242;
	bh=E+BdStv7jSermFK3Q5InwQ6aKkfEO1DTevs1KsaSxag=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZRsUWybzFWUZtu9niQgU2dtHTG2PjxyPmfXucvQTMs9SzrkxoYS/H1Q48dORw+4r
	 l3cKfUDqBN42Hn/jJBfopLFNz+x8FVLPKNkqzowKv9624iUPZ+5IPOe9WHcWQDIrez
	 haWnDzRw4CIMyb1L2M3ZzPftZdNWsy3KWag3avKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C128F800AA;
	Fri, 30 Sep 2022 10:39:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C0E1F80155; Fri, 30 Sep 2022 10:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59660F800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 10:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59660F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="lNeI6R1E"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A03266022C7;
 Fri, 30 Sep 2022 09:39:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664527177;
 bh=E+BdStv7jSermFK3Q5InwQ6aKkfEO1DTevs1KsaSxag=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lNeI6R1EXXnZ45AMl3XkvLawGjH/VJQOtxkkFpLQe4SCdssJu3/m5B0GDOXVotcMZ
 hKcUjbhdQomv+eInmQyK+AFRV8dB5wc3VbNcjc4w4/JucBt45ERANOwpdpViZMjXax
 sTw8H1sjGzeOhxk4SZB4YY/oUBJyo4XGl+TcbvXSvbWzgClyokOs6URnn3elSYStCT
 L6iG9TbuhlpgoVpxXi9bDUTlg7lIbnx4OnlyVdrJRpBj1nk9FmiYHpyuWM048d7a3K
 ZM4wIzR9+a1Ek9/kFJVcJ4j/F2IDU29GOAwq57ojVymvNo1xZnR/V0xVudHLnyHSm5
 +02hVKys4vdmg==
Message-ID: <533c4451-a172-df81-c34a-a3ec906a961e@collabora.com>
Date: Fri, 30 Sep 2022 10:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 -next 4/4] ASoC: mt6660: Fix PM disable depth imbalance
 in mt6660_i2c_probe
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 ckeepax@opensource.wolfsonmicro.com, jeff_chang@richtek.com
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
 <20220929150653.63845-5-zhangqilong3@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929150653.63845-5-zhangqilong3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org
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

Il 29/09/22 17:06, Zhang Qilong ha scritto:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by calling
> pm_runtime_disable when error returns.
> 
> Fixes:f289e55c6eeb4 ("ASoC: Add MediaTek MT6660 Speaker Amp Driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


