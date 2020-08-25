Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E45251A62
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 16:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 365601672;
	Tue, 25 Aug 2020 16:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 365601672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598364125;
	bh=6q5i+ivzJr1TKpzdOqqoz9MEUooVBB9TW7hxBGoK2TU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VCAKUKau2X/ZKopSiAks1gkslw7TZcyQQEuY7oLoUpoCV0VVaRERgBtYPi+Zhkg74
	 /2laNBAeWjQwxIn3ZG187xzyxJAP3khuj4GSf7CelzBaHgx34eLoMiLuK2d18QWkGO
	 oYCfaIH0PlhNdbwyEx0Vvyq0XpV4Jn6SVbKv5KRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF78F80260;
	Tue, 25 Aug 2020 16:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B40F8025A; Tue, 25 Aug 2020 16:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F2F0F800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 16:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F2F0F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="ZCsMvULr"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PDxE9Y074891;
 Tue, 25 Aug 2020 14:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=ug2chO0JPJZccAd487rorfPGgzxLhki0e8F6aJjpQmc=;
 b=ZCsMvULroX4RQa46fY3bNLa2bwF+pAwnIhyN6PqJtGWOlj3R8a1sZRQJryxn3/qH6/27
 bsVKNZtkqwmLOtHk3uTjuA5xS1L8s5RVLTZBC2zfm+ez7SVgklS8Qi6t9MJpgDvxIhL0
 HcrASf7SzyxHL2JQEqFOIGpOdr1b+CmwCeMTlL7V+SRUv1NyGCU8YbyI3Gqx1NT7lJMC
 ykdBC+2mVkxOgcl66l759PK38+vUOHfy8o3m3YUTE7xGQKI61mpwO8qeI1oliPakK+LV
 1foY6q4l8G1l7IdpGxXqECcBalod0JNEXQmbLoLkaGmlVM2AJ3A18kp/CNXMaVs5XXAR mQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 333w6ts5ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Aug 2020 14:00:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07PDsmMJ174754;
 Tue, 25 Aug 2020 13:58:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 333r9jwmnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Aug 2020 13:58:08 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07PDw6Wg030107;
 Tue, 25 Aug 2020 13:58:07 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Aug 2020 06:58:05 -0700
Date: Tue, 25 Aug 2020 16:58:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Sit, Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [bug report] ASoC: Intel: KMB: Enable TDM audio capture
Message-ID: <20200825135800.GS5493@kadam>
References: <20200825132102.GA306074@mwanda>
 <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CE6D3DA0-65A3-42BA-8341-13A3C6E80A55@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9723
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008250106
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Sia,
 Jee Heng" <jee.heng.sia@intel.com>
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

On Tue, Aug 25, 2020 at 01:49:25PM +0000, Sit, Michael Wei Hong wrote:
> 
> 
> > On 25 Aug 2020, at 9:21 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > ﻿Hello Michael Sit Wei Hong,
> > 
> > The patch 9c3bab3c4f15: "ASoC: Intel: KMB: Enable TDM audio capture"
> > from Aug 11, 2020, leads to the following static checker warning:
> > 
> >    sound/soc/intel/keembay/kmb_platform.c:518 kmb_dai_hw_params()
> >    warn: potential ! vs ~ typo
> > 
> > sound/soc/intel/keembay/kmb_platform.c
> >   502          }
> >   503  
> >   504          config->chan_nr = params_channels(hw_params);
> >   505  
> >   506          switch (config->chan_nr) {
> >   507          case 8:
> >   508          case 4:
> >   509                  /*
> >   510                   * Platform is not capable of providing clocks for
> >   511                   * multi channel audio
> >   512                   */
> >   513                  if (kmb_i2s->master)
> >   514                          return -EINVAL;
> >   515  
> >   516                  write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
> >   517                                  (config->data_width << DATA_WIDTH_CONFIG_BIT) |
> >   518                                  !MASTER_MODE | TDM_OPERATION;
> >                                        ^^^^^^^^^^^^
> > MASTER_MODE is BIT(13).  It's unclear what this is supposed to be.  My
> > best guess is that the ! should just be deleted.
> 
> This ! is intentional because it is meant to be Slave mode. Would a better approach be to create another #define for slave mode?

In my opinion, it's better to just leave it out.  ORing with zero causes
a different static checker warning on my unreleased checks...  Is it
0 << 13?  I feel like ORing with zero just makes things more confusing.

regards,
dan carpenter

