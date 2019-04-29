Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C3BE760
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 18:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD311669;
	Mon, 29 Apr 2019 18:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD311669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556554384;
	bh=VaYcysAJA+mf3lopvQqPV8wv8CtpapIeqjC74ITsfXM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2ToaPXwrGtgSRHP/iOn8Vtt/b8d4+801Le5yidKkD4E9caj5XqIkteWnWoN/dSJ3
	 uQHsdizYGGzCNPymuIgCYvJBe5fJrlxwAM9VyUQgIzMYSpSaWbMADL7UPYbvUISdmv
	 t/30cI0PPOPqGLYDVWILzU90ge9n7w+FBv/Y4ozo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF87F80CAB;
	Mon, 29 Apr 2019 18:11:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B52B1F80CAB; Mon, 29 Apr 2019 18:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=KHOP_DYNAMIC
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79E91F80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 18:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79E91F80641
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3TG90LT004931; Mon, 29 Apr 2019 11:11:09 -0500
Authentication-Results: ppops.net;
 spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
 by mx0b-001ae601.pphosted.com with ESMTP id 2s4kgpat8v-1;
 Mon, 29 Apr 2019 11:11:09 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
 by mail2.cirrus.com (Postfix) with ESMTP id 22ED1605A682;
 Mon, 29 Apr 2019 11:11:09 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 29 Apr
 2019 17:11:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 29 Apr 2019 17:11:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9EB8F45;
 Mon, 29 Apr 2019 17:11:05 +0100 (BST)
Date: Mon, 29 Apr 2019 17:11:05 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Daniel Gomez <dagmcr@gmail.com>
Message-ID: <20190429161105.GE81578@ediswmail.ad.cirrus.com>
References: <1555960430-8899-1-git-send-email-dagmcr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555960430-8899-1-git-send-email-dagmcr@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904290111
Cc: patches@opensource.cirrus.com, rf@opensource.cirrus.com,
 javier@dowhile0.org, lee.jones@linaro.org, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] spi: Madera codecs: add missing of table
	registration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Apr 22, 2019 at 09:13:50PM +0200, Daniel Gomez wrote:
> MODULE_DEVICE_TABLE(of, <of_match_table> should be called to complete DT
> OF mathing mechanism and register it.
> 
> Before this patch:
> modinfo drivers/mfd/madera-spi.ko  | grep alias
> alias:          spi:wm1840
> alias:          spi:cs47l91
> alias:          spi:cs47l90
> alias:          spi:cs47l85
> alias:          spi:cs47l35
> 
> After this patch:
> modinfo drivers/mfd/madera-spi.ko  | grep alias
> alias:          spi:wm1840
> alias:          spi:cs47l91
> alias:          spi:cs47l90
> alias:          spi:cs47l85
> alias:          spi:cs47l35
> alias:          of:N*T*Ccirrus,wm1840C*
> alias:          of:N*T*Ccirrus,wm1840
> alias:          of:N*T*Ccirrus,cs47l91C*
> alias:          of:N*T*Ccirrus,cs47l91
> alias:          of:N*T*Ccirrus,cs47l90C*
> alias:          of:N*T*Ccirrus,cs47l90
> alias:          of:N*T*Ccirrus,cs47l85C*
> alias:          of:N*T*Ccirrus,cs47l85
> alias:          of:N*T*Ccirrus,cs47l35C*
> alias:          of:N*T*Ccirrus,cs47l35
> 
> Reported-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> ---
>  drivers/mfd/madera-spi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mfd/madera-spi.c b/drivers/mfd/madera-spi.c
> index 4c398b2..1128584 100644
> --- a/drivers/mfd/madera-spi.c
> +++ b/drivers/mfd/madera-spi.c
> @@ -121,6 +121,16 @@ static const struct spi_device_id madera_spi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(spi, madera_spi_ids);
>  
> +const struct of_device_id madera_of_match[] = {
> +	{ .compatible = "cirrus,cs47l35", .data = (void *)CS47L35 },
> +	{ .compatible = "cirrus,cs47l85", .data = (void *)CS47L85 },
> +	{ .compatible = "cirrus,cs47l90", .data = (void *)CS47L90 },
> +	{ .compatible = "cirrus,cs47l91", .data = (void *)CS47L91 },
> +	{ .compatible = "cirrus,wm1840", .data = (void *)WM1840 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, madera_of_match);
> +

This is definitely an oversight but it would be worth
looking into if it is possible to use the existing table in
madera-core.c rather than adding new tables. The I2C will also
need fixed so it would be best to share.

Thanks,
Charles

>  static struct spi_driver madera_spi_driver = {
>  	.driver = {
>  		.name	= "madera",
> -- 
> 2.7.4
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
