Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B8B309600
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 15:45:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A1B31674;
	Sat, 30 Jan 2021 15:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A1B31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612017937;
	bh=YM12dk6ar+C0o8jK2UbYe/QJaojgsuNTLguEwU89fXM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kb97wwpMPqIzD7FyQ6pno3oY7c0uADz8J1JU+6Vr5aF7dpZ1RmW6qn9/J5t7Bbc9T
	 6TuSNg3KxMM3fo1+2crXDjCLd+JXX/1JNb9L6UyCqHixiPLEAuBN4hqEboDw+SCQMN
	 Vl1yjBnCqPG5j/Ckx2YaD1hCj9Zmh2i5r092F52Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED450F80158;
	Sat, 30 Jan 2021 15:44:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EE62F8015B; Sat, 30 Jan 2021 15:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19978F800BE
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 15:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19978F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Mj4fVFX8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10UEgIHP025126; Sat, 30 Jan 2021 08:43:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yfOqCib7MRw0TIq+kf6JqN7DVLXhcxtNSA7Oq32y5bs=;
 b=Mj4fVFX8Q6Dj1aR2yuIPZDrdW03eFuWuHbAGjv5lvawteeXrVxnIbKnpZreNoNIw/Zsg
 WXU0CWbbdvupqFHGfDiK2R58gY2KlCEYXXbqmNw2QXRKxyDeCs51mf6yyDXcbaQjoau4
 or9SLLlUHtgNoxsQzTd6znyx7xO3Gl5MdLQOJyQvs6zTdjrjYFJ1HAl06YUlH/qbIVau
 WAiJra7hrzvljPQAzyVckSHY3ovLA0UmYIhOuxxe+763CPJ+OjJxlizxdbeNyU2lJ3HH
 dQgQhksRl7+emW65YxBGfo0Js5LnuAu2/4qjeOaweFNuaVb4G9ylwWktFg8n4xg7SMTY VQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36d5r6849b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 30 Jan 2021 08:43:55 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Sat, 30 Jan
 2021 14:43:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Sat, 30 Jan 2021 14:43:52 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D5D2E2AB;
 Sat, 30 Jan 2021 14:43:52 +0000 (UTC)
Date: Sat, 30 Jan 2021 14:43:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 02/13] extcon: arizona: Fix some issues when HPDET IRQ
 fires after the jack has been unplugged
Message-ID: <20210130144352.GN106851@ediswmail.ad.cirrus.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121313.79530-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210123121313.79530-3-hdegoede@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101300081
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
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

On Sat, Jan 23, 2021 at 01:13:02PM +0100, Hans de Goede wrote:
> When the jack is partially inserted and then removed again it may be
> removed while the hpdet code is running. In this case the following
> may happen:
> 
> 1. The "JACKDET rise" or ""JACKDET fall" IRQ triggers
> 2. arizona_jackdet runs and takes info->lock
> 3. The "HPDET" IRQ triggers
> 4. arizona_hpdet_irq runs, blocks on info->lock
> 5. arizona_jackdet calls arizona_stop_mic() and clears info->hpdet_done
> 6. arizona_jackdet releases info->lock
> 7. arizona_hpdet_irq now can continue running and:
> 7.1 Calls arizona_start_mic() (if a mic was detected)
> 7.2 sets info->hpdet_done
> 
> Step 7 is undesirable / a bug:
> 7.1 causes the device to stay in a high power-state (with MICVDD enabled)
> 7.2 causes hpdet to not run on the next jack insertion, which in turn
>     causes the EXTCON_JACK_HEADPHONE state to never get set
> 
> This fixes both issues by skipping these 2 steps when arizona_hpdet_irq
> runs after the jack has been unplugged.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
