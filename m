Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96959398A29
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 15:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9D316EC;
	Wed,  2 Jun 2021 15:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9D316EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622638891;
	bh=nzgHzwbUpgqPua2cQmb7bmCAvymajUYhH4xtLt2lqnA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fdhmdpLIITESDnfrE8k90ey87i1XGPBuUi+iE1h7vehnbru5O9wzRtRWriESK53JA
	 GVToxyNJuvO3PwN9pCpcQhi0Tly25oBo+WJpVWUviYd966BA6DT7veLKPg3Cj/XxRP
	 HRZFaqaY/p7rt3hWAUzF9kesfw0hYB9FlCEAmTbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD50F80424;
	Wed,  2 Jun 2021 15:00:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 794A0F80424; Wed,  2 Jun 2021 14:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0097F80273
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 14:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0097F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="JLFH5iDt"
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 152Cxoc9183113;
 Wed, 2 Jun 2021 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=1R7T0QXg4/jFOmzmpFNfHhozecnbfAJFdgFogQ3bmAs=;
 b=JLFH5iDtHLTG1ABNzcwV68rrdImg3t0M8lObuEISyrV6WRHgwbKLvf2SsG57GlR1hHqx
 /K9LJIi2NYqa+CTadnwILztFq+hcjO7AOCenMEbH18mBnBMdo0WHU0FtORme5Hn/yHMy
 xaZQHbIb54aFAz1SKbgk/d886LiFNFUsnSttsCOiEQh0CS5o/H7WpOwWpTJ2zf/qVKnW
 eFroC4YYRGvdNPUHcNbyzw8rvAm2nOUonxE5grgsS+y/pKb4rGo8Em8qQMPfYmbv2axi
 1va7Kl9bLX5eHRS7BoIeXQvAArs4wmj8gXh5DM61nepNi8pTLEJCBjb30ikebnSdNarw uQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 38ub4crhv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 12:59:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 152Cvm2K125892;
 Wed, 2 Jun 2021 12:59:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38udebsfng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 12:59:49 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 152CxR0i141818;
 Wed, 2 Jun 2021 12:59:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 38udebsfmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 12:59:49 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 152Cxl3K014595;
 Wed, 2 Jun 2021 12:59:48 GMT
Received: from mwanda (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 02 Jun 2021 12:59:46 +0000
Date: Wed, 2 Jun 2021 15:59:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: shuah@kernel.org
Subject: [bug report] media: sound/usb: Use Media Controller API to share
 media resources
Message-ID: <YLeAvT+R22FQ/Eyw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: OphAyjX_0shjzV_nSqH0q3Q6BEsaZb-s
X-Proofpoint-ORIG-GUID: OphAyjX_0shjzV_nSqH0q3Q6BEsaZb-s
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10002
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 mlxscore=0
 mlxlogscore=901 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106020084
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

Hello Shuah Khan,

The patch 66354f18fe5f: "media: sound/usb: Use Media Controller API
to share media resources" from Apr 1, 2019, leads to the following
static checker warning:

	sound/usb/media.c:287 snd_media_device_create()
	warn: 'mdev' can also be NULL

sound/usb/media.c
   270  
   271          mdev = media_device_usb_allocate(usbdev, KBUILD_MODNAME, THIS_MODULE);
                ^^^^

If CONFIG_MEDIA_CONTROLLER is disabled then "mdev" is NULL.

   272          if (IS_ERR(mdev))
   273                  return -ENOMEM;
   274  
   275          /* save media device - avoid lookups */
   276          chip->media_dev = mdev;
   277  
   278  snd_mixer_init:
   279          /* Create media entities for mixer and control dev */
   280          ret = snd_media_mixer_init(chip);
   281          /* media_device might be registered, print error and continue */
   282          if (ret)
   283                  dev_err(&usbdev->dev,
   284                          "Couldn't create media mixer entities. Error: %d\n",
   285                          ret);
   286  
   287          if (!media_devnode_is_registered(mdev->devnode)) {
                                                 ^^^^^^^^^^^^^
dereferenced without checking here

   288                  /* dont'register if snd_media_mixer_init() failed */
   289                  if (ret)
   290                          goto create_fail;
   291  
   292                  /* register media_device */
   293                  ret = media_device_register(mdev);
   294  create_fail:
   295                  if (ret) {
   296                          snd_media_mixer_delete(chip);
   297                          media_device_delete(mdev, KBUILD_MODNAME, THIS_MODULE);
   298                          /* clear saved media_dev */
   299                          chip->media_dev = NULL;
   300                          dev_err(&usbdev->dev,
   301                                  "Couldn't register media device. Error: %d\n",
   302                                  ret);
   303                          return ret;
   304                  }
   305          }
   306  
   307          return ret;
   308  }

regards,
dan carpenter
