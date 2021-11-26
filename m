Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3507445EDA2
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8C5E1916;
	Fri, 26 Nov 2021 13:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8C5E1916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928695;
	bh=738bSYdyIdigXLlMxFXudb2N3jgQ0UIt9fKrjECy69U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sOyzQ43l7u8KS+qfgsLwooUURyuYp4Fm7WB/g568xCqQYJnnesCDXtWrAqOcWIuV+
	 HwRTjNYghILjWA6MKBL7aGNBNJ7LZ7SDrDjeCDWczdPCSSJv8L1TGz7eHCBUdQ0p8K
	 7U7HujhRPFDJvsmUJi+KcfIS77fvMaeWri+0M7TY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14209F80568;
	Fri, 26 Nov 2021 13:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08B56F8055A; Fri, 26 Nov 2021 13:06:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13D69F80542
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D69F80542
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="FU8lv0z9"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 36BA91F46847
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928371; bh=738bSYdyIdigXLlMxFXudb2N3jgQ0UIt9fKrjECy69U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FU8lv0z9NGgwj9+kpWcIN3FKFFwt7cjEI+yXFe7Tge/Rd3PwlcGxwzJd+A9UQ4ON6
 dox+v3LpD+H7Ab229W0BnXpnucW635tPD+8I5y1iwX6b12fyVBw4BZew6JWAJFSWN1
 AWmKBUQ2NXUWA64gDGqOLYPPdan1qsnXdg8bcFabRI3L4NDVaqnN12fJiS6ldU2BA7
 DrgHmjVZzRpNEc49WqtzMbSWGZy9N2uk/lUORzO/GjdfGgneZRjlehPPiMz/UE2wXd
 HlF9cGu2NGcQdDTtHCF7zuWIV699vcPPp8146snJr1Wt++F64cU2SNWvPrHGdCeCGS
 cQDD9V1uFr7xA==
Subject: Re: [PATCH v2 1/8] ASoC: SOF: mediatek: Add mt8195 hardware support
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-2-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5e4e1153-a503-5889-efdf-242766554967@collabora.com>
Date: Fri, 26 Nov 2021 13:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-2-daniel.baluta@oss.nxp.com>
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
> This patch initialize to support SOF on Mediatek mt8195 platform.
> MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
> It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
> mailbox interrupt between AP and DSP to use for IPC communication.
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


