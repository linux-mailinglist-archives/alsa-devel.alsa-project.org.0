Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537D64D997
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 11:32:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1D523D9;
	Thu, 15 Dec 2022 11:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1D523D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671100341;
	bh=WIDaz+drK8oF/b9fCu9/41JRPOIXp254wSJ84sWVcpo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M+hVPiLHc5MbWWUpowBr+zDpYKlYnyj6IAXuG5DCVkuJ9XmGM4ycIOgquy+Z7G8Os
	 B4ryjV66pyqKYm5lljEheCL89lC+rpigI2YaK6rA5JNtjfyaJm4AjIXY9v+ugW77D2
	 Xw1SIRYjPNRyIKyCIDaIQ3J7fmyJsY9na+NxMDsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B97D1F804F3;
	Thu, 15 Dec 2022 11:31:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9D0EF804ED; Thu, 15 Dec 2022 11:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34562F804CB;
 Thu, 15 Dec 2022 11:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34562F804CB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=GtPBVrT9
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 689146602C5F;
 Thu, 15 Dec 2022 10:31:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1671100274;
 bh=WIDaz+drK8oF/b9fCu9/41JRPOIXp254wSJ84sWVcpo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GtPBVrT9VvU5Nf3Fdnb3oE7wiZTu+ZLYId5RN1LJmUrey5rm8QajhLVbf0Z38uf90
 B2b4hDi8Xje+fO3bI86h+8/hGSeGrnNh3jGocVQw+MTAu2wTLDVhktrCS8UKLhIg/j
 L92zjN95nh15jDys2iegzxct6Jz+nHv5cc5iKMD9xs4FD2fFPu6JDuBDn42qxvaVh9
 ooXV3i2nIUFqrUBnXacnYDOxtRsCI3ZzbRT2kfD2uOYB6Xa0sPrC/6eXmuZ73MvNww
 4leYuWdo1YbTervvIs0+KgdF/UQVrmvAO3nr1EDhyIXsI9ebdnD2IUIJg/fQjIYyB5
 NfG5hvkMkT1Ng==
Message-ID: <7e8edf6f-9971-c704-4299-be9f7098d1cd@collabora.com>
Date: Thu, 15 Dec 2022 11:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8195: remove a redundant
 comparison of sram
Content-Language: en-US
To: YC Hung <yc.hung@mediatek.com>
References: <20221215061046.16934-1-yc.hung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221215061046.16934-1-yc.hung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Chunxu Li <chunxu.li@mediatek.com>, linux-kernel@vger.kernel.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 15/12/22 07:10, YC Hung ha scritto:
> DSP SRAM is not used for audio shared buffer between host and DSP so
> TOTAL_SIZE_SHARED_SRAM_FROM_TAIL is zero. Remove the definition and
> redundant comparison to fix coverity "unsigned compared against 0".
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angeloigoacchino.delregno@collabora.com>


