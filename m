Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906A2CDDDF
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 19:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 059C9167B;
	Thu,  3 Dec 2020 19:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 059C9167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607020946;
	bh=vOq4X8S2EngI26PLPSEJh7qV3+92izGH5SDul3HK02A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbPVVLpNrgRO9f3uPjWbgFOletoLmeiiqRvdOyaWDsOz90B7jWCoBi5vCgBak8s4a
	 5FTFTEmTKvUiVAKl26zf9ws2w+daUxjN6jOL97vVx3LQZqap/0eNYk6PuvmnvTE4lN
	 LBtk+3Q7edU/UhJIYaXaaK3xTzSLRaCDE4EyslMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 065B7F80254;
	Thu,  3 Dec 2020 19:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5DC9F8016D; Thu,  3 Dec 2020 19:40:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D9EBF8012A
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 19:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D9EBF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ibtKM/2U"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3Ic4vK180593;
 Thu, 3 Dec 2020 18:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=fPZwE8lpjSQ2WVrYedg68rx6EHHXQcpcgJ9Ne6tL6uQ=;
 b=ibtKM/2UIwdGvOIXvsOmCjjTyMjUqCQx2Waz0R6uxpGLVE/7OS1sKpCeqbDtJwTfseos
 oOQzwQ9eQL2H7fDcGSGlVeBQcwNrkc06021Mj8B9wAb0PEDKfTYUTr9X3bXEoYPGIeNP
 alD+DSJHKNMFgVkNxl47dxroPaRmi4GcYvwxvCodQUzdt5mLDswSPORvpD7lrPh+iyDR
 dqNPx6Cc/sJxvnqLa3d2y53CFy4umHfBcq+DhLID04EVubCuqH+J3AyhplGNrC4wjpE7
 Xkn/p9n5Ztf+u0/lnJuMMIcDvPytTtoEIz0NWtgst4vqD090NwsvtQ0AKZXhAE9pj7It tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 353egkyk99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 18:40:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3IaYxQ193769;
 Thu, 3 Dec 2020 18:38:36 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35404r7td0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 18:38:36 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B3IcTNJ001612;
 Thu, 3 Dec 2020 18:38:35 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 10:38:29 -0800
Date: Thu, 3 Dec 2020 21:38:23 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [bug report] ASoC: mchp-spdifrx: add driver for SPDIF RX
Message-ID: <20201203183823.GQ2789@kadam>
References: <X8j9HPrdXRy5IDvd@mwanda>
 <f58f5379-c645-6a0c-5345-88b72e4492a5@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f58f5379-c645-6a0c-5345-88b72e4492a5@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030109
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9824
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=3
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030109
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

On Thu, Dec 03, 2020 at 03:31:33PM +0000, Codrin.Ciubotariu@microchip.com wrote:
> On 03.12.2020 16:58, Dan Carpenter wrote:
> > Hello Codrin Ciubotariu,
> > 
> > The patch ef265c55c1ac: "ASoC: mchp-spdifrx: add driver for SPDIF RX"
> > from Oct 2, 2020, leads to the following static checker warning:
> > 
> >          sound/soc/atmel/mchp-spdifrx.c:468 mchp_spdifrx_hw_params()
> >          warn: 'dev->gclk' not released on lines: 468.
> > 
> > sound/soc/atmel/mchp-spdifrx.c
> >     442                          params_format(params));
> >     443                  return -EINVAL;
> >     444          }
> >     445
> >     446          if (dev->gclk_enabled) {
> >     447                  clk_disable_unprepare(dev->gclk);
> >     448                  dev->gclk_enabled = 0;
> >     449          }
> >     450          ret = clk_set_min_rate(dev->gclk, params_rate(params) *
> >     451                                            SPDIFRX_GCLK_RATIO_MIN + 1);
> >     452          if (ret) {
> >     453                  dev_err(dev->dev,
> >     454                          "unable to set gclk min rate: rate %u * ratio %u + 1\n",
> >     455                          params_rate(params), SPDIFRX_GCLK_RATIO_MIN);
> >     456                  return ret;
> >     457          }
> >     458          ret = clk_prepare_enable(dev->gclk);
> >                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> >     459          if (ret) {
> >     460                  dev_err(dev->dev, "unable to enable gclk: %d\n", ret);
> >     461                  return ret;
> >     462          }
> >     463          dev->gclk_enabled = 1;
> >     464
> >     465          dev_dbg(dev->dev, "GCLK range min set to %d\n",
> >     466                  params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
> >     467
> >     468          return regmap_write(dev->regmap, SPDIFRX_MR, mr);
> >                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Smatch is complaining that if the regmap_write() fails then we should
> > disable and unprepare the "dev->gclk".
> > 
> >     469  }
> > 
> 
> Thanks for reporting this Dan. hw_free() callback is still called if 
> hw_params() fails, which will unprepare gclk, but I guess it doesn't 
> hurt to add what you suggested.

It might hurt if it leads to a double free...  Just leave it as is.
This is a new warning message for Smatch and I'm still working out the
kinks.

regards,
dan carpenter

