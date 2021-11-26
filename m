Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E1945EDA7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:12:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8E2191E;
	Fri, 26 Nov 2021 13:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8E2191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928736;
	bh=e+ewKhzLthVTrZjBWWjI+guar4R9HCTxQLF6gS+C6RM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRqBe5b9TNmCFm+Dqg5P7cyWEpksGHdamUWy+LMrLWTsZresc5ieabOhJGfjpUDkZ
	 UtLFwHXuV2odrXM+C6tw18XUsg9WR5EaGac/d90y5HubN2MvL22taw29XCPWlt/Sfl
	 4evYyc9Mokif8ipn1vWCGQ0zIx9J8wl+Ny66n2cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1F68F804FB;
	Fri, 26 Nov 2021 13:06:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0423DF804F2; Fri, 26 Nov 2021 13:06:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BA49F804EC
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:06:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BA49F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="CkfIM/SD"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0B9681F46858
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928397; bh=e+ewKhzLthVTrZjBWWjI+guar4R9HCTxQLF6gS+C6RM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CkfIM/SDpQ7veDRI+cwsOlvDBTqGu9VT6/BB7+rplxlLCkIe1Dea/z3Q2YD+RrAwO
 3iLZGrnHvTQ95MZJ8Q8Okw1YVE2g65EdjHr7ll2QvMGuXMf7huhst9IO93Hibx2ar4
 jxfdEPoMGQIYNxBMsYNFv+PJo/b1N/lfal3I7yNWIjFi6yq/JcIvCdXlG2VqdeBkiw
 nanezsBchHRuoRz40KMy0tmx2OeKwlTlTLOoAmEYtp9IxQfZMsq7GI3PYvr2R4XQOo
 6Uygz9zGzcDfYQuxx89EtP9vANhHFvO/lX1Y46bmdnQ7fvDlBXX+qCsmQ6aOGe4isk
 XatmarWjPF45g==
Subject: Re: [PATCH v2 6/8] ASoC: SOF: mediatek: Add dai driver dsp ops
 callback for mt8195
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-7-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3510b65f-082a-2d1f-4222-7f2c9930b26e@collabora.com>
Date: Fri, 26 Nov 2021 13:06:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-7-daniel.baluta@oss.nxp.com>
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
> Add dsp ops callback to register AFE DL2/DL3/UL4/UL5 sof dai's with ALSA
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
