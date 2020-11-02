Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D72A2C25
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 14:55:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ADDF16FF;
	Mon,  2 Nov 2020 14:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ADDF16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604325308;
	bh=Y0jhN3/yz16pmSvMySEIR3NNb1IMG6HGjn6qHB/sC4s=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sqGFUF7x4RjtPB3V9dVOlgi0W7pGUJBAsLW9d7zcGv6QKADH66q0ovDdhu4SND4Ty
	 bVZQTbfxAz/tC8qcGxVTPSM8TIJakaM9lCEUmTd/mtXMwluiVTv9s13zP5MKkzv0dn
	 x15oNci7bR/PqqinY6jyuRMOrXc+i4pcMKphXfmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F39F80234;
	Mon,  2 Nov 2020 14:53:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00E88F80232; Mon,  2 Nov 2020 14:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 880D8F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 14:53:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 880D8F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="xd+2AV/7"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A2DnLqt169159;
 Mon, 2 Nov 2020 13:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=LFXAmn7suagsiua0G6v2ocK5iAJrjIEdCRXSuFoOXR4=;
 b=xd+2AV/7OzF7U4iXU65Abr6wr0mbWWa8aON9DJB/zYKIMojcCRybIuNNORl8BQ72Vjjh
 WP1UBxKtr6kvraZYKzYzoGx2fDHAuVu+qzghzVgnC6HstjEGcxygZLyel/O9Hryk0I72
 PnoZ04ZhLo38o+uC9xmIC1v8z5upJ+Ku7Jow2CSV4R0qEQaQhpdwRg/mr80O21aCare4
 SmYNtwyewzYdUMKNtLzYWPnvDeuvAyGhXz+HaG+21QYOYZ1RIN2ztucxKIciYGDRhmtX
 0F4U3i0tbDc3q9ZenPuVHF57EhavXVkShfkqYIBIMMalce8th+vfDcc33Onp52OHUkl1 dQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34hhvc3xfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 02 Nov 2020 13:53:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A2DojEi147563;
 Mon, 2 Nov 2020 13:53:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 34jf46jdjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Nov 2020 13:53:25 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A2DrNoi009785;
 Mon, 2 Nov 2020 13:53:24 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Nov 2020 05:53:22 -0800
Date: Mon, 2 Nov 2020 16:53:17 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: viorel.suman@nxp.com
Subject: [bug report] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20201102135317.GA41527@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=3 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=749 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=3
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=761
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020110
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

Hello Viorel Suman,

The patch 28564486866f: "ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI
driver" from Oct 13, 2020, leads to the following static checker
warning:

	sound/soc/fsl/fsl_xcvr.c:393 fsl_xcvr_en_aud_pll()
	warn: 'xcvr->phy_clk' not released on lines: 373.

sound/soc/fsl/fsl_xcvr.c
   351  static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
   352  {
   353          struct device *dev = &xcvr->pdev->dev;
   354          int ret;
   355  
   356          clk_disable_unprepare(xcvr->phy_clk);
   357          ret = clk_set_rate(xcvr->phy_clk, freq);
   358          if (ret < 0) {
   359                  dev_err(dev, "Error while setting AUD PLL rate: %d\n", ret);
   360                  return ret;
   361          }
   362          ret = clk_prepare_enable(xcvr->phy_clk);
   363          if (ret) {
   364                  dev_err(dev, "failed to start PHY clock: %d\n", ret);
   365                  return ret;
   366          }
   367  
   368          /* Release AI interface from reset */
   369          ret = regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_SET,
   370                             FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
   371          if (ret < 0) {
   372                  dev_err(dev, "Error while setting IER0: %d\n", ret);

clck_disable_unprepare(xcvr->phy_clk)?

   373                  return ret;
   374          }
   375  
   376          if (xcvr->mode == FSL_XCVR_MODE_EARC) { /* eARC mode */
   377                  /* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
   378                  fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
   379                                    FSL_XCVR_PHY_CTRL_TSDIFF_OE |
   380                                    FSL_XCVR_PHY_CTRL_PHY_EN, 1);
   381                  /* PHY: CTRL2_SET: EARC_TX_MODE */
   382                  fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
   383                                    FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1);
   384          } else { /* SPDIF mode */
   385                  /* PHY: CTRL_SET: TX_CLK_AUD_SS | SPDIF_EN */
   386                  fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
   387                                    FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS |
   388                                    FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
   389          }
   390  
   391          dev_dbg(dev, "PLL Fexp: %u\n", freq);
   392  
   393          return 0;
   394  }


regards,
dan carpenter
