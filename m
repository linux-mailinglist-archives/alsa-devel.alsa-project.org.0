Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486E57F61C0
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:41:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9435EB0;
	Thu, 23 Nov 2023 15:41:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9435EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700750491;
	bh=GaZao+pXNVMeKm4nmdU1f6UY3xSuNUfGOg8noP3RuBU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZjSg/TBJHS1CIaHTD46EgWZHQOUKWTGStADlCr+J9+WWKMEaBAF+Fpg5BGBp7GE9s
	 CoLTO1T9O4mVYdiHQwCvJsdbC0WJvQJDndifTwEGkbVYgsEZHuS2f+QHHgKn7nA0Y5
	 rStOMrcShg4X2OjUEvcHFrs3927ttmMvTMu+4MB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6592F80659; Thu, 23 Nov 2023 15:39:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79707F80551;
	Thu, 23 Nov 2023 15:39:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C70F2F802E8; Thu, 23 Nov 2023 11:46:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 459E4F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 459E4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=A8fvq++E
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AN7uxSu016943;
	Thu, 23 Nov 2023 04:46:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=hMYUXjmYOX4C8Ch
	mlTHTAFHv5/5PVyWHDsdSnhGV0MM=; b=A8fvq++EiFcuqSrT8Hm+l18z+9O9LJL
	xvZDkaAhkuEepgqWcpfeEU+vEexoHgYWZswt12Mv++Q/5EgnnexP2pJ2C/VPMOtV
	LrKxoCsnrLFzZPF9wKydhdAZU6J7pRkKzWQ89csRiDx0Qjn3ZWTGFAKrUg/9ph+V
	mKr813SKpkoBxuUhDCTtzH++GfSyu7uAWcAIbI0Gcp5pUyXy7ubgPu/xGiPJXmik
	3zEMWjdCKb4G06hb92+kAcAziVP6YqrFi+Cd8RohnhIX7bP5FCQ65y8aZCliVrVa
	O/2CVvK3zcSKMYGTlhbcoc2QsHDt3oVZoBdzRtoC26fmHW8tB60j/zQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj2dms8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 04:46:26 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 23 Nov
 2023 10:46:24 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Thu, 23 Nov 2023 10:46:24 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0DA403581;
	Thu, 23 Nov 2023 10:46:24 +0000 (UTC)
Date: Thu, 23 Nov 2023 10:46:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <20231123104624.GO32655@ediswmail.ad.cirrus.com>
References: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: A-Q1NA32qUHtecUx4wtlv6a-VJjIrG45
X-Proofpoint-GUID: A-Q1NA32qUHtecUx4wtlv6a-VJjIrG45
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=6691092e0a=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: ZBUJIDDIFT5MPASOATRWBN563K3BC3PF
X-Message-ID-Hash: ZBUJIDDIFT5MPASOATRWBN563K3BC3PF
X-Mailman-Approved-At: Thu, 23 Nov 2023 14:39:41 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBUJIDDIFT5MPASOATRWBN563K3BC3PF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Nov 23, 2023 at 09:06:58AM +0000, Maciej Strozek wrote:
> Add a polling mechanism that will keep the driver operational even in
> absence of physical IRQ connection. If IRQ line is detected, the driver
> will continue working as usual, in case of missing IRQ line it will
> fallback to the polling mechanism introduced in this change.
> This will support users which choose not to connect an IRQ line as it
> is not critical to part's operation.
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---

Sorry hang on this doesn't apply to Mark's tree, will need a v6.

Thanks,
Charles
