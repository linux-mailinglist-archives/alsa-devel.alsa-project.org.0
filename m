Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8AC98BA1E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 12:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CAC0950;
	Tue,  1 Oct 2024 12:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CAC0950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727779967;
	bh=l15OJaO7d8uLTv/eIYExf6EaBWBetMphAWDSVSJGy8Y=;
	h=Subject:From:To:CC:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fzgC+kMQDUlR+QVYwrzf7bb8mntJp0TLo9YJOUwS4Msl2DLkhm+AF9Vxzz535R/8O
	 cmi0IsxZ30PuBuz3cNht56xmR2JRNpIaeOYaoQu3Btt39ujoOpL8wwPOkyYlPjvtKF
	 ywl2r2O8U+tPDeYG9CgpRhBWJpLZMcNHNWZcjniQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E02BF805A8; Tue,  1 Oct 2024 12:52:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D677F805B0;
	Tue,  1 Oct 2024 12:52:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CDA9F80517; Tue,  1 Oct 2024 12:52:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EDC39F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 12:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDC39F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Jh3bI9wI
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4914LGQH016993;
	Tue, 1 Oct 2024 05:52:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=l15OJaO7d8uLTv/eIYExf6EaBWBetMphAWDSVSJGy8Y=; b=
	Jh3bI9wIx01UA64qYHVuQRJQ5y/IKjCTzsUquV1L9pdisEwEq6QCf4BuPs29tS0h
	0kektofLSYPFE4yv5zdL7aNs+KejTNd69tncoyp6l5fpMovnnCD/AXRi3onOHDtt
	LJdvYCb2DtPWiWF2K+KebNH54q3cjtG3EUJ67p/IB8yET5j7umzVEkRtlAXkEf5c
	dWtyroXaqc4d+vlmx8nppqFcBELxPcpM20FoZvDgUtaC+z1UPl1XUQeXzgXZgMGY
	086BznGyOo1KcqYHdEtqa/oUJvHmE/4ObK3uSVozPa3E2SgSBZYDvNuY2LhTj+EI
	g/uL7V6qYz8b6kBJ1+aqyw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41xf6xbktp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 05:52:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 11:51:58 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 1 Oct 2024 11:51:58 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8F46D820244;
	Tue,  1 Oct 2024 10:51:58 +0000 (UTC)
Message-ID: 
 <8e8afecd15264e14d72bfa569b8ae4e83552bc32.camel@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf 1/2] sof-soundwire: Change mapped control
 names to make them unique
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Date: Tue, 1 Oct 2024 10:51:58 +0000
In-Reply-To: <b113be76-2c10-4739-a34f-4487ce129da7@perex.cz>
References: <20240930134118.2640509-1-mstrozek@opensource.cirrus.com>
	 <b113be76-2c10-4739-a34f-4487ce129da7@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: QksoES7UFdwZjngM0vJEq-VX0Qk0sYgf
X-Proofpoint-GUID: QksoES7UFdwZjngM0vJEq-VX0Qk0sYgf
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: N5TRLFVQVFLZLUFPEUCKPCWNKCDBADBK
X-Message-ID-Hash: N5TRLFVQVFLZLUFPEUCKPCWNKCDBADBK
X-MailFrom: prvs=70044ac006=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5TRLFVQVFLZLUFPEUCKPCWNKCDBADBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W=C2=A0dniu wto, 01.10.2024 o=C2=A0godzinie 12=E2=88=B638=E2=80=89+0200, u=
=C5=BCytkownik Jaroslav
Kysela napisa=C5=82:
>=20
> > =C2=A0 LibraryConfig.remap.Config {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ctl.default.map {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0"name=3D'Speaker Digital Switch'" {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0"name=3D'Speaker Combined Switch'" {
>=20
> Combined? This string is for users not for developers. Please, find a
> better=20
> name describing the purpose of the control from the the user view.
> The old=20
> name is fine IMHO.
>=20
Unfortunately it can't be "Speaker Digital", what do you think of
"Speaker Stereo", or maybe "Speaker Control"? "Speaker Master"?
--=20
Regards,
Maciej
