Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A045C46EA8F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 16:04:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 250D217B2;
	Thu,  9 Dec 2021 16:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 250D217B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639062271;
	bh=LS0EtBmRDedhXVuSLcQh/ApTJ6Q0/81sv/fT8nF/E2A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aV4j4KP7oYo5v/EzGPTSw9VdJ1QgUICrHi6CoIyby0QzoZs6gb9v+KERAPP1ljA6r
	 ZD/+6dSnviTQbVlBse19vEkMpJl+1kuQNRZVanNLlSfu/gUaPuMLqgjIIuQkHfLrIo
	 8OttLmI6xkNS4UBAbV43M37wNBw7IfR7A9PKcGRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BBB2F800AB;
	Thu,  9 Dec 2021 16:03:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3C62F8028D; Thu,  9 Dec 2021 16:03:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDE58F800FC
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 16:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE58F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="FVQCvQU/"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 21AC61F46A88
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639062186; bh=LS0EtBmRDedhXVuSLcQh/ApTJ6Q0/81sv/fT8nF/E2A=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FVQCvQU/ydG/1xPks0xTHe4YTI6ldXkUGCqp/nhiwH+WXIcssx2UXBmo0ErJ1JUmV
 GZiwTWw7vbGlex5aQ8q7htE9wfnUc0jHc91QayQ145xc7ysgx5xNqQqO6fvvuTRmC3
 dMEQ1VNpaVBCtXYSmCls0iuC/6Go45BgAVf5nQxe095oaKDPZ45xf9J92aH7Yn3rQS
 bfIq3Q/PzcFJBoncX7fv7dGTTBIczrtI44xSzPXYDR680dFEk1xld1XkvkZaGcF7Xf
 tweztMKaS+EiqfKJRJsaitD/m1PFzG3kRO1RomKim+oLQt0Au8qO8Wi/7XeXRkUqqM
 BPT2t07WchLBw==
Subject: Re: [PATCH] ASoC: mediatek: assign correct type to argument
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2733d82a-38f7-d5fc-416c-2bfe5dc91a12@collabora.com>
Date: Thu, 9 Dec 2021 16:03:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211209073224.21793-1-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tzungbi@google.com, kernel test robot <lkp@intel.com>,
 trevor.wu@mediatek.com, yc.hung@mediatek.com
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

Il 09/12/21 08:32, Jiaxin Yu ha scritto:
> Fix the following sparse warning: (new ones prefixed by >>)
>>> sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33:
>       sparse: sparse: incorrect type in argument 3 (different base types)
>     sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>       expected unsigned int to
>     sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c:370:33: sparse:
>       got restricted snd_pcm_format_t [usertype]
> 
> Correct discription of format, use S32_LE and S24_LE to distinguish the
> different 32bit.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
