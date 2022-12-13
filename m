Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09A64B382
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 11:47:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C7F2129;
	Tue, 13 Dec 2022 11:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C7F2129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670928444;
	bh=/rl+V9fireMwj8qHsGjB1b0MfONrsBSzed9ZXGPlM+E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NSZ8ssEmdNFSWw3f+dlbGBb+Umg8n1nOpMsvTR5DFSj3j8p+rbNk3tQnroK/RwJb1
	 q8a/NMZFb1WfSkKGpl16qJDhNXhp9h1Z9qKHZZWQaVY8AvtrqjlJ38jAM49E1VuSyR
	 VC5/4f5zp8MRYY8YEDPqTyG/hda1wtu9i369OBXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 853A7F80538;
	Tue, 13 Dec 2022 11:45:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C877F80519; Tue, 13 Dec 2022 11:45:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B594F804ED
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 11:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B594F804ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=d6X6NjbD
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C89A66602C36;
 Tue, 13 Dec 2022 10:45:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670928332;
 bh=/rl+V9fireMwj8qHsGjB1b0MfONrsBSzed9ZXGPlM+E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d6X6NjbDCn6AAVp0FxhLHfmMSY3qwt8Hyjul3yIv7YbvdykLxjuHbGaX9doJxRLfr
 3U74JAza/5lOCzhNl3Xy0S82zm1FC1ew9Giplpmu2uUU4dBOTTAZuEJWmMVfIVG2XO
 fEfkGK/wyqpOOi7XbFPDDNS+moia44o1w8JNRlh6rBy7Cyh1ZYNkguYczWDABN+sAf
 G9LbH0OiyGrt5ZQxDjbBaASq639Qn73tPfJL+pzgkTsYHRf/IonE7jM+rENfsI7jGS
 X4bVSVdTNDUNl6iZTDkOzZhPinrz5Y5T+tarhnb5Ea/amjPRwYMM1vL93y97Bd0/JK
 32c/eP6O5bKIQ==
Message-ID: <6ffe412f-2921-160e-068f-cf567e9a0738@collabora.com>
Date: Tue, 13 Dec 2022 11:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 01/12] ASoC: mediatek: common: add SMC ops and SMC CMD
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-2-trevor.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Il 08/12/22 04:31, Trevor Wu ha scritto:
> SMC call is required to communicate with ATF for some secure operations,
> so we add SMC ops IDs and SMC CMD ID to common header.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


