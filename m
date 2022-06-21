Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC92D55389D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 19:12:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 827B1200D;
	Tue, 21 Jun 2022 19:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 827B1200D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655831565;
	bh=zkv//vh9fO7dBvRSCt/u2U10ROBis5M+X/X/VWWmI9k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YD7dlNfF35n272HTmjobRBaSYajXJgV1dgEjqGTY9D0KQcizFsJV5AhPOC1XdttSX
	 MacfCbcPOGseADHfO/HOm+n4n6azPDOg0q3YTMPRt87hF1r0Qf59CJukqpuIlBdkKx
	 LARaJ+o0FFgVp+EKTQPjsZxYCpwxpbfyT9X6u1rE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDE52F800CB;
	Tue, 21 Jun 2022 19:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01917F80152; Tue, 21 Jun 2022 19:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F775F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 19:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F775F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZlvqUof0"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LBPIlq007338;
 Tue, 21 Jun 2022 12:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=zDQ6GqXPGfrimhD4YgdQPLhNjpqeT4KNBIe2LvxDde0=;
 b=ZlvqUof0O3JHa37dG1ErPk5I9vsN1NDH/u5TxkE0hL6ChBK/cHYnUOST22fYhfgaZUs1
 HXu+CJHymtECTeFmrZeS1oyeBtkCouERVjhsW/KWWB6i9HVvqppVkrSO/botusxUmeSh
 fwzL4FMJr9Y7Yl4uQPP3KK4aUxIU+BGFPlRx7Ig1BCW9NlqUecIoluRiV3zsQeXwqmfH
 JNrcsgXfugEW+hYkGR0aBXe1d498EpAuUDArOTjEW7YR3rSVYmX3QYdqrVQKVTY+TaFx
 3fG07v92OiWfpKdFbhJP3YVWMBaW/OJC891MEgfw4iQLTE3RamgZSnXUckX0zY19aamI eA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41bx2d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jun 2022 12:11:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 21 Jun
 2022 18:11:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 21 Jun 2022 18:11:33 +0100
Received: from [141.131.206.39] (david-linux.ad.cirrus.com [141.131.206.39])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A77DE475;
 Tue, 21 Jun 2022 17:11:31 +0000 (UTC)
Message-ID: <06b02d51-6915-d56f-51e6-94a3fd182bc4@opensource.cirrus.com>
Date: Tue, 21 Jun 2022 12:11:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] ASoC: cs35l41: Correct some control names
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, <broonie@kernel.org>
References: <20220621102041.1713504-1-ckeepax@opensource.cirrus.com>
 <20220621102041.1713504-3-ckeepax@opensource.cirrus.com>
From: David Rhodes <drhodes@opensource.cirrus.com>
In-Reply-To: <20220621102041.1713504-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: exPQh_68I1CYLfWJkVVshTwYPeURyIev
X-Proofpoint-ORIG-GUID: exPQh_68I1CYLfWJkVVshTwYPeURyIev
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, james.schulman@cirrus.com, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org
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

On 6/21/22 05:20, Charles Keepax wrote:
> Various boolean controls on cs35l41 are missing the required "Switch" in
> the name, add these.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Acked-by: David Rhodes <drhodes@opensource.cirrus.com>

Thanks,
David
