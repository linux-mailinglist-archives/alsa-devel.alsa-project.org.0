Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647D0625B7E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 14:51:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4F5166C;
	Fri, 11 Nov 2022 14:50:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4F5166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668174684;
	bh=sqUtxr3JOt9CON4D6T396mqkqa6Hj8CIYNhAyoBlw00=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1B76KQJNGHJZ9lm1QqPsR1z36YGmMWxrpNAHeMbzOnzgnSOvYDXmposPIDAqvnXB
	 /dsMnlLeDL9Guq2/ZECBMXEyqE/YLYkIulWT4O1eFUZWwUhYYjTSeWI3EbsBvtjgop
	 s7PS0fUeiqEdZKIGCWOxiPrY5g3hcMpXbA36UxJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86C6FF800CC;
	Fri, 11 Nov 2022 14:50:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50556F800CC; Fri, 11 Nov 2022 14:50:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97BB0F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 14:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97BB0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oKZn5EE6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ABDQXbr005032; Fri, 11 Nov 2022 07:50:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=//sddTGCV87LKelpvK8ff4z976ThW+K8Io2Y83nt9Mg=;
 b=oKZn5EE6Kx8iP81QYles42BEsm74oyBkawvz2BsGmFb992M46schIOuJjksVEyDEoHHg
 uNuHTvfKOI0NA/1ZIPIHOZtIAhuD4ux1T/60l+wYUfGF6jWxoJwMf/WwInm4S96KS3hO
 CefXQtJSHv+3jEc5M0mS25F0qXPadIl3G/mjz+XyAOARxaYcj82nkbjC3X1+tyVSfQ5M
 0UwzkAU8jcchmPouuOWu693wH8xVugwtLh7iUVl6Z2iMBay8mgjty1J23IVNVF5blsnT
 Mo7FB35L5WgYWiMXRhWRs/+KPhxIbJ/RmQ80Bhx1nvvJbn22YxU7WkesGd5rrqzE4KAv ZA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81s0en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 07:50:19 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Fri, 11 Nov
 2022 07:50:17 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Fri, 11 Nov 2022 07:50:17 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6C37746B;
 Fri, 11 Nov 2022 13:50:16 +0000 (UTC)
Message-ID: <2d0abd69-d54c-47ad-0c49-7e509747955f@opensource.cirrus.com>
Date: Fri, 11 Nov 2022 13:50:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 00/12] Add support for the Cirrus Logic CS48L32 audio
 codecs
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <Y21kzH4gDd6ZrpVm@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <Y21kzH4gDd6ZrpVm@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KQE-Qr3YnoZZGAyU9WWfdxxH5637k2DD
X-Proofpoint-GUID: KQE-Qr3YnoZZGAyU9WWfdxxH5637k2DD
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, maz@kernel.org,
 linus.walleij@linaro.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, patches@opensource.cirrus.com,
 tglx@linutronix.de
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

On 10/11/2022 20:53, Mark Brown wrote:
> On Wed, Nov 09, 2022 at 04:53:19PM +0000, Richard Fitzgerald wrote:
> 
>>    regulator: arizona-micsupp: Don't hardcode use of ARIZONA defines
>>    regulator: arizona-micsupp: Don't use a common regulator name
>>    ASoC: wm_adsp: Allow client to hook into pre_run callback
> 
> The regulator and ASoC bits look good.  It looks like this is going to
> need another spin for at least the DT and irqchip bits, I think it'd
> make sense to take the above cleanup patches for this release even if
> everything else misses it to cut down on future patch volume.  I'll
> leave it for a bit and do that unless someone has concerns, it's going
> to be easier than applying and sending pull requests.

Yes, I have tested that these 3 patches can apply and build on their
own and don't break the older chips.

I should have put these at the start of the chain and mentioned in the
cover letter that they can be taken independently.
