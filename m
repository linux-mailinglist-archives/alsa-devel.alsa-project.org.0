Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5787989B4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 17:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F2784C;
	Fri,  8 Sep 2023 17:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F2784C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694186180;
	bh=ElcqGKuxC2Ej13NVqHf4mneI+mhWISsGNczlgVt+nN4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bUj75YFAw3LHXWvS9C0McITn8VXsb+B/1aStZlrA0i0rgJ5YyfrjRI8w+kB5ZUfer
	 axaESl2RdUM8VD53SS/EEtVQ3inGf5BTNK/c9k1K/wd6LoShlTLNIzdDwGXPRKwB2U
	 t4uBX+1Ah41j+Vu/YH+jov3VYVTQxKK4kili6ulo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08771F80558; Fri,  8 Sep 2023 17:15:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F7DF8047D;
	Fri,  8 Sep 2023 17:15:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A18CDF80494; Fri,  8 Sep 2023 17:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3F36F80236
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 17:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F36F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DOY3LmVv
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 388FDKDC003908;
	Fri, 8 Sep 2023 10:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=Nl/uBp4wjE95CikGacqAFgHKmdDa16tkvVJ9n7LfcNo=; b=
	DOY3LmVvKFRD376j4OBtqCUqawGgi35gQJplpiku6k7SzL9WWlIlgCLzxA37aV0C
	Dmj+cNjtDd8K4i9E8uq1FGhRnrffJckGcQ493bAeHBrCxePRZg9DsriAK2Ef00s+
	yw39tzxw8qIQD8Fi8xhNmImdbZgrzaLC3/gdPZjkVR3GmiChcHOg2f0jdSJ0zKob
	FhOKwpJPEbhixCmvXD3SqSS4kXICwdKct/RrI9PZADtBd//ONpZ7AJUfG65rpND+
	4mLjHROtFIuhACqEmRwhufjv5zMD0stkpWacelyc9RwSUbRfrWkmHvJR+AFU8Fnf
	k7rNex03Hw7mRSMNJMn8EA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t04h1g47u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Sep 2023 10:15:07 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 8 Sep
 2023 16:15:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 8 Sep 2023 16:15:05 +0100
Received: from [141.131.78.121] (unknown [141.131.78.121])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 477D646B;
	Fri,  8 Sep 2023 15:15:03 +0000 (UTC)
Message-ID: <45aef3e9-b6ee-ba26-32ac-ea72f41d1dcb@opensource.cirrus.com>
Date: Fri, 8 Sep 2023 10:15:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 04/11] ASoC: cs35l41: Fix broken shared boost
 activation
Content-Language: en-US
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "Mark
 Brown" <broonie@kernel.org>,
        Stefan Binding <sbinding@opensource.cirrus.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <kernel@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
 <20230907171010.1447274-5-cristian.ciocaltea@collabora.com>
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20230907171010.1447274-5-cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b6SePw-5IJcI2he5GkY83X12Y3AsL7Qp
X-Proofpoint-GUID: b6SePw-5IJcI2he5GkY83X12Y3AsL7Qp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IWX3MQ7MMBBGNM7YC4KLQO6VKRANABVA
X-Message-ID-Hash: IWX3MQ7MMBBGNM7YC4KLQO6VKRANABVA
X-MailFrom: prvs=461543e993=drhodes@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWX3MQ7MMBBGNM7YC4KLQO6VKRANABVA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/7/23 12:10 PM, Cristian Ciocaltea wrote:
> Enabling the active/passive shared boosts requires setting SYNC_EN, but
> *not* before receiving the PLL Lock signal.
> 

> Solve the issue by setting the SYNC_EN bit in PWR_CTRL3 register right
> after receiving the PLL Lock interrupt.
> 
> Additionally, drop the unnecessary writes to PWR_CTRL1 register, part of
> the original mdsync_up_seq, which would have toggled GLOBAL_EN with
> unwanted consequences on PLL locking behavior.
> 
> Fixes: f5030564938b ("ALSA: cs35l41: Add shared boost feature")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Looks good. If it's convenient to revise again, I think you could slim 
down the comment section by simply stating that 'PLL Lock requires the 
audio clocks to be active' (which is why it is not triggered until after 
snd_pcm_start).

Reviewed-by: David Rhodes <david.rhodes@cirrus.com>

Thanks,
David
