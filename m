Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE84E66B5
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 17:12:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B67C17DB;
	Thu, 24 Mar 2022 17:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B67C17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648138357;
	bh=NQIbmrCja9vafgXukwQnvA7dnbY+ovzFjWjQXecy4AA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KhWOtOtQotsV6tLsrNFTNRK0eQ7PLWWbL8p4BmDhPQM+apKWHLiiYM+NqFjsGnENI
	 v0AMv7IB1qmE469mQGZhQod3y+oKNZ9IGYoJhdwFpp7ZNfNy27+WpbG0htqzd0lciq
	 8mEHW/Xty6rFRHO+X2kM3N/dLgqMZ7zPq/9C/C3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A90F801EC;
	Thu, 24 Mar 2022 17:11:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ED0AF801EC; Thu, 24 Mar 2022 17:11:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90947F80139
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 17:11:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90947F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="dqy5Fb7i"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9C9361F4588F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648138296;
 bh=NQIbmrCja9vafgXukwQnvA7dnbY+ovzFjWjQXecy4AA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dqy5Fb7iHQn86liK/eKe2su/+aDIi7weA2TyPNWDCh4TZxEia+Au+iB3QA+0knXHi
 v9OC54dzY/aJgT6k4wUUZQRLXnmamQ5avMGrgRYovcncTBspQ4dmWC2HMFM34N7AEs
 OXsgPqUsSdJUP/1lIy2oAWDMY4x8IQ1YDWXolT8zmUDr5CkTelhIE5hHXoz2iZvo8o
 jMBiic0OQg5fCjbxd/eOVOsET3iqnD+84AgDRMw0kOIFUQcVDVdhkRMsnSvUi8eJeY
 tdb7LSDKooX8fWK3OqhJHV9tbIlD3j19t7twPEQpNpWNxPbMU/EeFjuJaMTMLQh7m8
 QNeahEts2FRYQ==
Message-ID: <9268bdf3-d1f2-b308-48ca-078f10dede31@collabora.com>
Date: Thu, 24 Mar 2022 17:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 1/6] ASoC: mediatek: mt8195: revise
 mt8195-mt6359-rt1019-rt5682.c
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324053851.27350-2-trevor.wu@mediatek.com>
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
> Revise driver for the coming driver combination.
> There are two major parts including in the patch.
> 1. Apply some suggested changes used in mt8195-mt6359-rt1011-rt5682.c.
> 2. Reorder the layout for centralizing the codec related code.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

