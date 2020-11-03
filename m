Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2332A4545
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 13:33:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FFE417CD;
	Tue,  3 Nov 2020 13:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FFE417CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604406833;
	bh=SwP8ntDbf4cFl5D/TL51U+gR/3UBnNGFfHsGfDBtyWw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSxHRyJ0C37hxwq0nfDvFTXqRenGLhXiUq9nqQ61nbPuhQ2CjSy31vmx4MM1+o39b
	 3B00HLsBXBxrP/ruUyz+k5vjDw0vm6n2vUAFIHPEcrkJVu0QR1fcWLuX/rP0Sf4S9U
	 h6F7n7MguBwimfJ0yFLOriVed3x0hL7vAX9Jg6T4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 973B6F804C2;
	Tue,  3 Nov 2020 13:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AA42F804C1; Tue,  3 Nov 2020 13:31:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 178A4F804B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 13:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 178A4F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ibxvv73c"
Received: by mail-wm1-x341.google.com with SMTP id c9so11026048wml.5
 for <alsa-devel@alsa-project.org>; Tue, 03 Nov 2020 04:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y5g02yisg2YY1sLEpz7UaUSABGGShGErCKYZaVBWDik=;
 b=ibxvv73cNC5BoJrVRc/HNlTXGT5LdQH6Xdd4KchdNSvNos3JpctjDBkt/IueeM+QaF
 c8Rzba0GgkPkcHNEBWeK5vW0wgJIxe430Pna4cVNyWK5CMTqjhlPeSWRYDTlqiNboOdc
 JaxC8ZkLZGhjDQZq8tdbM4ZLTX4hkTjQLXvzTcx447SSpxJ0Gq3A4YDD/bGiMWndOSo1
 MPuAEclfe7MHpHu0k+8518NsTKWOXc1+AeFGcZeGT3jv5bqvl72Qk2jwZtHmphdX7rXH
 r+SMWQJEJqvblpCkcwZK7qLkMJiNnc6iQN1Bx201q43Ka28PbwhuZmJz8OlOkDXY1K2N
 +B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y5g02yisg2YY1sLEpz7UaUSABGGShGErCKYZaVBWDik=;
 b=DwjrKpRsbctxrgVrzod9dsW+HGhz9+3BxKm4+RlR4+efWPSWyiKSkq+P+t3D34//R1
 V5LIBV/6gSEAwjebK5qslX+EstYJYiXdFkWSXbRweaODIr2g86F6USZaqEPa6f9j0ZEs
 lnHUHg5LsBeb0Trex+4LImeKtu7NKjJsV5rySl4jiUwZCKQLf8KJx75Ak3OkvHxchlD0
 uHDQHqcZf4fStpvZQGC0TpqNDyzqBllKQ87pVO3dA3cWyNWlCSp+OGKHLsnSACgFziHq
 1oSsv/zk58NUiJwNo3QcRrg+hQULI10j/sFyqIR6sz/5AVVfyU0PR/zUrL9AKQzNo8M2
 qbHQ==
X-Gm-Message-State: AOAM532I7UZp1Z8gOw4SWmOkOTnqLgVkkswAvT032v89++pJn37dxpeg
 Z4sVsKzWSeIW2pYhXwoAeaW1XA==
X-Google-Smtp-Source: ABdhPJyoDx75NM2nei8klPiV6Zbdy71+3ncC5yA+p6RbdzsnUy2pt1TXTtGiX+SMswnf4kmnfXwTHg==
X-Received: by 2002:a1c:b70b:: with SMTP id h11mr3580057wmf.185.1604406702958; 
 Tue, 03 Nov 2020 04:31:42 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id v6sm25922279wrb.53.2020.11.03.04.31.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 04:31:42 -0800 (PST)
Subject: Re: [PATCH v2 2/6] ASoC: codecs: lpass-wsa-macro: Add support to WSA
 Macro
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
 <20201029110829.16425-3-srinivas.kandagatla@linaro.org>
 <13987e14-0bd9-9659-b574-d3b7446bb789@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0bce847c-6437-9d12-6d54-d9ee99c7e896@linaro.org>
Date: Tue, 3 Nov 2020 12:31:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <13987e14-0bd9-9659-b574-d3b7446bb789@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



On 29/10/2020 15:47, Pierre-Louis Bossart wrote:
>> +static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool 
>> mclk_enable)
>> +{
>> +    struct regmap *regmap = wsa->regmap;
>> +
>> +    if (mclk_enable) {
>> +        if (wsa->wsa_mclk_users == 0) {
>> +            regcache_mark_dirty(regmap);
>> +            regcache_sync_region(regmap, 0x0, WSA_MAX_OFFSET);
> 
> I am not a regcache/regmap expert but the sequence seems odd. I could be 
> wrong, but one would typically sync *after* doing changes, no?

In this code path the MCLK is going from OFF to ON state, so the 
registers would be put in reset state, so we need to sync them with 
current cache state!

--srini

