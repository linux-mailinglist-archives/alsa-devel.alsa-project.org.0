Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB2B4CD836
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 16:45:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3FF71F07;
	Fri,  4 Mar 2022 16:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3FF71F07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646408738;
	bh=pQ7aX9J/raP7YNW4FUdeZNmAj1wF6vBfOX3dn8AF4sE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+eGX4duyPfPRdxmnzGREX67AOhfYPSoVc73IM0KkXSJYtNjhrsLsh0hW7TcJsUHP
	 s0Qo7mSsCAhDAI6G1c/oty2YNDF0EGoA5QTeapdNFsnVag/2g4TELiSg7lE77wp6bB
	 SSb/GL2FMCJPuBB6/Ahq24yevBzXnR8wiEf5bbxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B55CF800FA;
	Fri,  4 Mar 2022 16:44:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A921F801EC; Fri,  4 Mar 2022 16:44:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15AC9F800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 16:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15AC9F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="qIpEJ3EW"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2244w2je013723;
 Fri, 4 Mar 2022 09:44:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=Z4PNEb44rzAmhz7LlNft3ZiCpWyK5xAbOEcnRHxyPoU=;
 b=qIpEJ3EWoV1DZnFSePQg2JQ4nKm2gIVxLXEoyE+R1BHXZaaZPOAVEJ0f1UZKGJqe/+pH
 FmSiaOIPR+eIuxHy+FeIGLS9EQCJUUJeapZY9hEkVAXbBJDt6maEp3RZ5+rfyTSuU+Iq
 q6jngQyXjzA6y10WAuk/D84f0XyviUqs7Mcq8AHUjFTjc6W5V6EClxf/wG20L9emWm3i
 OjXoK5VyCMtwI636ZPaeUck3ThxlRWRveGUtPrMyA3Zg/+Ot2gTFzUVIXdagXmGCeLxN
 VMgoIdAlOWmGetWP3nhxMroK8VwVcNif4haaJIGp1b0KJUr2UwniOFDRUf+4gyL+FqY/ gQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ek4j3h5hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 04 Mar 2022 09:44:17 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:44:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 4 Mar 2022 15:44:16 +0000
Received: from [198.61.65.198] (unknown [198.61.65.198])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7D791B06;
 Fri,  4 Mar 2022 15:44:15 +0000 (UTC)
Message-ID: <d2b9dbba-b255-53d4-4698-ac233e6159d9@opensource.cirrus.com>
Date: Fri, 4 Mar 2022 15:44:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: <tanureal@opensource.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v2 01/20] ASoC: cs35l41: Fix GPIO2 configuration
References: <20220304150721.3802-1-tanureal@opensource.cirrus.com>
 <20220304150721.3802-2-tanureal@opensource.cirrus.com>
 <20220304152226.GE38351@ediswmail.ad.cirrus.com>
In-Reply-To: <20220304152226.GE38351@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GWr-N8vf8EX8BexWVkJe6iTMll-5Vo-5
X-Proofpoint-ORIG-GUID: GWr-N8vf8EX8BexWVkJe6iTMll-5Vo-5
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 3/4/22 3:22 PM, Charles Keepax <ckeepax@opensource.cirrus.com> wrote:
> On Fri, Mar 04, 2022 at 03:07:02PM +0000, Lucas Tanure wrote:
> > From: David Rhodes <drhodes@opensource.cirrus.com>
> >
> > Fix GPIO2 polarity and direction configuration
> >
> > Fixes: fe1024d50477b ("ASoC: cs35l41: Combine adjacent register writes")
> > Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> > Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> 
> Really sorry I only just spotted this but you are missing your
> own sign off here. You always need to personally sign each patch
> you are sending up.
> 
> Thanks,
> Charles
> 
Yes, sorry about that. I will give some time for more reviews on this version and fix it on v3.
