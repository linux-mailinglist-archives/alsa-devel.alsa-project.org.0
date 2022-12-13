Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BE664B37E
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 11:46:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB8B0198B;
	Tue, 13 Dec 2022 11:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB8B0198B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670928414;
	bh=kPUu8IwRTuGJDrDeOx64y30lNL72eXvhm3FsQSMrbh0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=veada6aSUD729bzdjymSzSHwisn9xbYPJw9C0Y9/6Wh0R7CclLtF08fbahYCcfAys
	 TthJV5SQfb3rCEnEAWGCcrxjTZYCIxLkCON/074MaNsBycyFc2LSW6jAQxyMW0qViA
	 IYMyTDpzYrjmqr+sIUxY5FcfsCDS5I3XVswIXtWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5645AF80510;
	Tue, 13 Dec 2022 11:45:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54D89F804D6; Tue, 13 Dec 2022 11:45:30 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id C7B18F80272
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 11:45:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7B18F80272
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=hd3HEzVn
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E58FC6602C34;
 Tue, 13 Dec 2022 10:45:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1670928327;
 bh=kPUu8IwRTuGJDrDeOx64y30lNL72eXvhm3FsQSMrbh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hd3HEzVn/gunEkf1MMI8W6WxOOQ1Cqh/bHSwa160E8osDabsDYUpWpia11qmeL+Yv
 gRxJ2dvu8zEd3NQIQKrcV3DBOlPhcPFtgizxRQbic65Y4nqMgA6idqCYa0Cv/eSyXf
 riopASQ+JvpHbFOT9aY21+9MtS41Kqynf5AJ5AtTaVCEy6Px7JAFpzc0VFwCVdNTMi
 3KblawJwxQ01eMP3lPno0R+8wDJOhRxqfziiOCnNXjIYcCu3WRfuYYXiOrRqhYz5JG
 9TJrwhWwschAZJ+nuxW6FA6iTwLRE9W6UW/aJSYm0XohwQ1MuXv+Xlr1jDqyZ1/PbW
 VF1UWV4XEi3yg==
Message-ID: <4c26f044-de7d-26dd-65c0-7db484e4df49@collabora.com>
Date: Tue, 13 Dec 2022 11:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 03/12] ASoC: mediatek: mt8188: support audsys clock
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-4-trevor.wu@mediatek.com>
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
> Add mt8188 audio cg clock control. Audio clock gates are registered to CCF
> for reference count and clock parent management.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


