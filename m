Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE04BF9E0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 14:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E72621862;
	Tue, 22 Feb 2022 14:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E72621862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645537999;
	bh=1iJ3MYfkNHq6GW7SFqh5i7XAomsTdSp46hJT3DQul8c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+MPOEwMLVZii1ccY5dA2eYq67BOCk6hLrzGi3lxgGu69EjwRX5Sfjjf8u4X5sVDe
	 0p+OBYWl8cmMgltrVlvA+8+lSjPyuFiM02mGms4EWEx08FQekbYXqxBVBNPV90ZpsO
	 3eQC/D0AT5XNcT5EH6yvFktrFcrC/VxoS0H39C8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F6BF801F5;
	Tue, 22 Feb 2022 14:52:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC458F801EC; Tue, 22 Feb 2022 14:52:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B014EF80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:51:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B014EF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk
 header.i=@rasmusvillemoes.dk header.b="AJ/I/oj0"
Received: by mail-lj1-x229.google.com with SMTP id r20so19662045ljj.1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 05:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=NsGSasV71blvFAQsUeTICtCaC8t3lLOY7dmm0my+M4s=;
 b=AJ/I/oj0OYUCwVJAmn4np80YsTakFowMhpIW/OjZXOW89NFj1/PftD135TnJ8Z/LI/
 phCp6HJjvpEUnJRHfF9K1BgyGXwxoB6W5MDk854iU3af6RUr/kHXTpiG/NzsQyTOh+gD
 kMP4OuIvponFrwXI617qzjNjPPsVrSYGnPYmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NsGSasV71blvFAQsUeTICtCaC8t3lLOY7dmm0my+M4s=;
 b=fzkwM98pHPtlvNBlMYlFd26wqzw64liNdcsfW1j0dJDQEUsIpkQg5cVIZFu5xiSJlV
 dwvrcd91rT+9rPkpgbGO6iutgr/ycCboSjamTtL6crdCNoghrqw2VBcr5Q9TawYwXPJJ
 cWYu8T96j4Gr0Q2I8wkE+YPQ7irHsehgnqHMLWWGeAGwBiwzh+FCEEXuhoQlLiw4A4ht
 XNlplPO7fXjoLi+trAZQ5BsPZ5BxnTo9dTGfmul3kMr9HHizKFUA/Yb90ml76wwet5fs
 SAoL6dSnnO+rqI5cK4MDh5xCQHmjWtk9CfSc9fedJoWX/4AQEFEdZ39/xnuvHhSGKVQv
 BV8g==
X-Gm-Message-State: AOAM5319L6j8pXn2ggfDpI90vQJ3h5WGREkdmEovJavekiv6tWhMNkbc
 LKPchJYE08CYQJfy+6ezExnEgA==
X-Google-Smtp-Source: ABdhPJxI+23Gdjl0KlMs6D0D/n7roxfjb4Eu5X3j0I3KcmM67FZxrBTBWvYuS399uuQpiLuHrCVJmg==
X-Received: by 2002:a2e:880a:0:b0:244:7dd:9256 with SMTP id
 x10-20020a2e880a000000b0024407dd9256mr18390534ljh.525.1645537917845; 
 Tue, 22 Feb 2022 05:51:57 -0800 (PST)
Received: from [172.16.11.74] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id a28sm1382796lfm.251.2022.02.22.05.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 05:51:57 -0800 (PST)
Message-ID: <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
Date: Tue, 22 Feb 2022 14:51:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Abel Vesa <abel.vesa@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
> Hi,
> 
> Drivers still seem to use driver_override incorrectly. Perhaps my old
> patch makes sense now?
> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
> 
> Not tested - please review and test (e.g. by writing to dirver_override
> sysfs entry with KASAN enabled).

Perhaps it would make sense to update the core code to release using
kfree_const(), allowing drivers to set the initial value with
kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
will continue to work [but if they kstrdup() a string literal they could
be changed to use kstrdup_const].

Rasmus
