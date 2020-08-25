Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DCE251976
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 15:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5178E1673;
	Tue, 25 Aug 2020 15:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5178E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598361785;
	bh=022JqIhdRQK8u2oQBk4DKotj/DXam5vaf+7NHWvvCRE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m2sDsR5X+QmoLhqa6Gdnix6V5/LC3XhiJnDsCvBQ/iZxiFUuKprOugBatjiVZUcvF
	 ewaMPUV6EAcISxFOBQZJPTzlfnHkOx4pVors46Vuc1/IOEvfuTt6JPDmV+jyk9ZvUl
	 LfmdLoSMSPrLr8YunOLemjtKG0mRsbvv/k/FXgqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F445F80260;
	Tue, 25 Aug 2020 15:21:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3311F8025A; Tue, 25 Aug 2020 15:21:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2294F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 15:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2294F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="aa5ebGcp"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PDFF3f192558;
 Tue, 25 Aug 2020 13:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=pelA2eyuxKM5cZPWWuWz7mXWEUYlVu8xXgFI1qKY+vg=;
 b=aa5ebGcpnSvxKF7AqVUvrUYDw9BscSYd2LVdvXHQY6sgjSox7JgsdCXE1TLxP4xuGBUd
 u1oRELCZQV9vJXo21lPmh+hlfNZkn2mkYfKN/usOovrruP40ggTa0tqiNOZVvk87vLFG
 vMrHoNIfE7WnnbBe7X3lSaC3AU0FrT36x6GEeQ5aWhnL7eHB6AXw2Q0uR5spQg89SeSd
 lft6E9dZbUa0mw6WIsvwB4Dqd4tvD3vEe0oxpTvR3OU1Igza5Ac3rl9PmGB5S0nO+GFi
 wp41QTasHBiZHlJjiEddP2ZAO8Jw3Ujhed6752AjTKMX1dPHvpLNSOEn1c5eZ9dkurFa Zg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 333w6trxsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Aug 2020 13:21:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PDKDmE182699;
 Tue, 25 Aug 2020 13:21:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 333ru7h0x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 13:21:10 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07PDL7Ze016573;
 Tue, 25 Aug 2020 13:21:09 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Aug 2020 06:21:07 -0700
Date: Tue, 25 Aug 2020 16:21:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: michael.wei.hong.sit@intel.com
Subject: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Message-ID: <20200825132102.GA306074@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=790
 phishscore=0
 bulkscore=0 suspectscore=3 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 mlxlogscore=780 suspectscore=3 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250100
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

Hello Michael Sit Wei Hong,

The patch 9c3bab3c4f15: "ASoC: Intel: KMB: Enable TDM audio capture"
from Aug 11, 2020, leads to the following static checker warning:

	sound/soc/intel/keembay/kmb_platform.c:518 kmb_dai_hw_params()
	warn: potential ! vs ~ typo

sound/soc/intel/keembay/kmb_platform.c
   502          }
   503  
   504          config->chan_nr = params_channels(hw_params);
   505  
   506          switch (config->chan_nr) {
   507          case 8:
   508          case 4:
   509                  /*
   510                   * Platform is not capable of providing clocks for
   511                   * multi channel audio
   512                   */
   513                  if (kmb_i2s->master)
   514                          return -EINVAL;
   515  
   516                  write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
   517                                  (config->data_width << DATA_WIDTH_CONFIG_BIT) |
   518                                  !MASTER_MODE | TDM_OPERATION;
                                        ^^^^^^^^^^^^
MASTER_MODE is BIT(13).  It's unclear what this is supposed to be.  My
best guess is that the ! should just be deleted.

   519  
   520                  writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
   521                  break;
   522          case 2:
   523                  /*
   524                   * Platform is only capable of providing clocks need for
   525                   * 2 channel master mode
   526                   */
   527                  if (!(kmb_i2s->master))
   528                          return -EINVAL;
   529  
   530                  write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
   531                                  (config->data_width << DATA_WIDTH_CONFIG_BIT) |
   532                                  MASTER_MODE | I2S_OPERATION;
   533  
   534                  writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
   535                  break;
   536          default:
   537                  dev_dbg(kmb_i2s->dev, "channel not supported\n");
   538                  return -EINVAL;
   539          }

regards,
dan carpenter
