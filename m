Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EEA64452D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EEE18F7;
	Tue,  6 Dec 2022 14:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EEE18F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670335193;
	bh=Oz3o/4G57PRE98iaFg2d8/J+qeIOl4OKz/+YJh/IR3I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zyv9wAzFhqrGVZgpSVcp0oMO4/ZRj3X5atWpI99NGF1vNDJqcurJDct11ZLxowPHp
	 Nsi8AXxeCJpzVYwl6nVKJ2n+CyZdiqUKt4jYe52gS/C5stMNRhmJMQI4jXu4ZkiX4Y
	 IvAWkWD1SWB+r9VlpB1uRW1dMbmbkaJmU3PJCurQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A76D6F805F4;
	Tue,  6 Dec 2022 14:53:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0250F80246; Tue,  6 Dec 2022 12:37:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E227F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 12:37:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E227F8014C
Received: by mail-wr1-f49.google.com with SMTP id q7so23051282wrr.8
 for <alsa-devel@alsa-project.org>; Tue, 06 Dec 2022 03:37:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2dEEPgYHWLWGN87zsbE4biUqCxTkyL0Hp4s+LmxL1OA=;
 b=WHTVQjfPv4l4XIx4cRRuvRAfoxPRrNpseCK5dUJTRU4WF5AC/UMpqVWzztza0WFAlB
 UXxcv8MhquxIUtsE2taHXeB4Vbui/WEt5oJnUvsKUOcG3buvJRRdlJsBTnzSYw+ORan3
 GvM/BHNNmw8ZGnspBl76/xo8bikt9gsiuwYapdknII4oMtCGxglHgXIGmwH6XxyivtHr
 meSt9V/FKnA24yD/9tijFYEwzVdQnr+XssRXqmH6gGLRPlmkB0NyKdEYmjvMoP0jDhUM
 P+lLBxJbbEvRt6HFehaOwJNqIIvzVfCQG1FZl/fMR/h0odiMk9EplpWgyKIJGzJu6ete
 uxSA==
X-Gm-Message-State: ANoB5pniRswxJ3l63lkij1ZndLLz75HJQ2Bwn1sORuMmXJexhu9oFbKe
 WDcv5TzDwlGGaqtCkimiZXY=
X-Google-Smtp-Source: AA0mqf5IQao7pI3S55ozIZ3UILwG0zwLXEWSh3JhE8Rsg0wuM8pdCGyXY1E8JKqEYaIaMJ9EdjlENQ==
X-Received: by 2002:a5d:5385:0:b0:242:f8d:fcee with SMTP id
 d5-20020a5d5385000000b002420f8dfceemr27418643wrv.86.1670326648777; 
 Tue, 06 Dec 2022 03:37:28 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0024207ed4ce0sm16635553wrx.58.2022.12.06.03.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 03:37:27 -0800 (PST)
Date: Tue, 6 Dec 2022 11:37:26 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Dawei Li <set_pte_at@outlook.com>
Subject: Re: [PATCH 1/6] hyperv: Make remove callback of hyperv driver void
 returned
Message-ID: <Y48pdr9DEmXShhFR@liuwe-devbox-debian-v2>
References: <20221205153644.60909-1-set_pte_at@outlook.com>
 <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB232373567792ED1AC5E0849FCA189@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailman-Approved-At: Tue, 06 Dec 2022 14:53:23 +0100
Cc: jgross@suse.com, wei.liu@kernel.org, sstabellini@kernel.org,
 linux-hyperv@vger.kernel.org, gregkh@linuxfoundation.org,
 haiyangz@microsoft.com, linuxppc-dev@lists.ozlabs.org, decui@microsoft.com,
 alsa-devel@alsa-project.org, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 oleksandr_tyshchenko@epam.com, srinivas.kandagatla@linaro.org,
 christophe.leroy@csgroup.eu, bgoswami@quicinc.com, mpe@ellerman.id.au,
 xen-devel@lists.xenproject.org, johannes@sipsolutions.net, kys@microsoft.com,
 robert.jarzmik@free.fr, roger.pau@citrix.com
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

On Mon, Dec 05, 2022 at 11:36:39PM +0800, Dawei Li wrote:
> Since commit fc7a6209d571 ("bus: Make remove callback return
> void") forces bus_type::remove be void-returned, it doesn't
> make much sense for any bus based driver implementing remove
> callbalk to return non-void to its caller.
> 
> This change is for hyperv bus based drivers.
> 
> Signed-off-by: Dawei Li <set_pte_at@outlook.com>
[...]
> -static int netvsc_remove(struct hv_device *dev)
> +static void netvsc_remove(struct hv_device *dev)
>  {
>  	struct net_device_context *ndev_ctx;
>  	struct net_device *vf_netdev, *net;
> @@ -2603,7 +2603,6 @@ static int netvsc_remove(struct hv_device *dev)
>  	net = hv_get_drvdata(dev);
>  	if (net == NULL) {
>  		dev_err(&dev->device, "No net device to remove\n");
> -		return 0;

This is wrong. You are introducing a NULL pointer dereference.

>  	}
>  
>  	ndev_ctx = netdev_priv(net);
> @@ -2637,7 +2636,6 @@ static int netvsc_remove(struct hv_device *dev)
>  
>  	free_percpu(ndev_ctx->vf_stats);
>  	free_netdev(net);
> -	return 0;
>  }
>  
>  static int netvsc_suspend(struct hv_device *dev)
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index ba64284eaf9f..3a09de70d6ea 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -3756,7 +3756,7 @@ static int hv_pci_bus_exit(struct hv_device *hdev, bool keep_devs)
>   *
>   * Return: 0 on success, -errno on failure
>   */

This comment is no longer needed in the new world.

But, are you sure you're modifying the correct piece of code?

hv_pci_remove is not a hook in the base bus type. It is used in struct
hv_driver.

The same comment applies to all other modifications.

Thanks,
Wei.
