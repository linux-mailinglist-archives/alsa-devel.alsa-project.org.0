Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D243797CC9C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2024 18:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ADB1B71;
	Thu, 19 Sep 2024 18:45:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ADB1B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726764314;
	bh=fGLwGNvhSyUN4tqy0B8fOiB+Akxq1PKmNmdksMZgeAk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jol8580S40Rh8flRu9uOI27D1DRGIjbLb/RQjoolNr7KQjj3HabFGhq+Nr446ZW63
	 fp+1R7B82IPEZDDslk3HrgzBgf7+dqusWyiqZQu/4q9AQ/EWiwj9EuN3Bvystt1Erj
	 FlYD8/qHmESASIvZARZ/bJNqkyqA1tp5wO0y3dZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D006F805AF; Thu, 19 Sep 2024 18:44:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17AFAF805A1;
	Thu, 19 Sep 2024 18:44:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7A4FF8020D; Thu, 19 Sep 2024 18:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C08BEF80107
	for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2024 18:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C08BEF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dUQnOKhY
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 48J5eFFQ010089;
	Thu, 19 Sep 2024 11:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Y8HDrDZcq5CrBJHhSm
	2kcFKekp/6O3KZeOV0pu87RQI=; b=dUQnOKhYgtM2aqZdY1KwFIfdyJvnW8XfP9
	vL7IeCwN9v2wPpYqd0FsvQ+kVXJ8KHeb6OOTLkeSmYpgG+JwvuwECi6M0Ybu71Lb
	qBWf62hkY1DpMVHJLgUXhgAsKPk0bg5GP0mE0vx3y8IWjt5eruAYO96XiRevANrH
	mMt6e3UGX9NdsmnUqByXftYlXIxNAW+Ad1yz6rjetABzJlp6n3maEJE529/y/S06
	75XbFS3LS4G+rrT2Wdbd63DACjp4TJJCX93/Wp7f7P/aiuo4yeHngxztel/ozwiA
	46xP2BVG9TZEXomF2drPSUojUXjFHg5NZHMF4CSOoEvHwPG4EDSA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41n6wjp896-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 11:44:33 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 17:44:31 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 19 Sep 2024 17:44:31 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id B322A820248;
	Thu, 19 Sep 2024 16:44:31 +0000 (UTC)
Date: Thu, 19 Sep 2024 17:44:30 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
CC: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs35l45: Corrects cs35l45_get_clk_freq_id function
 data type
Message-ID: <ZuxU7tjueKOkE+d1@opensource.cirrus.com>
References: <20240919151654.197337-1-rriveram@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240919151654.197337-1-rriveram@opensource.cirrus.com>
X-Proofpoint-GUID: URMPacK92kHMxA_bqBMt9HDVXFD1CHyH
X-Proofpoint-ORIG-GUID: URMPacK92kHMxA_bqBMt9HDVXFD1CHyH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NNWUUZVST4P624DI3BBHBGLGRSDXARW7
X-Message-ID-Hash: NNWUUZVST4P624DI3BBHBGLGRSDXARW7
X-MailFrom: prvs=6992485028=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNWUUZVST4P624DI3BBHBGLGRSDXARW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 19, 2024 at 03:16:52PM +0000, Ricardo Rivera-Matos wrote:
> Changes cs35l45_get_clk_freq_id() function data type from unsigned int
> to int. This function is returns a positive index value if successful
> or a negative error code if unsuccessful.
> 
> Functionally there should be no difference as long as the unsigned int
> return is interpreted as an int, however it should be corrected for
> readability.
> 
> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
