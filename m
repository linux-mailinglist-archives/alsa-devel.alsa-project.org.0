Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1679A814
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 14:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF9E852;
	Mon, 11 Sep 2023 14:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF9E852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694436972;
	bh=S+HX1YnWrWfDgk3thDvicZaC76TUQI5BbVSldFhhnqg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kLH6COiHnHXDrg4c2NKNuL+0pTY8PVNU/KjL8HmZkXQbBpr2Y+VCHL+9QhCSxXGq8
	 uYHJdCfl5YLvOsaMH1nn/eMFnUXedrQcABvqNXbHBT6RVNgOL2lso8mZNocCxAm4KY
	 VmD5NHSW4d39B6+zWj+X4NeiQo8qF4wS7lI3UM6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8FFFF80549; Mon, 11 Sep 2023 14:54:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66913F80246;
	Mon, 11 Sep 2023 14:54:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57D10F80425; Mon, 11 Sep 2023 14:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4240F80246
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 14:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4240F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k6HL8vZy
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38BCKOc4019530;
	Mon, 11 Sep 2023 07:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=vVHlWkZCeiO7mNNZwEblnDDlwUUCr2etvJOYkCcHdDE=; b=
	k6HL8vZyH+oAI55pQGJBKvxq2Ms68q6LzddXdaP42GdLXVBrGNCCq79jsTzClfEz
	MzKx0jCUWYIkKatoWTnKUYt22agTmWEpcSw6sEm/RYRGddhJcNByvmloKrdgNnXf
	6cs5dXQDZuLbeugRtoYo3xkR/OIB/8Wt4LNX8D9pR9qfPnw1Veh4J/vvivIs1b31
	l0GlEkGcdkXYwwv1y5XS+AynBT2QXnAMlvp2SUfPhF0XytD+/yDwa27so1yGNe8h
	P7qUBrMzKHcKvdjivdtlwkMk2mjzvc6zWIixHdCyThkv/JIxEHCQuU/+IESs61Yy
	bcY1oY1kxeLyfyQ78dAciw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t0n4j9rwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 07:54:38 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 11 Sep
 2023 13:54:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 11 Sep 2023 13:54:36 +0100
Received: from [198.90.251.125] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 367DD11AA;
	Mon, 11 Sep 2023 12:54:36 +0000 (UTC)
Message-ID: <2e7c77bb-2f9b-50a0-334f-ff4351364761@opensource.cirrus.com>
Date: Mon, 11 Sep 2023 13:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mtd: cs42l43: use modern PM macro helpers
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>, "Lee
 Jones" <lee@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Arnd Bergmann <arnd@arndb.de>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
References: <20230911111623.705640-1-arnd@kernel.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230911111623.705640-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JZDG-pKbYJFxtZ4CBBEspERNqh8xXIXh
X-Proofpoint-GUID: JZDG-pKbYJFxtZ4CBBEspERNqh8xXIXh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SMT4DVDCYXHLXGRHJXZGBTHLFSEGZX6M
X-Message-ID-Hash: SMT4DVDCYXHLXGRHJXZGBTHLFSEGZX6M
X-MailFrom: prvs=4618f18b96=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMT4DVDCYXHLXGRHJXZGBTHLFSEGZX6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/09/2023 12:16, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The old SET_SYSTEM_SLEEP_PM_OPS/SET_RUNTIME_PM_OPS macros required enclosing
> the function definitions in an #ifdef or marking them __maybe_unused:
> 
> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>   1138 | static int cs42l43_runtime_resume(struct device *dev)

Commit title has typo. mtd should be mfd.
