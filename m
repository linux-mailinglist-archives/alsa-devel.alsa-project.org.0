Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B0290073
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 11:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AC601799;
	Fri, 16 Oct 2020 11:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AC601799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602839028;
	bh=lHa4Ol4qCYddIskqG1lsdL69iW8aF9mTqSeuPNVl8eY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDl/qg/EFWHlLpYLeigDa8a6MrLo+wgk6PT86Acol4wz57DfEsTq3TWNszOScWPEv
	 yBN3Ff8c0sDdMuUskuZa0TFOnWBFAqOfXgmM25qvJVH9n53JV6CQ2kycx3pNMNY4G2
	 N+c7Cq2lc01aBtWx0Gq18o5GqE+pJ1TbiDwypUNY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F71F8021D;
	Fri, 16 Oct 2020 11:02:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 871DAF80217; Fri, 16 Oct 2020 11:02:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D13EF800B8
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 11:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D13EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="J/qVoHmA"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09G8wG0j010538; Fri, 16 Oct 2020 04:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=qbEy+RUlEXHlen/P4VXawLv+5FTJsE1+6IDxyiw8LTI=;
 b=J/qVoHmAjZUMueeTEUwfSo4C1K2sxvsCu+l5VrkAfS98YfacpadkYPJ8lk0ETdddxq32
 Z2C9xD9M89y/vYPS0rs8CP/rhzGuHk8X7oYFOLEL+5epQvCR45vilSWzDILJum0hV0rN
 hdlLu8Lg/yft05iafyBOcx5T18vSrYRsWyAW0XMRTGqWqIOBN9g7QMamlBBi6/UJOijA
 h1NoLmD1AQhLqQ/bbwD58aNWmdqivXJKbF24qvIXaRCaVhQ4V+WTw1agURSeoZ4dSZ/n
 APT9Ka+Ir6UP6piwaSwwBWuCbGjo2OdKPjrMs+xhmVhAHRxJHGC7D7CQUEPmAJqw19vl pQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac1yyfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 04:01:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 10:01:46 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 10:01:46 +0100
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7F7DB45;
 Fri, 16 Oct 2020 09:01:46 +0000 (UTC)
Subject: Re: [PATCH 6/7] ARM: dts: Add dts for Raspberry Pi 4 + Cirrus Logic
 Lochnagar2
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, <broonie@kernel.org>,
 <robh+dt@kernel.org>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014145418.31838-7-rf@opensource.cirrus.com>
 <e9db1a11519dce0938cef867179160a818ec4143.camel@suse.de>
 <89913f8b-fe92-1a31-77ff-49ea3f3d3294@opensource.cirrus.com>
 <5d2587193f0e99996445d5fa507a8acf7854fed3.camel@suse.de>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <72eb1414-0657-fd62-e0c7-fc5f53d6aa6c@opensource.cirrus.com>
Date: Fri, 16 Oct 2020 10:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5d2587193f0e99996445d5fa507a8acf7854fed3.camel@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160065
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


On 15/10/2020 16:12, Nicolas Saenz Julienne wrote:
> On Thu, 2020-10-15 at 12:14 +0100, Richard Fitzgerald wrote:
>>> Sadly I don't think creating a new device tree is a good solution here. If we
>>> were to do so for every RPi hat/usage it'd become unmanageable very fast. There
>>> is a way to maintain this in the open nonetheless. I suggest you build a DT
>>> overlay and submit it to https://github.com/raspberrypi/linux, see
>>> 'arch/arm/boot/dts/overlays.' The Raspberry Pi engineers have a kernel branch
>>
>> We want something in mainline so that it can be used by people
>> developing on mainline and taken as a starting point for configuring
>> the codecs for other host platforms. The RPi is a convenient platform to
>> use as the base because it is widely available and low-cost.
> 
> If what you want to convey is the proper way of configuring your specific
> device the way to go is writing a devicetree binding. See

If we have a working configuration it is unreasonable not to make this
available for people who want to use it or examine it. A working example
can be more helpful than a ton of documentation.

It's also worth noting that setting up a working sound system involves
configuring multiple drivers (for example you also need a properly
configured ASoC machine driver at least) crossing multiple driver
bindings. So a complete working example is valuable to see how
it fits together.

> Documentation/devicetree. It's even possible to validate a given devicetree
> against the bindings (given they are written in yaml format).
> 

Validating only checks syntax and bounds. It doesn't prove that it will
work.

> Regards,
> Nicolas
> 
