Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64B28A143
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Oct 2020 22:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E02844;
	Sat, 10 Oct 2020 22:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E02844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602361070;
	bh=jvimFtNbFABn0j17CiptQ6gdQetdG1mXLovo07s/kP4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uTMG9nT/GvJr21Zkx3ERAzxxjlquPcJNijQOlD1SuigblDvTW7WLJyGICiJJ2sr5t
	 7lw/bh73yqOSgKEYlYqavox5W+eCWCqkiaZcP9QkmQXsZt97/2q2FWL1y6Ennun6tQ
	 fkEK3N5We3BayQVG04UEBvsJAW0Bw5l6R+U4wYsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C694F80163;
	Sat, 10 Oct 2020 22:16:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32713F80164; Sat, 10 Oct 2020 22:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C16AF80117
 for <alsa-devel@alsa-project.org>; Sat, 10 Oct 2020 22:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C16AF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="sFXPLf9L"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09AKFuWl074016;
 Sat, 10 Oct 2020 20:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Bqm+DhfmniCA+wmNe+7c8C8KBOd20O5sYP85AYHfTpg=;
 b=sFXPLf9LgjFhbYPZWAOGiMbjmqiW9vWXTpOAFJ+nB8P5W4PMVtiYLQ4hMe9AGMGjp3Sp
 ADsnrQuRW//8khrEOmuy0mjnwRYWVaKfSY1lQgIZNVDj6/a8ehf0FkhVfrB948vNMMqG
 hdC6Pd8Y66wsCtFl9BxWgJJjrY92kZv6l1pny8HPf07jd5zHOVA2WN0ELvbGN1DD/cOk
 NZilmXavX/7lfm2AL7HnP2ZAIP7iOarjTd913PoFLFAspDH1dhlsvrKN1Nhd8fI4nX+5
 vsoamIMc5ZGelauf9enD/X8lHGTTv4RgI7okTSxMgnW4+jztuytuIkHRP5qEeRgNQTxk RA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3434wk97q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 10 Oct 2020 20:15:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09AKAMem133178;
 Sat, 10 Oct 2020 20:15:55 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 34322r52h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 10 Oct 2020 20:15:55 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09AKFqQH032194;
 Sat, 10 Oct 2020 20:15:54 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 10 Oct 2020 13:15:51 -0700
Date: Sat, 10 Oct 2020 23:15:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: cezary.rojewski@intel.com
Subject: [bug report] ASoC: Intel: catpt: Firmware loading and context restore
Message-ID: <20201010201547.GA1890676@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9770
 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 suspectscore=3 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010100190
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9770
 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=3 impostorscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010100190
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

Hello Cezary Rojewski,

The patch a9aa6fb3eb6c: "ASoC: Intel: catpt: Firmware loading and
context restore" from Sep 29, 2020, leads to the following static
checker warning:

	sound/soc/intel/catpt/loader.c:654 catpt_first_boot_firmware()
	warn: consider using resource_size() here

sound/soc/intel/catpt/loader.c
   638  int catpt_first_boot_firmware(struct catpt_dev *cdev)
   639  {
   640          struct resource *res;
   641          int ret;
   642  
   643          ret = catpt_boot_firmware(cdev, false);
   644          if (ret) {
   645                  dev_err(cdev->dev, "basefw boot failed: %d\n", ret);
   646                  return ret;
   647          }
   648  
   649          /* restrict FW Core dump area */
   650          __request_region(&cdev->dram, 0, 0x200, NULL, 0);
   651          /* restrict entire area following BASE_FW - highest offset in DRAM */
   652          for (res = cdev->dram.child; res->sibling; res = res->sibling)
   653                  ;
   654          __request_region(&cdev->dram, res->end + 1,
   655                           cdev->dram.end - res->end, NULL, 0);
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^
It's been years since I have seen one of these warnings.  Back in the
day we used have have a lot of off by one warnings because resource_size()
is supposed to be calculated as "end - start + 1".  But here we are
calculating "dram.end - res->end" so I'm not sure if the math is correct
or not.  This is very new code so hopefully you know the answer off the
top of your head?

   656  
   657          ret = catpt_ipc_get_mixer_stream_info(cdev, &cdev->mixer);
   658          if (ret)
   659                  return CATPT_IPC_ERROR(ret);
   660  
   661          ret = catpt_arm_stream_templates(cdev);
   662          if (ret) {
   663                  dev_err(cdev->dev, "arm templates failed: %d\n", ret);
   664                  return ret;
   665          }
   666  
   667          /* update dram pg for scratch and restricted regions */
   668          catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
   669  
   670          return 0;
   671  }

regards,
dan carpenter
