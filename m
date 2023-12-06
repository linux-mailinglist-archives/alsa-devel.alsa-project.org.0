Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEBF807401
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 16:53:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC9F483E;
	Wed,  6 Dec 2023 16:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC9F483E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701878011;
	bh=0VViBjomo3/YMJd/uGIPwWCWh5RmcYzYzdcRGInIWig=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IIxBzZy3HsAR+HhzigImPd2WUZgiFn80PRAH6yo+rYGaoBnZd9/WQGF8lh/8Llfnn
	 gm62Szy0k/vvShb5YgFiF/dJakvr8W9Cj5qC7jkvxueJacPB/p/yO94cw+9aZ6YrWE
	 dqIzdZ3RuXJhZMm9sxVs1rhAKkaeSxCGn2Qco66Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECFDAF80570; Wed,  6 Dec 2023 16:53:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9EEFF80571;
	Wed,  6 Dec 2023 16:52:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2436F8024E; Wed,  6 Dec 2023 16:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC9CAF800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 16:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9CAF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Rv4RMkJB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B65Vl3J031364;
	Wed, 6 Dec 2023 09:52:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=P1wsTuwthHd+W6v
	2WJ5TuYJRlVVn8EOVEAwGIIuMNs0=; b=Rv4RMkJBl1nO7aatvjUBvaWrlYdp6vc
	8AUmD1BDzS4AWxz+TYYJpRWGY91cz1CT6jwpTLBpVqfUMtFp+gliux1VqYEZFxv6
	169S0Rsmg2tuj/f1BdIyBY+jd1PSXpVgUK8KoWiirFE3WKenum1y71w5TBiagYKA
	1Ntz88trZLYsl17WubLbXAMtv6OCxJ1vI7qLU6XvUY91Pl/R0lpKYUYDZI6DaYYy
	3QkizeQJZpiCFwx3L1R/jfzMeRBOqB6LD+u8sFQqX3QWeE7zrWVxg3gcis2Mln44
	h3LJqZC2jrlL+bUWNXnXif15sG8zs6Y05iHP+nuzHrpic3wYkgCbY0g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3utd47rwch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 09:52:44 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 15:52:42 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 6 Dec 2023 15:52:42 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7D5AA11D1;
	Wed,  6 Dec 2023 15:52:42 +0000 (UTC)
Date: Wed, 6 Dec 2023 15:52:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v2 2/2] sof-soundwire: Add basic support
 for a 4x cs35l56 configuration
Message-ID: <20231206155242.GL14858@ediswmail.ad.cirrus.com>
References: <20231206140547.1344041-1-ckeepax@opensource.cirrus.com>
 <20231206140547.1344041-2-ckeepax@opensource.cirrus.com>
 <2086d1e4-e122-415c-8147-e63931f38b9d@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2086d1e4-e122-415c-8147-e63931f38b9d@perex.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: LTlRkJPw0EQOhCD5x0_xaE85oae9eyr9
X-Proofpoint-ORIG-GUID: LTlRkJPw0EQOhCD5x0_xaE85oae9eyr9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OS7XX4NBPC4I2VYAHQI24FLZJEMBVLZX
X-Message-ID-Hash: OS7XX4NBPC4I2VYAHQI24FLZJEMBVLZX
X-MailFrom: prvs=77042597b4=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OS7XX4NBPC4I2VYAHQI24FLZJEMBVLZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 06, 2023 at 04:16:06PM +0100, Jaroslav Kysela wrote:
> On 06. 12. 23 15:05, Charles Keepax wrote:
> >cs35l56 is a boosted speaker amp, add UCM support for configurations
> >with up to 8 amps. This also updates the default naming for the
> >speaker amp UCM file to remove the number of amps. Special cases are
> >added for the existing amps that require different UCM for different
> >numbers of amps, but future additions will defaults to not including
> >it in the naming.
> >
> >Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >---
> 
> ...
> 
> >-	False.Include.spkdev.File "/sof-soundwire/${var:SpeakerCodec1}-${var:SpeakerAmps1}.conf"
> 
> Thanks, but I meant to do a global change like this:
> 
> https://github.com/alsa-project/alsa-ucm-conf/pull/370
> 
> Could you rebase your change on top?

Sure no problem thank you.

Thanks,
Charles
