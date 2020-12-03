Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510E2CD9BF
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 16:02:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4EA51823;
	Thu,  3 Dec 2020 16:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4EA51823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607007750;
	bh=5bjB6PQ8PRj0q39g55bb3rSaZsRqM/s7Wnh/DY9boPo=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PohQpvgqhLbBknk0wgDtAvznlvt3W9ku5Z6m+WsqId+j8NnQ0zRThhNyXDQL4esEn
	 PqBzz2CCx6Tb5URRW9yynftnLwll4ltD/RVS2MjLmEhqdcgpgZ9PGYCfFMaId5khlk
	 wmq46ZDBdkKof/idoAM63oINE/wY4Y0XqaW3YhKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4560F8012A;
	Thu,  3 Dec 2020 16:00:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61C04F8016D; Thu,  3 Dec 2020 16:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F30FAF8012A
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 16:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F30FAF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Mk4xS5FF"
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3Extcs163614;
 Thu, 3 Dec 2020 15:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=rNLRXiNThiGHAf6b3uWN9SDwMshmlc+M2pXjau3jS/A=;
 b=Mk4xS5FFUwBe0wlr0qJwTvPhmiYS1A92lZPVTXh5qoI0IQ5hV1T1jKNJi84NTjGT6AXY
 dfi4uiEgiMOLZ+Tp6uQU7jyYlsUUjriJQCs9v0XcRY2vpT6Dcjyovuxw5wQecupDysuD
 C8IFl9j7W+5/ztvDPhHx1GwPMlMTGNzqX1Kk+SZPcM8EHyS65v3AjRnwqbzOdp9/lwim
 9U99fpKSpzRDymNDIOcTuo9Zigx8sva87MbayPaejAcbkUMEDpQcNXLEfG6f9rW8VTI/
 FQEh0r7Kf29n04gzfjkZrADrxQITp2DQdogciTt1uSV2CinwhAEm1K1BCxLQsvaCqjRn FA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 353dyqxe6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 15:00:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B3EuDJK106550;
 Thu, 3 Dec 2020 14:58:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 3540f1y3qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 14:58:44 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B3EwfNr029861;
 Thu, 3 Dec 2020 14:58:43 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 14:58:41 +0000
Date: Thu, 3 Dec 2020 17:58:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: codrin.ciubotariu@microchip.com
Subject: [bug report] ASoC: mchp-spdifrx: add driver for SPDIF RX
Message-ID: <X8j9HPrdXRy5IDvd@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=3 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=720
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 clxscore=1011 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=706
 suspectscore=3 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030092
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

Hello Codrin Ciubotariu,

The patch ef265c55c1ac: "ASoC: mchp-spdifrx: add driver for SPDIF RX"
from Oct 2, 2020, leads to the following static checker warning:

	sound/soc/atmel/mchp-spdifrx.c:468 mchp_spdifrx_hw_params()
	warn: 'dev->gclk' not released on lines: 468.

sound/soc/atmel/mchp-spdifrx.c
   442                          params_format(params));
   443                  return -EINVAL;
   444          }
   445  
   446          if (dev->gclk_enabled) {
   447                  clk_disable_unprepare(dev->gclk);
   448                  dev->gclk_enabled = 0;
   449          }
   450          ret = clk_set_min_rate(dev->gclk, params_rate(params) *
   451                                            SPDIFRX_GCLK_RATIO_MIN + 1);
   452          if (ret) {
   453                  dev_err(dev->dev,
   454                          "unable to set gclk min rate: rate %u * ratio %u + 1\n",
   455                          params_rate(params), SPDIFRX_GCLK_RATIO_MIN);
   456                  return ret;
   457          }
   458          ret = clk_prepare_enable(dev->gclk);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   459          if (ret) {
   460                  dev_err(dev->dev, "unable to enable gclk: %d\n", ret);
   461                  return ret;
   462          }
   463          dev->gclk_enabled = 1;
   464  
   465          dev_dbg(dev->dev, "GCLK range min set to %d\n",
   466                  params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
   467  
   468          return regmap_write(dev->regmap, SPDIFRX_MR, mr);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Smatch is complaining that if the regmap_write() fails then we should
disable and unprepare the "dev->gclk".

   469  }

regards,
dan carpenter
