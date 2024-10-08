Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E670199426B
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 10:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B27852;
	Tue,  8 Oct 2024 10:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B27852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728377086;
	bh=ddWBz5ZhVjiY40fdPhWGfNAhNzQv5dG5PFpyNFR7T5I=;
	h=Subject:From:To:CC:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=icwp/P4eSX3690HkdJwm9YoBYNVLJjOGDJy0keSN8laBLCiNLev+Wp4A1F+vlB/FL
	 +OFyb+wPrM6VdIegGRuhC79XvMIdBOYzf5KVr1aK2JbU1Hxb7wICCvtjgMxtY5W+JN
	 fIDGpU/cQvpGnbXM4CdBUQTXFfmoIKGJH1M72AmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30099F805AD; Tue,  8 Oct 2024 10:44:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 457E0F805B1;
	Tue,  8 Oct 2024 10:44:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC08F80528; Tue,  8 Oct 2024 10:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5223F800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 10:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5223F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eb1KJZsj
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4986Oj9Y011883;
	Tue, 8 Oct 2024 03:44:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ddWBz5ZhVjiY40fdPhWGfNAhNzQv5dG5PFpyNFR7T5I=; b=
	eb1KJZsjOQ+hWaAF9GJkqiBqCiqJ2dEbiWN2InslUiXQfL+/j0oPA3O3iMn77v3A
	eu23yEskrtnOjWaEEAIr9GMJiE5lsLmO9sJtHpxmM1ox3q5G+Wo8uOB5vlXCZWFk
	h1+rlP9M/S2IGvEpPLR1gINWX8YzAFTXm6UwM5jfrWmuNsdte32Sg2Kl5IlYc2dh
	wEIkGeXvK8Dc0NjefB22GFDVofqv8eHnMJiUppC7LJz3hMpQ7OCXB/fj7gMJphDE
	TyJlrpzsCe/0j5HKHR+kHTnlyR7j4HsSQmNVfX6oBT/3Lee7NX03TpqaZukHSoK5
	8GFg5qik4h6lAhyCj1LIfQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4231vhu8je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 03:44:04 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 09:44:02 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 8 Oct 2024 09:44:02 +0100
Received: from ediswws03.ad.cirrus.com (ediswws03.ad.cirrus.com
 [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 98B68820248;
	Tue,  8 Oct 2024 08:44:02 +0000 (UTC)
Message-ID: 
 <e15178a1eaee371a32ce4d2c720eeb6a22e3f51c.camel@opensource.cirrus.com>
Subject: Re: [PATCH alsa-ucm-conf v2 2/2] sof-soundwire: Add sequence for
 controlling Mic Mute LED
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: <perex@perex.cz>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Date: Tue, 8 Oct 2024 08:44:02 +0000
In-Reply-To: <20241002142947.4015912-2-mstrozek@opensource.cirrus.com>
References: <20241002142947.4015912-1-mstrozek@opensource.cirrus.com>
	 <20241002142947.4015912-2-mstrozek@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Proofpoint-GUID: qK05ebFlFXlYgkzPrDKWNT9OchN_bqJA
X-Proofpoint-ORIG-GUID: qK05ebFlFXlYgkzPrDKWNT9OchN_bqJA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3PNXN2ERLF64PQVSOMBX6HPPTKSH2C7R
X-Message-ID-Hash: 3PNXN2ERLF64PQVSOMBX6HPPTKSH2C7R
X-MailFrom: prvs=701117332b=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PNXN2ERLF64PQVSOMBX6HPPTKSH2C7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

W=C2=A0dniu =C5=9Bro, 02.10.2024 o=C2=A0godzinie 15=E2=88=B629=E2=80=89+010=
0, u=C5=BCytkownik Maciej
Strozek napisa=C5=82:
>=20
> +FixedBootSequence [
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec "-/sbin/modprobe snd_ctl=
_led"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysw "-/class/sound/ctl-
> led/mic/card${CardNumber}/attach:cs42l43 Decimator 3 Switch"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysw "-/class/sound/ctl-
> led/mic/card${CardNumber}/attach:cs42l43 Decimator 4 Switch"
> +]
> --
> 2.39.5
>=20

Please ignore this version, will send v3 with added headset mic

--=20
Regards,
Maciej
