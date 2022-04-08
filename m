Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E384F927C
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 12:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F23CF1901;
	Fri,  8 Apr 2022 12:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F23CF1901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649412214;
	bh=7NGSuo4Sc3q7d+xEOL+gCuZe8DYDWsEbLcdLWfuCj9I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4pv/WydF8yBNe+BH/uR1XGU/EacDEhn2U7anyXG6HQQlTqM1FH3i+za0SVlwkdRU
	 E3LvPYV3VK5uH+eBUWFqe2QXXoVNDW+v4SbRzcFzTcyYuFUsbcGmGO9olkHMnmYKUP
	 73uLgZCafW6M1a7eZGY+prVUP3mYvrPE44WPDDNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62807F8051D;
	Fri,  8 Apr 2022 12:01:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0739F80516; Fri,  8 Apr 2022 12:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A0D3F80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 12:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A0D3F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="JxcO36Vm"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 711501F46D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412093;
 bh=7NGSuo4Sc3q7d+xEOL+gCuZe8DYDWsEbLcdLWfuCj9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JxcO36VmnJPCLOLcyirJ48rdA8J1Gy93FP8p7ew06GuDciO5pj3p+5yjfd/VgFyNf
 fB3zwg1o7CBqPqDV11/Jg3p2t0pqRD7WHS3NXe3476+ti6gJmpNqDXnDP8gcDi8xx+
 Nw/H5hhpQJnE6qKWQmWRCFuGxvVvc8IqB4H8K6y3KaxEeZh0sxet79Ye2cVJ79E6Cq
 HSSp6JCE8ML4aA0vKpze42X1qA1mHjF4LT2byKPpog94zHIypR2JiPYgvDy28RfKwP
 1WSEJB60U5gJRYxl8wPdrrpWJwRsjxiIxHS/VcJqFk++49D3SVnxhlefn9hEJfPwt2
 GFxXISHXBDiZQ==
Message-ID: <118239ae-e1c9-2f72-4a4f-26a5523755bb@collabora.com>
Date: Fri, 8 Apr 2022 12:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org, nfraprado@collabora.com, tzungbi@google.com
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
 <20220408060552.26607-5-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-5-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

Il 08/04/22 08:05, Jiaxin Yu ha scritto:
> Add support for using the rt5682s codec together with rt1015p on
> mt8192-mt6359 machines. All configurations are shared with the rt5682
> codec variant, so simply select the SND_SOC_RT5682S config to ensure the
> codec is present and set the correct card name. The codec will be linked
> to by pointing to it in the headset-codec property in the devicetree.
> 
> While at it, also create macros for the names of the different codec
> variants supported by this driver, as well as rename occurrences of
> rt1015p_rt5682 to rt1015p_rt5682x, since they are shared between rt5682
> and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
