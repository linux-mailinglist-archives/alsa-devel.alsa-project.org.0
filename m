Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AE60453D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08DCF864C;
	Wed, 19 Oct 2022 14:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08DCF864C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666182409;
	bh=HHExzLVJB2VZIgJm38d+dSmFdPeMo0tDsgobPfRwYms=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SIa1IUcGrXRn+6bOG21krw+fRZ0LTdVTIx04uXze3VFSUVJoXtju9JB8QotIKPNk8
	 m4gi82O2vq/gOPwl1HK5PKDpC9VVjze1k8RtUc8PE19wI5a0FbFcdfHp8/ehWT3rO3
	 jAbRQeyDqFu+HDGc6N/eabE0SSs7GSzddiQj8DFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD86F804E0;
	Wed, 19 Oct 2022 14:25:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0CD6F80087; Wed, 19 Oct 2022 14:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F9E2F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:25:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F9E2F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lHRd+gEc"
Received: by mail-wm1-x32f.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so14444941wmb.0
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 05:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bjMgaAxf3cPo2xvIkUaAZp9gtwOpwstMnjYfymEdluU=;
 b=lHRd+gEc+LSqVpsp8uIxS9SQlS1qxm2iebVX1RFuIFsGD93vZE8NzjjtXqigKMuCAs
 TMdD6RfEnpZzlPjOfO0kIobviHsyUreB+YYV9IvM7ItpOgJUck+T4eCNF0eisWGutjbb
 p977pnolgHK46CaXAboslqV212VEr0GOGcgHmYyb8CcqczF3AwjOBy5mNZQ9M1esXzUW
 cZnQ7XfHyVLYZEeNO11/RJzzN4llVVJVJldeg+qmNvdqt6Yk70qVuHInnr55iYeFsUGV
 EmaO76Fv5Sl0+GiBM7uIiZ8kciUGY2byKaUJzoR6v2+cVvVM0q1GBmhzMIP/ZGHFFf0v
 5RwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bjMgaAxf3cPo2xvIkUaAZp9gtwOpwstMnjYfymEdluU=;
 b=met0ktNCV9rQHVtaWbEqhizhU53Lc+EH2yciMETD3YyBzb0ECZ9+OigPxbGYLSUnIO
 d29X1XGgv/KU+DALNyzdw4xc6ZJahHWTVYXA7SvXNleL9ddy/J3aOd+LXCvi/aMm7PvV
 ywtXZ2SpH5oAahqwwOM5anNdipo3aFAYAWi6cRhzK+CymhNSkBXJKWLwflDzbnuytyKp
 RGTv7cdcKpo4misX3C4WjX76zkZPnWYBbjzX4/8O5ULc4+kpn5q4BmhNbsS43xxRAamG
 cNofY95z8AbuG7vbFGFZWVm5RYj+NKLqTCF1HqJ59iHdKerTWo5K98gq4nwcEVWPAMSy
 nUdw==
X-Gm-Message-State: ACrzQf3fqCJrsV0H2/pzAK+gqR1XdBq556FRpNqv16z7vuW1XARANmlo
 UIVZcCKFd07WgvjxQ133WVY=
X-Google-Smtp-Source: AMsMyM51YrNAH1KSaziPnTMUAlap8IppnhFeNYBSEJdvs5FCtBVan+R8OxTuChaFh0S9XP3661KujA==
X-Received: by 2002:a7b:c00d:0:b0:3b4:6331:2fc5 with SMTP id
 c13-20020a7bc00d000000b003b463312fc5mr25717274wmb.11.1666182348257; 
 Wed, 19 Oct 2022 05:25:48 -0700 (PDT)
Received: from [192.168.0.210]
 (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
 by smtp.googlemail.com with ESMTPSA id
 d1-20020adff2c1000000b0022ac1be009esm14068917wrp.16.2022.10.19.05.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 05:25:47 -0700 (PDT)
Message-ID: <cca499ac-6e6e-fa92-b7d1-9a2848c6645e@gmail.com>
Date: Wed, 19 Oct 2022 13:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
To: Paul Cercueil <paul@crapouillou.net>, Mark Brown <broonie@kernel.org>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
 <Y0/pSVbueZYXBsmA@sirena.org.uk> <S820KR.GPNPWZ8QG3PG3@crapouillou.net>
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <S820KR.GPNPWZ8QG3PG3@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

On 19/10/2022 13:19, Paul Cercueil wrote:
> Hi Mark,
> 
> Le mer., oct. 19 2022 at 13:10:49 +0100, Mark Brown <broonie@kernel.org> 
> a écrit :
>> On Wed, Oct 19, 2022 at 08:16:39AM +0100, Colin Ian King wrote:
>>>  There are two spelling mistakes in codec routing description. Fix it.
>>
>> Bit disappionting that people didn't notice the errors during boot
>> there...
> 
> Well that's on you. You merged the patchset before anybody could review.
> 
> -Paul
> 
> 
Fortunately I spell check linux-next daily to catch these typos.

Colin
