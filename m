Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884E90D55E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:36:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA5E845;
	Tue, 18 Jun 2024 16:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA5E845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718721373;
	bh=bJe8JzhPEEkXJ5ptIUtmGtaGPiiJiEhyUtbBuK49e5I=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JI2GdWWP+vy2ow7mkFGW8H5lWULmIiNI31nfa/IVTusDLGXkhG1FEuYIos2vRaEmb
	 IvgnXN58qcMXquRZS7uGGZNSf9prOok9+uCypB96YgPRzlaNDbuRxwtMKos6ZShDv2
	 WElbdhxGPjl1Uek3Ix+WJo/EKPcGnogUEzzofFNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD572F805CB; Tue, 18 Jun 2024 16:35:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F21D8F804D6;
	Tue, 18 Jun 2024 16:35:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49CFCF80236; Tue, 18 Jun 2024 16:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6377F80269
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6377F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ioXuKhAe
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45I62OUg026682;
	Tue, 18 Jun 2024 07:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=bJe8JzhPEEkXJ5ptIUtmGtaGPiiJiEhyUtbBuK49e5I=; b=
	ioXuKhAeMmmzgRbgc3z+824NmAt1MkOoxzkDI9ANYoPLPKVLHpfQO8k/oaG4NBeQ
	gn/5/cSHbnmtSTDlKLI+akGtAWg8WrYBw8vZDQmZLrE6HhAwN6jL5gaPmJ4KL7v9
	xCW4m79EahunCC929G4UyNdcM6PnKgvyRpmshfpuR17IxfKEox85hfbB8JFYXV85
	fCEuiqkuJMHCJ6mDFN3WHsk0nU12ovk7lDkdDvE7krUmkqhxVCiUxzabGgtkzxN6
	PjgbJTbfkpo+CICv8EpPJt3RxPT6Zz1MXO/7Ic1G0lwvHHEJYtcEV0YNysrPotAb
	QFWYy5bGmKAqWlDBllR7eA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cju2u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:59:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 13:59:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 13:59:57 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id DC0C6820248;
	Tue, 18 Jun 2024 12:59:56 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240618125325.61173-1-simont@opensource.cirrus.com>
In-Reply-To: <20240618125325.61173-1-simont@opensource.cirrus.com>
Subject: RE: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the
 background
Date: Tue, 18 Jun 2024 13:59:56 +0100
Message-ID: <000b01dac17f$6b84e5d0$428eb170$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQMEbY4a5v39dJc50MgieJ5kS4EI6K96Incw
X-Proofpoint-GUID: YLFvuopG_geV1876tYYya2jGB8yS-az5
X-Proofpoint-ORIG-GUID: YLFvuopG_geV1876tYYya2jGB8yS-az5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: Y5J5K7CS7BWQ6WBIORZ4UFWPUV3IXA5V
X-Message-ID-Hash: Y5J5K7CS7BWQ6WBIORZ4UFWPUV3IXA5V
X-MailFrom: prvs=3899536243=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5J5K7CS7BWQ6WBIORZ4UFWPUV3IXA5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 18, 2024 at 1:53=E2=80=AFPM Simon Trimmer
> Subject: [PATCH] ALSA: hda: cs35l56: Perform firmware download in the =
background
>=20
> It is possible that during system boot when there multiple devices
> attempting simultaneous initialization on a slow control bus the
> download of firmware and tuning data may take a user perceivable =
amount
> of time (a slow I2C bus with 4 amps this work could take over 2
> seconds).
>=20
> Adopt a pattern used in the ASoC driver and perform this activity in a
> background thread so that interactive performance is not impaired. The
> system_long_wq is a parallel workqueue and driver instances will =
perform
> their firmware downloads in parallel to make best use of available bus
> bandwidth.
>=20
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>

Sorry Takashi this should have had v2 in the Subject - when fixing up v1 =
we
found all the things that triggered the series of hda_component changes
so it fell off my mental queue as something I'd published before.

I'll do a re-send with that corrected for Lore.

-Simon

