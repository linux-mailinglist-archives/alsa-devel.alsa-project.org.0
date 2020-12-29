Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AA2E726A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Dec 2020 17:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DC9182B;
	Tue, 29 Dec 2020 17:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DC9182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609260822;
	bh=MZSsh9N9J+K6tEa5tvKG73CSQRBCrLQVoIEFCR1Of+Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzT1fcDfqUgydxTLeqnjLK22BGGlycyRA2cdNUx1u88k4W5ZeTZgmaM7GT6JMIfor
	 aN6r/apBBfoNwzvOURVGjPvUlsWQpO1vLjYHFkjA6h0L9iu9DogGnihlJahUZEd0KQ
	 Upto6ZJ2n7UXEgIENGwxBdZXp0HYyAN8iLYspBac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AC08F8022D;
	Tue, 29 Dec 2020 17:52:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B412F8022B; Tue, 29 Dec 2020 17:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B37F80141
 for <alsa-devel@alsa-project.org>; Tue, 29 Dec 2020 17:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B37F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JentzFaq"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BTGjsIF001692; Tue, 29 Dec 2020 10:52:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=nhgYx7cqWgTw69wlvU8Cudb5DVNq7vlstqAzD2EBDV4=;
 b=JentzFaqCYGOsW9RcNYJfnZEtLyQlHqcsFAyN6T9wMiA9FS/Iwe/NQdNZyrMDIo3ZuR/
 i7zMvWSuMdchpLrO3Yci5ak0mN4PLUL6fH7AVevlgPz8ICGOwP1CddQ6XWd42YdDdY2D
 0/0Gs3TDzBssP1KnE6U4hvAggQjyLINvKpRMNphiqCaC65rtp3s5SQVt7dD8fZCsm6h0
 Xzf77rehrdmPOSIP1USqBQaL6nVuZTM5HEWeAQZZCLzaNW6EJOWxkHmjGJ7tojNVQNfY
 YjIn3e8HRfCHwGp5n6C1aRjGitUvtvtxLkAXAIZ1hJJRZSVq8vCvBDH2CLf9OW3bbw5f aQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35p3f7afpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 29 Dec 2020 10:52:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 29 Dec
 2020 16:51:58 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 29 Dec 2020 16:51:58 +0000
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.77])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8DAE42AB;
 Tue, 29 Dec 2020 16:51:57 +0000 (UTC)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150635.GP9673@ediswmail.ad.cirrus.com>
 <20201229151548.GG4786@sirena.org.uk>
 <1d982dd1-eb02-e7c7-357e-83cf5003c624@redhat.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <21333e30-1e7a-2c95-9e7c-6325c7e78f9a@opensource.cirrus.com>
Date: Tue, 29 Dec 2020 16:51:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1d982dd1-eb02-e7c7-357e-83cf5003c624@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290106
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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



On 29/12/2020 15:40, Hans de Goede wrote:
> Hi,
> 
> On 12/29/20 4:15 PM, Mark Brown wrote:
>> On Tue, Dec 29, 2020 at 03:06:35PM +0000, Charles Keepax wrote:
>>
>>> There is maybe more argument for porting the Arizona code across
>>> anyways, since for a long time Android didn't properly support extcon
>>> either. It supported the earlier out of tree switch stuff, extcon
>>
>> Completely moving the driver doesn't cause the same problems as the
>> current proposal (unless it drops functionality I guess, there were
>> issues with adding new detection types into the input layer but I can't
>> remember if this hardware was impacted by that or not).
> 
> The input-layer supports the following switches:
> 
> SW_HEADPHONE_INSERT
> SW_MICROPHONE_INSERT
> SW_LINEOUT_INSERT
> SW_JACK_PHYSICAL_INSERT
> 
> Which is a 1:1 mapping with the cable-types currently exported by
> extcon-arizona.c .
> 
> I'm fine with fully moving extcon-arizona.c over to only using
> sound/core/jack.c functionality and it no longer exporting an
> extcon device.
> 
> I guess we should move it out of drivers/extcon then though.
> I suggest using: sound/soc/cirrus/arizona-jack-detect.c
> Note that sound/soc/cirrus is a new dir here. Would that work
> for you ?

Shouldn't it be sound/soc/codecs/arizona-jack.c so that it is with all
the other code for those codecs?
> 
> And I guess we probably also want to change the MFD instantiated
> platform-dev's name to which it binds then?
> 
> I suggest using: "arizona-jack-detect" as new pdev name.
> 
> It will take me some time before I can make time to implement this,
> but this is a plan which I can get behind.
> 
> Regards,
> 
> Hans
> 
