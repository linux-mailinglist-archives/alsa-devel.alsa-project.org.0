Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEDA211FD9
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 11:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648A316C5;
	Thu,  2 Jul 2020 11:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648A316C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593681912;
	bh=mk+cP6ab8HFv3C1+zOHjK1REMlA/xBvLVJIwpMAVK5M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLLw2PtWl9c/vEM0l7eNuISSQStZprhMtOlQSzoPntkvw/mWpsDJqYfz+ynwgo0RU
	 K/G6KLe7jk0mapuU8KnSxlycgZjaseCeub94n33jyIRWhoa7XfBEPKLcpZcZ5bp0BV
	 o/9bNuiupcYuxsQtddZpdRYDD2fFPFW+v8t6I8Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D8DF800C1;
	Thu,  2 Jul 2020 11:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98634F8022D; Thu,  2 Jul 2020 11:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4976F800C1
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 11:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4976F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Henjgm7B"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0629K0Jv024016; Thu, 2 Jul 2020 04:23:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=J0AXJKehzt+e/GELyh0zbYY6Mu4SNRdcwWUGlkpq0OQ=;
 b=Henjgm7Bi10eJVwj6R9bGw6Akp6b+BN8NnrdNTqPwfSrkpTYhoPsngUB64JqbFROGP8V
 VC9lHUrkqcxrznwGsPtVGB216sROs+qy3TairypHN3utE8fevEUXUgEg3sgfijpvU/ZW
 THg8uGn9Nk2oe8cinaubmoYgACGLkD57tR/qORurpkROVed9mVFfveb8NmIfrVeJnoim
 N1Pryzg8tmH3Y6OnpD7MXf1bh/sMtRHFs0f70WngZN0ZSiN47AxEdWa57gourZs8ib0L
 9iBpzVUOOYtzzVbYK29CJIqUrh6Yj7RTjlT2NzZ2tZUaG4amvLkoud0fDgYuW9YQ7mxp rQ== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 31x3h4qmab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 02 Jul 2020 04:23:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 2 Jul 2020
 10:23:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 2 Jul 2020 10:23:19 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ED60F44A;
 Thu,  2 Jul 2020 09:23:18 +0000 (UTC)
Date: Thu, 2 Jul 2020 09:23:18 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 7/7] ASoC: codecs: wm8400: add _maybe_unused as needed
Message-ID: <20200702092318.GL71940@ediswmail.ad.cirrus.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
 <20200701181320.80848-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200701181320.80848-8-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com
 ip4:5.172.152.52 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 cotscore=-2147483648 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007020069
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Wed, Jul 01, 2020 at 01:13:20PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warning by adding __maybe_unused. Maintainers for this file
> may want to double-check if those definitions are necessary.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---

Yeah I think in this case better to remove them, they arn't used
in the driver, the driver is pretty old and no one really works
on it so little chance the features are ever getting added.

Thanks,
Charles
