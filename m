Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84D3D3C4E
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 17:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F22FF1734;
	Fri, 23 Jul 2021 17:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F22FF1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627053550;
	bh=bUGziJ824dTlTbdJ/eKFElZPR0PCt/4hv4mUyRiqXrU=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ES8YQZ2C8wiEkPdUPB0FwDOUvlZr546tZ9H10DI/7Q/JfCoYeOYyQa4q5Gx0WMj/R
	 AoP2X0cDierq5NJEfNul6F1djMGxeYM46QtW2ONXjzaP4ykuKOEIrUKhlP+RNgsAls
	 llrmkcoHXFi9bkwqOcd99i6K01UKknlTBboKmmnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5656EF804AD;
	Fri, 23 Jul 2021 17:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B20EF80086; Fri, 23 Jul 2021 17:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDA48F80086
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 17:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDA48F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="e7qlSIWj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16NEvULx009361; 
 Fri, 23 Jul 2021 10:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=4yHweakhnI2OyDgFaWWjfP9xK9RpLJ6y8bF2JOAWTWk=;
 b=e7qlSIWjx5i8QO3F0JCnvz/UDDUUJjq99ec9scrkQ5+edrs4MtnT7wOPiurFZdB/vWns
 HkOojQRRx6W0QcpsBvNpJLXPI4mngFpT9Ot+yPs0YZLCCPvLVHB0gpZZk68pW1apjJ/m
 lYx4a5tAxY6MHrs257EsKDlFCpV+svnBh/nqJlWMsUZS1BiNxfW+3ObNevGzoXm6GmPW
 O68FNVYn+mzjZxGz/7C5FqFKzmHtycvZ+C4wIdXt000j8HWqxRfRa41aJ5CoF7yl+tFA
 D4la6FKOIpPd/OdafZ8QVBrroxE+KtkupqHcUDqsAoZak6A7gAYngIYCcSRQOd6DAG8q uQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 39ya2r9j9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 23 Jul 2021 10:17:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Jul
 2021 16:17:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 23 Jul 2021 16:17:32 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.17])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A2CA45D;
 Fri, 23 Jul 2021 15:17:26 +0000 (UTC)
Subject: Re: [PATCH] ASoC: dapm: Revert "use component prefix when checking
 widget names"
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20210703125034.24655-1-rf@opensource.cirrus.com>
 <20210705165041.GC4574@sirena.org.uk>
 <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
Message-ID: <1952b7f0-3c0a-faa4-8a1b-1a8bc4fff473@opensource.cirrus.com>
Date: Fri, 23 Jul 2021 16:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GII0KmB3bBEliG1p-TJYD1Y4RICA2hMu
X-Proofpoint-ORIG-GUID: GII0KmB3bBEliG1p-TJYD1Y4RICA2hMu
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=957 suspectscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107230092
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 shumingf@realtek.com, rander.wang@linux.intel.com
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

On 22/07/2021 10:55, Richard Fitzgerald wrote:
> On 05/07/2021 17:50, Mark Brown wrote:
>> On Sat, Jul 03, 2021 at 01:50:34PM +0100, Richard Fitzgerald wrote:
>>
>>> That commit breaks all users of the snd_soc_component_*_pin() functions
>>> because it results in the prefix being added twice. It also breaks code
>>> that correctly uses the snd_soc_dapm_*_pin() functions.
>>
>>> Use the snd_soc_component_*_pin() functions if you want the component
>>> prefix to be prepended automatically.
>>
>>> Use the raw snd_soc_dapm_*_pin() functions if the caller has the full
>>> name that should be matched exactly.
>>
>> I'm not sure the analysis of which function to use when is correct or
>> what we want here (though it will work ATM), though looking again more
>> closely at the patch it doesn't look entirely right either.  The way
>> this used to be done, and the way that older code will most likely
>> assume things work, was that the DAPM functions would first try to match
>> on the local DAPM context before falling back to doing a global match.
>> This is what the fallback loop is intended to do, and the dapm functions
>> are passing the "search other contexts" flag into dapm_find_widget().
>>
>> I'd not expect the distinction you seem to expect between component and
>> DAPM and we probably have a bunch of older drivers that aren't working
>> correctly like the Realtek driver mentioned in the original fix.  I
>> think what needs to happen is that dapm_find_widget() needs to be
>> checking both the prefixed and non-prefixed names, and that the
>> component stuff shouldn't need to bother and just be a convenience
>> wrapper for users that happene to have a component to hand.
>> Alternatively we need to do an audit of all the non-machine drivers to
>> switch them to use the component functions exclusively (and possibly
>> some of the machine drivers as well), most of the CODEC users look to be
>> a small number of Wolfson/Cirrus ones.
>>
> 
> I don't mind if someone wants to change the core dapm functions if that
> is generally useful, providing that it also updates all callers of those
> functions to still work.
> 
> Changing the behaviour of core code to fix the Realtek driver without
> updating other callers of those functions is a problem.

Just to point out this is breaking stuff right now. It's not just
theoretical.
