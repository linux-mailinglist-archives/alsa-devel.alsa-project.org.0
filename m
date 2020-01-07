Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17647132582
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 13:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 466DF1835;
	Tue,  7 Jan 2020 12:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 466DF1835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578398414;
	bh=sRMJ/Fa9e1+q5R99MFUolKOUvG1PC8f6KBc9FzKZ6+0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1d+tAEA2sWdODEbtibqtS+z3drNokTX+Rx1jWiwOYVIN+yiv8ZBgaHNL+APhGEBD
	 slMzRIW94fn7w8AQWAbg0qKjZvzpF8PyoxpYL0KML2bnW+ZwQh46YTMLauzQPGW9Ry
	 L7lDW3NgrKmvaFB4EKSzatOu5gwqmG9UngUV+Isw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 394F3F801EB;
	Tue,  7 Jan 2020 12:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 462C2F8014A; Tue,  7 Jan 2020 12:58:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51706F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 12:58:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51706F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NxEljdX0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007BvGbt026141; Tue, 7 Jan 2020 05:58:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=cLhF3qKf38jGY8av3O6TIut/RMEI7A1bYJ0WOXmAxts=;
 b=NxEljdX0syV1zKOU1Z+dfQDWPd81WEAQe2vmdebPIwjYWy0XA9PsR3k5xBCJk8Cm0BxR
 aVzo8oRa2xLeZKsF0mbcHgQPJk6kYI4/hzaFIvGo6QkAqZ4cso54bw7mtvcqyVSkK+nG
 XZDBwvfbMH7nI/dcC7iQ4G9oCNippIAtM66BJzOzFaz5z6L7F6IAokJztCP/O3fdWEdS
 H8v1PYIoCZ2UbBNGkDMdpp76R43itToHfn5/QjR5nPhozEVQBWF6lEGETMMaPDlt2fR/
 2odkDmR+/Goa1cOvMHZtnWjNTpvbBfPLM3WdH3XFRXv8dko/PH/eId8BQlZpU9cUcfEE 7g== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=rf@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2xar0tbe23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 07 Jan 2020 05:58:24 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 7 Jan
 2020 11:58:22 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 7 Jan 2020 11:58:22 +0000
Received: from [198.90.251.123] (edi-sw-dsktp006.ad.cirrus.com
 [198.90.251.123])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 57C6E2B1;
 Tue,  7 Jan 2020 11:58:22 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
References: <20191218163701.171914-1-arnd@arndb.de>
 <CACRpkdbqzLUNUjx_kt3-7JLZym2RZ47edW5qp0MgXmpW4-Xf9Q@mail.gmail.com>
 <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <322b5fbe-e9ca-99cd-80d0-000a5464b37a@opensource.cirrus.com>
Date: Tue, 7 Jan 2020 11:58:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2BoVcdgRZqYutA=_SVHLtJwQzP3mKKN-q8n1ROj_iPgw@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=950
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001070098
Cc: patches@opensource.cirrus.com, "moderated list:SOUND -
 SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] pinctrl: lochnagar: select GPIOLIB
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 07/01/2020 10:39, Arnd Bergmann wrote:
> On Tue, Jan 7, 2020 at 10:45 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Wed, Dec 18, 2019 at 5:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>> I wonder if GPIOLIB should just become mandatory when enabling the pinctrl
>>> subsystem, or if there are still good reasons for leaving it disabled
>>> on any machine that uses CONFIG_PINCTRL.
>>
>> Hm that is a tricky question, they almost always come in pair but are
>> technically speaking separate subsystems.
> 
> I think there are a number of use cases for GPIOLIB drivers without PINCTRL, but
> are there any examples of the reverse?
> 
>         Arnd
> 

You could have muxable pins that aren't gpios. For example muxing 
between i2c/spi signals. So a pinctrl driver doesn't imply gpio.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
