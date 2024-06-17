Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4490B2D5
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 16:49:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE0B2B6A;
	Mon, 17 Jun 2024 16:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE0B2B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718635795;
	bh=Vx60TwCd5DvU3lW+N0yTg5OEPPielolK61OlocuXBGM=;
	h=From:To:CC:References:In-Reply-To:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ovGGcgJmSX28oE4Bd1RPLYxNQjZ03PdPB57Xr4O7MHXVw5mpYQN8FYK26JJdQbCJs
	 fOf19xXNxVw04zdDa5doFqLL4qOxpxai3sxGFsQ/TNTaWHknx3pF3yG2Fhqd5O3cXl
	 ILfsEj/1gqQUAEZe9kJJUfuDTfiVt9fqcdIGW90g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2252EF80578; Mon, 17 Jun 2024 16:49:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FC7EF804D6;
	Mon, 17 Jun 2024 16:49:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24ED0F8023A; Mon, 17 Jun 2024 16:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3336F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 16:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3336F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RHwZULEW
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45H6pj0S020277;
	Mon, 17 Jun 2024 09:48:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=NU2i88E3x+E9mAi+Ds4+RUAASBPO7aAk4fdksz4mITk=; b=
	RHwZULEWMZIH6vSoc1uH36iciq/A3dwUd7xlIBHnqoUGU+mp6VpdFWyc0lPMqKZi
	qkJK8X0dOUq/9f8SujzWSlhFGsnZ1TGFIvJt0U6DHHjKhOV7Zbt47TrotFJ7701x
	oGMbebivDuc1GF+YTx2oeVyJ9FOHgqEuXzBi9BoTDi2P58DQNVS6JjN8Al76kOUG
	or9jmSk+235z6mX03jaqPmeQ/0pnxwJThsPK8pWs/R8Awf9QuOuCYlwhr6ihAYHQ
	COU8D9uTlfvxrRMac0tmV/vsPQv0efiFbpN689UuCYpnjKGKpFrQ/E5zkMZOv3fJ
	MxylHEGHeBZIVzIKy8IT4w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cjsxjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:48:53 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 15:48:51 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 15:48:51 +0100
Received: from EDIN6ZZ2FY3 (EDIN6ZZ2FY3.ad.cirrus.com [198.61.65.31])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 593AC820248;
	Mon, 17 Jun 2024 14:48:51 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: 'Richard Fitzgerald' <rf@opensource.cirrus.com>,
        'Mark Brown'
	<broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
 <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
In-Reply-To: <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
Subject: RE: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
Date: Mon, 17 Jun 2024 15:48:51 +0100
Message-ID: <007b01dac0c5$7807ac30$68170490$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLJlotUhHos9A3t9Z11wTi0/o5GmwIOUdMXAdn00ZqvzxnqoA==
X-Proofpoint-GUID: ImJAUvX1q-czcllldZxnSVyIKYNGOdFR
X-Proofpoint-ORIG-GUID: ImJAUvX1q-czcllldZxnSVyIKYNGOdFR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: L6V6A7NTMHJ5KTMY5NLUPK4JMBMNVFFG
X-Message-ID-Hash: L6V6A7NTMHJ5KTMY5NLUPK4JMBMNVFFG
X-MailFrom: prvs=389839efd0=simont@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6V6A7NTMHJ5KTMY5NLUPK4JMBMNVFFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> Sent: Monday, June 17, 2024 3:34 PM
> On 17/06/2024 15:04, Mark Brown wrote:
> > On Mon, Jun 17, 2024 at 02:53:38PM +0100, Simon Trimmer wrote:
> >> IRQ lookup functions such as those in ACPI can return error values when
> >> an IRQ is not defined. The i2c core driver converts the error codes to
a
> >> value of 0 and the SPI bus driver passes them unaltered to client
device
> >> drivers.
> >>
> >> The cs35l56 driver should only accept positive non-zero values as IRQ
> >> numbers.
> >
> > Have all architectures removed 0 as a valid IRQ?
> 
>  From discussion threads we can find 0 might still used on x86 for a
> legacy device.
> But the conversations we can find on this don't seem to exclude passing
> a negative error number, just that 0 can normally be assumed invalid.
> 
> The kerneldoc for SPI says:
> 
>   * @irq: Negative, or the number passed to request_irq() to receive
>   *	interrupts from this device.

Yes and the threads of these lore links in these commits are rather feisty

ce753ad1549c platform: finally disallow IRQ0 in platform_get_irq() and its
ilk
a85a6c86c25b driver core: platform: Clarify that IRQ 0 is invalid


