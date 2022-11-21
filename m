Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C601C633878
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:30:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 270451676;
	Tue, 22 Nov 2022 10:30:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 270451676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109451;
	bh=seSQC6SqlEqebN8nlAvurHoHM/q4v6iR/e2pC83lUxE=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jsHpNs6oA+iXMPMcoCq4My6zIvSY/2UdOLUNKKSTS7KLh1LlAsXMK3bpHQrnWfKU0
	 TF7QiMo8B19Cxbzg4OGWtD3hYXrjeMcMEjVSTZBK8/CQKCkV+MlZQA2tP8qurb1Zeh
	 cs52hcqLgj0+7FuacrUtzcsoJ9rJqrDhMUSQuxZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47DF5F805A1;
	Tue, 22 Nov 2022 10:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD095F8028D; Mon, 21 Nov 2022 11:16:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 246D6F80115
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 11:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 246D6F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HMQtLNQC"
Received: by mail-lf1-x129.google.com with SMTP id j4so18160573lfk.0
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=;
 b=HMQtLNQC6JHUcpQnXKaMPeLJYNEXESjWqW9Jm9fxHdDsyxq3fD2y+gUbum8cazGLlS
 0Nzot0o7wlI3aHmX0JtEp59ASN04zoUP5cBLwhJUS8UWXS1vrDPK5s0nm6MtNyPRkAXr
 i9HRjhzMXJwfcX+oinAm/OP6xU5bC2NyVL00djub62igijCsqVS/+Gs3g8Ob67GV62e5
 lbpACEGBVz+P7gegvEedJPLtYc/UAuXuZCP3D6YMe70yXUQfK1oo2OuCbl17wDJsWOWJ
 juioZPmih2Q2tDZ+3ZlWsJUEwqpG6mEfuUGwVkFA5iKPxQNEPbzHK7gtA/8R8W2wDMdd
 a+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=phJFVLoc9/POc6nbD0liFwrgYsKAiaNUs+VrsQZny0U=;
 b=gNni4+prrerE8fdp8MR7+G6h4tEP2ZaupOgzJWATzp1or5iccimBa8aVC0LtsRG/ld
 Xs4/1u0zlPF8xAQPcaMsPz8lV7hnBqzxmxuIhx7mIycTHlEwWcX9JFrVm/xt+jO3TuMR
 rK9eqQHkbaAwNxpf2s9mjLUduP1U5xrhaG32BbGoj0qZHVGrK/+XmcOY85VdWJOSilkW
 rhj2DYTwf3ImzoUDdx75eeddr+oH/uQU9X5M7ZFkWIlYHDiTJt7F6m2QEw7Q1LdccuBa
 J+aB2lD0I8p2ZTFSHCYpGXnn2HBHBtIsb9W8G19fZlXYw9B3s30FHOWq4gwZUKBR3qG0
 4mTw==
X-Gm-Message-State: ANoB5pn0tw9tZM5hzqHjbHxWuCrjkUScttbs5vq/fMZDD+u7emjuPibc
 2tm+AJ5GHI1DzGmedM3VpWE=
X-Google-Smtp-Source: AA0mqf4ot1dRfz4XcQJOzbIEVDNmvoy9FxZf/F3Gx+j1WTmSwhOpMtvOjIltFzq0/t2LrM51x6qHTA==
X-Received: by 2002:a05:6512:2521:b0:4a4:5e83:e07d with SMTP id
 be33-20020a056512252100b004a45e83e07dmr1937785lfb.409.1669025797870; 
 Mon, 21 Nov 2022 02:16:37 -0800 (PST)
Received: from [172.16.196.95] ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a05651236c800b004a03d5c2140sm1957388lfs.136.2022.11.21.02.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 02:16:36 -0800 (PST)
Message-ID: <20825b50-c2ef-7efb-efbf-ac00cc4ab9f4@gmail.com>
Date: Mon, 21 Nov 2022 12:16:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
To: Rob Herring <robh@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Daniel Mack <zonque@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20221118223728.1721589-1-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On 11/19/22 00:37, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

>   .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-

Acked-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


