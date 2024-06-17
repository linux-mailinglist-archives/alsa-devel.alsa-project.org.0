Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C0990B246
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 16:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AED0DF8;
	Mon, 17 Jun 2024 16:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AED0DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718635003;
	bh=b1PJGTlv1eUZIrgNlnXwXE+3iK9WQzktLmR8xz3nq0E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YZpsYX3ALfPQHzCyPqYxueuFc+McMK/6CwsKTNFe4+e3RusUR4PtjUhy8wMZW4Wru
	 EFFN6Giff9w204uT6W1SLebpwpkVWuJA0T3Vq9poDaNAMqHaX8lqU0dOcur4N9u7VK
	 w93+BSUAypV/ZOC0C8TEqwzAyuBbkC3Wogf8KKrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C572DF8058C; Mon, 17 Jun 2024 16:36:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E447F805A9;
	Mon, 17 Jun 2024 16:36:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECE1FF8023A; Mon, 17 Jun 2024 16:34:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 92025F8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 16:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92025F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qUciWrvK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 45H5Q2nA001972;
	Mon, 17 Jun 2024 09:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=82NKCBlNAyD/uD7R+ED4UFGffGVBQme/etpeP85WnTs=; b=
	qUciWrvKskySBFPVRT64266PzVojuoy4SapsHRj7AuvgrL8LAoAYo7Hthl1gcFqa
	XHsIyf8tuQTEldrmj9cKaD1htmE0Y43LimlHqKb5Zgbly5wAeku/VL9gFPMtLGfo
	WoUeFL6XNr27D2j1sB6gQy0o5wBHvKZRxCLptSGd+1uajrH9XBvwy+cTZYZ0V/i+
	RR//hPyRdEfdMyi73AE3WDX0Ty3IECOSNhKxsZh90V6ObyOp2Wk399zW68xEqrO2
	KhMcvT40jOwmmkou4sOi7H8TJgjDDdTXobsv62E636VXiZvpZzl26LoyxeaM0ZKD
	zMybmYmeCqaiNnItPeQMXQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cjsx39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 09:34:01 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 15:33:59 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 17 Jun 2024 15:33:59 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6B1B8820248;
	Mon, 17 Jun 2024 14:33:59 +0000 (UTC)
Message-ID: <3451fcf6-ff33-4f72-83d1-945b026b925b@opensource.cirrus.com>
Date: Mon, 17 Jun 2024 15:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: cs35l56: Accept values greater than 0 as IRQ
 numbers
To: Mark Brown <broonie@kernel.org>,
        Simon Trimmer
	<simont@opensource.cirrus.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20240617135338.82006-1-simont@opensource.cirrus.com>
 <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <917507e5-dc6c-4e18-a7e1-554625de604e@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q0Z9tes_w-BZ_luaxhXYn0kLD8UA4f76
X-Proofpoint-ORIG-GUID: q0Z9tes_w-BZ_luaxhXYn0kLD8UA4f76
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KC3N2WZK67KOSNZ475PZDKDLZYXGJT3Q
X-Message-ID-Hash: KC3N2WZK67KOSNZ475PZDKDLZYXGJT3Q
X-MailFrom: prvs=38987c7648=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KC3N2WZK67KOSNZ475PZDKDLZYXGJT3Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/06/2024 15:04, Mark Brown wrote:
> On Mon, Jun 17, 2024 at 02:53:38PM +0100, Simon Trimmer wrote:
>> IRQ lookup functions such as those in ACPI can return error values when
>> an IRQ is not defined. The i2c core driver converts the error codes to a
>> value of 0 and the SPI bus driver passes them unaltered to client device
>> drivers.
>>
>> The cs35l56 driver should only accept positive non-zero values as IRQ
>> numbers.
> 
> Have all architectures removed 0 as a valid IRQ?

 From discussion threads we can find 0 might still used on x86 for a
legacy device.
But the conversations we can find on this don't seem to exclude passing
a negative error number, just that 0 can normally be assumed invalid.

The kerneldoc for SPI says:

  * @irq: Negative, or the number passed to request_irq() to receive
  *	interrupts from this device.

