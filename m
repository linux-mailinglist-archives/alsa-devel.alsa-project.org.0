Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B974EDE
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCFC71B10;
	Thu, 25 Jul 2019 15:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCFC71B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060322;
	bh=I+/n9+Ov4i1MwavP7fYLQohgCDf9ruGmVdFvywNzGkw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0zxw99REs5VsUHAu/+nKq6LmbGViq5eB1QXBFOnak8jMNoljrjbD+4zEnQ8+Ipko
	 fHDL8R81eQaIa0c5BZRcQ2uu70pbnQ58OwQtbj7w3AIp+nV7FTzK0HUHpDQNfGPZOm
	 PQszWtM8YjC6P9yI8Cote4j3ugESrVkGqySHw4vo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C9A6F8015A;
	Thu, 25 Jul 2019 15:10:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6218DF803D0; Thu, 25 Jul 2019 15:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9C71F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C71F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YppvM7TD"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x6PD9ZOP004963; Thu, 25 Jul 2019 08:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=W6D+mxnioMqoWu1TbB41cDEFI4NluWOE/Ium4D2McLQ=;
 b=YppvM7TD14tIMcgHNxPXJCJzNvVohCQezycNG+oCns+Bcx4LLlwg9I5xoSrh6QcPzQcY
 4r4H4xL8Bbep7F3U3QBily7Mk2rb+wS522Qllkjj9avDRQYxqqW8q3bAzl5+/YkCZvnS
 m7xcZTgxhoU4MjwwG4EFH2J4Aqo14FICCA3zLSDNy4eUDXh+Pyq9MbM7qVteVmMZfGui
 78I/rhJwuyfESvyxD3yDH15SiJvb/gtm/PZgap8BuXX8a83fBjN7dY6E6dmEWBrVGCd+
 bVdJsbeEzxPMuhqqlsLTCJqoyrIstq2wT5ZaBOitsRemodOUxZwqPOeJndmXqB7I9MRz xw== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 2tx61nk3j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 25 Jul 2019 08:10:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 25 Jul
 2019 14:10:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Thu, 25 Jul 2019 14:10:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C39342A1;
 Thu, 25 Jul 2019 14:10:09 +0100 (BST)
Date: Thu, 25 Jul 2019 14:10:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190725131009.GZ54126@ediswmail.ad.cirrus.com>
References: <20190725123152.28179-1-ckeepax@opensource.cirrus.com>
 <20190725124732.GA4213@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725124732.GA4213@sirena.org.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1907250154
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: cs47l15: Add codec driver for
 Cirrus Logic CS47L15
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

On Thu, Jul 25, 2019 at 01:47:33PM +0100, Mark Brown wrote:
> On Thu, Jul 25, 2019 at 01:31:51PM +0100, Charles Keepax wrote:
> 
> >  	select SND_SOC_CS47L24 if MFD_CS47L24
> > +	select SND_SOC_CS47L15 if MFD_CS47L15
> >  	select SND_SOC_CS47L35 if MFD_CS47L35
> 
> The Makefile and Kconfig sorting is a bit off.  Please send a followup
> fixing this.
> 

Can do.

> > +static irqreturn_t cs47l15_adsp2_irq(int irq, void *data)
> > +{
> > +	struct cs47l15 *cs47l15 = data;
> > +	struct madera_priv *priv = &cs47l15->core;
> > +	struct madera *madera = priv->madera;
> > +	int ret;
> > +
> > +	ret = wm_adsp_compr_handle_irq(&priv->adsp[0]);
> > +	if (ret == -ENODEV) {
> > +		dev_err(madera->dev, "Spurious compressed data IRQ\n");
> > +		return IRQ_NONE;
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static irqreturn_t cs47l15_dsp_bus_error(int irq, void *data)
> > +{
> > +	struct wm_adsp *dsp = (struct wm_adsp *)data;
> > +
> > +	return wm_adsp2_bus_error(dsp);
> > +}
> 
> Noticeable difference in pattern between these two interrupt helpers
> (and makes me wonder why we need the wrappers at all).

Yeah there doesn't seem to be any need for the wrappers.

I will respin the series and fixup these two issues.

Thanks,
Charles
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
