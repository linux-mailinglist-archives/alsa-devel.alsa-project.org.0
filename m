Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C26162450
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 11:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1962E1671;
	Tue, 18 Feb 2020 11:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1962E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582020710;
	bh=V0VG7lES8YHz3P+sDuNMM4aVwO75feIQcnwvgF5HdEA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d3Svzg+0ZLgYbC3q+13r7HG2F71gvmXJ7cprmqJcQRusdQrzerJhlSkfLb6JR7F4b
	 N1W5e1/FLNr4zxRXkmUHN1CL2Qo50Gxi7C8iEwo6/K3F4+9aQjxfqYzkt6xxwMc+Ug
	 a+OUx+HjbD/Ti0xz0qfQHE0M2BC6jmNaPckOerO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33847F80145;
	Tue, 18 Feb 2020 11:10:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30858F80148; Tue, 18 Feb 2020 11:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 146E5F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 11:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 146E5F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="N9GN9Qtl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01IA1LFv008454; Tue, 18 Feb 2020 04:10:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=7C3WqxU7agsBY/SV9N06VqS8zd5zedsNtq9mPxpHcVo=;
 b=N9GN9QtlEK4wicayZdVMUNi3AzFIrZEiwzXLlzxOfuI7yaunRJtaiDTj71aamKf0fMn9
 SBT+eoCLOwGin1aqqFH/lhDajXtSBGd9U5vtcX5+FTmmONpA6hGImOxWEagV6ySjDB1t
 o/+ybKPiLpKYvWB351lzv1ASF5LRLFsX/LsCLPfkwSyuS8cl7dvn9o3RpwRE+UJ9cieK
 o7K8TWg7+mWl/AArcQMtA2FWQZNzBcThXQNCusPnvfKHF3c01OmxAznpFKZDZ6T377X9
 Y3fkEMJZ1r34jYZjF5cle1gts1wGdAk5SalgdPfONXO42assPqdAJJSsNLxUZWmna4RC 4Q== 
Authentication-Results: ppops.net;
 spf=pass smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
 by mx0b-001ae601.pphosted.com with ESMTP id 2y6dxw3vru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 18 Feb 2020 04:10:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 18 Feb
 2020 10:09:59 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 18 Feb 2020 10:09:59 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 500272AB;
 Tue, 18 Feb 2020 10:09:59 +0000 (UTC)
Date: Tue, 18 Feb 2020 10:09:59 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Feb 18 (sound/soc/codecs/wm5110.c)
Message-ID: <20200218100959.GD108283@ediswmail.ad.cirrus.com>
References: <20200218152853.67e2482a@canb.auug.org.au>
 <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
 <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1011 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180080
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, geert@linux-m68k.org
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

On Mon, Feb 17, 2020 at 11:05:49PM -0800, Randy Dunlap wrote:
> [resending to broonie@kernel.org; other email address got message too big for mailbox]
> 

Will have a word with our IT guys, Mark's
opensource.wolfsonmicro.com account certainly shouldn't still be
accepting email.

> 
> On 2/17/20 11:04 PM, Randy Dunlap wrote:
> > On 2/17/20 8:28 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20200217:
> >>
> > 
> > on x86_64:
> > 
> > WARNING: unmet direct dependencies detected for SND_SOC_WM5110
> >   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MFD_WM5110 [=n]
> >   Selected by [y]:
> >   - SND_SOC_BELLS [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (MACH_WLF_CRAGG_6410 || COMPILE_TEST [=y])
> >   - SND_SOC_SAMSUNG_TM2_WM5110 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
> > 
> > 
> > Full randconfig file is attached.
> > 
> 

This looks like it comes from these two patches:

ea00d95200d0 ("ASoC: Use imply for SND_SOC_ALL_CODECS")
d8dd3f92a6ba ("ASoC: Fix SND_SOC_ALL_CODECS imply misc fallout")

What is happening is the machine drivers still select these
symbols but this doesn't take account of the dependencies, which
are now added by the second of those patches.

I guess there are a couple of options:

1) We could update the machine drivers to do an imply as well,
like the changes to SND_SOC_ALL_CODECS. I think this will
generally work but doesn't really feel right as you can end up with
the machine driver built without the CODEC.

2) We could update the machine drivers to a depends on and make
the CODEC symbols manually selectable. I guess this also has the
advantages that it would be necessary for the simple card stuff
that seems to be everyones first choice for machine drivers these
days.

Mark do you have any strong feelings on this I am leaning towards
2?

Thanks,
Charles
