Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC3368EC4C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 11:04:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D414A4D;
	Wed,  8 Feb 2023 11:03:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D414A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675850687;
	bh=RpAmc5CXzCxPXWjKhuSY3yGyiR7WN0k8Mq4i/ct2LT0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S97Hupr2h0knEo48+SqfcMUkNzOdC5ILbdE0zAjTYaT52mN0ksNuIwKUFm252elJF
	 9XsCrP3C/VhhGkX4JYFtqSRap5op0pr9ZSZ6JbDPiQDOmjzd35UqggI074Cwxngrxo
	 bWE8kOe4gw4OmBeXYAPMxqprEYlWBWObkIZH6wSA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50729F80095;
	Wed,  8 Feb 2023 11:03:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F920F804CC; Wed,  8 Feb 2023 11:03:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7B4CF80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 11:03:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B4CF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=STUJB066
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3187LPHk011275;
	Wed, 8 Feb 2023 04:03:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=orPW6Tl0jOf9S97zbcY2T9FCO8LqYdndxqeT8o3kDNM=;
 b=STUJB066a2wfI44JZ73/nECnTl+bwj87qsy1/uy2EXjJd5Q5ONMlLqjYphFt+kF2LHBL
 g3ELvrui8HRmbr9vp+Lh4i972hrQ8zySLJyUG9+g1kqDrzFn/AwCBv+hawNOixJ9M6Zy
 R79gk8BcVt193hl+WyzUHbBTmvWscWO974KHWznbJP5SRVduH2bYitQ09n2XZkYaxvxO
 2u8X0Ku1jhSuU22Obih6Mbw5e1Wniddqfe9GFWeozAdUae0pb78Gh6oV6hTOnpACF3jj
 8Ia9wDcYRM6SvatWPYZ2HDsLxu3x/xdCvcRLEfuQv9ZK3OIsrhTUx0lLtPZLbzEFbMWq GQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nhnn7wsp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 04:03:38 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 8 Feb
 2023 04:03:36 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Wed, 8 Feb 2023 04:03:36 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4267BB1A;
	Wed,  8 Feb 2023 10:03:36 +0000 (UTC)
Date: Wed, 8 Feb 2023 10:03:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Subject: Re: [PATCH v2 2/5] ASoC: cs35l41: Refactor error release code
Message-ID: <20230208100336.GE36097@ediswmail.ad.cirrus.com>
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
 <20230207162526.1024286-3-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230207162526.1024286-3-lucas.tanure@collabora.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: TVxCZn1sGUXj3iK7Cs_MDYb5k1X8hZ9w
X-Proofpoint-ORIG-GUID: TVxCZn1sGUXj3iK7Cs_MDYb5k1X8hZ9w
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BF6SVEQIHTYYLFMBLSIKLEZGI2ITMETY
X-Message-ID-Hash: BF6SVEQIHTYYLFMBLSIKLEZGI2ITMETY
X-MailFrom: prvs=74039f8db2=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BF6SVEQIHTYYLFMBLSIKLEZGI2ITMETY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 07, 2023 at 04:25:23PM +0000, Lucas Tanure wrote:
> Add cs35l41_error_release function to handle
> error release sequences.
> 
> Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
