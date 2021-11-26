Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63345ED90
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:09:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C06FF1931;
	Fri, 26 Nov 2021 13:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C06FF1931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928593;
	bh=9EQmaihFqroyudxA2nA0/OcsptHnfOtG3O895b09Y2g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7o5BaYRqBwHwmZvyt4HulPF43LE5lgfa9Bq5prZYjpSDuRBF8hSx3RmwCZQVhTmW
	 xOeQIxR7XiRRkMLzQM6x8I9yUyfmq8HTnqfUQKLZiB2SJF2C5hyTkX1d6QMsDrqAMV
	 d9Qic/xhBN1DOYVz55aF4Cs23sf2zIoTewYxPZ3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC21F80166;
	Fri, 26 Nov 2021 13:06:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68D02F8053A; Fri, 26 Nov 2021 13:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ABFEF80245
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABFEF80245
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="K+tqyBcS"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 60C4C1F46847
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928355; bh=9EQmaihFqroyudxA2nA0/OcsptHnfOtG3O895b09Y2g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K+tqyBcSzgn/XvTEwoARRUXVoMuW3VR0M9EJZTrKV9TMaA4ZotGcziOvZbCNrw41p
 pHq4wvsIvn8Q5xf9YZdYQ1uiP5mc80hNRnx2/L0yihFqoteGv4FLcufgZWWvU2C4fY
 NCsXfU0pXXYcjLceWyeUw5nTPz9U5WnL1F71zb/cZPUtqSbfFUIsEpu4fd7AJnVAB5
 JyceM4BHVE6oINAM2tfDRm0WPMyWCN93FMT38lrYdAt9Cf+a2U54bzWHfrZS7p4RtG
 RyoDhRVdHRLraYo2Iy+54YEBZ5o8LJnicgOrfOg/+IJKu5QplQbUIutlZ4jEruBHQo
 H0kZmjJQ2Da4Q==
Subject: Re: [PATCH v2 4/8] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp
 ops to load firmware
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-5-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9521a830-bf02-8232-368e-1afb4b978bf4@collabora.com>
Date: Fri, 26 Nov 2021 13:05:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-5-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, yc.hung@mediatek.com,
 daniel.baluta@nxp.com
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

Il 18/11/21 11:07, Daniel Baluta ha scritto:
> From: YC Hung <yc.hung@mediatek.com>
> 
> Add mt8195-loader module with ops callback to load and run firmware
> on mt8195 platform.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
