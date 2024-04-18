Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE18A9759
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 12:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F127AE69;
	Thu, 18 Apr 2024 12:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F127AE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713436013;
	bh=zsM/iB4mGCTl7LmWoqNU7yUQUj/3fGVzRHR12CI27Q8=;
	h=Subject:From:To:CC:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WTP4S7hKbLF/eRc8ADwmrynf/6sZ1QcLHyBwGMATXFLGW40481f3i26VKcBHd5poQ
	 RTNzFxaKd4udP/PQSM1m0PHBzT140ouAAxR2lm0yqBjxrXjlykhVgmwddHCNyIHK+3
	 zKCCBqprgEIx/ndf45e3BhlJ/a90vBTKU2zQcyZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF3CCF8013D; Thu, 18 Apr 2024 12:26:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A3DF8013D;
	Thu, 18 Apr 2024 12:26:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FF3EF8025A; Thu, 18 Apr 2024 12:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B2F3F8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 12:26:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B2F3F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=X5shHVWw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43I5jAL6019878;
	Thu, 18 Apr 2024 05:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:content-transfer-encoding:mime-version; s=
	PODMain02222019; bh=zsM/iB4mGCTl7LmWoqNU7yUQUj/3fGVzRHR12CI27Q8=; b=
	X5shHVWwAeiughpEBrf7vMHcxLA4+Xrlmf77SahR07OUhgQavXEa/cLUwm7R0uQL
	ZMqJRleqs9E4gSuonsHHAZTC+YjsJkPvCdv1Q7yn/xkFCA/J/xvVw6mVEZktUj+E
	/04Xo8XwcuVfZ2bKAGODywHY1kDL7pEBXQT+yZ7tOgI8NderakALyuBgpQBolhfG
	6FzXxKDBin+B/+v8Tz/MB73Gdr3EyvH4/V8BO+tGKtCWc/7cym14fKYl0kP+7eKH
	g0V/hAssRjKuHeAeyBSbpbfkv+NjjqGfQOcF14Q4GLRBur3/FnX5KDp1SPVxWybH
	cHzc93NeRapiU98LO6Z3zg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhvmhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 05:26:08 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Apr
 2024 11:26:07 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 18 Apr 2024 11:26:07 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2E77282024A;
	Thu, 18 Apr 2024 10:26:07 +0000 (UTC)
Message-ID: 
 <d2cd2a02c05da332ed839eb735c7bbbfea84c400.camel@opensource.cirrus.com>
Subject: Re: [PATCH] spi: cs42l43: Correct name of ACPI property
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Date: Thu, 18 Apr 2024 10:26:07 +0000
In-Reply-To: <ZiD0N24MpYX7uj1U@ediswmail9.ad.cirrus.com>
References: <20240418094206.1323489-1-mstrozek@opensource.cirrus.com>
	 <ZiD0N24MpYX7uj1U@ediswmail9.ad.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: dWqPW6ZcixiRIt3gBsfrNG8ADh5TPWjF
X-Proofpoint-GUID: dWqPW6ZcixiRIt3gBsfrNG8ADh5TPWjF
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MF7OHMAS2WHK7CBTUKEUDHD7UODC3FBJ
X-Message-ID-Hash: MF7OHMAS2WHK7CBTUKEUDHD7UODC3FBJ
X-MailFrom: prvs=183834ae71=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MF7OHMAS2WHK7CBTUKEUDHD7UODC3FBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W=C2=A0dniu czw, 18.04.2024 o=C2=A0godzinie 10=E2=88=B621=E2=80=89+0000, u=
=C5=BCytkownik Charles
Keepax napisa=C5=82:
> On Thu, Apr 18, 2024 at 10:42:06AM +0100, Maciej Strozek wrote:
> > Fixes: 1f05252a3a95 ("Add bridged amplifiers to cs42l43")
>=20
> Sorry actually are you sure this commit ID is right, I don't
> think it matches the one in Mark's tree?

You are right, let me correct that in v2

Regards,
Maciej
