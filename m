Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7E682B19
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 12:04:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939391F4;
	Tue, 31 Jan 2023 12:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939391F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675163054;
	bh=kXyX+GNcikz57BNSSFNG85y0jY9tnat4KSNnO/u3lBQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HcnJpwOibmiP8MMabozvwGPw9CdXjHFQqnkocjI7FpOGKXXJYg4bYguSZRJR4xGg5
	 wSX0kXwsCA+4SdFP2JiAVh3/tMHY/gobHVx+/3xEtyPdYwNvvCzVWCYmXhjXDqMAfL
	 KrsIEoPzQnRM4cDp0iQqPwu35yqR4uJlCpd+gaAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5F5F80155;
	Tue, 31 Jan 2023 12:03:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 840D1F804E0; Tue, 31 Jan 2023 12:03:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC38EF800A7
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 12:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC38EF800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n7rmD41S
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30V5icZS020816; Tue, 31 Jan 2023 05:03:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=9Je/JGcAqVqBec9JIWxD28hiF0b7sSvMarOTsZeOI0E=;
 b=n7rmD41S3zZpFYfvGkkgx1H/T5dDFxxUbAL/rrrpCyEq/g+IDjHga2tuLh24fkmI9jt6
 Qn1jiYykzUEEJkYFiF4MMLRUCXsL3o66tLzVafmYOfD4guASTTCeSRnB6kGilXx3rNwv
 nJtQ2QSOKLDjIK+eZcamAzTPbUyBE8+M1qcmXjtF2+wrvgGiZmHz+0lWySrhI56fOYBb
 uxjVzxbp1gDiIPiAhL64mW5WgxPKPav6eqh03nd0k+pSt/MIkROfOg/wI61/DP48xyOg
 fQ2bpFhJAc6ttc2jkO1yQ0MH6kY34tbOY5Ig/Zi2lCdy6SopqjvsdteGCplc81Wdd3fM xw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nd10t4x3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Jan 2023 05:03:09 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Tue, 31 Jan
 2023 05:03:08 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Tue, 31 Jan 2023 05:03:08 -0600
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2F96D2A1;
 Tue, 31 Jan 2023 11:03:08 +0000 (UTC)
Message-ID: <cb52e4cf-47d8-33be-f77d-fc2d0b868a5c@opensource.cirrus.com>
Date: Tue, 31 Jan 2023 11:03:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 8/8] ASoC: cs42l42: Wait for debounce interval after
 resume
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20230127165111.3010960-1-sbinding@opensource.cirrus.com>
 <20230127165111.3010960-9-sbinding@opensource.cirrus.com>
 <1e5e1312-18f5-e70f-3237-c2ffc851eef7@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <1e5e1312-18f5-e70f-3237-c2ffc851eef7@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rCa9VOVGCZsLmOQggf8O0Ayx6BVgYnZv
X-Proofpoint-ORIG-GUID: rCa9VOVGCZsLmOQggf8O0Ayx6BVgYnZv
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/01/2023 16:45, Pierre-Louis Bossart wrote:
> 
> 
> On 1/27/23 10:51, Stefan Binding wrote:
>> Since clock stop causes bus reset on Intel controllers, we need
> 
> nit-pick: It's more that the Intel controller has a power optimization
> where the context is lost when stopping the clock, which requires a bus
> reset and full re-enumeration/initialization when the clock resumes.
> 

Ok, it's true that clock stop doesn't _cause_ bus reset, bus reset is
necessary when exiting clock stop. We can re-word if you want us to
describe that accurately.

But from the codec driver's point of view, a clock stop causes a bus
reset.

> The rest of the patch is fine so
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
>> to wait for the debounce interval on resume, to ensure all the
>> interrupt status registers are set correctly.
>>
>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
