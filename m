Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054687E7C7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 11:56:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59C02BA9;
	Mon, 18 Mar 2024 11:56:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59C02BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710759384;
	bh=ZUhNoBxh3J6cWXi5e/gUPiqVtXXbt/Lv3dv2304O83Q=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SKfRhdQiNwe0ckqoWAMm/PCCFOwN1z5Jr2ISio1rYVGQhOQB8BQCaTUunm6UairT7
	 QlVUHY5Gbo9V0+bK0vROLH5Lj7+qp0/Fdvi5dFYp927QtAnSeU7piRM2FGiaI7a8GT
	 JM9zDZ/VsbPHJaDCJu23pxkcrOkzjCH5w6ZBbQjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA1EBF805AF; Mon, 18 Mar 2024 11:55:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DA1CF80589;
	Mon, 18 Mar 2024 11:55:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80769F80564; Mon, 18 Mar 2024 11:55:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F42BF80570
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 11:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F42BF80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LlYDmlvx
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42IArGAx022496;
	Mon, 18 Mar 2024 05:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=j/P3jhkFcI/GSjQOO7udR4a7hxdYtOwuw+ZHKLCwg/o=; b=
	LlYDmlvxx3E7ipG1y8n+Plnyb5EcaYaIGIlbnFFiLilTT/xMnMYL6ZWhC6oCfKPV
	VtVXe9JLHFyEE3wQFI5joq8O165r3FmU/4uy0DYRKukk3CzR3QX9wWwVlRiwjSDK
	zD4uZjOR061G3aajvJsa/Go3rr2KW/QficPkP6mimzcA2eDgtywjOeGaA+7VvNz7
	O3M4lzss9pAy6s3OD/i70s9N5HdSWqXzpJnV/VNPLIwpJ36yxp1OHL7mUTzK44BH
	CaExhs+9ozNsNkQg93AvCR14SHk3le8UEQXw49XMbml8bw/u2X1BUeXIvisCGa7J
	6rw32cLLtMwzvBEuyhUOFA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ww8txsuup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:55:28 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 18 Mar
 2024 10:55:25 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 18 Mar 2024 10:55:25 +0000
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.64.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 29BE5820244;
	Mon, 18 Mar 2024 10:55:25 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Anthony I Gilea' <i@cpp.in>,
        'James Schulman'
	<james.schulman@cirrus.com>,
        'David Rhodes' <david.rhodes@cirrus.com>,
        'Richard Fitzgerald' <rf@opensource.cirrus.com>,
        'Jaroslav Kysela'
	<perex@perex.cz>, 'Takashi Iwai' <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <570989e3-299f-4617-adde-b6b8d1e06277@cpp.in>
In-Reply-To: <570989e3-299f-4617-adde-b6b8d1e06277@cpp.in>
Subject: RE: [PATCH] ALSA: hda: cs35l41: Support HP Spectre x360 14 eu0000
Date: Mon, 18 Mar 2024 10:55:25 +0000
Message-ID: <000901da7922$c81acee0$58506ca0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGLr+NaMOldL6AUGiyN2yXXigp0abHa4c7g
Content-Language: en-gb
X-Proofpoint-GUID: F0-X8bZTpG4RpATfR3l8G2oHhUH0vcm6
X-Proofpoint-ORIG-GUID: F0-X8bZTpG4RpATfR3l8G2oHhUH0vcm6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5J6MJODSHONISB5HQJ4VZ3MRXVMWAX7H
X-Message-ID-Hash: 5J6MJODSHONISB5HQJ4VZ3MRXVMWAX7H
X-MailFrom: prvs=08079a9db2=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5J6MJODSHONISB5HQJ4VZ3MRXVMWAX7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Support for this laptop was previously added in patch:
33e5e648e631 ("ALSA: hda: cs35l41: Support additional HP Envy Models")

Is your branch out of date?

Thanks,
Stefan Binding

> -----Original Message-----
> From: Anthony I Gilea <i@cpp.in>
> Sent: Sunday, March 17, 2024 2:05 AM
> To: James Schulman <james.schulman@cirrus.com>; David Rhodes
> <david.rhodes@cirrus.com>; Richard Fitzgerald
> <rf@opensource.cirrus.com>; Jaroslav Kysela <perex@perex.cz>; Takashi
> Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org; patches@opensource.cirrus.com; linux-
> sound@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] ALSA: hda: cs35l41: Support HP Spectre x360 14 eu0000
>=20
> The new HP Spectre x360 has _DSD for CS35L41 amps in ACPI but
> reset-gpios and spk-id-gpios are merged into single Package of size 4 =
so
> _DSD parser fails to parse it.
>=20
> Overwrite broken _DSD with the correct configuration.
>=20
> Signed-off-by: Anthony I Gilea <i@cpp.in>
> ---
>   sound/pci/hda/cs35l41_hda_property.c | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --ruNp a/sound/pci/hda/cs35l41_hda_property.c
> b/sound/pci/hda/cs35l41_hda_property.c
>=20
> --- a/sound/pci/hda/cs35l41_hda_property.c	2024-03-10
> 23:38:09.000000000 +0300
> +++ b/sound/pci/hda/cs35l41_hda_property.c	2024-03-14
> 18:22:01.887566917 +0300
> @@ -64,6 +64,7 @@ static const struct cs35l41_config cs35l
>   	{ "103C8BE5", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4100, 24 },
>   	{ "103C8BE6", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4100, 24 },
>   	{ "103C8B3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4100, 24 },
> +	{ "103C8C15", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4100, 24 },
>   	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 1, 2, 0, 1000, 4500, 24 },
>   	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4500, 24 },
>   	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4500, 24 },
> @@ -405,6 +406,7 @@ static const struct cs35l41_prop_model c
>   	{ "CSC3551", "103C8BE5", generic_dsd_config },
>   	{ "CSC3551", "103C8BE6", generic_dsd_config },
>   	{ "CSC3551", "103C8B3A", generic_dsd_config },
> +	{ "CSC3551", "103C8C15", generic_dsd_config },
>   	{ "CSC3551", "104312AF", generic_dsd_config },
>   	{ "CSC3551", "10431433", generic_dsd_config },
>   	{ "CSC3551", "10431463", generic_dsd_config },

