Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE26F39436D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 15:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E45616D8;
	Fri, 28 May 2021 15:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E45616D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622208911;
	bh=ne09AXJxXv6RDuMDY54C00VKJoVg/7qd/pX7LSqoKG0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CdyFw7at/9m08CrqjaZbi0BbhCnddzmPqn/a0Ku3XPKe0Mu4megfgemeCxrAe+2FN
	 ys4d9NaWIu2kNdJABijQUg7RB/DIwHsL+SOeDo/hkvQNKQiNQDFBR6t6Kr3UXumlbQ
	 5ZWQYPhldTVqMr7f5h1P+Jnu8lPUCdygx7EosOzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8C09F804AB;
	Fri, 28 May 2021 15:33:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A4BBF804AC; Fri, 28 May 2021 15:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A78DF802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 15:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A78DF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="MGZhgWhg"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14SDKU0Q001860; Fri, 28 May 2021 13:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=HLUSfFNsvepNfOshN0c8ooQ73thlVw/e2Bq6VxGepJc=;
 b=MGZhgWhg95roXsJDEqHHYCO9dXvFbeEACtvc4AUZmGaH/OSA0LptpxmiGBe9HiKzfOuB
 YeqeRyzqFi25xsZT5aQ3FOhnWGlLt5uF5NloiM9oXt+ULCe8FAdpqzrntKJgscO9QCOH
 YDl9a1v08Bv1PpLyUKvafDTaM4Vov8lOuuHrbMftKkgASkEFVfs4aT6U02D2CDAFhC3o
 kdKM8/mz3eYEV16T+dEpVDrW3rKwyopsI86aaD4ra84Pv1UVUv2ELT77xelkgdmdI5cb
 CsQdHYjjXtv1cEkjK1TWIANUF2JFS73YioYCpsa/1SXfwRMYXPKfRqLmSsjTWisDGZq7 PA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38sn3yrwmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 13:33:27 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14SDLxuX117567;
 Fri, 28 May 2021 13:33:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38rehkyxhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 13:33:26 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14SDXPtD194449;
 Fri, 28 May 2021 13:33:25 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 38rehkyxh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 13:33:25 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14SDXISv026221;
 Fri, 28 May 2021 13:33:23 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 28 May 2021 06:33:17 -0700
Date: Fri, 28 May 2021 16:33:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Message-ID: <20210528133309.GR24442@kadam>
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: UVSJdCaZHlkVip_h0yaymPkF8ZNnex7o
X-Proofpoint-ORIG-GUID: UVSJdCaZHlkVip_h0yaymPkF8ZNnex7o
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

On Fri, May 28, 2021 at 09:17:57PM +0800, Dongliang Mu wrote:
> The snd_ctl_led_sysfs_add and snd_ctl_led_sysfs_remove should contain
> the refcount operations in pair. However, snd_ctl_led_sysfs_remove fails
> to decrease the refcount to zero, which causes device_release never to
> be invoked. This leads to memory leak to some resources, like struct
> device_private.
> 
> Fix this by calling put_device at the end of snd_ctl_led_sysfs_remove
> 
> Reported-by: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com
> Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  sound/core/control_led.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 25f57c14f294..fff2688b5019 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -371,6 +371,10 @@ static void snd_ctl_led_disconnect(struct snd_card *card)
>  	snd_ctl_led_refresh();
>  }
>  
> +static void snd_ctl_led_release(struct device *dev)
> +{
> +}

Whatever you're trying to do, adding a dummy function is never the
answer.

regards,
dan carpenter

