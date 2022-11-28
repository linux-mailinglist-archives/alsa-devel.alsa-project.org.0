Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1663A94E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 14:19:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF8C169D;
	Mon, 28 Nov 2022 14:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF8C169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669641542;
	bh=2uXRwe0i//JyPghl6Zfj5I4f4NSH8kMwVmZpxa1n7FY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HvWKKlCLGvJH76TcJ1SCdDsEuvxC8krfl3L4YsXG2TqHYYtDpZacO8IVJMcFl+NAt
	 omVLLjfsgPRUaZ15lO+J1vmTMZxkH8ax3qp1A5aQKJRmsUG9GzWayF2cIPdP44hqti
	 1QUy7Zu5Go2qyEOViy0ddog648QYz6ezYB8pO7Ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE275F8024C;
	Mon, 28 Nov 2022 14:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34721F8020D; Mon, 28 Nov 2022 14:18:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03727F8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03727F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="jADSdHpH"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A89086600011;
 Mon, 28 Nov 2022 13:17:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669641476;
 bh=2uXRwe0i//JyPghl6Zfj5I4f4NSH8kMwVmZpxa1n7FY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jADSdHpHmCcKmFVAN5qk55NzAn6vTVxeC+UP+4CqVe7eRb+dKH62Vpa8ytwUq0+aq
 9uq75z/bLl/EaFjeMFBrX1ubdQP3XegPiLOu4+BDHfXOqx0qM2xRu9OsGsqc4Q1lcV
 IpDpHDOJgT6Lm1rHjkMhKLkIEJme6Ep3IpdXH/pGjhIdrcfoGrxRnss93TN6uKIWfT
 scFJCZZNE3Xffb/KGzfkQ32slVx5Vrt8pxZTFFe7JEaUQVmAvYeX0NYAnP8VNoXh7m
 Ty2ohY0M9DZFCoitf+DAiyJ/bc24IzRF7OldfEukrDbRX2t8+UHJ6ulQxMtbXPVfNc
 GJX+UgMEOVIFw==
Message-ID: <a214fe55-fb5e-04b8-348b-895902470b18@collabora.com>
Date: Mon, 28 Nov 2022 14:17:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Il 28/11/22 11:49, Ricardo Ribalda ha scritto:
> If the device does not come straight from reset, we might receive an IRQ
> before we are ready to handle it.
> 
> Fixes:

I agree. That's a coding mistake... but...

This commit needs a Fixes tag, as this is indeed a fix.... kexec isn't anything
new, so all kernel versions are affected by this bug.

Moreover, I can see this pattern repeated across *all* MediaTek AFE drivers:
while at it, can you please replicate this change on all of them, each with
their appropriate Fixes tag?

That would make this fix complete.

Thanks!
Angelo


