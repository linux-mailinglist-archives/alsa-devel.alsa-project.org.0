Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4318059F6
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 17:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918E2DEB;
	Tue,  5 Dec 2023 17:29:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918E2DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701793769;
	bh=rKvs9AP1b1yUOpwmfY36PK85gz1A8tNXQI2QBuh5RaM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WHe3cBnC/mJIim7O3HSmtUYy+MmgKzKZ9RoyHoc6vmFq5bL/H6RBrPuV92KBm62iQ
	 6y0D1APGo3CzpFD7VbfMljUhP+uFiPpen252M8TD0KOiKedeJPd0jE7uLXtbJ0okNZ
	 fvreHJI9w6g3yJ70rBJ+lLlq6VRT3OFsxmn2ekxc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B442BF8028D; Tue,  5 Dec 2023 17:28:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC79F802BE;
	Tue,  5 Dec 2023 17:28:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4EBCF8024E; Tue,  5 Dec 2023 17:28:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE318F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 17:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE318F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=G5f0U2AT
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B5FafaZ006693;
	Tue, 5 Dec 2023 10:28:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=B//pYPtzx9bMAjH
	2WeRjWuLosIBYsHkVW4trGitrujI=; b=G5f0U2ATGPn0pWYMd/qkL4xB6RFEd+c
	XTbQ7JAT8tC6B+PgcgWOKuBK0+7H/2Ei5c76wRuXJnKHagjCYJSrVXVjdgarzY4m
	3749M6K+7vYfQ3K/G2WeA8AWJi52tJEBoDshfS0QPahbIwvOODQ7hsuc70SRXhxe
	sM6T8qvIbcURGKpF80NHNAlkNGsg+vVdmU6JJE0U4vk2xFxQ7WKh3JwQGCKV6Z7h
	XUkTRkPL8ugJdiTVdJCYgku7/MEs7A9Xdnzdl5w6iDPGRcoZopO3M3+8iDTl19dO
	d6Yij7Ajmus5KyOANEe/jhBogrz1Z65BAsAoyRReM4kGNbuy5OfbUig==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnkh3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 10:28:40 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Dec
 2023 16:28:38 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 5 Dec 2023 16:28:38 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D0E9411AB;
	Tue,  5 Dec 2023 16:28:38 +0000 (UTC)
Date: Tue, 5 Dec 2023 16:28:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <perex@perex.cz>, <bard.liao@intel.com>, <mengdong.lin@intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add basic support for a
 4x cs35l56 configuration
Message-ID: <20231205162838.GH14858@ediswmail.ad.cirrus.com>
References: <20231205142420.1256042-1-ckeepax@opensource.cirrus.com>
 <20231205142420.1256042-2-ckeepax@opensource.cirrus.com>
 <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c14371e7-0974-4d97-b5b8-55937390b684@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: qTo3gUYc9x3xtFpjHV0oxKEE-jpcL5na
X-Proofpoint-ORIG-GUID: qTo3gUYc9x3xtFpjHV0oxKEE-jpcL5na
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZF7S3QW6P22TUVAYGGKGHAZAPUOMU2QC
X-Message-ID-Hash: ZF7S3QW6P22TUVAYGGKGHAZAPUOMU2QC
X-MailFrom: prvs=7703bda8c8=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF7S3QW6P22TUVAYGGKGHAZAPUOMU2QC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 05, 2023 at 09:25:27AM -0600, Pierre-Louis Bossart wrote:
> On 12/5/23 08:24, Charles Keepax wrote:
> > +	EnableSequence [
> > +		cset "name='AMP1 Speaker Switch' 1"
> > +		cset "name='AMP2 Speaker Switch' 1"
> > +		cset "name='AMP3 Speaker Switch' 1"
> > +		cset "name='AMP4 Speaker Switch' 1"
> > +	]
> > +
> > +	DisableSequence [
> > +		cset "name='AMP4 Speaker Switch' 0"
> > +		cset "name='AMP3 Speaker Switch' 0"
> > +		cset "name='AMP2 Speaker Switch' 0"
> > +		cset "name='AMP1 Speaker Switch' 0"
> > +	]
> 
> If we only need an on/off switch, I wonder if this can be made
> conditional, i.e. enable/disable a control if it exists. That would
> scale to various numbers of amplifiers without a need to add a 2-amp, 6
> or 8-amp configuration.

I think that is possible, would you lean towards modifying
HiFi.conf to only include a single file for cs35l56, or would you
lean more towards having each cs35l56-x.conf file include a
single base file?

Thanks,
Charles
