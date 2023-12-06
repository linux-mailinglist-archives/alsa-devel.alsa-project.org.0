Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64726807351
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 16:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE6A82B;
	Wed,  6 Dec 2023 16:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE6A82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701875151;
	bh=vds4NpZ9l2qNRrwv1PMAnmP0wQ2ipCZfeaAblyNbF4Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DA7/worqi9ZetvDumnvSZxWqLGYXSMm57f4KypIAYJze9OspnnuUyTAfou3vwWt2e
	 0BjIpjo1YA/lMj9r7sD04qHNihaK6RH6nk1VXuDt4nPVsxAQuH5imlhjoaUCRd6KR8
	 L10zOystoGRyoPg1HnLub1QopecA7FIG2SoKo3rk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD8D1F802E8; Wed,  6 Dec 2023 16:05:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5284F80571;
	Wed,  6 Dec 2023 16:05:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B7DF8024E; Wed,  6 Dec 2023 16:05:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC6E6F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 16:05:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC6E6F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RNGAjyzC
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B67KtUH002302;
	Wed, 6 Dec 2023 09:05:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=M25hb4z56ID3PuW
	wzYhjE+nqxLwvZ6MyJKwq/0x9NQY=; b=RNGAjyzCXSOm3whXJfd8jDqknsLsbbt
	JIed6dAo0jC5KAIwGezHBXJmVX7/QDJAwJ00HSKeCM+NVxdxjUJPRgcOVju+uv7x
	rKo20E76Yxq6JMIKVQdIiB1mzJLGZdPOkOU31JGGftpFKU7jdtwIYIpGb8kgMAFF
	pJrMGgJxtT4N7Amjpa6J+yqVhLZ1YNZYHCXrFETFqQMb07ikoYgEMKFeW9Iezkd0
	Ibc4eOCierQIwbGQoNdrwqFCNpYVISdMIZ/BBnYRqSfz4fhlTG7RFYEsv2UUjhJe
	CuEQSj1ea1likHy9Kk5rv5sY8aBqJwUf7Tsii7GE0KoC4cfwg+I5rMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1w8um7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 09:05:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 15:05:17 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 6 Dec 2023 15:05:17 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3155C11D1;
	Wed,  6 Dec 2023 15:05:17 +0000 (UTC)
Date: Wed, 6 Dec 2023 15:05:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <pierre-louis.bossart@linux.intel.com>, <bard.liao@intel.com>,
        <mengdong.lin@intel.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH alsa-ucm-conf v2 2/2] sof-soundwire: Add basic support
 for a 4x cs35l56 configuration
Message-ID: <20231206150517.GK14858@ediswmail.ad.cirrus.com>
References: <20231206140547.1344041-1-ckeepax@opensource.cirrus.com>
 <20231206140547.1344041-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206140547.1344041-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 6pnQ7LKPfZLOFl3tF1CvgSAQJS_GlTbF
X-Proofpoint-ORIG-GUID: 6pnQ7LKPfZLOFl3tF1CvgSAQJS_GlTbF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: FJNFKHYYTPDEYGXDEX5NCYFEMEGBWYPH
X-Message-ID-Hash: FJNFKHYYTPDEYGXDEX5NCYFEMEGBWYPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJNFKHYYTPDEYGXDEX5NCYFEMEGBWYPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 06, 2023 at 02:05:47PM +0000, Charles Keepax wrote:
> +	False {
> +		If.simplespeaker {

Ooops this name is left over from when I had the if the other way
around, so is a bit confusing. I will leave it a couple days for
any comments then fixup if we are happy.

Thanks,
Charles
