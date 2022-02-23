Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B04C45C8
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 14:17:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E861B20;
	Fri, 25 Feb 2022 14:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E861B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645795078;
	bh=9lKBU3pTEDi5zr6j/7WBZBcnx996ERE3hOHQe6iypFQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oev/CUN1iUof21KHhnrGfR8VynvNM44DyyY9O/ZzGH4Qsk++fLfrx0iLUFr7E5cPg
	 c+hJEmgwxIG1aua3qNe0VCNpTbdrPxmayfAIPFNHNQwkPKBGzECtApPp0mtX/GjvGG
	 qKlDJ6fL8+ikqvdm+Ko6Mta12DwvgaSsGeZ146ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2D3F805B6;
	Fri, 25 Feb 2022 14:11:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7929FF80237; Wed, 23 Feb 2022 21:13:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28949F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 21:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28949F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="ugMTRqf/"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 314ED405D7
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 20:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645647191;
 bh=iwWa9JcbVhEYFFR9LsmnA7bsxJWJbrU0gOV0sfgjYeA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ugMTRqf/dNN2yJ+Fwc559+kKZKSoJSbnlZ5ne6B/VatWfF9i5t1sbH1InHlPw5bHz
 YTs3Zm0cR9Mv7GNEwCMXffRe+JPs82YVRVREmru5k2Ily+P9+DG2BCTqMWtfhDOaW8
 7el9wu/u/uk7LgHbkyPAMAvNodolNY142iADvMc2BsH6K2dPyYccVaj1c+qlxS7JDc
 L8f6cLeYa26sxTYqTZ1jonyRjA+Q+JnmMU7jTsc40JVWy5iRSBJ1+YqTdRhWhEaOFI
 ilrpDGsYPEExhmC5zctJffN4DUNWw2IMTfDGbdRS4SPEVQsk2O5rN1xJZ5VGmS4srN
 Lv/BP0o6X6DRg==
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso14116539edh.6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 12:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iwWa9JcbVhEYFFR9LsmnA7bsxJWJbrU0gOV0sfgjYeA=;
 b=DCseT6MuFBL47JLfs5KPDJNh81NR+HkRiPy2d3i7HJROpVCMUYzjIHw2Ec+pDgHU8+
 UGyPvRlhuohxp1Bzzklmwgq2hKDzsTxRPmvxPMGardAnZ7mCzvI/O0pk25fZ/mmmT2E+
 MaVW6NqYpjjyBzLY08dkroboVOci/X/SJPwkY283g5kx8ZKpR/tppC1eMioP83KGlLjb
 E2Ry28GyYxGvSrz6po7zmxZPwJtIRhldn5D6Iod2/zEFz6OvkTmO4F/Yx0il6vgBJSwT
 10EqHKBhFse9WRFsVdEmmK2Ywm02oyMn9+VoYCPcvx/KFEPtq1K85WD7A6tE8pUldsKO
 Vi7Q==
X-Gm-Message-State: AOAM533uHYV+ciaNxW286XFVejwJ2m9U0Lm90wQ7JOYH2c9CjFB6j/E9
 naPIxnkXqyqYoYsR6Krr2w7NUQxaVRVzbwAqXxNjcM2iL9Ue6mGm1zYGKZCUREPjZ896gQqs8zb
 82qD6LrrB5/SwoHucNvhFitIE0ephMGGwu9kQcV9H
X-Received: by 2002:a50:d4d2:0:b0:410:9fa2:60d6 with SMTP id
 e18-20020a50d4d2000000b004109fa260d6mr1046079edj.35.1645647190019; 
 Wed, 23 Feb 2022 12:13:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz26puqYUhlyjvmoVu/kDMW076CFmPiGqR/4gF9iezSP9z6kTJySAPUmRGeoBQCBAPnogL/Qg==
X-Received: by 2002:a50:d4d2:0:b0:410:9fa2:60d6 with SMTP id
 e18-20020a50d4d2000000b004109fa260d6mr1046041edj.35.1645647189826; 
 Wed, 23 Feb 2022 12:13:09 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id ee30sm359292edb.4.2022.02.23.12.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:13:09 -0800 (PST)
Message-ID: <ab308509-0f81-6f6b-7b94-0ac1086de53a@canonical.com>
Date: Wed, 23 Feb 2022 21:13:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 07/11] spi: use helper for safer setting of
 driver_override
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220223191310.347669-1-krzysztof.kozlowski@canonical.com>
 <20220223191441.348109-1-krzysztof.kozlowski@canonical.com>
 <YhaTWiSQl6pTVxqC@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YhaTWiSQl6pTVxqC@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 25 Feb 2022 14:11:18 +0100
Cc: linux-hyperv@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Fabio Estevam <festevam@gmail.com>,
 linux-clk@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Abel Vesa <abel.vesa@nxp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-spi@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Bjorn Helgaas <bhelgaas@google.com>, virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Shawn Guo <shawnguo@kernel.org>
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

On 23/02/2022 21:04, Mark Brown wrote:
> On Wed, Feb 23, 2022 at 08:14:37PM +0100, Krzysztof Kozlowski wrote:
> 
>> Remove also "const" from the definition of spi_device.driver_override,
>> because it is not correct.  The SPI driver already treats it as
>> dynamic, not const, memory.
> 
> We don't modify the string do we, we just allocate a new one?

Actually you're right - the SPI and VDPA implementations operate on
"const char *". The others do not, so I can convert them to "const char
*". Thanks!

Best regards,
Krzysztof
