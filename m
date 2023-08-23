Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43654785C94
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 17:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68D2832;
	Wed, 23 Aug 2023 17:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68D2832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692805891;
	bh=vsfzhzdNrsBf3g3KAWx7zyQxcJJxSXDU7xIHsixPApQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ieWBfbYzLT1MmLUY3LQLy7aVoYEw58H5L7M6s7TY9goBPspsqj5y6kYifQRG0cQ4k
	 Ico04smoyvhtrCKHzpheZuyMrw9N7BF+l7zWfWT5OuDMwDfDrnMa4Y19biQuYfZC/f
	 +I6uRgHnJhyi3wjjtjLMxYqkEpMfH5XStXemsjNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3353F804F3; Wed, 23 Aug 2023 17:50:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5BC0F8022B;
	Wed, 23 Aug 2023 17:50:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45004F8023B; Wed, 23 Aug 2023 17:50:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DE5EF80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 17:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DE5EF80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=U9luYDnq
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37N4rX8H005941;
	Wed, 23 Aug 2023 10:50:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=p89TY34g1oplKjR
	zE1JAiK2b6jmwSGTB2Oin7Cm2PjQ=; b=U9luYDnqZSjiVqJNy+8qlu0MfSqX7RD
	LtihomrKhOIjS8qLrpjqjm/sVCl5pyrMNrIAvplkpQMx5Hsb4HojpuDhBDdJ0iB7
	eInFAltJgDqDgl+rM9ynbm4R/U1k7gkOWqAgWKQmg0/ef/5eo+Iamshc+TlNLegs
	AB8oCl2TY7oSX7NJORdPH/oV7tmwgAfZRZeu9ICFzHkCOxzk/4Ty0Dz1NmQqh+56
	mZFm7LZ8EPFHm5QdW7a9QfIuD9wad6zH9nm8tboVQya1BaU7DFk+qzq8cxls1WVv
	IShPIMuUivtMwww6Izl1u27qUpodFLAuer1U26IKzIHPF/KcgOBh29w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sn21s17hu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 10:50:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 23 Aug
 2023 16:49:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 23 Aug 2023 16:49:58 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7F5E5357C;
	Wed, 23 Aug 2023 15:49:58 +0000 (UTC)
Date: Wed, 23 Aug 2023 15:49:58 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Message-ID: <20230823154958.GF103419@ediswmail.ad.cirrus.com>
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: oetx_UaDLQhyQRAX_wG_yKsCDhPE_Gr9
X-Proofpoint-ORIG-GUID: oetx_UaDLQhyQRAX_wG_yKsCDhPE_Gr9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GYAD67IJPKDNMG3PPZP7MCONS425FH66
X-Message-ID-Hash: GYAD67IJPKDNMG3PPZP7MCONS425FH66
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYAD67IJPKDNMG3PPZP7MCONS425FH66/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 23, 2023 at 10:21:13AM +0100, Charles Keepax wrote:
> Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
> added an additional local params in __soc_pmc_hw_params, for the
> CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
> bytes) and keeping two local copies of it makes the stack frame for
> __soc_pcm_hw_params really large. As the two copies are only used
> sequentially combine these into a single local variable to shrink the
> stack frame.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Hmm... this might need a little more thought its not clear why this
should change the frame size and it only seems to change the frame
size on the ARM cross compiler I am using, not x86.

Thanks,
Charles
