Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC253E3EE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 11:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D4116BF;
	Mon,  6 Jun 2022 11:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D4116BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654507877;
	bh=hptmirzpxdfe7VL/+OG+1YyH3ex6/jyGAeUaGVYaUKw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bn5J7lftjGVO1xNM6cg1/ZzHNODxhgbG/U4iJ7XWc0O4NXQaAN9CbD+8cj7ME2rJp
	 Kelsxrb1Zo4/vuW/RZTxz2drAJbNT7Qf8QKRNq5jfgIujZKymZThaEI0QD0493aVtk
	 hcaSqYyPazrIA2TSeg1nYRBcy/w9oR9wV5gJ3/p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E031F80310;
	Mon,  6 Jun 2022 11:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53565F801D8; Mon,  6 Jun 2022 11:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 929C9F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 11:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929C9F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="nb6u/4JY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2565KdFF012652;
 Mon, 6 Jun 2022 04:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=dSUqhCTZXHV3N+XZL5p1hy3iq3wKm8e7EJunKldfbbA=;
 b=nb6u/4JYc1CXIX4SlLnBuHHK3INE0YuQqALVJ5alQ8rushYfooq6oVaxZcoEMp3jsiuY
 Ya/f8a0PMgVsHEP5ISLxem7t6fybq7OSbeesDkXeDQFwmR6VVNdjmEOB3MZ3LWxmlZjn
 QT7uOv1DAzkgS8YmeAMnfAqIJYV0dB/3UCYaTNONdYVfMNVcxcbciKggptAkxgABdert
 KJChcotRsjuRE36hspqIxqoW9BYGjMh7+K3Atf+A5y2x5me1XH/EUol8IfOJ0SzzrtjS
 mX/lX7eDOsfHCUtsLscTD8OTjXEQ+mTuVudCfSLX3H8xfrsifLccPK6ERR19kVrKY1lA Ug== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gg3tq1p30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 06 Jun 2022 04:30:02 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 6 Jun
 2022 10:30:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Mon, 6 Jun 2022 10:30:00 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.90.251.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F0C22B10;
 Mon,  6 Jun 2022 09:29:59 +0000 (UTC)
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
 <linux-kernel@vger.kernel.org>
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <1b5ba014-44ca-e753-141a-d8ff5fd248bb@opensource.cirrus.com>
Date: Mon, 6 Jun 2022 10:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YCcBa_HjJdfFg4ONq-SqjxXb_0YSvico
X-Proofpoint-GUID: YCcBa_HjJdfFg4ONq-SqjxXb_0YSvico
X-Proofpoint-Spam-Reason: safe
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>
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

On 03/06/2022 18:07, Andy Shevchenko wrote:
> When kernel.h is used in the headers it adds a lot into dependency hell,
> especially when there are circular dependencies are involved.
> 
> Replace kernel.h inclusion with the list of what is really being used.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
