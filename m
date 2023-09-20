Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CBA7A7602
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 10:37:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAAE8A4B;
	Wed, 20 Sep 2023 10:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAAE8A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695199068;
	bh=Tp9JsVqis5h2cpSImtkW2hG/vez8ue4v0b/cvBwcbuk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z0VPJAVY1K/YBI01qS0FLw+7fQDd/6IbIDzJwuLjkzub0kYrz+lqU2w0aZKmrCpBQ
	 8208kYYQ3wnkuyrIPZDgPmH+Zp34e0sf51CxmUMO6QvgGX3zGKFq/Q+vXmPwYhrqAs
	 fvcpHOTlTWuFCITIwTPD1eA+QmRkVsi7Xvel9VSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC659F80558; Wed, 20 Sep 2023 10:36:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C94BF801F5;
	Wed, 20 Sep 2023 10:36:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68CC3F8025A; Wed, 20 Sep 2023 10:36:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E4C6F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 10:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E4C6F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=if5DCWGC
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38K7981o027268;
	Wed, 20 Sep 2023 03:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Jyhl8Y3oyKx0h61
	XhFzFxdqJ/5lcrhBpmC44A35uauo=; b=if5DCWGCmdPJwH1e6vLubzJLxpPLorJ
	HHEQqU8u2HKeJFlKUp/oGO9nDSTuSeyD/4xKrX2s3h0g21lnCeuGEVZZVFd8tZHB
	9Hv00LXIZG4LVMdWiS7wp3//4j+wWO6DL/p7vVCI5rEGIOF5oQGfFltKotmXhOrc
	Wg9j+2T+o4EQDVVUYmdJ2vx43YO9h1QeGQLFficEtxBhBoeYmITQpV4NlJ+2G/XU
	QvCDF2CZ62EAMKnW+gvt5nUxSguvnZvsIUnqf24xU30XfrFpWYyuYUlYvUxT+Ekx
	T5JCarzkVst47mj8rLeFw5wfFS+yv8E6sycBI3FuZ3IU9PA7oQaz7LQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t58shv53w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 03:36:49 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 20 Sep
 2023 09:36:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Wed, 20 Sep 2023 09:36:47 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C65882A1;
	Wed, 20 Sep 2023 08:36:47 +0000 (UTC)
Date: Wed, 20 Sep 2023 08:36:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 1/5] dt-bindings: ASoC: cirrus,cs42l43: Update a couple
 of default values
Message-ID: <20230920083647.GD103419@ediswmail.ad.cirrus.com>
References: <20230919103116.580305-1-ckeepax@opensource.cirrus.com>
 <20230919103116.580305-2-ckeepax@opensource.cirrus.com>
 <20230919192302.GA51154-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919192302.GA51154-robh@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Ah6d-omvyVXmVaEwUDIeH2zF7LmXg4xL
X-Proofpoint-ORIG-GUID: Ah6d-omvyVXmVaEwUDIeH2zF7LmXg4xL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EPLEBUTIU53ZJZFQGSCU53WRLBN6DCEY
X-Message-ID-Hash: EPLEBUTIU53ZJZFQGSCU53WRLBN6DCEY
X-MailFrom: prvs=46278edbb0=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPLEBUTIU53ZJZFQGSCU53WRLBN6DCEY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 19, 2023 at 02:23:02PM -0500, Rob Herring wrote:
> On Tue, Sep 19, 2023 at 11:31:12AM +0100, Charles Keepax wrote:
> > The bias sense is being enabled by default in the driver, and the
> > default detect time is being dropped slightly. Update the binding
> > document to match.
> 
> That's not really a compatible change. If I wrote my DT expecting bias 
> sense was disabled by default then the OS changes behavior, my 
> platform behavior would change. Maybe that doesn't matter here? IDK. 
> It's on you if this breaks anyone, so:
> 
> Acked-by: Rob Herring <robh@kernel.org>
> 

Yeah I appreciate that, but this should be fine, the part is very
very new. The only systems using the part are still in development.

Thanks,
Charles
