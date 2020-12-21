Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7072DFB1D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 11:40:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1EBE1757;
	Mon, 21 Dec 2020 11:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1EBE1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608547221;
	bh=zM8NfCGaAI9o+QLPpcpq43henb1mqNfB4O11DYdPfw4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WxLt93mmZvSuO1w9Pgk7cRAdQU2K7DuYtjgObE8uMmOGVZa0Fk29FfFI3QHlCY5sl
	 Cf4lf6yLRirKKeGsZPrnMDTu2kh/YTiQ2zjrDfjdwlLKE5otW9HpGUkbdejoZ1o2et
	 aG2xnGx4SHUsYNcDa+wYhqjTZB9c782BwH5uo78o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D230DF801EB;
	Mon, 21 Dec 2020 11:38:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BCCCF801D5; Mon, 21 Dec 2020 11:38:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3DC7F800E4
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 11:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3DC7F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RslDdVW4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BLAa20H005340; Mon, 21 Dec 2020 04:38:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=kqdrZOb2FKOv/PPkSfWW8gDUQTDnYAioyzgCwgZ6rwY=;
 b=RslDdVW4u3AMhMt7KVd3LndOMuy6lI0ypiM37Wos/JYCG4/lYBStcpHtTV6axoHpcM9g
 G41mDGnT1FZ2ujzc6HhKQl3AFdaLi92NAaTmzg6ffHLz9+4GmE2Mx5dtu8Z9qt7Qeu8h
 wn0Tcdhp9tUgZsH6kZvih8o3MysFxaiwjY/9latiAvzt7gnnSUXU5eW+nr5lpwcTWu6o
 kLB9mN0l7qscO4LIPyUyFirqZs3KA9OAx8A+aDtKgwHGs/rQ1Yad3/vQ502isCWBRL+t
 I61dqUImyjrtlQwR6caRUFi4rEcD1AscnQDcsDlOg8K2fEb7ywLdgFfWd/uL4cM0JedS DQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35hetuhqqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 21 Dec 2020 04:38:25 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 21 Dec
 2020 10:38:23 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Mon, 21 Dec 2020 10:38:23 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.186])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0B45511CB;
 Mon, 21 Dec 2020 10:38:22 +0000 (UTC)
Subject: Re: [PATCH v3 3/6] ASoC: audio-graph-card: Support setting component
 plls and sysclks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20201217154142.24301-1-rf@opensource.cirrus.com>
 <20201217154142.24301-4-rf@opensource.cirrus.com>
 <873604gf45.wl-kuninori.morimoto.gx@renesas.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <35430e71-5718-de7f-9587-73d15ed6507a@opensource.cirrus.com>
Date: Mon, 21 Dec 2020 10:38:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <873604gf45.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 phishscore=0 mlxlogscore=876 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210077
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de
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

On 18/12/2020 00:03, Kuninori Morimoto wrote:
> 
> Hi Richard
> 
> Thank you for your patch.
> This is v3 patch, but I think this is the first time for me
> to receive patch...

Yes sorry.
Somehow I missed you off V1 and V2 emails.

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
>>   include/sound/simple_card_utils.h     |  25 +++
>>   sound/soc/generic/audio-graph-card.c  |  16 +-
>>   sound/soc/generic/simple-card-utils.c | 236 ++++++++++++++++++++++++++
>>   3 files changed, 275 insertions(+), 2 deletions(-)
> 
> I understand that you need sysclk/pll and .set_bias_level_xxx().
> But I guess makes it generic code is difficult (?).
> Thus, as Sameer doing on Tegra, creating custom audio-graph-card is better
> idea for you ?
> 
> # Now I'm creating new audio-graph-card2 which also supports
> # overwriting/customizing each/all functions.
> # It is not full compatible with audio-graph-card, but almost same if you
> # uses normal connection.
> # I hope I can post it next year
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 
