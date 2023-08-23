Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA206785D64
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:40:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AF6C827;
	Wed, 23 Aug 2023 18:40:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AF6C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808859;
	bh=Km0jVihvZg8F8DZ4G4cDNpphIJn3an3/R/T+HhhOYqs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W3PGSFqK+WkR4cgZXl3flYvF4gwn8NtJ2GdipW/JiMM9ng9BTuXItTq56r2sK+azD
	 5bXpS5oJd6yPDECZPV3Ka92JGOtg3wOEECZBToZu7seDRrLT6vmSiMxYz5Qkn90v5v
	 XA6c2KKeJamfcGDTPszXr8KG+Er9JZ+Z1QCXP8MY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4E54F80536; Wed, 23 Aug 2023 18:39:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65862F800D1;
	Wed, 23 Aug 2023 18:39:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB621F80158; Wed, 23 Aug 2023 18:39:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81B0AF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B0AF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZQLPepTl
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37NBg6p7026375;
	Wed, 23 Aug 2023 11:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=cpgzNH57mx+DsvI
	xWbkG41BP3185zto9IDE8mqY1W3Q=; b=ZQLPepTlxXmr8U49U9k1k6kg2PwlW9C
	NIV8iGd6qqw66SOg5EtWlUAY44081Qteub2LDiSTvbmIt9VnsedujcC2Cc9Bs3T3
	zgX1v95Thzvg5KYPVyiirEJPrOLoRp4+8UmJsfxQEX4gEh84WaS5U/nfqVsTIYuI
	Fc9EpOgd2RQMBQeJOkS4Qy2XrwLXvpYfdxg6htuD54f4jTTPdk8FiwDQG53yxz2i
	M7Dx/yxbeM9Inn5lXQnGtCwtohGqenLmD4jmBAmJorJe32j+3hQL2WHLVX2bJCfV
	iKc/25aCq+A/2Fz2p3m04bCvpqHAZ7baeh+Fk+APSJCVPDIolu/T6lw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sn21s1a59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 11:39:37 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 23 Aug
 2023 17:39:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 23 Aug 2023 17:39:35 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 301B311CD;
	Wed, 23 Aug 2023 16:39:35 +0000 (UTC)
Date: Wed, 23 Aug 2023 16:39:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Message-ID: <20230823163935.GG103419@ediswmail.ad.cirrus.com>
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
 <20230823154958.GF103419@ediswmail.ad.cirrus.com>
 <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: q62JCQh8r1O-iiNK-ZfRaiGWABN0pUZM
X-Proofpoint-ORIG-GUID: q62JCQh8r1O-iiNK-ZfRaiGWABN0pUZM
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Z2GD4MAJ7P2HG324XGBVZFOHJ7BOSX5W
X-Message-ID-Hash: Z2GD4MAJ7P2HG324XGBVZFOHJ7BOSX5W
X-MailFrom: prvs=3599de430b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2GD4MAJ7P2HG324XGBVZFOHJ7BOSX5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 05:19:31PM +0100, Mark Brown wrote:
> On Wed, Aug 23, 2023 at 03:49:58PM +0000, Charles Keepax wrote:
> > On Wed, Aug 23, 2023 at 10:21:13AM +0100, Charles Keepax wrote:
> > > Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
> > > added an additional local params in __soc_pmc_hw_params, for the
> > > CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
> > > bytes) and keeping two local copies of it makes the stack frame for
> > > __soc_pcm_hw_params really large. As the two copies are only used
> > > sequentially combine these into a single local variable to shrink the
> > > stack frame.
> 
> > Hmm... this might need a little more thought its not clear why this
> > should change the frame size and it only seems to change the frame
> > size on the ARM cross compiler I am using, not x86.
> 
> Isn't that just going to be a function of the compiler being smart
> enough to work out that there aren't overlapping uses of the two
> variables and they can share stack space?  There's no reason not to help
> it figure that out.

Yeah I think my only concern here was I no longer was certain I
understood what was happening. I don't think the patch can do any
harm, well except for the names being slightly less clear in the
code. It is starting to look like the mostly comes down to the
compiler being smart enough, although both were GCC in my case
so the difference is still a little surprising to me.

Thanks,
Charles
