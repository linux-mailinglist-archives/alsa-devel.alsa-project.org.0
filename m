Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AE3D95B4
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 21:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11171F8C;
	Wed, 28 Jul 2021 21:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11171F8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627498875;
	bh=4AUj/P74xLSZ3g3esxKV9im5ZPtykrH/XtqjcDS1yIM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jtE8xqQv4gyyPHhm0SvS/qpeUlbeY2AOdps+RO5DLlhx3wTUGdMUpzWeeVW2W0Dmz
	 PFmyTpKGFWxiBSpnlF0ROpt+exBLMsyfLZqsLl6cxXjCc6gW1onn6twOLRNII/JAgo
	 rF+B7lQvy/ksv+6UqA2L9zt08SJBjamDMvIHdOlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 289A2F80127;
	Wed, 28 Jul 2021 20:59:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB547F8025A; Wed, 28 Jul 2021 20:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46FFEF80127
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 20:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46FFEF80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="RI5Z9RwJ"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16SArwea015791; 
 Wed, 28 Jul 2021 13:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=EGSW0TwfIT+GMxavIP78M2ErEcV0sbtlNTgmieySSak=;
 b=RI5Z9RwJz2wSoIcwio8LhoCnsQHohf01Mp4ZF/5fFrmu1NlVxQr3MHfcXHppJidIzEjN
 dNTbrmikP35AwDdDBD3jKyxt4slXLhl4Se+TT31VApGymMAxLcuhpJTwkLzFbr8plhfq
 Ozs7c+LAYo6f+/QUPAYaY6FJQcu3cKshiX75LmrQdqv8Hbf6NLq7c6dh23BALEweKEi+
 9TbApERBPgNtljCp+zHV4Ib2qeBTsAXchwPFYvqmO9FAX+11JBAaR7p9jc14REkhn3iO
 VUktebKqwcDvbafANYqxp6veLEYDrb7mHFzvn867ArmbAfscvAEl9r84F2DsbPi0mIe5 Rw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20usw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 13:59:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 19:29:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 19:29:30 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.65.56])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 57B7A2BA;
 Wed, 28 Jul 2021 18:29:30 +0000 (UTC)
Subject: Re: [PATCH] ASoC: dapm: Revert "use component prefix when checking
 widget names"
To: Mark Brown <broonie@kernel.org>
References: <20210703125034.24655-1-rf@opensource.cirrus.com>
 <20210705165041.GC4574@sirena.org.uk>
 <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
 <20210728160948.GE4670@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <a59d60bf-6bbc-c65f-bd77-2b1bc98b0d22@opensource.cirrus.com>
Date: Wed, 28 Jul 2021 19:29:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728160948.GE4670@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MQqvYS1TpwSz0d8KkpV4ovc0L2R-oIS4
X-Proofpoint-GUID: MQqvYS1TpwSz0d8KkpV4ovc0L2R-oIS4
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=519 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280109
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

On 28/07/2021 17:09, Mark Brown wrote:
> On Thu, Jul 22, 2021 at 10:55:23AM +0100, Richard Fitzgerald wrote:
> 
>> I don't mind if someone wants to change the core dapm functions if that
>> is generally useful, providing that it also updates all callers of those
>> functions to still work.
> 
>> Changing the behaviour of core code to fix the Realtek driver without
>> updating other callers of those functions is a problem.
> 
> The thing here is that nobody would have thought that that any caller
> would have been open coding this stuff like the component things were,

On the contrary, since that was the only way to use these functions with
a prefixed component it's entirely possible that there is code already
adding the prefix. Why would you expect nobody has ever written code
that works?

> it's simply the wrong abstraction level to be implementing something

Ok, but that doesn't mean that it could never have happened.

> like this so people wouldn't think of auditing the callers to find uses

I don't think that it's either safe or desirable to skip checking how
callers use functionality that you want to change. My understanding of
Linux development protocol was that if you make a change that affects
other code, you are responsible for updating that other code to match.
Regardless of whether you agree with how that other code was
implemented. It creates a lot of overhead for everyone if it's ok to
make changes without trying to fix up other code that is affected by
that change.
