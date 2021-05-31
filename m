Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54478395967
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 13:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D525684C;
	Mon, 31 May 2021 13:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D525684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622459026;
	bh=RFNTQk0WGmnRHI/qM20A10JgbeJSGdEy8yZrvmLviKw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XDgjAUoqqTKo2/tE/QfD+OEbX8umLKgmwyyWhXiY+I+d5CctIA/G6pqS3UpIh4vNF
	 wS+KCqRhJ7lnU+CGwrt96lrpDwmxrC8b/Q6l4+EZ0lxggA2W6XaK5oNM35b1m97RN9
	 E3TKC8yhMYBjpUOZfQS6p1bfb+lUo7UE5ShKdTyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31271F80088;
	Mon, 31 May 2021 13:02:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87ECEF802E2; Mon, 31 May 2021 13:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0EFFF80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 13:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0EFFF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="b6Y+uTIU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14VAxX4d006324; Mon, 31 May 2021 11:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6U6dXdZ6BaD0EcTa1qPwuG+hENq3EURvA/7zTs0XMGw=;
 b=b6Y+uTIUDE4XnGwpsYYC9romlLM6sSF/EiR2/bQcXefbad28tHSptGXbsgXK1SXoiDLr
 9Ee2dgEJ3ovDihu0ML/lbYsbMvgE9SxJ05q9B/fANyH9n5eWaz78MrTWyh3WrqVl+0OS
 jzydGje8WFok3pf+JymAftV5c8hxllDSAkZdx0SgY9bkj9cPbMjAHeENP3Y/b13qDCNv
 SyBdrzu5oujuvzHMOOrWOdUuJKRAKj9JInfj4bTZxETi74gF6T06O/EqAr0jJIAN5sUH
 XR3599p49YhS/pRGegLanYN661zEMARxLz8Fmw/ZDPs+KTIksn4Ejdls4U+F0bSUaOzu wA== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 38vj1kr71b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 11:02:00 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14VB1xrR135920;
 Mon, 31 May 2021 11:01:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38uycqa3nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 11:01:59 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14VAxpwU131422;
 Mon, 31 May 2021 11:01:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 38uycqa3nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 11:01:59 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14VB1qXr008565;
 Mon, 31 May 2021 11:01:56 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 31 May 2021 11:01:51 +0000
Date: Mon, 31 May 2021 14:01:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
Message-ID: <20210531110144.GA24442@kadam>
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: ge1lDP6nbaKCSJI9CWpTy8vfkB6ae4bl
X-Proofpoint-GUID: ge1lDP6nbaKCSJI9CWpTy8vfkB6ae4bl
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

Just to clarify again some more, this call back has to free "led_card".
This patch changes the memory leak into a use after free bug. (A use
after free bug is worse than a memory leak).

There were some other leaks as discussed where a dummy free function is
fine because they were dealing with static data structures (not
allocated memory).

> +
>  /*
>   * sysfs
>   */
> @@ -663,6 +667,7 @@ static void snd_ctl_led_sysfs_add(struct snd_card *card)
>  		led_card->number = card->number;
>  		led_card->led = led;
>  		device_initialize(&led_card->dev);
> +		led_card->dev.release = snd_ctl_led_release;
>  		if (dev_set_name(&led_card->dev, "card%d", card->number) < 0)
>  			goto cerr;
>  		led_card->dev.parent = &led->dev;
> @@ -701,6 +706,7 @@ static void snd_ctl_led_sysfs_remove(struct snd_card *card)
>  		sysfs_remove_link(&card->ctl_dev.kobj, link_name);
>  		sysfs_remove_link(&led_card->dev.kobj, "card");
>  		device_del(&led_card->dev);
> +		put_device(&led_card->dev);
>  		kfree(led_card);
>  		led->cards[card->number] = NULL;
>  	}

Btw, I have created a Smatch warning for this type of code where we
have:

	put_device(&foo->dev);
	kfree(foo);

sound/core/control_led.c:709 snd_ctl_led_sysfs_remove() warn: freeing device managed memory: 'led_card'

So hopefully that will prevent future similar bugs.  I'll test it out
overnight and report back tomorrow how it works.

regards,
dan carpenter

/*
 * Copyright (C) 2021 Oracle.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"

static int my_id;

STATE(managed);

static void set_ignore(struct sm_state *sm, struct expression *mod_expr)
{
	set_state(my_id, sm->name, sm->sym, &undefined);
}

static void match_put_device(const char *fn, struct expression *expr, void *param)
{
	struct expression *arg;

	arg = get_argument_from_call_expr(expr->args, PTR_INT(param));
	arg = strip_expr(arg);
	if (!arg || arg->type != EXPR_PREOP || arg->op != '&')
		return;
	arg = strip_expr(arg->unop);
	if (!arg || arg->type != EXPR_DEREF)
		return;
	arg = strip_expr(arg->deref);
	if (arg && arg->type == EXPR_PREOP && arg->op == '*')
		arg = arg->unop;
	set_state_expr(my_id, arg, &managed);
}

static void match_free(const char *fn, struct expression *expr, void *param)
{
	struct expression *arg;
	char *name;

	arg = get_argument_from_call_expr(expr->args, PTR_INT(param));
	if (get_state_expr(my_id, arg) != &managed)
		return;
	name = expr_to_str(arg);
	sm_warning("freeing device managed memory: '%s'", name);
	free_string(name);
}

void check_put_device(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_hook("put_device", &match_put_device, INT_PTR(0));
	add_function_hook("device_unregister", &match_put_device, INT_PTR(0));

	add_function_hook("kfree", &match_free, INT_PTR(0));
	add_modification_hook(my_id, &set_ignore);
}
