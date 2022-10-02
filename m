Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D686E5F2469
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Oct 2022 19:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA1EB2946;
	Sun,  2 Oct 2022 19:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA1EB2946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664733323;
	bh=5W29tZVkY7Gcwhc8yEWup/KXx3wVHKfaa0BxBjFL65Y=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfiAsGPrXd5T7v3bXlgseYTOfdU/ZDfiOTl2fRfg+WNAuGHol3zBgo1mLmIQo5qOt
	 7PvwmB7DFj7+1ySE+VEFzeNhaWBlomcmk6J/V3CiHH6jPVXG+frj7G67ChsnEy4mQn
	 45/7SRzLSrM9Il5wnh5LV6Oxijgp0biGvQnT0LDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24A1FF80087;
	Sun,  2 Oct 2022 19:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EBA2F80246; Sun,  2 Oct 2022 19:54:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7625F800A7
 for <alsa-devel@alsa-project.org>; Sun,  2 Oct 2022 19:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7625F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="YuC8Y4AP"
Received: by mail-pj1-x1036.google.com with SMTP id l12so7986639pjh.2
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date; bh=5W29tZVkY7Gcwhc8yEWup/KXx3wVHKfaa0BxBjFL65Y=;
 b=YuC8Y4APFIJhwUMuvqJRBlA3DDtVhe5TPvQ75K9BWgea++GLv22fP7KiIZs/MNoqIn
 ofHQ4HYoR+IOJ9JUITRatGkNyj9RL/t+cWECfpUXOvqRP79P7BghlF2ty2yXMzukrk4q
 rKSXTCpBuvzC+IQ0vcgFgYmL5yE6Ck77ywmgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5W29tZVkY7Gcwhc8yEWup/KXx3wVHKfaa0BxBjFL65Y=;
 b=Mz31OKKA80g/MFJNX+t2Gm40uSLPY9P4FRTgyYxDC+qNblyEnukbfBLPUAkq+tFaB2
 lGaCQHdz24AaWvtTomxNhd/+56kk9XE/4cLT/jRKkKl5X/0mkxzh0uJUahH1emQKWTZ3
 QFSAqbSdmSh80AVkahgnK6rDUGJ15sXsjibtOMAqt0Y+tN9MjwiGI306gNe4jFe0+yin
 QmF8JS/uIoXj/icRlvDSMBAiHpmseIw61iXocnGoTL+NsrFSVfIxXhSHjZfnSxaSNCzr
 2RiWqhMo5UPyCpfC5DIhj0ihYIM8+HH8cuqg6HQMJYi+yy+x3PPUj6tYPg09he0Xs21Y
 o0gw==
X-Gm-Message-State: ACrzQf2BkhvbRyFyCXbDL1dxMOKSnfeZjg8Q4fD0Dvvj0+65wANZUbLQ
 f183I7y6O/eSzY9e43WUcc/7eA==
X-Google-Smtp-Source: AMsMyM4ycgoxPkQdx7TH7/NaqNt518nq+9R7njsWalvl4hA0vjKBB/2jxloiomvO2pmZgKL0kCmWHA==
X-Received: by 2002:a17:90b:254a:b0:200:53f:891d with SMTP id
 nw10-20020a17090b254a00b00200053f891dmr8580039pjb.168.1664733260980; 
 Sun, 02 Oct 2022 10:54:20 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.124])
 by smtp.googlemail.com with ESMTPSA id
 rm13-20020a17090b3ecd00b0020263b7177csm13363107pjb.3.2022.10.02.10.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 10:54:20 -0700 (PDT)
Message-ID: <ca430004-7f03-b6f8-092c-0a7ab1cddcd0@schmorgal.com>
Date: Sun, 2 Oct 2022 10:54:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221001200039.21049-3-doug@schmorgal.com>
 <202210020642.ts8UPw06-lkp@intel.com>
 <a9a94d2d-5379-7e0b-b27c-cad0f569a773@schmorgal.com>
 <a5f9ec49-f921-5efa-6721-d23671ec6bc0@kernel.org>
From: Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH 2/2] ASoC: wm8961: add support for devicetree
In-Reply-To: <a5f9ec49-f921-5efa-6721-d23671ec6bc0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild-all@lists.01.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>
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

Hi Krzysztof,

On 10/2/2022 1:35 AM, Krzysztof Kozlowski wrote:

> Now I see the report about issue I wrote to you. It's not particular
> nice catch of robot... it's visible from the code and easily testable by
> yourself. Even without compile test... The code was just not tested for
> warnings.

Thanks for your thorough and timely review. It is much appreciated. I
will address everything you mentioned in V2, and will do a better job of
checking for warnings with multiple configs going forward.

Doug
