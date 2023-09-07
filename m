Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1674079A492
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 09:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56F8D93A;
	Mon, 11 Sep 2023 09:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56F8D93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694417586;
	bh=5Aa5O7MHJsKoyFgG9iK+mhkQNMcLvrsrQ2vURYqEtlg=;
	h=Subject:From:In-Reply-To:Date:CC:References:To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cw5r2fnV657//nRJPVijrvoMfhu2ISmC+QvAvuHURljTScPZdxCPxC1ze9KQWQdbT
	 9I8+U7ANTLYaazkWzjYvqG6vGn1wiOkMSpq/qOmeMGu2LvvkJoudJZ7zSomLsUmSru
	 8xYfxwhYmRus8Hz5hE3EsF5VZcXYtyQSzgG0lNcQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1149EF8007C; Mon, 11 Sep 2023 09:31:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D654F80558;
	Mon, 11 Sep 2023 09:31:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FA17F80494; Thu,  7 Sep 2023 21:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C5DCF800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 21:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5DCF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cJjtMPvc
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3879g1s5014439;
	Thu, 7 Sep 2023 14:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to; s=
	PODMain02222019; bh=8Q2FE7o81owhXFer2OtaRJ0nbORoYwm42s7QqzBNa2g=; b=
	cJjtMPvc/eIjFhvmY1wmb1dUxfYlHe1JKhmIChukcma7gx3qfahNLrrhwn9S+Ppd
	dFcOwFeY4ZIaHhajB4xs/qHLZ5ZlnTKkYvhldu69rKAcHjqJ4ULbAtV/+9u7bivP
	av9GmHcmGDwyDE14MZfMr6/+y4EIw9SJUKFyzotoSQX8jb/cyp5wxX8hRHMEaCGK
	IaG7tWDaK8xykz8Lwi9r4IffvMiKcgROTRdkFgsqnlPoeaQamegG2sX/Xo9r0ANO
	5oNzku2pmIOO5r5ny61IgmY3j5qtqlSpW0SX9Cd+B+4m5ghX4QGQ0NlBGkF/Wt6t
	8GusLv5gwWWi767Eh7+I0w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sv2ex75w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 14:40:29 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 7 Sep
 2023 20:40:27 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 7 Sep 2023 20:40:27 +0100
Received: from smtpclient.apple (macC02FN0GLMD6T.ad.cirrus.com
 [141.131.156.171])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2277715B4;
	Thu,  7 Sep 2023 19:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <20230901084843.GZ103419@ediswmail.ad.cirrus.com>
Date: Thu, 7 Sep 2023 14:40:14 -0500
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
Message-ID: <0FA27CCC-83F1-4358-B914-35C0FF135A06@opensource.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
 <20230901084843.GZ103419@ediswmail.ad.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-Proofpoint-ORIG-GUID: mfOg2b6W0M_x268ezV1Q3O3bEITlMAXH
X-Proofpoint-GUID: mfOg2b6W0M_x268ezV1Q3O3bEITlMAXH
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=4614c9396b=rriveram@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RZGKYVONFH65FEY6Y6Y2E4KTOAAOFEK5
X-Message-ID-Hash: RZGKYVONFH65FEY6Y6Y2E4KTOAAOFEK5
X-Mailman-Approved-At: Mon, 11 Sep 2023 07:31:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZGKYVONFH65FEY6Y6Y2E4KTOAAOFEK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> On Sep 1, 2023, at 3:48 AM, Charles Keepax =
<ckeepax@opensource.cirrus.com> wrote:
>=20
> On Thu, Aug 31, 2023 at 11:20:39AM -0500, Vlad Karpovich wrote:
>> From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>>=20
>> Checks the index computed by the virq offset before printing the
>> error condition in cs35l45_spk_safe_err() handler.
>>=20
>> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
>> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
>> ---
>> sound/soc/codecs/cs35l45.c | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
>> index 2ac4612402eb..02b1172d2647 100644
>> --- a/sound/soc/codecs/cs35l45.c
>> +++ b/sound/soc/codecs/cs35l45.c
>> @@ -1023,7 +1023,10 @@ static irqreturn_t cs35l45_spk_safe_err(int =
irq, void *data)
>>=20
>> i =3D irq - regmap_irq_get_virq(cs35l45->irq_data, 0);
>>=20
>> - dev_err(cs35l45->dev, "%s condition detected!\n", =
cs35l45_irqs[i].name);
>> + if (i < 0 || i >=3D ARRAY_SIZE(cs35l45_irqs))
>=20
> I am happy enough for this to be merged, since it clearly does
> no harm. So:
>=20
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> But I do still have a slight reservation of what is the point
> of this error check?  This handler is static and can only be
> called from within cs35l45.c and the only code that registers
> IRQs goes through the cs35l45_irqs array and registers IRQs
> from there, so how does this ever end up with i being out of
> bounds?
>=20
> And whilst I would not add this to this patch. I do also think
> perhaps Ricardo had a point in his email, the IRQ handler
> should probably be renamed, since it handles more than just
> the spk_safe_err's, perhaps something like cs35l45_report_err.
> On why the watchdog and global error call this as well, that
> was a review comment on an earlier patch since the handlers for
> those errors only printed a message, they might as well be
> combined with the spk_safe error that also only printed a
> message. If at some point separate handling is added for them
> they can be split out.

Thanks Charles, I had missed that comment. It=E2=80=99s clear to me now.
>=20
> Thanks,
> Charles

Acked-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com =
<mailto:rriveram@opensource.cirrus.com>>

