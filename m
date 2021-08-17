Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3450D3EEC08
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 14:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9CB1661;
	Tue, 17 Aug 2021 13:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9CB1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629201602;
	bh=TOcpkTGjrQ4pD7Z5HRgb2yPlFEeO60EleVCi8HlGt6c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHG2JGKw+Av2n4ywMu0qBwJdrMDx00qFyfKS/d1InHN08KbUsu2/vaYGxwmeJvQzj
	 bfOC5QUcd1Exr9ypnOM71abUiUFIzS0G5zTosPjRARmm9KpvfPAGokdNrMEex/3fKW
	 SB0y3l/aDXstOrVVMeQmNSSLvbj3KQjOZWng62QI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23354F80134;
	Tue, 17 Aug 2021 13:58:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75681F80272; Tue, 17 Aug 2021 13:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91002F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 13:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91002F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="JYwdfJGN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17H5G88X006623; 
 Tue, 17 Aug 2021 06:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=QrMTdVAszLcR9CMpWeF6bTLtoBvMHkTMYmWrt+imPnA=;
 b=JYwdfJGNYYwIrrDYV2rv+4ijZFDM8DwtHwJ2I0FloEPvB656+cpUfujx1ZUYio7uU2Q5
 1KzeEx7xYVbsi/efge8aQJ48Bu0GYOjD5KA8StP/+k19NWU6ZA3mh9U9Gzll4C1GYMsA
 co/rVaP22ZQo5c/grhtuSJ9Q+A4UyOW27wMs3EPMmhPN/zqSlrGiyHs6zZjURHgXArIR
 zyrM30LlSOEfffuG2jHaNB13+Qaj3vNg7YzkXRCZ86LoIaBBB6FfQXfVUD5qcHbOGCEz
 ZvR6/zANQOgArx0mMFOcj44znbRoHIQvpL+adv2HU9bgjAdb861x0HNWTCso11+UuaCa Nw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3ag0nggwpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 17 Aug 2021 06:58:29 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 17 Aug
 2021 12:28:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 17 Aug 2021 12:28:22 +0100
Received: from [198.90.238.180] (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7E34E45D;
 Tue, 17 Aug 2021 11:28:21 +0000 (UTC)
Subject: Re: [PATCH 2/2] ALSA: hda/cs8409: Prevent pops and clicks during
 reboot
To: Takashi Iwai <tiwai@suse.de>
References: <20210812183433.6330-1-vitalyr@opensource.cirrus.com>
 <20210812183433.6330-2-vitalyr@opensource.cirrus.com>
 <s5h1r6xlvrs.wl-tiwai@suse.de> <s5hczqgil3v.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <6595e87d-1dae-b536-c17b-eafa07d04bbe@opensource.cirrus.com>
Date: Tue, 17 Aug 2021 12:28:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hczqgil3v.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-GUID: AnC5RTzh0mPaqUW5ZXINb2_B0nfTkEzj
X-Proofpoint-ORIG-GUID: AnC5RTzh0mPaqUW5ZXINb2_B0nfTkEzj
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170074
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Stefan Binding <sbinding@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
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

On 14/08/2021 7:41 am, Takashi Iwai wrote:
> On Fri, 13 Aug 2021 08:10:47 +0200,
> Takashi Iwai wrote:
>> On Thu, 12 Aug 2021 20:34:33 +0200,
>> Vitaly Rodionov wrote:
>>> From: Stefan Binding <sbinding@opensource.cirrus.com>
>>>
>>> During reboot, when the CS42L42 powers down, pops and clicks
>>> may occur due to the codec not being shutdown gracefully.
>>> This can be fixed by going through the suspend sequence,
>>> which shuts down the codec cleanly inside the reboot_notify
>>> hook, which is called on reboot.
>>>
>>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>>> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
>> I hold this one for now, as there is a fix series that deprecates the
>> reboot_notify callback of HD-audio by forcibly doing runtime-suspend
>> at shutdown.  Please check the three patches in
>>    https://bugzilla.kernel.org/show_bug.cgi?id=214045
>>
>> I'm going to submit those soon in anyway.

Hi Takashi,

Thanks for letting us know. We have tested against for-next branch and 
we have an issue.

Loud pops on reboot. It looks like suspend have never been called on 
reboot or shutdown for us.

> The removal of reboot_notifier landed in my for-next branch now.
> Please rebase and adapt the changes appropriately.  In short, the
> runtime suspend is applied at the shutdown, so the workaround is
> needed only for suspend.
>
>
> thanks,
>
> Takashi


