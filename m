Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 508812F2C99
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 11:24:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2456316E7;
	Tue, 12 Jan 2021 11:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2456316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610447058;
	bh=LvYVEC37bLzvbCe7DKss6dRzBePYAEVaPuEAtjveHqk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVCnZVQQ5VjzOqi0j0Pe8LnLTqF4dNCXjqJwQIBthDJ6jbWTrZac3gMomBKaoeooK
	 b/n5LO+4k7NdtHcTTos80KOteChNIgx6GKZp2oNXHgMj5emZgBCW97NhgzRRlP+9FG
	 CHFZDgm2T3MQi5pzBpJvSlqPX3P7SNZ2IST1XEpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F268F804AA;
	Tue, 12 Jan 2021 11:23:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AFE3F80475; Tue, 12 Jan 2021 11:23:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7490FF800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 11:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7490FF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="F6O2oVM+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CAMmHR018269; Tue, 12 Jan 2021 04:22:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=OupojVahqqyY5lVkMconfNlsBdRPPIj670tlMIkeqSA=;
 b=F6O2oVM+kN3gmqHvoV70TTQtsXlbp4eDtmPYJbY9NOpqCIFUwxnApIUN9Kh+ycoRorOO
 5syvvkYC+j+NHIW5C3clSxlPmoMLXrEjHsHYjWgcZp8FCjupzFhVpgtpb31SYoTBf0Lh
 TkycOzAYwWkmj0FoA0dlwekgjuQeT8pwprZzM9kdgxUf1jDc2UNP7SvigIshVkQJMICj
 4zSV99QYRlI7f8OGtF3mt+MW5+PerI7vxtpO+VLQhcz76LLZ+8PGdNoToo2D792g55Ix
 P6pBJoz4E/G/4nVuPCNWfUQ8JN1zYDmuOTZfO/5XDM1/6LGdadMXROL1bIhXhGZ2uss9 zQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35y9sru8tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 12 Jan 2021 04:22:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 12 Jan
 2021 10:22:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 12 Jan 2021 10:22:46 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.57])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1B80045;
 Tue, 12 Jan 2021 10:22:46 +0000 (UTC)
Subject: Re: [PATCH v4 3/6] ASoC: audio-graph-card: Support setting component
 plls and sysclks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-4-rf@opensource.cirrus.com>
 <87y2gzymc5.wl-kuninori.morimoto.gx@renesas.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <762d798c-bd75-e24a-40fd-263f68f1a5f1@opensource.cirrus.com>
Date: Tue, 12 Jan 2021 10:22:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87y2gzymc5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=899 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120056
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, nsaenzjulienne@suse.de
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

On 12/01/2021 01:35, Kuninori Morimoto wrote:
> 
> Hi Richard
> 
>> Some codecs need plls and/or sysclks to be configured using the
>> snd_soc_component_set_[sysclk|pll] functions. These drivers cannot
>> necessarily be converted to use the clock framework. If the codec is on
>> a I2C/SPI bus, a nested clk_get would be needed to enable the bus clock.
>> But the clock framework does not support nested operations and this would
>> deadlock.
>>
>> This patch adds new dt properties that list phandles of components with
>> the pll/sysclk settings to be applied. Multiple settings can be given for
>> the same phandle to allow for components with multiple clocks and plls.
>> The plls and sysclks are enabled when the card bias level moves to STANDBY
>> and disabled when it moves to OFF.
>>
>> The implementation does not attempt to handle specifying complex clock
>> ordering interdependencies between components. The plls and sysclks are
>> applied to a component as it is passed to the card set_bias_level/
>> set_bias_level_post callbacks. It follows from this that the order
>> components are configured is the order that they are passed to those
>> callbacks.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
> 
> As I mentioned in v3, adding *general* pll to common card driver is
> maybe difficult.

You did say that. But you did not say why.
Can you be more specific about what problem you see with adding it
to the generic driver?

> Using your own customized audio-graph-card driver is better idea,
> instead of adding code to common driver.

I just don't want to duplicate code without good reason.

> 
> I think Sameer's Tegra driver (= [3/6]) is good sample for you ?
> 
> 	https://lore.kernel.org/r/1606413823-19885-1-git-send-email-spujar@nvidia.com
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 
