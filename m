Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A563797D00
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 21:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849A0A4D;
	Thu,  7 Sep 2023 21:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849A0A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694116242;
	bh=Db0NqmTGuh52sxm5Jkky1R2+22W8xh7Z98LTGOLaCj8=;
	h=Subject:From:In-Reply-To:Date:CC:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rpsZnSG54Qd2fAprvX+KYjYQEkYTf+9WLoVPO365Rbu7sd33LIucvMUzrmaCpyIF0
	 bSNQcOwkUOfcZU7+sO8KvLQsoTGn/250fnxgtuR8+27mP0CshEmcDBVDxFKYiyYkGV
	 NeeA7d/9Qvj2oupYnoYcnKTHlJQKNUfbUkzgac2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C9F3F80549; Thu,  7 Sep 2023 21:49:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFB13F8047D;
	Thu,  7 Sep 2023 21:49:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1E85F80551; Thu,  7 Sep 2023 21:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39BD7F8047D
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 21:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39BD7F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=QnGFebao
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 387F7qxN020114;
	Thu, 7 Sep 2023 14:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=
	PODMain02222019; bh=Db0NqmTGuh52sxm5Jkky1R2+22W8xh7Z98LTGOLaCj8=; b=
	QnGFebaoLc7aoJtnat6cJLSJTAmmDrvOtSVfgDOBXTR3DmC6f56uw+zp32TZTAFl
	VX8rJDUZaJI8MFUXE92oXvUbdvtubq3vzinCwQiHIVGZIk1g5X9xJIGa29qoKUKp
	5gdXdTFuZKGr06CjzCfautU3hknle3L2UwMPvZ4PuZe8QDVgrAWQzRRTpgKQlSgz
	zWqwtJyP3BMI6Ay5MG6SgvruiNs5KNvv2Vt1SZJD76Sbk/AWj1YJx1UUqiZ1q+NC
	SHm0VV05VhELqAPJHUsiGyBPmVldeBPyn6Qq31GxgcZEQJh2tNDJs1CsSO/zdX7c
	E3MzQt7KfMrbYGPPUKBglw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex766c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 14:49:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 7 Sep
 2023 20:49:40 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 7 Sep 2023 20:49:40 +0100
Received: from smtpclient.apple (macC02FN0GLMD6T.ad.cirrus.com
 [141.131.156.171])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B5841458;
	Thu,  7 Sep 2023 19:49:38 +0000 (UTC)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 4/4] ASoC: cs35l45: Add AMP Enable Switch control
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <20230901085039.GC103419@ediswmail.ad.cirrus.com>
Date: Thu, 7 Sep 2023 14:49:28 -0500
CC: Vlad Karpovich <vkarpovi@opensource.cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-ID: <199C31E4-1154-4C60-A846-6B8D12598D8D@opensource.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
 <20230831162042.471801-4-vkarpovi@opensource.cirrus.com>
 <20230901085039.GC103419@ediswmail.ad.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-Proofpoint-ORIG-GUID: mNrc0qiF602fbNMlKB0D6J6hgn5SWA31
X-Proofpoint-GUID: mNrc0qiF602fbNMlKB0D6J6hgn5SWA31
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VBFRYQHX6HXCWWRSMCKVUKW47TNAK76J
X-Message-ID-Hash: VBFRYQHX6HXCWWRSMCKVUKW47TNAK76J
X-MailFrom: prvs=4614c9396b=rriveram@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBFRYQHX6HXCWWRSMCKVUKW47TNAK76J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> On Sep 1, 2023, at 3:50 AM, Charles Keepax =
<ckeepax@opensource.cirrus.com> wrote:
>=20
> On Thu, Aug 31, 2023 at 11:20:42AM -0500, Vlad Karpovich wrote:
>> The "AMP Enable Switch" is useful in systems with multiple
>> amplifiers connected to the same audio bus
>> but not all of them are needed for all use cases.
>>=20
>> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
>> ---
>=20
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> Thanks,
> Charles

Acked-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>=
