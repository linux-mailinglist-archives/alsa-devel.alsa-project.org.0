Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFC1710F60
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 17:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3FB4823;
	Thu, 25 May 2023 17:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3FB4823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685028125;
	bh=25hqg3rlwQYSvrdOIgLUQSSAoK2RFz3DmzMkaUzzZI8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ctvWzY5z7jm0GvkDiRpS0yM+oM+ZhLmx6TlNtn3c63Qavj5HdZETtvqvHr+om4jGG
	 2xOuJ4Kq51PZlEefnLsS4AnsBOiiYEiFmrBr7NpSyRFLaVvTK/BMYn4U8c8TYAQYR5
	 jmRaSBaw4U8CHvK4patZnMDstuBvmaL4QSdJjZMg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95B42F80249; Thu, 25 May 2023 17:21:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F07F0F8016A;
	Thu, 25 May 2023 17:21:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7130F80249; Thu, 25 May 2023 17:21:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BE74F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 17:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE74F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZAOF0BT4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34PEEWR0026032;
	Thu, 25 May 2023 10:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=6CgxYFUZaCDeXUsZtv/pxCBWxRpoY7aw04bXnJPfD6M=;
 b=ZAOF0BT4ocxt5T9cBSHY078RvMKRsHLewbM6LnjhkL9xITcU56JqiP5OLaGn3G6gIjdk
 Z9/bJG93d2My4HGNJCD7j5os3krNXQ++9qp8Ywlpl71U5OBkaS1IUles51eEsNVvVKeG
 Sty1Dg43H4JH06g8VJRux7Ns0qyMUlfO/J4rY5KG4dNAr2loKgPHSZ9DAVgGBG/utKdc
 FjPxQK5wDhkKRp9Ln7i8bTXHGXI/knYt+L6BaDrwU7NBqzN9PzjzHNvsA5vx2tLtG5SF
 5QwOPkufgMMlnf09UVzFA1PZwLGZDPhVp/pQsj4NzgrlEyXgEsIJuNYe75MtOuYk/Cc1 gw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qptmm71a7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 10:20:50 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 25 May
 2023 10:20:49 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 10:20:49 -0500
Received: from [198.61.65.166] (EDIN4L06LR3.ad.cirrus.com [198.61.65.166])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1780745;
	Thu, 25 May 2023 15:20:49 +0000 (UTC)
Message-ID: <727e499c-9e06-200a-f6c5-a8a20cebf49e@opensource.cirrus.com>
Date: Thu, 25 May 2023 16:20:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/13] ASoC: cs35l56: Pass correct pointer to
 cs35l56_irq()
To: Mark Brown <broonie@kernel.org>
CC: <tiwai@suse.com>, <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
 <20230525150659.25409-9-rf@opensource.cirrus.com>
 <b95b2364-c190-4c4f-8136-a75988be8ce3@sirena.org.uk>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <b95b2364-c190-4c4f-8136-a75988be8ce3@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cErvjbCte3N4UNjRJ0nc8gXZkTaaFjwD
X-Proofpoint-GUID: cErvjbCte3N4UNjRJ0nc8gXZkTaaFjwD
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: HFYMNGBNUCJMOYHX4IRNUPXS3GWJMT3W
X-Message-ID-Hash: HFYMNGBNUCJMOYHX4IRNUPXS3GWJMT3W
X-MailFrom: prvs=050971c6a2=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFYMNGBNUCJMOYHX4IRNUPXS3GWJMT3W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/5/23 16:14, Mark Brown wrote:
> On Thu, May 25, 2023 at 04:06:54PM +0100, Richard Fitzgerald wrote:
>> cs35l56_irq() was changed to take a cs35l56_base* but the code
>> in cs35l56-sdw was still passing it a cs35l56_private*.
> 
> For bisection this should be squashed into the change it's fixing.

Oh damn. I knew I had to do that and forgot.
