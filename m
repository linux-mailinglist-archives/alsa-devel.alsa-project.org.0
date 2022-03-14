Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EDF4D802C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 11:46:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26AEC18A4;
	Mon, 14 Mar 2022 11:45:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26AEC18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647254781;
	bh=j588M5zB/9t7D4ivjAn/3OXlaIV0VdQg6MdXm4IofKk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWAGZeJKFjluPQJ8EaQxytANsj9UT2+gLfKvu9mUx211Y0XBpRHRBV6pgpmuTuHcO
	 63O6maNmyoNdXTNaym/jfmrsrHQY2SO0FHM9K6oWzGFgMkL9Wp8gyRezggPHlTl+fi
	 k1M5/7n153wHmMWMeL3yoSfES55bFIamCspFcltU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8CEF801EC;
	Mon, 14 Mar 2022 11:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B46DF80100; Mon, 14 Mar 2022 11:45:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D4E0F80100
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 11:45:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D4E0F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Zk8FhjIp"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EDC31F41E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647254703;
 bh=j588M5zB/9t7D4ivjAn/3OXlaIV0VdQg6MdXm4IofKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zk8FhjIpdGaMPLwBRGovJ8HzZIFKyOryuzdJ4lhXvVF1S7EC3W1O+6oudNWxJWXkm
 vs5koGvEsgQRb0F+l9de2Guee/Aq44N6hZ8NK92crkLMMwLqHMl56tS2K4nArbraU6
 ULrKVlWcEEfR8GB+SZfUgjYsq7iGEyKelmJNQAzqe1Be+gFlGobagf97SqCOAzENwN
 8gM9f7LVM33AK8Zq4sN2BpE1BLo+DC043tHTjIc/uWbbxQVf0zhxKrm2gXjGvUfJqu
 R5EiuzwOgRjSsyGd1CV8N4PoRA+G7laLxzSL5ccNBr4+C/8KVEeQqUScJQUrfoN1+C
 hcl4AWu6OL+KA==
Message-ID: <d13b7bb3-989c-55eb-c7b9-41836ccb95a9@collabora.com>
Date: Mon, 14 Mar 2022 11:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 15/19] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-16-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-16-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add support for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 924 ++++++++++++++++++
>   1 file changed, 924 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
> 

Hello Jiaxin,

I see some duplication between this one and the mt6366-rt1019-rt5682s....
....for this reason, I would propose to split out the MT6366 bits into a
common file, something like mt8186-mt6366-common.c, as to reduce the duplication.

If it is expected to see MT8186 machines with DA7219 or MAX98357, then it'd be a
good idea to also do something about preventively commonizing these ones, like
it is being done in ... MT8192, if I remember correctly.

Regards,
Angelo
