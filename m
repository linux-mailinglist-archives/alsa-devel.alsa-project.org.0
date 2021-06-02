Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B0398131
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 08:37:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D33716E1;
	Wed,  2 Jun 2021 08:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D33716E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622615864;
	bh=BECvzOeEYR3yDzN5WLUWqq59aYHxNLZOBFeN8REEvo0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkKhSlPMOk+CdbN+T2QTQii730Y8CaoaUPNBawM7LvH1kezNdhvoG+fTPEe277Wir
	 uwU6WJkamZaQi85prta2zrslRBXS/TSO2mwOcEYYE8rgodGw1i3OmExH2dMWbVBFy0
	 V5F8e7TCeikxzFce+/z/IzYtJwJEKyAhKr1mcP78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA71CF80425;
	Wed,  2 Jun 2021 08:36:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E4E6F80424; Wed,  2 Jun 2021 08:36:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DE2F80103
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 08:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DE2F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="Gezj5ThD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1526YhjH014970; Wed, 2 Jun 2021 06:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=+gOexGANZZS/oRgP/lTbcgKz1yPXMtQU2iZfikPHFaM=;
 b=Gezj5ThDljD/iCcK+OwqhPtV9mwHPE1NNSD1g4TyGeFKHDHSR7mTKZRR3HnARmaOG9zB
 AD17ZQ6hbpV9plez57LQxwtZySLKRbR+EYVasm62cBud1IxPaVPUlUSKh8gn3ihr+koR
 1rGp6AALyBEK/eOuA+4jEkW77Lu1t6Y9wtOdntdVQ3b24WnE1X0pMeM7Tw0WFHKOCv0U
 yMYopfZNzktSvM0HzdEkyrVt10BH+DA4ncJNQyfPJ9+65vaXgO6V4HpMRQMXaWQJ70GC
 /w56rymUKBMX0Sq1tk/bS9Yi8PLqnZZzKxj88zfnuQ3+aXwWFVDlW/dQBJHe3xGcF1On 1g== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38wx9fr3q5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 06:36:01 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 1526a0B3168714;
 Wed, 2 Jun 2021 06:36:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38udeayrnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 06:36:00 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1526Zxo6168609;
 Wed, 2 Jun 2021 06:35:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 38udeayrkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Jun 2021 06:35:59 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1526Zo7V020192;
 Wed, 2 Jun 2021 06:35:55 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Jun 2021 23:35:50 -0700
Date: Wed, 2 Jun 2021 09:35:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH v2] ALSA: control led: fix memory leak in
 snd_ctl_led_register
Message-ID: <20210602063543.GB10983@kadam>
References: <20210602034136.2762497-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602034136.2762497-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: lZx4N9uLYLfLPXlB1XU0SPq9KH3jp0Eq
X-Proofpoint-ORIG-GUID: lZx4N9uLYLfLPXlB1XU0SPq9KH3jp0Eq
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Wed, Jun 02, 2021 at 11:41:36AM +0800, Dongliang Mu wrote:
> The snd_ctl_led_sysfs_add and snd_ctl_led_sysfs_remove should contain
> the refcount operations in pair. However, snd_ctl_led_sysfs_remove fails
> to decrease the refcount to zero, which causes device_release never to
> be invoked. This leads to memory leak to some resources, like struct
> device_private. In addition, we also free some other similar memory
> leaks in snd_ctl_led_init/snd_ctl_led_exit.
> 
> Fix this by replacing device_del to device_unregister
> in snd_ctl_led_sysfs_remove/snd_ctl_led_init/snd_ctl_led_exit.
> 
> Note that, when CONFIG_DEBUG_KOBJECT_RELEASE is enabled, put_device will
> call kobject_release and delay the release of kobject, which will cause
> use-after-free when the memory backing the kobject is freed at once.

(Hopefully it's clear to everyone that this is in the original code and
fixed in your patch).

> 
> Reported-by: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
> Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---

Looks perfect to me!

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

