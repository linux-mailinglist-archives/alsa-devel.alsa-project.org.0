Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016AD4FF180
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 10:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8E615F9;
	Wed, 13 Apr 2022 10:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8E615F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649837490;
	bh=cmvxWusnVL5bD9s50qXXa+xtNz6dc66N02AiMPf7utQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G2tuRfB6wU8kbENY+ItisSEkxsKsdCtp/9gklCtWzTgfnwlhkS5FD06prYIZBbm+R
	 P7FHVG0bv/I75o1ADUqBgYaPSeU2z4x+G0oi5pd0xFsrpbZQrk1d+s3AMAtI+gZZbS
	 At8Gi4KMI5/o/YOIcxT1y0V3WU+6SwnXZd5nbRak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E53F8F8028B;
	Wed, 13 Apr 2022 10:10:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24DF1F80248; Wed, 13 Apr 2022 10:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F06D6F80095
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 10:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06D6F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ph4a58+G"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23D6IFDP015619;
 Wed, 13 Apr 2022 03:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=O4GoFNVVTf47ppwTSm5vJVuvbs0wXiJG5IAnDR+VmCs=;
 b=Ph4a58+G3WJ1IkQhNki3uX/KrDbxtqzTepvtCPDC0XrTv7mk7b09s/x0kB+6jyfHQU+X
 k//aDLP5QmplUyv+MNG7tftHGCtNWUWUqB6oBhrsUnNfe0UQ5q8c58ttyu6e0glGp/0h
 LqE0P235t+R7OzTKThr8TbD3ExB0p5z/rfWlRrU6wGjgp7FcP2zNMAM9CE52OgU87aHu
 x5ewIUataEhPcZfpRvyxXU2Bg7bx4zh5IEFisDdfN8YhTyLrmISH+yeTghvMrDN0M4wt
 G2HJx7HS1n0gOoB6Yvhpcy0G7k/WvJ7JsrDgRVS1G5VZxs/Jg8jVL0W/qaGuISfsFend 3w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fb7hymvex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 13 Apr 2022 03:10:19 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 09:10:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 13 Apr 2022 09:10:17 +0100
Received: from [198.61.64.152] (unknown [198.61.64.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2826E475;
 Wed, 13 Apr 2022 08:10:17 +0000 (UTC)
Message-ID: <f3926070-34e0-4004-22cb-99f26aec34f4@opensource.cirrus.com>
Date: Wed, 13 Apr 2022 09:10:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: <tanureal@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/16] Support external boost at CS35l41 ASoC driver
References: <20220409091315.1663410-1-tanureal@opensource.cirrus.com>
 <s5h1qy18lpg.wl-tiwai@suse.de>
In-Reply-To: <s5h1qy18lpg.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZGKUxCH8Q4Lm2O9JyzL89XjML9VP9zNY
X-Proofpoint-ORIG-GUID: ZGKUxCH8Q4Lm2O9JyzL89XjML9VP9zNY
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

On 4/13/22 8:51 AM, Takashi Iwai <tiwai@suse.de> wrote:
> On Sat, 09 Apr 2022 11:12:59 +0200,
> Lucas Tanure wrote:
> >
> > Move the support for CS35L41 external boost to its shared library
> > for ASoC use.
> > This move resulted in cs35l41_hda_reg_sequence being removed,
> > and its steps were broken down into regmap writes or functions
> > from the library. And hardware configuration struct was unified
> > for its use in the shared lib.
> > While at it, some minor bugs were found and fixed it.
> 
> The patch series seem inapplicable via git am.
> Could you check the setup of your mailer?
> 
> 
> thanks,
> 
> Takashi
> 
Hi,
Could you explain how you apply this series? So I can reproduce it and see what's going on.
To apply a series of patches I usually:

1 - Find the patch series on https://patchwork.kernel.org/
2 - Click the series button on the right top corner, which will give me the single patch file with all series changes
3 - git am ~/Downloads/Support-external-boost-at-CS35l41-ASoC-driver.patch

And that works fine for me here.

Thanks
Lucas
