Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B16D540C2DC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 11:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DA6517CC;
	Wed, 15 Sep 2021 11:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DA6517CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631698676;
	bh=K8Pz/G/Y4+Q2E+M3Xh9gSFguPuwux18ytnh8mLnQ58I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rUmNPLnMf0nmiU8mqZtn+rEJtnNbMGgLPDAlWtS4QWrUixCfu8e5XCVm32fHyYO5o
	 j34WjqixIp6NElPb4SOiDf4JZTnQjRS4wMiAAhJw51TchB+oXKwXpWiNegV23A8S/D
	 VcHPsWvOMPed5OLxgfEOOJuW9hzmYaZaH6Gu5wis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8235CF802E8;
	Wed, 15 Sep 2021 11:36:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91AA0F8027C; Wed, 15 Sep 2021 11:36:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22A74F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 11:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A74F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="E0yEV3k/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18F8RYYa002529; 
 Wed, 15 Sep 2021 04:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=7jSSEFSclv8FhsW/JSW/6X0NIoG/uGILNNBtf6HBqDU=;
 b=E0yEV3k/zd2P2kmr7uM+Zr4/5Lpw3NaeWFQT66H3Ntikak+LUBops6ge/r3fChnNqogU
 bcDveTVLxfLs9HFfKoTriI8EAgyPlHJ4Y3Tweh8qw48Fi3ajTyJ+6XcGOXcsP7NHjYEs
 5ebRxdnQcmkfQZIHbRyjW8LQSufj/L74fKVyCxWbgJdLitgSERswxrpGmGvz5fq+7ADU
 Gn98OUkv3BJo9/MiPQm4ilLghZ4JNWE/j8zam9cHrtUB82gELz5ExCL9lckmAMCuHCmC
 iJKNwt7ZiI3+jwJyPRO95knmWq8zED0HLnMAmYVY0Ri3TnWrfa7qD4DVIt6G5+5HqZec mw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3b3287gm7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 15 Sep 2021 04:36:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 15 Sep
 2021 10:36:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 15 Sep 2021 10:36:27 +0100
Received: from [198.90.238.230] (unknown [198.90.238.230])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7678D45D;
 Wed, 15 Sep 2021 09:36:27 +0000 (UTC)
Subject: Re: [PATCH 1/2] ASoC: cs42l42: Minor fix all errors reported by
 checkpatch.pl script
To: Mark Brown <broonie@kernel.org>
References: <20210914165220.752498-1-vitalyr@opensource.cirrus.com>
 <20210914165220.752498-2-vitalyr@opensource.cirrus.com>
 <20210914170516.GG4434@sirena.org.uk>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <e5686fcb-32ba-8f7d-3e29-113ddb65a141@opensource.cirrus.com>
Date: Wed, 15 Sep 2021 10:36:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914170516.GG4434@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-GUID: TKicdmKMLmcpd0wGR1l6VnbanSDtgUXn
X-Proofpoint-ORIG-GUID: TKicdmKMLmcpd0wGR1l6VnbanSDtgUXn
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, James
 Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>,
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

On 14/09/2021 6:05 pm, Mark Brown wrote:
> On Tue, Sep 14, 2021 at 05:52:19PM +0100, Vitaly Rodionov wrote:
>> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
>> ---
>>   sound/soc/codecs/cs42l42.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)

Hi Mark,

Thanks a lot for review. We will fix and push new version.

Thanks,

Vitaly

> This sort of minor cleanup should go after any fixes so that there's no
> dependency created needlessly.


