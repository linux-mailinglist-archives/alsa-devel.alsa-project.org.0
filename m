Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422929065A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 15:32:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C338817AB;
	Fri, 16 Oct 2020 15:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C338817AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602855121;
	bh=0q9eMtl+tVMcjj0yTDyECQfXcXwEgyYOpN8u5dF8X1k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lPbbdkJB7lDsAVmj2F7PMl0NOqTIBQOm4qPYJNdYFVnGFmQEQSDw2R3oR7VZbqPO3
	 EQmjk3F7JukUVuOuyN/Q6XezT22oOImCKiE9CL2BZIJrpT6iVQp7pjz46MVk2ccbIu
	 FND7mRnyDhdG/+2DPtOcKPY6nNCs6LaNF3frrLPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A40BAF8021D;
	Fri, 16 Oct 2020 15:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E92A4F80217; Fri, 16 Oct 2020 15:30:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9315EF800B8
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 15:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9315EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="jLPerM7H"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09GDKuI8031555; Fri, 16 Oct 2020 08:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=EIFdycrd2ap6D7qPrimuZQwoebezAFOPU6dKTD7N7RY=;
 b=jLPerM7HmVGBq0QyY8rZARuxbCIh18RcB6tih9Ep0hzLcDCOyiZzOUW6Er3dmUVw9eNT
 owe5oejeZrBeHmgXhaTocEsaQDdeYSChGFDkAGWuF8MtlNA7GafLeV62kGi+eLmeUYr8
 rAKS7h6wws6PnJw6vJS3PDxkZxrivhA+r6/gz3hPy6qbh/ME4O3EfPaSrk36b4H0UWy2
 vIvs9luwrnSpeOkNbHbGSclu4ykAlTVCmMhEZhCcZRuh+vOEjItmY+7HTyhqn9T81bQY
 CINAZRPc9DqnuYst8YMFoQJB9xl2+8vTLYc1NDFFkZ6UbuuMm9BTKfth0BxwT8QGtH/K EQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3439cng6gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 08:30:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 14:30:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 14:30:09 +0100
Received: from [10.0.2.15] (ausnpc0lsnw1.ad.cirrus.com [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0C87345;
 Fri, 16 Oct 2020 13:30:09 +0000 (UTC)
Subject: Re: [PATCH 0/7] Add dts for Rpi4 + Cirrus Lochnagar and codecs
To: Mark Brown <broonie@kernel.org>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
 <20201014185632.GD4580@sirena.org.uk>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <b3376cd4-010f-cf72-8c81-1f5d22cb6454@opensource.cirrus.com>
Date: Fri, 16 Oct 2020 14:30:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201014185632.GD4580@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=809 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de, linux-rpi-kernel@lists.infradead.org
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

On 14/10/2020 19:56, Mark Brown wrote:
> On Wed, Oct 14, 2020 at 03:54:11PM +0100, Richard Fitzgerald wrote:
>> This set of patches provides support for using the Cirrus Logic
>> Lochnagar audio development platform plus Cirrus Logic Madera/Arizona
>> codecs with the simple-card machine driver and a Raspberry Pi4. The
>> ultimate aim is to provide the dts file but some updates are needed to
>> the simple-card machine driver.
> 
> Why extend simple-card and not the more modern and flexible
> audio-graph-card?
> 

I'm struggling to understand how to use audio-graph-card where there are
multiple alternative codecs. The host I2S endpoint has to point back to
the codec endpoint, like this:

	cpu_i2s_ep_cs47l15: endpoint {
		remote-endpoint = <&cs47l15_aif1>;
	};

But obviously that depends on which codec node was enabled. Listing
multiple endpoints makes the whole port node disabled if any remote
endpoint is in a disabled node. I've tried adding status="disabled"
to endpoints or multiple port definitions with status="disabled" but
I haven't figured out a solution.
