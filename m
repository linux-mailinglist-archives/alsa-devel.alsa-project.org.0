Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 227805BE1BB
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 11:18:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BE8C857;
	Tue, 20 Sep 2022 11:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BE8C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663665519;
	bh=m+ggfILRe4soos/9I5YFTnSL4zlW4UH05McHOPkIq94=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CeGjDiAsLfjyBPEKZUTy8zuKoo3scxuJ1vLb6j7rHmFYfQQuaQX+JDE2XyYhBf3Wu
	 tvFTZyjJSUX1ruccdGab+Aciys5/vu89aqhCIbJQJyk5zp/v2rzw3YxieOCIwCMK7+
	 EVFpYeyeIdlM/AcjIBnUyBW2FuBNxTKQzdW8YAKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D31B4F800C9;
	Tue, 20 Sep 2022 11:17:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 587EBF80155; Tue, 20 Sep 2022 11:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54FC7F800C9
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 11:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54FC7F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ckT1VIou"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28K7UgYp001414;
 Tue, 20 Sep 2022 04:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=5iQ7Hk97DDzsd/9mpNc/KXu5Xgutl+Nll03FBIeS0S0=;
 b=ckT1VIouTN8aWdhtUD1phL1fw90bHxvFZHrhlhD/3GHxxMVBtD7+Ox9vONRbxcQfSTrj
 QXvzqkinZ7O0FMmdkmpolOZEmCRoNcgsJUgRkZWH8eyQ2Rx6xmKuWjQI1821KxeZm9S7
 /FvePxCgQ/1NjQ1N0h7sttYrBPHzMn4aKHmxbsnbozqbQpws5dZkRIAYwWCjYP4g66Pw
 172Gm1MtzaTyPcGB1UqzfseK4sUpR96426F5e5PqyP7XwUIC9jOYuDowoweWgT8dr2IX
 ShqCQO8w4jQ5FIeHTohLsFHt7XCVLshQyk6axImj4PmcbI+eD5P7hjEaeh8GSGcZC15V NQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jnanmka8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Sep 2022 04:17:30 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Tue, 20 Sep
 2022 04:17:29 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Tue, 20 Sep 2022 04:17:29 -0500
Received: from [198.90.251.95] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 201CA475;
 Tue, 20 Sep 2022 09:17:29 +0000 (UTC)
Message-ID: <633a7b75-91f8-9a54-c042-87079d27cc8c@opensource.cirrus.com>
Date: Tue, 20 Sep 2022 10:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] soundwire: bus: Fix wrong port number in
 sdw_handle_slave_alerts()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <sanyog.r.kale@intel.com>
References: <20220917140256.689678-1-rf@opensource.cirrus.com>
 <9edb1178-7454-eb3f-60a5-d3f73d01c9d6@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <9edb1178-7454-eb3f-60a5-d3f73d01c9d6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FfAq9d8vE1bFE8VL_Xw0G6Lxgh3j7hlq
X-Proofpoint-ORIG-GUID: FfAq9d8vE1bFE8VL_Xw0G6Lxgh3j7hlq
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On 19/09/2022 09:44, Pierre-Louis Bossart wrote:
> 
> 
> On 9/17/22 16:02, Richard Fitzgerald wrote:
>> for_each_set_bit() gives the bit-number counting from 0 (LSbit==0).
>> When processing INTSTAT2, bit 0 is DP4 so the port number is (bit + 4).
>> Likewise for INTSTAT3 bit 0 is DP11 so port number is (bit + 11).
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> Another thing that never worked, but no one has used port interrupts so
> far. I only used it for PRBS tests in early enabling some 3 years ago,
> and it was for port 2 IIRC.
> 

Except us because Cirrus Soundwire requires a full DP prepare sequence,
it doesn't support simplified DP_SM.

There's still the problem of the code deadlocking while waiting for the
prepare interrupt, because it holds the bus lock while waiting for the
completion, so the alert handler can't run. That's something I need to
look at fixing. But it's not a blocker, just means that the code has to
wait the whole timeout for each amp. (That's another thing, couldn't we
issue all the DP prepares first so the amps prepare in parallel, then
wait for them to ack?)
