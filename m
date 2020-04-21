Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E9E1B2763
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 15:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9939516BA;
	Tue, 21 Apr 2020 15:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9939516BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587475059;
	bh=tAtzolWfRCMiIVft2Ncj5jiIGlEWrQL29p5xys3rgaM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSUCsNFfg6q/ZcbbDGTIYXVdzYevU5Qj6TIA8OGX4b5j5bgUvVz6xv+kFFGnKWPWr
	 /tf79bzY2n8K4lw1UlVwB3GOtzThoKTLrVmr4DvF+gQIN1Qdsukca4HNz1KRle7B1N
	 fXolFrUWx0jLgce3PayNQfvZXlmmu0fpU2Wn4SEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF8E7F800FF;
	Tue, 21 Apr 2020 15:15:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47819F801EC; Tue, 21 Apr 2020 15:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49903F8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 15:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49903F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="bsL2mm9f"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LDBHuf013669; Tue, 21 Apr 2020 08:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=eQSksNnr16lv473MUndY75YiFvq7xp0brkXvXdv6kL0=;
 b=bsL2mm9fuCYb7w8ukaP/lJEpAicOMG/62nKFIXRJiItvsAejwDb8ZUTrqs2rTRwRVjvr
 YYYCt0axmdKqoCNMXAUWRJLwu4pgxTDvPFpglkIicGdxh3YxiUwUCWQDorQHEXAClom8
 1fxHf9dIRm2ZZaJiqm/MQjnYejeUfPHE7LxZgfqiR6rb8E5XD4cxYskY90E9718xCVNk
 77dwr67UykuFNckrXG1h/z648JM9on0+FHVpcJDuodIMEdEvXEnu3DnRMysd6F1yFQlf
 Ed6s3Ht/cCbQ5Vc8rqZOKsq1y5QMS1na3BAOjLb5aE/toR8hP2KNk/jsNDKd4+/lOJaU 6g== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 30fwyqmxnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Apr 2020 08:15:46 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 21 Apr
 2020 14:15:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Tue, 21 Apr 2020 14:15:43 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6756D2AB;
 Tue, 21 Apr 2020 13:15:43 +0000 (UTC)
Date: Tue, 21 Apr 2020 13:15:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix wrong clock after suspend & resume
Message-ID: <20200421131543.GG44490@ediswmail.ad.cirrus.com>
References: <1587468525-27514-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1587468525-27514-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004210105
Cc: kstewart@linuxfoundation.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, tglx@linutronix.de, info@metux.net,
 ckeepax@opensource.wolfsonmicro.com, allison@lohutok.net
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

On Tue, Apr 21, 2020 at 07:28:45PM +0800, Shengjiu Wang wrote:
> After suspend & resume, wm8960_hw_params may be called when
> bias_level is not SND_SOC_BIAS_ON, then wm8960_configure_clocking
> is not called. But if sample rate is changed at that time, then
> the output clock rate will be not correct.
> 
> So judgement of bias_level is SND_SOC_BIAS_ON in wm8960_hw_params
> is not necessary and it causes above issue.
> 
> Fixes: 3176bf2d7ccd ("ASoC: wm8960: update pll and clock setting function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
