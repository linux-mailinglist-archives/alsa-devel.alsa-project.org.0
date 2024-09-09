Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F74971CB5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 16:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6EF0847;
	Mon,  9 Sep 2024 16:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6EF0847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725892532;
	bh=C7bXknGyFxyMitrh31Cr/MolSopclgYoGfO3FYZG1hw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJrswZeAbmYrMazlf14rCPMYhEIfobrT1uecBTLSrBdY+Zbnn6BoDevHBCXKul155
	 AMdF6qLruJ9Lx701oJgrWZ4H1GqBGD75d0eXZ5s+yAzmUhcNySjXVOPYdaYg2Sdvyn
	 o3xe4sIgSjclr04DcUSMxAXhmsgXlpOUwEUfuKFw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78284F805BB; Mon,  9 Sep 2024 16:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB647F805B1;
	Mon,  9 Sep 2024 16:35:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23535F801F5; Mon,  9 Sep 2024 16:34:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11701F800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 16:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11701F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E6A9u6bp
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4895uBUC005605;
	Mon, 9 Sep 2024 09:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=T2HTchzqKQv0cV3UAK
	mPXN4bhD8dnPssptBbdVsRfM0=; b=E6A9u6bpbdKagTlFrP/TR7JNkNBv4pGKUb
	cl+FhT2GJhmeWwTestkjQeJxUZL2BJedjwBX6vsWmKydKhkmLUC64ILDaXc+J2c+
	KkK02nHkB01TlzkndKERix3xqVcvbQnL8X73xkWDIgRQyaoAv0OCNxlIuMzLmX92
	29xte2ewKtCwwkuSJsGEPyWuLryQ1clBrSpC/LNEdDj5VvAFhGe6jtg75uqJ8V3r
	Y5LDSMVmmqEOuEOfs/NJNhx5z2+KPXIinywyBcN12JGjTa7z6KGVFWjXmWiPj8/H
	+62wpDTmBp1wBZ+Xb91+CZvKqd0YJhYU+7QrbpGmW4aQsWCgkZWQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41gm7x1qaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 09:34:52 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 15:34:50 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 15:34:49 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id DAC1F820249;
	Mon,  9 Sep 2024 14:34:49 +0000 (UTC)
Date: Mon, 9 Sep 2024 15:34:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: "Liao, Bard" <bard.liao@intel.com>,
        "Liao, Bard"
	<yung-chuan.liao@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "Kale, Sanyog R"
	<sanyog.r.kale@intel.com>,
        Shreyas NC <shreyas.nc@intel.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
Message-ID: <Zt8HiDW0gs6hXDPY@opensource.cirrus.com>
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
 <ZqngD56bXkx6vGma@matsya>
 <b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com>
 <f5110f23-6d73-45b5-87a3-380bb70b9ac8@linaro.org>
 <SJ2PR11MB84242BC3EAED16BEE6B46F85FF932@SJ2PR11MB8424.namprd11.prod.outlook.com>
 <acec443c-f9ab-4c1d-b1ab-b8620dfef77f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <acec443c-f9ab-4c1d-b1ab-b8620dfef77f@linaro.org>
X-Proofpoint-GUID: McJ1BWxhzIXMwKxx7Iw_lx2naU0oC6P7
X-Proofpoint-ORIG-GUID: McJ1BWxhzIXMwKxx7Iw_lx2naU0oC6P7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XHGWUHFA3HZPYRWI6CIFKWYZOL6JNVP5
X-Message-ID-Hash: XHGWUHFA3HZPYRWI6CIFKWYZOL6JNVP5
X-MailFrom: prvs=698262c8fd=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHGWUHFA3HZPYRWI6CIFKWYZOL6JNVP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 04, 2024 at 01:43:50PM +0200, Krzysztof Kozlowski wrote:
> On 03/09/2024 17:17, Liao, Bard wrote:
> 
> >>>
> >>> then dpn_prop[0].num = 1 and dpn_prop[1].num = 3. And we need to go
> >>>
> >>> throuth dpn_prop[0] and dpn_prop[1] instead of dpn_prop[1] and
> >> dpn_prop[3].
> >>>
> >>
> >> What are the source or sink ports in your case? Maybe you just generate
> >> wrong mask?
> > 
> > I checked my mask is 0xa when I do aplay and it matches the sink_ports of
> > the rt722 codec.
> > 
> >>
> >> It's not only my patch which uses for_each_set_bit(). sysfs_slave_dpn
> >> does the same.
> > 
> > What sysfs_slave_dpn does is 
> >         i = 0;                          
> >         for_each_set_bit(bit, &mask, 32) {
> >                 if (bit == N) {
> >                         return sprintf(buf, format_string,
> >                                        dpn[i].field);
> >                 }
> >                 i++;
> >         }                         
> > It uses a variable "i" to represent the array index of dpn[i].
> > But, it is for_each_set_bit(i, &mask, 32) in your patch and the variable "i"
> > which represents each bit of the mask is used as the index of dpn_prop[i].
> > 
> > Again, the point is that the bits of mask is not the index of the dpn_prop[]
> > array.
> 
> Yes, you are right. I think I cannot achieve my initial goal of using
> same dpn array with different indices. My patch should be reverted, I
> believe.
> 
> I'll send a revert, sorry for the mess.
> 

Hi, apologies for being late to the party (was on holiday), but yeah
this is breaking things for me as well and is clearly wrong.
Agree probably best to revert.

Thanks,
Charles
