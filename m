Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF562414F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 12:23:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75FE51650;
	Thu, 10 Nov 2022 12:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75FE51650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668079414;
	bh=ZMdNWbhvfd3zKJe7zbYHHfLkVWy0zJ8+Z4NmY9lsrJA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJcGDiG5A9blrlD3wvByfSM5OUqk0g/76HsgsrPmi3sU1vx3eUGBA+AbCrUQ0Z6Bg
	 VQVneFc9+qrsVGxzjv49S3IYIrVJOYj+furLFk6hWe1v6pU6o12prqUupWbq6qqus0
	 qy0aLOfSSGlxgsk/Bjt6129s0EutF4C7kBUg8YCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C204F80162;
	Thu, 10 Nov 2022 12:22:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D22D1F8021D; Thu, 10 Nov 2022 12:22:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE5F9F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 12:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE5F9F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SUaY1jm+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AA9FLHi004698; Thu, 10 Nov 2022 05:22:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=04hU+ISPUch+ZRCv1Q+3n72ZEEiUP6vT4o1xW8JdjnU=;
 b=SUaY1jm+sVK6BkEOlWU3D3VH0U9/7lNDlbBOvsEYO5LnA1S4mLKhL/rSyRTkv9hNFGOP
 +QGBlmNB1T+B6HeHCuIZhzJuGu/jPRgjStB5KTjfsi3vzjScBZp1AHd+p7eaGRLawSdo
 liMwGW3nDdlal0tsvcVlzfjE8g2gMSFgZzrMx4bubtG50XCK75hjw6M2UkF+iV1LEjBB
 yIE0veU2i8spbFLHlDOZ5dNYCbjIKqfgh3mnzlo5YAQQb4rfLDrWhUGf73Suklhx+p4U
 78+hKeIsRcLxJou07Ct6sykUBhkAESkSQC4yNa+Elzo5H9AfySn6JIn3QZzvQ3b1fLxS fA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3knm8pek27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 05:22:28 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 10 Nov
 2022 05:22:26 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Thu, 10 Nov 2022 05:22:27 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0C8C3476;
 Thu, 10 Nov 2022 11:22:27 +0000 (UTC)
Message-ID: <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
Date: Thu, 10 Nov 2022 11:22:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 09/12] irqchip: cirrus: Add driver for Cirrus Logic
 CS48L31/32/33 codecs
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-10-rf@opensource.cirrus.com>
 <87mt8zutib.wl-maz@kernel.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <87mt8zutib.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8S_O80bx2UQ4PY8ndGbnWR4MbPtL4s5G
X-Proofpoint-GUID: 8S_O80bx2UQ4PY8ndGbnWR4MbPtL4s5G
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de
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

On 10/11/2022 08:02, Marc Zyngier wrote:
> On Wed, 09 Nov 2022 16:53:28 +0000,
> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>
>> The Cirrus Logic CS48L31/32/33 audio codecs contain a programmable
>> interrupt controller with a variety of interrupt sources, including
>> GPIOs that can be used as interrupt inputs.
>>
>> This driver provides the handling for the interrupt controller. As the
>> codec is accessed via regmap, the generic regmap_irq functionality
>> is used to do most of the work.
>>
> 
> I cannot spot a shred of interrupt controller code in there. This

It is providing support for handling an interrupt controller so that
other drivers can bind to those interrupts. It's just that regmap
provides a lot of generic implementation for SPI-connected interrupt
controllers so we don't need to open-code all that in the
irqchip driver.

> belongs IMO to the MFD code.

We did once put interrupt support in MFD for an older product line but
the MFD maintainer doesn't like the MFD being a dumping-ground for
random other functionality that have their own subsystems.

>  It is also a direct copy of the existing
> irq-madera.c code, duplicated for no obvious reason.

It's not a duplicate. The register map of this device is different
(different addressing, 32-bit registers not 16-bit)

> 
> 	M.
> 
