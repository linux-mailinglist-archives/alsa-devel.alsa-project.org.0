Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0E3615D5B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 09:08:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95781683;
	Wed,  2 Nov 2022 09:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95781683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667376516;
	bh=UZWWOAYmzMX416LIYkufW8EF7vXYm/UKqfvrVtaQy6Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+rs0RAarVEZYJ+7nhm9uVKzfXY/+QRJNt2kmbNJW3/8xsi3ENHs5CvJu+DzPc/nt
	 KLJ0vTC3elLtt8fgf2lYRYdIsMurHvv0YCQzkL3kSkU9BrvYS5yj+wtVxc2nDoypAp
	 Z58Uc41SjIUqodlTIynbNtK7lPXrn6YXmHMxV3O0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B95EF80423;
	Wed,  2 Nov 2022 09:07:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47CECF8026D; Wed,  2 Nov 2022 09:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E88EBF80085
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 09:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E88EBF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="JbNeyS5h"
Received: by mail-wr1-x42e.google.com with SMTP id bk15so23263379wrb.13
 for <alsa-devel@alsa-project.org>; Wed, 02 Nov 2022 01:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vnAnmSt8vCtHb/nQVL50lsBnUPTXAejosvygs/MYwlM=;
 b=JbNeyS5h0hTdXHTEb7GtydATNNK2dp6NYIPpTKEhsGCCGqDJ1VOzVi5bYnDXhOsnnE
 RkMCzgXtWadxivKomBKNZQDLjkhlBr+EV2PXAgM4i8Ttp9ELulBYULOd7WgcR2EKFJ3q
 lwFUelgcOyPgEK2xLpMLSJcM8c1UnOczpntr8cvDPJokixQlcD9liP/aZlOjLmuL31k5
 I/CfKMMeDqIBXcZCcNVsB6TsIIIz5DTmmKzj7FPb77twt99BDrO32X2x0aH73iHXGjmn
 BWQ+GvhBtrfKGI3W08tV9vFh06TIapQFk0XYV0uK0Yu0OBo4v+zaCv+fnpmfonY6T9cI
 ZG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnAnmSt8vCtHb/nQVL50lsBnUPTXAejosvygs/MYwlM=;
 b=dYpFCafwPcyyg1oigZpy/aHNW9fMYav/3tPYac+Mp8PA+SlvCOkHfNILsRZYg/90eA
 OZXPne1RyRrGAmCpu7MRDw4KBdxA9kfQIkPX3ao6nRQDw0Zm6wvC/i6LZfTKGYD9EzIn
 28RB3K+v6dtvYLCj49bsR2J+M58Egr0nVZ/7xCopXaEwneicZBVcd1OyhZeXJ5Bw/vJJ
 fDeqxzOXdo0h9t/KHiHQ9gA8/B3Y4/fEhKYUYzmi6NQHApcNgN9lwxFOlRW3mjl0sAbI
 v41wPgfDuOXWZp0zjTErc0DbcYp9H0OVWHs3v8WgeTpmd1Pk2yQRJlCidHv5n55UX99T
 nxTQ==
X-Gm-Message-State: ACrzQf00mO1rec8FYRiOEUwnVTOgI0HEAhizoIriq92UpgNU/DGRExi8
 EWjtjWxy4cXdJAcZ2pKUY4DbIA==
X-Google-Smtp-Source: AMsMyM4RNUVUAgKayw8H0HZe2yKGYqCfHwE8ipd798ULPS5HZa8qDEqlCcUfle9Oa157pW1r5tZTGA==
X-Received: by 2002:a05:6000:1849:b0:22e:6d62:cc9e with SMTP id
 c9-20020a056000184900b0022e6d62cc9emr14532034wri.323.1667376453768; 
 Wed, 02 Nov 2022 01:07:33 -0700 (PDT)
Received: from [192.168.2.9] (78-22-137-109.access.telenet.be. [78.22.137.109])
 by smtp.gmail.com with ESMTPSA id
 bo29-20020a056000069d00b0022eafed36ebsm12384603wrb.73.2022.11.02.01.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 01:07:33 -0700 (PDT)
Message-ID: <5e62ea97-9a2e-b07d-375b-d029d941d520@mind.be>
Date: Wed, 2 Nov 2022 09:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/3] ASoC: adau1372: fix mclk
To: "Sa, Nuno" <Nuno.Sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20221028152626.109603-1-maarten.zanders@mind.be>
 <20221028152626.109603-2-maarten.zanders@mind.be>
 <SJ0PR03MB6778A0EB0CD15A3A917BFE4A99379@SJ0PR03MB6778.namprd03.prod.outlook.com>
Content-Language: en-US
From: Maarten Zanders <maarten.zanders@mind.be>
In-Reply-To: <SJ0PR03MB6778A0EB0CD15A3A917BFE4A99379@SJ0PR03MB6778.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi,

On 10/31/22 12:20, Sa, Nuno wrote:
>
> I guess this needs a Fixes: tag?

Yes, you're right. I figured it'd be less relevant since we're fixing 
the initial commit, but that was wrong.

Did you get a chance to look at the fix itself?

Thanks!

