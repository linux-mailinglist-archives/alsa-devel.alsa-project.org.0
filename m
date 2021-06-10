Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAB13A237F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 06:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B08170C;
	Thu, 10 Jun 2021 06:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B08170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623299152;
	bh=iJ2hzCrEGtUCbPcoYko8dxZfARs7ZnGfGMItx27Tf+Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zz0zuTC1bFO1ixoC3htClWDGw3mnORyCnk0a1T7PSzRpVNN/vBLPz7N/c5Rp+TKJd
	 BulmwixJB3EUdfJksz+RjCc27kOupGc7lzplyrpX5CDR5C5F0JHw3AR1q63Bt7rdol
	 RSitv9Nr2zwEHJMNMZNQlvAsGhfnSiBDyW8zfhCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A21F80227;
	Thu, 10 Jun 2021 06:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F103CF80218; Thu, 10 Jun 2021 06:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A69EF800FC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 06:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A69EF800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="mSI1Wles"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15A4Bsbw142920;
 Thu, 10 Jun 2021 04:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=LEazC6ogr6hCMNVqjWODl0cQvkfwPbczvSsd5csdXpU=;
 b=mSI1WlesUb5uTLSKMXiSVe1dYGZ2v6/og4P/XO4QwA0YusTm10xV+v3I5ltDaENB7b0d
 LKnaNtsQTLldzE/y8UMsP/7VHQvryR7mbZnm9ORBZ/B6hfs/URAqm3LI+WAeZePvxoOE
 FQdVejg00TZ6+IgNrDVl3wKQ+ChHMZMbpuJ+dcQ7fbD10rAANMk05tjcJh8HJWjujeeZ
 tQiyYAmbCii/Ohc9gTJVsGke0AXhfur9HVz/mFDhZi/CUd7x8XZ9r6IeieaC2ljLWMY/
 DyXDtRok2KguRnLMzTc3gE5AugkCb+Sk4L/PoicusUvrEw+sue3T7XvQurHM5xtOc7I1 UQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3900psass4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 04:24:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15A4AQh2144349;
 Thu, 10 Jun 2021 04:24:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 38yxcw8hsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 04:24:13 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15A4OCFA166307;
 Thu, 10 Jun 2021 04:24:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 38yxcw8hs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 04:24:12 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15A4O7M8015222;
 Thu, 10 Jun 2021 04:24:11 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Jun 2021 21:24:06 -0700
Date: Thu, 10 Jun 2021 07:24:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [bug report] ASoC: rsnd: add null CLOCKIN support
Message-ID: <20210610042400.GU10983@kadam>
References: <YMCmhfQUimHCSH/n@mwanda>
 <87tum6booi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tum6booi.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: _7OdBs7zcQhrzcq2zFOz7Fgl06TZjo-u
X-Proofpoint-ORIG-GUID: _7OdBs7zcQhrzcq2zFOz7Fgl06TZjo-u
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10010
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100026
Cc: alsa-devel@alsa-project.org
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

On Thu, Jun 10, 2021 at 08:31:25AM +0900, Kuninori Morimoto wrote:
> 
> Hi Dan
> 
> Thank you for your research.
> 
> > sound/soc/sh/rcar/adg.c
> >    423  static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
> >    424  {
> >    425          struct rsnd_adg *adg = priv->adg;
> >    426          struct device *dev = rsnd_priv_to_dev(priv);
> >    427          struct clk *clk;
> >    428          int i;
> >    429  
> >    430          for (i = 0; i < CLKMAX; i++) {
> >    431                  clk = devm_clk_get(dev, clk_name[i]);
> > 
> > If devm_clk_get() returns NULL that's not an error.
> > 
> > 
> >    432  
> >    433                  if (IS_ERR(clk))
> >    434                          clk = rsnd_adg_null_clk_get(priv);
> > 
> > But I think if rsnd_adg_null_clk_get() returns an error then it is an
> > error.
> > 
> > 
> >    435                  if (IS_ERR(clk))
> > 
> > This is impossible.
> > 
> >    436                          goto err;
> > 
> > So I think it should be:
> > 
> > 			if (IS_ERR(clk)) {
> > 				clk = rsnd_adg_null_clk_get(priv);
> > 				if (!clk)
> > 					goto err;
> > 			}
> 
> Hmm indeed. Thank you for your report, I didn't notice about it.
> How about this ?
> 
> ----------
> diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
> index 0ebee1ed06a9..2b05a1568ee8 100644
> --- a/sound/soc/sh/rcar/adg.c
> +++ b/sound/soc/sh/rcar/adg.c
> @@ -393,7 +393,7 @@ static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
>  	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
>  	if (IS_ERR(clk)) {
>  		dev_err(dev, "create null clk error\n");
> -		return NULL;
> +		return PTR_ERR(clk);

Yes, I think this part is correct.  If an error happens, then it should
be reported to the user so they can fix it.

>  	}
>  
>  	return clk;
> @@ -430,9 +430,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
>  	for (i = 0; i < CLKMAX; i++) {
>  		clk = devm_clk_get(dev, clk_name[i]);
>  
> -		if (IS_ERR(clk))
> +		if (IS_ERR_OR_NULL(clk))
>  			clk = rsnd_adg_null_clk_get(priv);
> -		if (IS_ERR(clk))
> +		if (IS_ERR_OR_NULL(clk))
>  			goto err;

But this is not correct.

If a function like devm_clk_get() returns NULL, then it's not an error,
it's something where the user deliberately chose to disable the feature.
It shouldn't trigger an error message and the rest of the driver should
be written to accomodate it.

>  
>  		adg->clk[i] = clk;

So we should assign the NULL pointer here and add NULL checks to make
sure that it doesn't lead to a NULL dereference.

regards,
dan carpenter

