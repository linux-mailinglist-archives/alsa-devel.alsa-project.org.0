Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D6B4D6E6D
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 12:25:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FB017C5;
	Sat, 12 Mar 2022 12:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FB017C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647084310;
	bh=xMGkdMd9dfsE/d9DxAKriQcequG5d/py+/v1DEVjTck=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wk4vJjpfbrp06lttik9om1M7gAL/FCybgjA4HRzrECrTN0TB1LKCFAoUa4ZiNxE6j
	 9uClUtuU4ueFgYs/dtouIE3CMgMgv53Yq8aiIPhrqAQQckeJBqOlt3RaWPMPmyPVi7
	 S4jYR5vVNI9PYby9u40Ie3jmciIXPqq5U6Ui2w40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389E0F8025C;
	Sat, 12 Mar 2022 12:24:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A405F801D5; Sat, 12 Mar 2022 12:24:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED9B6F800B0
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 12:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED9B6F800B0
Received: by mail-ed1-f52.google.com with SMTP id r29so4675863edc.0
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 03:23:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OSf1OwJ7magl6qu7qroFSGgkU8xwtM3u7m6pE+i/ZuY=;
 b=St1F8Ns6q/sVzO+b3ERIEYJiMx0UHSMqXjLr9GE1KVZEqRMQ+Mpike7rnTFgHh6af1
 FJQqML5kW1ln5D2M+RiFMkTfK68JxiAo1W5fK7UsIxafWgB8CMxNrylwljfpkxMbCDof
 qR6u/PkpGJHQ9vN9j/vNxwJjbjbH1yY/lCFYSpGtjwQuHNJtkxOeja5LWpdV0qyMoPpE
 A/FgWgNkAWAxTCHha3mYMsKKu6qc0cLSyXnFtEIXSzmU417cabsvuAN/xXfe/e3a2qLc
 SZYHJkXxxT883oCnNisl0tV7pLLZqRq7S/7CwsUXmiZRv6RnXKw7xjIaLkGUwpgHJ9uk
 G1Kg==
X-Gm-Message-State: AOAM533FmCpZFgiXFi1kOnQteOqkK/LnHC1/2mIBrAuHddF0jiok73+g
 xSe+v19sDtkRNqB7wenLlyE=
X-Google-Smtp-Source: ABdhPJwNOq5DkxOgDmvFW1pYBkpqCGq0vx2MY/WBchfflM8IP0pOMftZ8a2mga9NeAkMM5ra2LlHpQ==
X-Received: by 2002:a05:6402:11ce:b0:418:633b:ed95 with SMTP id
 j14-20020a05640211ce00b00418633bed95mr2058091edw.0.1647084239107; 
 Sat, 12 Mar 2022 03:23:59 -0800 (PST)
Received: from [192.168.0.148] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 v2-20020a17090606c200b006a728f4a9bcsm4210406ejb.148.2022.03.12.03.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 03:23:58 -0800 (PST)
Message-ID: <c80eed69-088b-cfaa-a041-cdd6d5fe160c@kernel.org>
Date: Sat, 12 Mar 2022 12:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: dt-bindings: Fix patternProperties with fixed
 strings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20220311234802.417610-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220311234802.417610-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On 12/03/2022 00:48, Rob Herring wrote:
> The simple-audio-card and renesas,rsnd bindings used 'patternProperties'
> with fixed strings to work-around a dtschema meta-schema limitation. This
> is now fixed and the schemas can be fixed to use 'properties' instead.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 16 ++++---
>  .../bindings/sound/simple-card.yaml           | 42 +++++++++----------
>  2 files changed, 28 insertions(+), 30 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
