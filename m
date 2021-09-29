Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1A41C731
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 16:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C901F16AA;
	Wed, 29 Sep 2021 16:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C901F16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632926914;
	bh=ay/DFiQ8rMBbZXoad424imzuibsG0DmpTRc6cnRjLFU=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrW8oM8j60Yf4LVhuuLvT+2bOJyeQ9w5ISuMVmvHzxUyTWAUNDj+WbFFB46lribAb
	 rcaI2OIHTMp4ewvqcc42qohR6Nqjy1TgrdjL4sVQf2grWKJRqqhlDsSqMB9k+/FWlm
	 x6xBnEpjlDXHupjMN3XZa9BdPu93Pg0YS8FL1DVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5293FF80113;
	Wed, 29 Sep 2021 16:47:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E716DF80227; Wed, 29 Sep 2021 16:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C00BDF80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 16:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C00BDF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WGL0i6AJ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T9qXi0002957; 
 Wed, 29 Sep 2021 09:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=CxUQIokPqP+S4DsPpXxO1OV616fdP6M9szOHlDqKOtc=;
 b=WGL0i6AJ3+YTYsWUAHpV57/hw5HGy1lw5S0FDeDHA3Cd2OJoo9e37SQLz6PtSSSK4fiG
 OY+pimiUxxNBScwOtTMi8kF7wAXwDP6DJirm2u0VdzZekAlkZPQMvEodVGetgryL9FE4
 r1+zoPb6uh+p9OVOqjlkQGZl3uudhPHJTr5CtqRIYeoW2910XWXXUeI96w/Ao59vysuw
 YmhPxpgx59gKAgf/v9yTa/5nxY5069Kc5I4yfTKsRBAscBFJGumFIuhenmmN+qMvjYxH
 LeXK2/dyTZoEXocWTpk4QAMzKXE1R0LI3A47nfVKbaDeDpeYnB+OzsawldU01WBWKZJM cQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bc6be1fk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Sep 2021 09:47:04 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 29 Sep
 2021 15:47:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 29 Sep 2021 15:47:02 +0100
Received: from LONN13613Z2 (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 63036B13;
 Wed, 29 Sep 2021 14:47:01 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: 'Guo Zhengkui' <guozhengkui@vivo.com>, 'Liam Girdwood'
 <lgirdwood@gmail.com>, 'Mark Brown' <broonie@kernel.org>, 'Jaroslav Kysela'
 <perex@perex.cz>, 'Takashi Iwai' <tiwai@suse.com>, 'Charles Keepax'
 <ckeepax@opensource.cirrus.com>, 'Richard Fitzgerald'
 <rf@opensource.cirrus.com>,
 <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>
References: <20210929123217.5240-1-guozhengkui@vivo.com>
In-Reply-To: <20210929123217.5240-1-guozhengkui@vivo.com>
Subject: RE: [PATCH] ASoC: wm_adsp: remove a repeated including
Date: Wed, 29 Sep 2021 15:47:01 +0100
Message-ID: <001001d7b540$dd169ca0$9743d5e0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKSXDI3vuTgErK6XFa2Eat9tY11+apFyTPg
Content-Language: en-us
X-Proofpoint-ORIG-GUID: d4-kMTQG5hXM4qsnekmm7yNhRwHJqimO
X-Proofpoint-GUID: d4-kMTQG5hXM4qsnekmm7yNhRwHJqimO
X-Proofpoint-Spam-Reason: safe
Cc: kernel@vivo.com
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

On Wednesday, September 29, 2021 1:32 PM, Guo Zhengkui wrote:
> Remove a repeated "#include <linux/firmware.h>" in line 32.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---

Acked-by: Simon Trimmer <simont@opensource.cirrus.com>

Thanks,
Simon

