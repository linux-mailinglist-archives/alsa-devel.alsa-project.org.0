Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F414F9279
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 12:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 069D8190B;
	Fri,  8 Apr 2022 12:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 069D8190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649412187;
	bh=H48V/pdViwo1p4zdgSuQJNP0nt+xojqU1ZySQizv8TA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkKDmlqSDgKsJXvtyF17cyN6om/zyxcqS0crE9S3UE41MSlW+buXNCFr6zbC/je25
	 MHb1/xUksDqxH9Nf2rBW8NkWPFunMAV05p3xxwXZwyT9lFdFJhEcJkek/+Dz1qbxlt
	 5CGZnrlQfBR+jINNQ3LqLxPLzkNM38f+2AKfh418=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCFD3F80518;
	Fri,  8 Apr 2022 12:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A799AF80518; Fri,  8 Apr 2022 12:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB3AF80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 12:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB3AF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="e+OwaoM0"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2C7A21F46D05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649412085;
 bh=H48V/pdViwo1p4zdgSuQJNP0nt+xojqU1ZySQizv8TA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e+OwaoM0/W425yMTI5CiDoCZ2qF4wxgsbTPnDsjRfoWZspx1u5BLH7u3Km871jNEG
 L4cybVNSOkyyskB9p5pTI6tNLYKQ59q48+IlDyI3qQC2cagfvteklRJBKrPSYYPGrU
 ojvfbobYyK6exslPlXMMBsNKap1o9DbsBJAur0vvYCBkmKzcBpx4FqPLC+/rks8On/
 8oOlFArZ9jrqzgnvekz0cXfpXd4s/kxsys1/yhytnzSdA0L2p3y39IG4uv7I+avuq7
 7yOVOw3jLdlMWZ4iDOMmkadY3qhb7seD+TMjw/3uO11aGeME37oS+sZpJaE3zBK89B
 k11ozMdvSfgNA==
Message-ID: <90bea01f-aad1-6150-4d51-0c51bcb48d09@collabora.com>
Date: Fri, 8 Apr 2022 12:01:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [v10 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org, nfraprado@collabora.com, tzungbi@google.com
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
 <20220408060552.26607-3-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408060552.26607-3-jiaxin.yu@mediatek.com>
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
> As part of the refactoring to allow the same machine driver to be used for
> the rt1015(p) and rt5682(s) codecs on the MT8192 platform, parse the
> rt1015(p) codecs from the speaker-codecs property in the devicetree and
> wire them to the I2S3 backend, instead of hardcoding the links and
> selecting through the compatible.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

