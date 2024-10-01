Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCAD98B96C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 12:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0837DF6;
	Tue,  1 Oct 2024 12:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0837DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727778136;
	bh=6lBAuAZ+WfbrGzFwi0A8aptFUIlMSvwUFTEhWRUPTq0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m6Pux8VT+Cq1w+VGjyPP4hCxjIVZCzOP3wm4vH8ebPsTYUqHaERA1QpUKdlOhpfph
	 BNtM4JiOCwmX8ECWRq/LZ3gMXE9B1Q3hHnp/UVvYDPaNwIiNMNgzgKorLxSmegW6hp
	 T2UD4bubfqWJ+bOkSvv9lknR//s40uSq2/vYHw4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 142DAF805D9; Tue,  1 Oct 2024 12:21:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5DA9F805D5;
	Tue,  1 Oct 2024 12:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 819C4F80536; Tue,  1 Oct 2024 12:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 739F0F80104
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 12:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 739F0F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YqpKvkbP
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4914Gmao010836;
	Tue, 1 Oct 2024 05:21:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6lBAuAZ+WfbrGzFwi0
	A8aptFUIlMSvwUFTEhWRUPTq0=; b=YqpKvkbP5I7e1T1eOW6ZU3Y5pGPkUtlu+x
	uI9dQgWX4ivRT0ffPsMvZweAMHBsC35niwb/C1bmEoINTGbMaR8hrpjUZ9+IH0B3
	vnrfyXfq/9t6BJ1C3PJU303hrB3fVTNkr8MvgUnRD/dUn2LUV+uWNepQ6h3XFihw
	OCDoTHN/2fSEAAonBYNfJONJAHSPzru28uwoSadYSotRH9lFIgc25dwC/i3HNW6P
	q5Zz6hMGClGlPOCDOXxt/xAe//QUOI7bJE6a2nFNNqpwLxdk7ninsDzghF+4liyC
	ooIuK2r9Syp03681WV+OYgu9Jc61VEcKmCqQusdrDQ4xt3L4Y5xA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41xf6xbk53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 05:21:40 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 11:21:38 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 1 Oct 2024 11:21:38 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id AAD08820244;
	Tue,  1 Oct 2024 10:21:38 +0000 (UTC)
Date: Tue, 1 Oct 2024 11:21:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf 2/2] sof-soundwire: Add sequence for
 controlling Mic Mute LED
Message-ID: <ZvvNMcoag9ed7imz@opensource.cirrus.com>
References: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
 <20240930134118.2640509-2-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240930134118.2640509-2-mstrozek@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: 2V003SOg_BITJObSVejXqVjbu3RZDZr6
X-Proofpoint-GUID: 2V003SOg_BITJObSVejXqVjbu3RZDZr6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2JB24TN5KOO7RJUCGSNOJVBNNPYOPVGZ
X-Message-ID-Hash: 2JB24TN5KOO7RJUCGSNOJVBNNPYOPVGZ
X-MailFrom: prvs=7004ca106a=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JB24TN5KOO7RJUCGSNOJVBNNPYOPVGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 30, 2024 at 02:41:18PM +0100, Maciej Strozek wrote:
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
