Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F24E66AD
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 17:11:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B0F1704;
	Thu, 24 Mar 2022 17:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B0F1704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648138288;
	bh=EwHy9mWfSuvvqMimVBgvIfNMqN76TuyvYhpTkRpZ2mY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQknVAcTM/7MFBVBjwPdWSaiAsy2wBvaoGJf/QYCEE6ZY+DlvuX1pcwgvqyr8N15I
	 JKBzsVYY8AEzdpwXNv9jAOi95+vfJvgtbvbYWjauJWGayUbG2lUswuAIhOrtP3HY+R
	 zTB2talTLB42R4ABCUUF17lrA2jPEjrmsQpjiguc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68D86F80154;
	Thu, 24 Mar 2022 17:10:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4447F80165; Thu, 24 Mar 2022 17:10:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81B43F80139
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 17:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B43F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="YbwjaZuS"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 644EC1F4588F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648138211;
 bh=EwHy9mWfSuvvqMimVBgvIfNMqN76TuyvYhpTkRpZ2mY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YbwjaZuSY3rU3Yk34+j0IN39Nb0q9CbL2386wWKs6DQDuScq7BoiG/R1eZtGHpVPP
 1Mg8LvlcNYHAwZ6OvFhRirYcEebf7Q262A+kMh3t3jVqA8WGpa9tsqWAhoTlu0Jwxl
 ECZvz5TWxtJr/C8UUvGzoOqLdqzUCYEHExLvKrNY4+4UCk9vFIg0rEPprIuHg4i31E
 fUtdDqlvq9QLgv3bmn3HQuRmi+tDjc77o0vd40iYf9rttMuzRfqfX42AcWxn6crrHD
 ZCHo3m1TckA+Jn2XXesjXA2CY48xu5kp8EYNQaZOEgbODYkwWO1B50uVqywZ6JfJsj
 gdX3Dy4O2aWSQ==
Message-ID: <18525f9a-e5b3-f6c2-e88f-3e0c5b789cad@collabora.com>
Date: Thu, 24 Mar 2022 17:10:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/6] ASoC: mediatek: mt8195: merge machine driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-3-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324053851.27350-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tzungbi@google.com, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com, aaronyu@google.com,
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

Il 24/03/22 06:38, Trevor Wu ha scritto:
> Because most functions can be reused in different codec combinations,
> mt8195 machine drivers are combined to one common file.
> 
> The model and compatible string are used to decide which codecs are
> being used.
> 
> As a result, We can prevent from copy-paste functions when new codec
> combination is introduced.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Thanks for this much appreciated big cleanup!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

