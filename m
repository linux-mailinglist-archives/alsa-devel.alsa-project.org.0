Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185ED6D18FD
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 09:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C0FB201;
	Fri, 31 Mar 2023 09:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C0FB201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680249070;
	bh=fYs9+IHZi89uwmos3p/qaA836FdmlCm31xFfsPBW804=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nZyBBCj3x/0NIfitRhlcWDZMtdIPImCVh908I1j8GGNZTAjRiyDu/sNhUAP4Xh7GT
	 9kNJ0Kuntn3Twd5q6xNAGQKIBcFtAKT2zldD4WuqpQJ2IIojhc3WOThRhFuewo8cvx
	 w21OT3uJVee9s3QDBs/FT96dLRABH/kq96XPYcY0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F026EF8024E;
	Fri, 31 Mar 2023 09:50:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39AFDF80272; Fri, 31 Mar 2023 09:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7583F80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 09:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7583F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qM+oBIBD
Received: by mail-lj1-x235.google.com with SMTP id o20so19218904ljp.3
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 00:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680249010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rp61AZrrrJ7L6Ea4XSRLHJ/Ln9sIYk2x6qqY8rh7zM4=;
        b=qM+oBIBD6/4I26sY9lrDp/o6uOQD+VJqjveehx5YKQ5U4XVIIJdQyWfIqLGrjSRFGM
         OVSGuWvmjg4bHjNyx4hooahb8ZMXIF/FKcH4A5/DTX/UO0KoQpdLzBt1duQeuwiyQlIr
         NegaXc/uhq0C1G8dE3Fpmy8fAcmOIGLaYTrPkO3pkKx0T4Hi4XcEedrpVbXhpqhG7rQ3
         S0+dsfpQTRhlfRl1DUePVmMgOpbBV8Ti9hlTG8cxeRVgJUvjsTDqVIWBJDPXYasUVgeO
         4y13tVzzYjdCDj469LKssnOgESUixPCxtuHXtIPKnoFh1PDNs+6opz42G4RdfEUCKu+V
         f2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680249010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rp61AZrrrJ7L6Ea4XSRLHJ/Ln9sIYk2x6qqY8rh7zM4=;
        b=Y4tbdbyE91wbBoU1CzRVdw5v2uzDphZcLaDXGBIvyxaU0ekTAYBrwVivxfpq7Gd0Fe
         LAQtTZufrVvH/2St3u1AqDIdhp0jloktMvhssxBL0rMXB+/QP87u2sUrj+ctXZj8oKfK
         ilW0w5KHpOc7LHyN160C15Jd4XH40tbE3OBHDEm5rmVtCkDMY+L7TInGabkwnQYbaaRa
         qOJR1nVSnJdHXoRzwNWn6jQkCcXXbgLurjah2NXMoCPb+nuKpHOHRzsErYHpx8VF0Fco
         P4Ll5oqV+4tQorBgCAiY1ZdL9+WduZrIvqnjTv0NlGOioZ31JONfmTVs+qGlkL4H5X7d
         P9yw==
X-Gm-Message-State: AAQBX9fAYTXpoZdVIUv5aloRUZcNzBQv41LRD9Dg2qfyftYG5pESxke9
	W+j2SCaJrBFLxeRvMLgBwW3t8g==
X-Google-Smtp-Source: 
 AKy350aP0sVxOVbRdfaxygjd9Zkval2nVvpFquxKpaz0Y8pPfwIPacIOwyKNqxo+YZny2UHLm+5AUQ==
X-Received: by 2002:a2e:9ccc:0:b0:2a6:183a:9a13 with SMTP id
 g12-20020a2e9ccc000000b002a6183a9a13mr1625313ljj.46.1680249009752;
        Fri, 31 Mar 2023 00:50:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 p23-20020a2ea417000000b002934abfb109sm249539ljn.45.2023.03.31.00.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 00:50:09 -0700 (PDT)
Message-ID: <2872b939-a617-90ee-2249-9eb535559f07@linaro.org>
Date: Fri, 31 Mar 2023 09:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 2/2] ASoC: dt-bindings: max98363: add soundwire
 amplifier
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
References: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
 <20230330234319.6841-2-ryan.lee.analog@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230330234319.6841-2-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KFYY4O6CKFXNZVDW3SIR53BREPFCZ77W
X-Message-ID-Hash: KFYY4O6CKFXNZVDW3SIR53BREPFCZ77W
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFYY4O6CKFXNZVDW3SIR53BREPFCZ77W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/03/2023 01:43, “Ryan wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> Add dt-bindings information for Analog Devices MAX98363 SoundWire Amplifier
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

