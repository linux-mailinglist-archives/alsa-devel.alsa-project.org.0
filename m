Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A89501F6A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Apr 2022 02:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 308BB189D;
	Fri, 15 Apr 2022 02:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 308BB189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649980990;
	bh=izxFiO/+lGj81wPRSdsKtBD0iUjS+y/YmW/KAAdQnxU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHPdl7NzP8wu6nQm9hsaMiXie475QcxmlFJ0W3SzCnfJs9ytj/8YbhXkVZj4UvGbg
	 wESsY7/0R3oknlU3hqtP3xyBw0T67Fe3FWMnEYhUQPcu440CUtX+IhEI3yhp6SxZR1
	 EtAGfVGCuYKT7OJ5ypiN1mPrxApagCOnwsSSF6Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C59F801F7;
	Fri, 15 Apr 2022 02:02:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B7B7F80162; Fri, 15 Apr 2022 02:02:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 530B8F8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 02:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 530B8F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="qjfgI842"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=v2Dn6qtvKX9phF9c++5hboesgqNOkOUVB6NrTw92XNw=; b=qjfgI842dUFH+bNI1oFu9a4fJi
 17/vob0IxmH8C1n6WdZhGqOstu6pL3DY33dsJ48tiDWfJEjHhxmaxNj+Gw273XjBGPCUhuotBzCBr
 iNlqogqPRlmOFIM4Q4wsKow+BZzCDFnqt+ve9nOd8p8LcNAKn5ShUAIldrZL32xiWbhL7Qe3av3q5
 5zDpaDra5C3dTfPhcQkBwULaN7QIGMcnY+SqIvtoZT/8ivzwqZFzSzUfH/n9kEenDYrW11qjGnKxO
 nPTyHV8W8IOnWvVTgEJnmJTtDf6R+aD1xYoiBdlqZl1+gN4B+Ez/CnCUP8D9S+3PnA0UvZBW3fnbb
 Bz/Bc6Cg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9P8-005Bn5-Sb; Fri, 15 Apr 2022 00:01:39 +0000
Message-ID: <292dcb6e-6f23-7e61-7927-5b6fe5911f97@infradead.org>
Date: Thu, 14 Apr 2022 17:01:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next V2] sound/oss/dmasound: fix 'dmasound_setup' defined
 but not used
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220414091940.2216-1-miles.chen@mediatek.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220414091940.2216-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
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



On 4/14/22 02:19, Miles Chen wrote:
> We observed: 'dmasound_setup' defined but not used error with
> COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.
> 
> Fix it by adding __maybe_unused to dmasound_setup.
> 
> Error(s):
> sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]
> 
> Fixes: 9dd7c46346ca ("sound/oss/dmasound: fix build when drivers are mixed =y/=m")
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Change sinve v1:
>  add fixes tag
>  use __maybe_unused
> 
> ---
>  sound/oss/dmasound/dmasound_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
> index 9c48f3a9e3d1..164335d3c200 100644
> --- a/sound/oss/dmasound/dmasound_core.c
> +++ b/sound/oss/dmasound/dmasound_core.c
> @@ -1428,7 +1428,7 @@ void dmasound_deinit(void)
>  		unregister_sound_dsp(sq_unit);
>  }
>  
> -static int dmasound_setup(char *str)
> +static int __maybe_unused dmasound_setup(char *str)
>  {
>  	int ints[6], size;
>  

-- 
~Randy
