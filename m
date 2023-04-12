Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 793406DF00E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 11:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0FF110B5;
	Wed, 12 Apr 2023 11:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0FF110B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681290662;
	bh=8cTgKx/R/Qdi00COX4uDNL2LK48n3bKpPRqlANnC6kw=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=BlQtRUF/ENjv+TOzpr1wX9axUftOj9IojVVTR0WjjYA7R2yyDazY9MwFIH+O5yvGp
	 k2Ow6LA7qqi/81XRln0h4Uo1tmuxhjPI68Uoj9T1fRly47KxjcBP3I+Ljc1A5YIrR1
	 HYYS1Upe4FeZr6JRv9OOXZpBy0i+M0Q/XpdFrfyA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2400BF800E5;
	Wed, 12 Apr 2023 11:10:11 +0200 (CEST)
Date: Wed, 12 Apr 2023 09:09:56 +0000
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: cs4271: flat regcache, trivial simplifications
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
 <20230410223902.2321834-3-alexander.sverdlin@gmail.com>
In-Reply-To: <20230410223902.2321834-3-alexander.sverdlin@gmail.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUCG6RQ7ZOJPS3X4DGS42RIPROXWXXCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168129060942.26.2120154679508355729@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A63A5F8032B; Wed, 12 Apr 2023 11:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AAEAF80100
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 11:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AAEAF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eOSmWuQJ
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33C5sGqE023356;
	Wed, 12 Apr 2023 04:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=UigUkNR6881wrnlvVj1g9hFPk4PfO8ZLIjY/sdfTSMs=;
 b=eOSmWuQJX8NCioqB0DvL2oVQhd5/41euMJo8E9Xoj8oOBLlgNnwjUqfmgdWS4agsU+zl
 6Ym7N5DASTA1H7GZ5re4fQpJSsM9/LKkjAVGGqkJvB8/0UZOWnuTIC2I6vIvrkrwXiXR
 1iyyM7oFWHWXS6mgokgZdcelIFlxDZxXnjqZ4MtukxU2il+5BawDWTnPUkNRcmN2WhRu
 SHiYXK5rJooEyO1XCW2HJ1XmedCMIkPinH2HstqfzSNByijMhUZ/3W08MfU9jqCs1kQV
 qgM54ungHLlLR5mD7MyJdggf4kKZB5pLl317dRYxgFH72OMMVv6mmQ59ppcuE6odUbLJ EQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pu4pq6jjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Apr 2023 04:09:58 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 12 Apr
 2023 04:09:57 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Wed, 12 Apr 2023 04:09:57 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 05C7C45;
	Wed, 12 Apr 2023 09:09:57 +0000 (UTC)
Date: Wed, 12 Apr 2023 09:09:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: cs4271: flat regcache, trivial simplifications
Message-ID: <20230412090956.GY68926@ediswmail.ad.cirrus.com>
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
 <20230410223902.2321834-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230410223902.2321834-3-alexander.sverdlin@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: udVNQjJh6RmxTrSwzNkVSE-TvB0h1R_8
X-Proofpoint-ORIG-GUID: udVNQjJh6RmxTrSwzNkVSE-TvB0h1R_8
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BUCG6RQ7ZOJPS3X4DGS42RIPROXWXXCD
X-Message-ID-Hash: BUCG6RQ7ZOJPS3X4DGS42RIPROXWXXCD
X-MailFrom: prvs=9466a8b822=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUCG6RQ7ZOJPS3X4DGS42RIPROXWXXCD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 11, 2023 at 12:39:01AM +0200, Alexander Sverdlin wrote:
> - Switch to REGCACHE_FLAT, the whole overhead of RBTREE is not worth it
>   with non sparse register set in the address range 1..7.
> - Move register width to central location
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
