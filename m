Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A228F0CA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 13:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB47176F;
	Thu, 15 Oct 2020 13:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB47176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602760579;
	bh=hOXId7AxBpyBo8Hh2tajZ5a37Znd3NUgNK0ok0gc6TM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ct+LqlNCv8urnGZkedAYPPCq907l9EazCLLYhhJfqhDtoWJAHxSXfcRta5lCm4/gh
	 EdlsDWswcREtc80TORWYn36ewb3WZTjAGe4s+xV1rEBfPf0btPRfjNmfRo8Iy4z/zp
	 Km8ppmyNmmKUIYRCmpYLb7duvtZsBv4kfAisOLXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A581F800F6;
	Thu, 15 Oct 2020 13:14:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37190F801A3; Thu, 15 Oct 2020 13:14:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_65,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6436CF800F6
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 13:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6436CF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NfTvKcNI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09FBDcLX003370; Thu, 15 Oct 2020 06:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=6MtK5HTjl7O8ZLDUURV0+Pu2XnudzYXw1xSbOLCaSLM=;
 b=NfTvKcNInwlTR4ftDqXW+H0MtdXOkDJ9YRN7ui0qYh6FdpD1DoiOw0n3EQBUs9OEcjoj
 MaVy7+x0m6x5kRbgecOTnx2lQWkppeEmT26BLzu8TEARY2t1vstnO0qJkDz9J5zXige+
 SDk92oG7Ay7XxZGS7KdANAdYITQaFlvbtmsKfncFNf/FOJu/eBJz43L1Z7fw35Ohb+Jb
 yBS8oflfP6sJCzfYWr0OI+odh9708s1HpuEU+JEs7lfQKtEPJqoUwoyhEITBrtQEAS8W
 6lJfOk+yTt7G39/aOMO8mifWqtxqzQmpl6mYANTcK/6IL4rN8LY3Ecs6M4Xg2ADjX2Ma 8Q== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac1xkvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 15 Oct 2020 06:14:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 15 Oct
 2020 12:14:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 15 Oct 2020 12:14:21 +0100
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2AA3B2AA;
 Thu, 15 Oct 2020 11:14:21 +0000 (UTC)
Subject: Re: [PATCH 6/7] ARM: dts: Add dts for Raspberry Pi 4 + Cirrus Logic
 Lochnagar2
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, <broonie@kernel.org>,
 <robh+dt@kernel.org>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014145418.31838-7-rf@opensource.cirrus.com>
 <e9db1a11519dce0938cef867179160a818ec4143.camel@suse.de>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <89913f8b-fe92-1a31-77ff-49ea3f3d3294@opensource.cirrus.com>
Date: Thu, 15 Oct 2020 12:14:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e9db1a11519dce0938cef867179160a818ec4143.camel@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150080
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


On 15/10/2020 11:25, Nicolas Saenz Julienne wrote:
> Hi Richard,
> your series is very welcome, upstream support for audio codecs on the RPi4 has
> always been lackluster.
> 
> Could you provide more information on the actual products? Are there custom
> made hats for the RPi4 or this wired into a generic development board.
> 
Info on the codecs is available from www.cirrus.com.
The Lochnagar audio development board is not a hat, but it can be wired
over to the RPi GPIO header. It is not specific to the RPi.

> On Wed, 2020-10-14 at 15:54 +0100, Richard Fitzgerald wrote:
>> This is based on the default bcm2711-rpi-4-b.dts.
> 
> Note that you could've included bcm2711-rpi-4.dts (as if it was a .dtsi).
> 
Ok, will change.

>> Configurations are provided for Cirrus Logic codecs CS42L92, CS47L15,
>> CS47L24, CS47L35, CS47L90 and WM8998.
>>
>> For each codec there is a sound node and a codec device node and both
>> default to disabled. Enable the pair for the codec in use.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
> 
> Sadly I don't think creating a new device tree is a good solution here. If we
> were to do so for every RPi hat/usage it'd become unmanageable very fast. There
> is a way to maintain this in the open nonetheless. I suggest you build a DT
> overlay and submit it to https://github.com/raspberrypi/linux, see
> 'arch/arm/boot/dts/overlays.' The Raspberry Pi engineers have a kernel branch

We want something in mainline so that it can be used by people
developing on mainline and taken as a starting point for configuring
the codecs for other host platforms. The RPi is a convenient platform to
use as the base because it is widely available and low-cost.

> that tracks of the latest kernel release, so once you get the rest of patches
> sorted out and they are included in a release it'll make sense to do so.
> 
> I can't tell for other distros, but opensuse packages overlays, so the effort
> will ultimately be useful to users.
> 
> Regards,
> Nicolas
> 
> 
