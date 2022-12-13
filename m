Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A13E464B381
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 11:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B1320FC;
	Tue, 13 Dec 2022 11:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B1320FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670928433;
	bh=iuqT409IUBvhSQ/CRdv9Kn5GVcraHKp1jmtmN2tp524=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mKMwZBgtDVgGTpsWDcz70/OzHLqopgLPK8FRcz7korQO8nhdSzpT6aJrx75e+og/K
	 RB7ZdY1Lm/bFmcG1xdwzMu2+OANgvGbMnpoChDh1pOCDU2w5n1eUjvTFbqVqUsgC5U
	 oDkJY3TEIiBqgQij1wvPw3hJ8Gfczn5OHnjWHd+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1649F80272;
	Tue, 13 Dec 2022 11:45:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA350F804FD; Tue, 13 Dec 2022 11:45:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 192FEF80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 11:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192FEF80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ea4lsPxp
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5E84A6602C35;
 Tue, 13 Dec 2022 10:45:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670928330;
 bh=iuqT409IUBvhSQ/CRdv9Kn5GVcraHKp1jmtmN2tp524=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ea4lsPxpbWawWIqUaYWw5p7QgK5IEfdYdsbMEf82jS245uskBMFY+MXtV0iZlZ+1N
 IBMMZs0gszA3HOAc2otnf79agBCip7Cs95PyQzNloFQjuvTBWtGnc0Efo1LH+nzl4W
 UZWOtDqSUQGurbhV4aKM1+DdygpDrQjo9xf3jQzMMfB92dQA38GksVZkpGINGcpG8g
 6hjDdODAstyb5MQMA/eirBVCg0E7V+M7rDnIvzr+OVnzydz2x8cxnOMl4bDvveHhpo
 9ukwBaZexB4DYHnrp/NADKmSrX3BzyUUGeRhjB/c9hbGkAflaj50N7+F9TpIUzpMlH
 5RjKcmnMw3QSA==
Message-ID: <476ac247-011a-caab-a7c2-b167ebb57916@collabora.com>
Date: Tue, 13 Dec 2022 11:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 02/12] ASoC: mediatek: mt8188: add common header
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-3-trevor.wu@mediatek.com>
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
> Add header files for register definition and structure.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


