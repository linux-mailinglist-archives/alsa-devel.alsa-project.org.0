Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5496BF00
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 15:47:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827E7B76;
	Wed,  4 Sep 2024 15:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827E7B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725457634;
	bh=AjpnI5qp5wSl9R+DpXde2r7+CO38FpagY+Ve8gS9etk=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RgU7sK9gQ+d9OdXU0wIWVzsuPci1jOzUUqgBhRgAnBNXJwl0zz2EDj2m+//xeCSAa
	 HtoLMNiwBnJHXdase68KJEhUpHDinTKubxrsuXfXuTX3MnI1GUhRaUkQ8mTpw4qrWl
	 Omd7h2BdNljIrgGMLjVz7avS0hgGIvrkOl4UBmw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8E05F8058C; Wed,  4 Sep 2024 15:46:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5F2F805B3;
	Wed,  4 Sep 2024 15:46:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF42F80199; Wed,  4 Sep 2024 15:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9E26F800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 15:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E26F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=I930DrXP
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4844i0ic006144;
	Wed, 4 Sep 2024 08:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=dL34FBVTjgHT8QW2Am75+/hWuPFunEOFpjLE1kFYkho=; b=
	I930DrXPhgWl7p/EJGC4I/rz7cVBJ31Et1psAaSpqBIT58ILwtJX7NwSwo5EpVbQ
	PSjarKBguzeMaSjVdB1/JBIn0kNoE5oJ5Ffu5J6OUNVlx3aFPDhm7WjpWf6gxtsG
	A9OawqPgb5z8M1b8TRtOvqATXYzuLx4DJVbFndjOO27T8NyZvtFq/J4Wx5UqGJFu
	2DgoHOSstXf4P3tJXgqz69qTLHzy/QSPIYD/N3+hbEhcSdCg8U/0ziBb8TT0oQY3
	F+2dMggy5+L725z3V7O0v5Z/D1IXrq/DLd18245it0sf+B4VOHRHYBXrezKf+2SN
	1J1nBbCYmmPDpl7c3bVOLw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41bykkckyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 08:46:32 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 14:46:30 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 4 Sep 2024 14:46:30 +0100
Received: from EDIN6ZZ2FY3 (unknown [198.90.188.28])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9E3E182024A;
	Wed,  4 Sep 2024 13:46:30 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: 'Mark Brown' <broonie@kernel.org>
CC: <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240904120700.188644-1-simont@opensource.cirrus.com>
 <e1aeb66c-ecb3-4778-b306-f3a212caf879@sirena.org.uk>
In-Reply-To: <e1aeb66c-ecb3-4778-b306-f3a212caf879@sirena.org.uk>
Subject: RE: [PATCH] ASoC/HDA cs35l56: Remove redundant IRQ handling
Date: Wed, 4 Sep 2024 14:46:30 +0100
Message-ID: <004601dafed0$d8ff8cd0$8afea670$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKHzAIo361Zljfa9iRBQSN4dy/XOQEQvrcusOV2n+A=
X-Proofpoint-GUID: T5wFkE1A2qVSP_Pao5lY3hzYA-hzzW2G
X-Proofpoint-ORIG-GUID: T5wFkE1A2qVSP_Pao5lY3hzYA-hzzW2G
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KLCAMZCHI35XI4L57QNQZTTNB36A6U3P
X-Message-ID-Hash: KLCAMZCHI35XI4L57QNQZTTNB36A6U3P
X-MailFrom: prvs=6977ef6907=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KLCAMZCHI35XI4L57QNQZTTNB36A6U3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 04, 2024 at 12:25:00PM +0000, Mark Brown wrote:
> On Wed, Sep 04, 2024 at 12:07:00PM +0000, Simon Trimmer wrote:
> > The IRQ handling in the cs35l56 driver was purely informational. It was
> > not necessary to support the HDA or ASoC driver functionality and added
> > unnecessary complexity to the drivers.
> >
> > As the IRQ signal GPIO line could be connected and shared with other
> > components the handling is replaced with a regmap patch to ensure the
> > cs35l56 IRQ sources are masked and will not generate interrupts that go
> > unhandled.
> 
> Given that the code is there now and has been since the driver was
> introduced about 18 months ago what's the ongoing cost of having it?
> The information it's providing is notification of hardware faults,
> reporting those does seem useful.

Originally we were expecting to use the IRQ mechanism for an event logging
stream that would function in a similar manner to compressed streams to be
able to get an information feed for debug and tuning tools, but those were
never created and the logging infrastructure not implemented.

It's quite a spread of code and a lot of complexity in the regular execution
paths managing them / synchronizing the contexts, there is more going on in
the SoundWire bus variant compared to the conventional i2c/spi that it is
hard to justify maintaining it all for a couple of log messages - in the
event that someone did encounter the two situations being reported the
regmap dump would point us to the cause pretty quickly.

-Simon


