Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29F7F1877
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:20:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCDCEDE5;
	Mon, 20 Nov 2023 17:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCDCEDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497251;
	bh=UdovXj9eRG/y3npf2/dSirveIPiB9jm8ntA/K6kRWGw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DvdRv3aQAvQU9FQuhcUzezuuOvoK2CdQFFbEknV44HVtdmxGI9duyS1sODrRLzYNk
	 GYhPyudQhzKyfjbIgf7N8Tyr/acm/nunKTyv+HcaHGOUyGYzbBimrifPinWbM5NVi/
	 V5QtNm+oThInU14WFm1EizUUuwmXwxsRmuvN7rpg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CBC9F80578; Mon, 20 Nov 2023 17:17:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE13F8057B;
	Mon, 20 Nov 2023 17:17:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BB09F805E5; Mon, 20 Nov 2023 17:16:51 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A6983F805D8
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 17:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6983F805D8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=I0W+9Ho3
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AK6oXeG014560;
	Mon, 20 Nov 2023 10:16:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=Ywj1kdPjKsuou2fy1TtXc2Xqs1GoaBvw35slxNV/7EU=; b=
	I0W+9Ho3GB8GYvDBtlhm2uf1mZEPslXeitaQMajmsf12ZhhLVOpVQUHGBrJupnJp
	Dz2oWe61n9xMvfXJgupn5XGhizv14uUkV6mXyz5GSJ/fg3NLIxmBi0V8UYS6Ychp
	R6iF3xeMArWUgFMJK76c49zRKWe80FJLl6igniopbKC6FbGNTscgcbQvUqEojx9o
	I60+yu+5fZwSc2ecVz1fA34acwQ0Rvs+fhuK0ozUTIODJVQl7RnFDkN0x1Sb+QhX
	7BvzroAn+AKFyRnnBA6VtcrptqcrG48m3MJ7pP2rN3TwHM1+A8ej7R+p0uSQlgZv
	hvJ//3d1Lo4LcB+zD8VGZA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj2a1e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 10:16:40 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 20 Nov
 2023 16:16:38 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Mon, 20 Nov 2023 16:16:38 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 31900357F;
	Mon, 20 Nov 2023 16:16:38 +0000 (UTC)
Date: Mon, 20 Nov 2023 16:16:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Maciej Strozek <mstrozek@opensource.cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <20231120161638.GJ32655@ediswmail.ad.cirrus.com>
References: <20231120141734.76679-1-mstrozek@opensource.cirrus.com>
 <7248897a-0b59-4cdc-9915-d3297f2d6efe@sirena.org.uk>
 <261e118d-529b-0ce0-5524-d24d767fa92f@opensource.cirrus.com>
 <c031657a-a1ec-44eb-8885-afee68d7523b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c031657a-a1ec-44eb-8885-afee68d7523b@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: o5eMkHLJNbnn67w0gTWh6TXQS7nIHgxj
X-Proofpoint-GUID: o5eMkHLJNbnn67w0gTWh6TXQS7nIHgxj
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=66884bf062=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: PV5XQP6XXWTA6Y7SKAYFYJRM6DX63PLC
X-Message-ID-Hash: PV5XQP6XXWTA6Y7SKAYFYJRM6DX63PLC
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:17:30 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PV5XQP6XXWTA6Y7SKAYFYJRM6DX63PLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Nov 20, 2023 at 03:54:14PM +0000, Mark Brown wrote:
> On Mon, Nov 20, 2023 at 03:46:26PM +0000, Maciej Strozek wrote:
> > W dniu 20/11/2023 o 14:40, Mark Brown pisze:
> 
> > > > +		} else {
> > > > +			return 0;
> > > > +		}
> 
> > > Is it a bug to call this function without to_poll set to something
> > > known?  This will just silently ignore it which seems wrong and is
> > > inconsitent with the handling in the interrupt case which will wait for
> > > the the completion to be signalled and report a timeout on error.
> 
> > In interrupt case 0 means timeout (and calling function should expect 0 as
> > error/timeout), so the only inconsistency I see is in not waiting before
> > returning a timeout, but that would be needlessly wasting time?
> > Do you think adding a debug print or a comment would help here?
> 
> It seems like a clear code bug if this is ever called with an unknown
> completion, I'd expect a WARN_ON_ONCE() there.  The lack of a delay is
> potentially going to affect how any error handling works which doesn't
> feel ideal though the users look fine right now.

I guess perhaps another option might be to not stick so strictly
to the wait_for_completion_timeout API. This function could
return an -EINVAL here and a -ETIMEDOUT for a timeout then the
callers could be updated accordingly.

Thanks,
Charles
