Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E557266B3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 19:06:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D583D74C;
	Wed,  7 Jun 2023 19:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D583D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686157604;
	bh=6G35OELlwe3k5lm70bNoUmgbLyCtiZp+4G54RQcFDkE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rNnuec1Mlrfacfrbfu6nfKbPeiy/pzEMmBKpAOMElyfdNryc5oI42+Qt+N7IuUS9N
	 UJt7znCVZX4Lv7bm4ApGX0baXOckxNlqQwQbaCfuL9UjlB4Jw6C4FyMHw9Zn0sXBoW
	 Q7kjZxmusKgy8I0x+g3Z1ijI0yzPOt1uZH2vrK/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0463F80520; Wed,  7 Jun 2023 19:05:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69414F8016C;
	Wed,  7 Jun 2023 19:05:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E6FF80199; Wed,  7 Jun 2023 19:05:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E7027F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 19:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7027F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=J80Z+lwn
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3576cdx6001764;
	Wed, 7 Jun 2023 12:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Wzxf+Ve9EasLuQwz//Zls2Je1Mi6ZpszXM9t2CRtAnc=;
 b=J80Z+lwn91dciHUm0sasTeQqlbAQhscUcchtvemTDxsfh03c0ALaENHQBftDKVVJjVUw
 E2XaCq/Xp7GM1qG9vWlc8SqIjyDX0ayM73JekC6D+STqaluJgyMvL9l9gvTTVileOIeh
 11fa2WO/xifUl32NNtoPbxsYwJklSAjTPTOMj4aaPy3olH3ULrcLNc0gTCwr+RndYp7r
 zP10ta0Nh+RlVi2GQE1h2DcWMmaRlWVANOIep7rtY6+Uep7hsVHHMcpPzu6NDNADi/av
 GZ2cZt6mROJaTKLwwmIY+mag6oULp05Ua/uzWsWeNMA/PvyaMuuzPkHiT/bUcHijujiU Qw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r2a7ah69b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 12:05:22 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 7 Jun
 2023 18:05:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 7 Jun 2023 18:05:20 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AA38446B;
	Wed,  7 Jun 2023 17:05:20 +0000 (UTC)
Date: Wed, 7 Jun 2023 17:05:20 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <bard.liao@intel.com>,
        -
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: add N cpus to M codecs dai link support
Message-ID: <20230607170520.GM68926@ediswmail.ad.cirrus.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
 <8411fd34-0326-ae92-1d1e-ff171318ebf2@opensource.cirrus.com>
 <c183a76f-38d9-8e20-af80-32b40e1caffa@linux.intel.com>
 <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <47053ebb-4157-49a2-bfeb-cf090d502a81@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: MaPW8-vv9wXVjTNhCeYnAsjColxnrGTs
X-Proofpoint-ORIG-GUID: MaPW8-vv9wXVjTNhCeYnAsjColxnrGTs
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5YWMSAQ2OJQB4RYA74FYPOOO3L6NOLBF
X-Message-ID-Hash: 5YWMSAQ2OJQB4RYA74FYPOOO3L6NOLBF
X-MailFrom: prvs=152287a13b=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YWMSAQ2OJQB4RYA74FYPOOO3L6NOLBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 07, 2023 at 05:22:45PM +0100, Mark Brown wrote:
> On Wed, Jun 07, 2023 at 10:10:24AM -0500, Pierre-Louis Bossart wrote:
> > On 6/7/23 04:29, Richard Fitzgerald wrote:
> > > On 07/06/2023 04:12, Bard Liao wrote:
> 
> > > You are declaring that all the CPU and CODEC in the dailink behave as a
> > > single logical link. So you can just connect all CPUs to all CODECS.
> 
> > > That also fixes a problem with the existing N CPU to N CODEC mapping. It
> > > assumes that means CPU0 is connected to CODEC0, CPU1 is connected to
> > > CODEC1, ... But that isn't necessarily true. You could have an N:N
> > > mapping where multiple CPUs have been combined to create a multi-channel
> > > stream that is sent to all CODECs. 
> 
> > This is questionable when the CPUs are connected to different links.
> > SoundWire is not a giant switch matrix, there's a clear parent-child
> > dependency and limited scope.
> 
> > Example topology for a 2 link/4 amplifier solution.
> 
> Or a system with two distinct I2S DAIs (TDM is another thing).

I guess the bit that slightly phases me here is, historically a
DAI link has been the thing that specifies what is connected to
what. What kinda happened when we added multi-cpu is we bent
that assumption, at least for the N -> N case, and now even
more so for the N -> M case, where only a subset of the DAI link
is actually connected.

If your system looks like:

CPU A -> CODEC A
CPU B -> CODEC B

What makes this a single DAI link, rather than 2 DAI links? And
does the information within the DAI link about what is connected
to what not just start looking like DAI links?

Thanks,
Charles
