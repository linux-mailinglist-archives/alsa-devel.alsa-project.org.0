Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FFB3E2F06
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Aug 2021 19:51:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80F3816E0;
	Fri,  6 Aug 2021 19:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80F3816E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628272273;
	bh=xEEfenSy0O41PfuFwReJ0STyZSGbTYzakXEj1iDM9+4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=RB8eM1QsztLslKqR12UWKB6jVeBloh++QvRGPnBwD5iqRsXahQqEv/jesvBMh/Lk7
	 QlroKvu6BlG9UCe0T978/usgIwvPWr3v3C/DxCD8ugPQNVGCzolX9bhcRO+l0UkwEo
	 fYgxC3eiXaPDs4NpWtJpNKcG9SheDmOY7BbC1J7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9CA9F8010A;
	Fri,  6 Aug 2021 19:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 394FBF8025F; Fri,  6 Aug 2021 19:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA46AF8010A
 for <alsa-devel@alsa-project.org>; Fri,  6 Aug 2021 19:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA46AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c/RKj6Q6"
Received: by mail-oi1-x229.google.com with SMTP id o185so13101075oih.13
 for <alsa-devel@alsa-project.org>; Fri, 06 Aug 2021 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=eFtBGQc5loUVM+0/DNWgWpoePp5ZhuL8S0GVMtXHMIc=;
 b=c/RKj6Q6AXQOwH/BglolT9Gmve+5CQUqa8jQMlDcp1qHJ67Cv9Nh0yWfh1WMTK7s+s
 El4bLCesvV256KalKV2jGAhIFxT5s2Fy6rnLVjPuPRlOg8kdfRlsmDvtX/gjz2ADHGLT
 xXe3EkgSt34r+KjQfyPXGZfzgMY1H4gd1FMAyYuj6dRd+FY9k+xbpiVSIb3g7zFJdRZn
 eR8w6+cM1F1+efrM8CHtKpw6hpavUc9Y3ZNe04pkRbjyuV0VlEpeCsqj2eYG0bUrysbJ
 /q5t1V3AsSbHouhe1+Al+gSRRj+OsgW6aRqGbav5ClWK1hYkhRl4dSYW843+DHY4aguo
 an7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=eFtBGQc5loUVM+0/DNWgWpoePp5ZhuL8S0GVMtXHMIc=;
 b=eLvqfoVgyd3k9hWDoJSV/zwX/5mDiaf5FV9caMhOChqA0UGKJl8Fz/A41pLiqlD4JO
 AaqOB1zyRGlGilGym9w52SOe83hIH6ptE9L2/nT8+XpnzXDClcY7DWaC/+lVa6JC2Ose
 yp/RMMso5muor+7xP/98AZExiGsUHuwSTkOn495OYG0PFAB5olFjTjj6FbjdNqLISAqi
 FEpzZp4ELRYb6q8mZghQ6UphzGdaGoxGnesGP6by7ROMt0rejJsC6dz1WRmlxRTMTuKH
 jpI9LDbUfs5V70YihrLwiSiIpfWCROOvjZOaQD3hujeE7k8Lfo3yl4CV978spbXKF+pn
 Ioiw==
X-Gm-Message-State: AOAM5311YjJ0V3RJbTbbHxob1vtFeoUGgKsIAaLVmwfUSjkAAErxr6yQ
 T8jpacz/PC+dyf1gUTcif3qZqa5DWcJ/fnI=
X-Google-Smtp-Source: ABdhPJzQwMQJhnpf5WGGeW7ehSTg1CfNc6NoFP+r5AvHbvQzcUqHwQr3HxYMO0h1BtcAAu6t6GW5vQ==
X-Received: by 2002:aca:39c6:: with SMTP id g189mr10161760oia.47.1628272170976; 
 Fri, 06 Aug 2021 10:49:30 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id c26sm1660710otu.38.2021.08.06.10.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 10:49:30 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:54cf:2a6b:50cd:9862])
 by serve.minyard.net (Postfix) with ESMTPSA id DB6091800D4;
 Fri,  6 Aug 2021 17:49:28 +0000 (UTC)
Date: Fri, 6 Aug 2021 12:49:27 -0500
From: Corey Minyard <minyard@acm.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] parisc: Make struct parisc_driver::remove() return void
Message-ID: <20210806174927.GJ3406@minyard.net>
References: <20210806093938.1950990-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210806093938.1950990-1-u.kleine-koenig@pengutronix.de>
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 linux-parisc@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 openipmi-developer@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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
Reply-To: minyard@acm.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Aug 06, 2021 at 11:39:38AM +0200, Uwe Kleine-König wrote:
> The caller of this function (parisc_driver_remove() in
> arch/parisc/kernel/drivers.c) ignores the return value, so better don't
> return any value at all to not wake wrong expectations in driver authors.
> 
> The only function that could return a non-zero value before was
> ipmi_parisc_remove() which returns the return value of
> ipmi_si_remove_by_dev(). Make this function return void, too, as for all
> other callers the value is ignored, too.
> 
> Also fold in a small checkpatch fix for:
> 
> WARNING: Unnecessary space before function pointer arguments
> +	void (*remove) (struct parisc_device *dev);
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/parisc/include/asm/parisc-device.h  | 4 ++--
>  drivers/char/ipmi/ipmi_si_intf.c         | 6 +-----
>  drivers/char/ipmi/ipmi_si_parisc.c       | 4 ++--
>  drivers/char/ipmi/ipmi_si_platform.c     | 4 +++-
>  drivers/input/keyboard/hilkbd.c          | 4 +---
>  drivers/input/serio/gscps2.c             | 3 +--
>  drivers/net/ethernet/i825xx/lasi_82596.c | 3 +--
>  drivers/parport/parport_gsc.c            | 3 +--
>  drivers/scsi/lasi700.c                   | 4 +---
>  drivers/scsi/zalon.c                     | 4 +---
>  drivers/tty/serial/mux.c                 | 3 +--
>  sound/parisc/harmony.c                   | 3 +--
>  12 files changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/parisc/include/asm/parisc-device.h b/arch/parisc/include/asm/parisc-device.h
> index d02d144c6012..4de3b391d812 100644
> --- a/arch/parisc/include/asm/parisc-device.h
> +++ b/arch/parisc/include/asm/parisc-device.h
> @@ -34,8 +34,8 @@ struct parisc_driver {
>  	struct parisc_driver *next;
>  	char *name; 
>  	const struct parisc_device_id *id_table;
> -	int (*probe) (struct parisc_device *dev); /* New device discovered */
> -	int (*remove) (struct parisc_device *dev);
> +	int (*probe)(struct parisc_device *dev); /* New device discovered */
> +	void (*remove)(struct parisc_device *dev);
>  	struct device_driver drv;
>  };
>  
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index 62929a3e397e..bb466981dc1b 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2228,22 +2228,18 @@ static void cleanup_one_si(struct smi_info *smi_info)
>  	kfree(smi_info);
>  }
>  
> -int ipmi_si_remove_by_dev(struct device *dev)
> +void ipmi_si_remove_by_dev(struct device *dev)

This function is also used by ipmi_si_platform.c, so you can't change
this.

-corey

>  {
>  	struct smi_info *e;
> -	int rv = -ENOENT;
>  
>  	mutex_lock(&smi_infos_lock);
>  	list_for_each_entry(e, &smi_infos, link) {
>  		if (e->io.dev == dev) {
>  			cleanup_one_si(e);
> -			rv = 0;
>  			break;
>  		}
>  	}
>  	mutex_unlock(&smi_infos_lock);
> -
> -	return rv;
>  }
>  
>  struct device *ipmi_si_remove_by_data(int addr_space, enum si_type si_type,
> diff --git a/drivers/char/ipmi/ipmi_si_parisc.c b/drivers/char/ipmi/ipmi_si_parisc.c
> index 11c9160275df..2be2967f6b5f 100644
> --- a/drivers/char/ipmi/ipmi_si_parisc.c
> +++ b/drivers/char/ipmi/ipmi_si_parisc.c
> @@ -29,9 +29,9 @@ static int __init ipmi_parisc_probe(struct parisc_device *dev)
>  	return ipmi_si_add_smi(&io);
>  }
>  
> -static int __exit ipmi_parisc_remove(struct parisc_device *dev)
> +static void __exit ipmi_parisc_remove(struct parisc_device *dev)
>  {
> -	return ipmi_si_remove_by_dev(&dev->dev);
> +	ipmi_si_remove_by_dev(&dev->dev);
>  }
>  
>  static const struct parisc_device_id ipmi_parisc_tbl[] __initconst = {
> diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
> index 380a6a542890..505cc978c97a 100644
> --- a/drivers/char/ipmi/ipmi_si_platform.c
> +++ b/drivers/char/ipmi/ipmi_si_platform.c
> @@ -411,7 +411,9 @@ static int ipmi_probe(struct platform_device *pdev)
>  
>  static int ipmi_remove(struct platform_device *pdev)
>  {
> -	return ipmi_si_remove_by_dev(&pdev->dev);
> +	ipmi_si_remove_by_dev(&pdev->dev);
> +
> +	return 0;
>  }
>  
>  static int pdev_match_name(struct device *dev, const void *data)
> diff --git a/drivers/input/keyboard/hilkbd.c b/drivers/input/keyboard/hilkbd.c
> index 62ccfebf2f60..c1a4d5055de6 100644
> --- a/drivers/input/keyboard/hilkbd.c
> +++ b/drivers/input/keyboard/hilkbd.c
> @@ -316,11 +316,9 @@ static int __init hil_probe_chip(struct parisc_device *dev)
>  	return hil_keyb_init();
>  }
>  
> -static int __exit hil_remove_chip(struct parisc_device *dev)
> +static void __exit hil_remove_chip(struct parisc_device *dev)
>  {
>  	hil_keyb_exit();
> -
> -	return 0;
>  }
>  
>  static const struct parisc_device_id hil_tbl[] __initconst = {
> diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
> index 2f9775de3c5b..a9065c6ab550 100644
> --- a/drivers/input/serio/gscps2.c
> +++ b/drivers/input/serio/gscps2.c
> @@ -411,7 +411,7 @@ static int __init gscps2_probe(struct parisc_device *dev)
>   * @return: success/error report
>   */
>  
> -static int __exit gscps2_remove(struct parisc_device *dev)
> +static void __exit gscps2_remove(struct parisc_device *dev)
>  {
>  	struct gscps2port *ps2port = dev_get_drvdata(&dev->dev);
>  
> @@ -425,7 +425,6 @@ static int __exit gscps2_remove(struct parisc_device *dev)
>  #endif
>  	dev_set_drvdata(&dev->dev, NULL);
>  	kfree(ps2port);
> -	return 0;
>  }
>  
>  
> diff --git a/drivers/net/ethernet/i825xx/lasi_82596.c b/drivers/net/ethernet/i825xx/lasi_82596.c
> index 96c6f4f36904..48e001881c75 100644
> --- a/drivers/net/ethernet/i825xx/lasi_82596.c
> +++ b/drivers/net/ethernet/i825xx/lasi_82596.c
> @@ -196,7 +196,7 @@ lan_init_chip(struct parisc_device *dev)
>  	return retval;
>  }
>  
> -static int __exit lan_remove_chip(struct parisc_device *pdev)
> +static void __exit lan_remove_chip(struct parisc_device *pdev)
>  {
>  	struct net_device *dev = parisc_get_drvdata(pdev);
>  	struct i596_private *lp = netdev_priv(dev);
> @@ -205,7 +205,6 @@ static int __exit lan_remove_chip(struct parisc_device *pdev)
>  	dma_free_noncoherent(&pdev->dev, sizeof(struct i596_private), lp->dma,
>  		       lp->dma_addr, DMA_BIDIRECTIONAL);
>  	free_netdev (dev);
> -	return 0;
>  }
>  
>  static const struct parisc_device_id lan_tbl[] __initconst = {
> diff --git a/drivers/parport/parport_gsc.c b/drivers/parport/parport_gsc.c
> index 1e43b3f399a8..4332692ca4b8 100644
> --- a/drivers/parport/parport_gsc.c
> +++ b/drivers/parport/parport_gsc.c
> @@ -378,7 +378,7 @@ static int __init parport_init_chip(struct parisc_device *dev)
>  	return 0;
>  }
>  
> -static int __exit parport_remove_chip(struct parisc_device *dev)
> +static void __exit parport_remove_chip(struct parisc_device *dev)
>  {
>  	struct parport *p = dev_get_drvdata(&dev->dev);
>  	if (p) {
> @@ -397,7 +397,6 @@ static int __exit parport_remove_chip(struct parisc_device *dev)
>  		parport_put_port(p);
>  		kfree (ops); /* hope no-one cached it */
>  	}
> -	return 0;
>  }
>  
>  static const struct parisc_device_id parport_tbl[] __initconst = {
> diff --git a/drivers/scsi/lasi700.c b/drivers/scsi/lasi700.c
> index 6d14a7a94d0b..86fe19e0468d 100644
> --- a/drivers/scsi/lasi700.c
> +++ b/drivers/scsi/lasi700.c
> @@ -134,7 +134,7 @@ lasi700_probe(struct parisc_device *dev)
>  	return -ENODEV;
>  }
>  
> -static int __exit
> +static void __exit
>  lasi700_driver_remove(struct parisc_device *dev)
>  {
>  	struct Scsi_Host *host = dev_get_drvdata(&dev->dev);
> @@ -146,8 +146,6 @@ lasi700_driver_remove(struct parisc_device *dev)
>  	free_irq(host->irq, host);
>  	iounmap(hostdata->base);
>  	kfree(hostdata);
> -
> -	return 0;
>  }
>  
>  static struct parisc_driver lasi700_driver __refdata = {
> diff --git a/drivers/scsi/zalon.c b/drivers/scsi/zalon.c
> index 7eac76cccc4c..f1e5cf8a17d9 100644
> --- a/drivers/scsi/zalon.c
> +++ b/drivers/scsi/zalon.c
> @@ -168,15 +168,13 @@ static const struct parisc_device_id zalon_tbl[] __initconst = {
>  
>  MODULE_DEVICE_TABLE(parisc, zalon_tbl);
>  
> -static int __exit zalon_remove(struct parisc_device *dev)
> +static void __exit zalon_remove(struct parisc_device *dev)
>  {
>  	struct Scsi_Host *host = dev_get_drvdata(&dev->dev);
>  
>  	scsi_remove_host(host);
>  	ncr53c8xx_release(host);
>  	free_irq(dev->irq, host);
> -
> -	return 0;
>  }
>  
>  static struct parisc_driver zalon_driver __refdata = {
> diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
> index be640d9863cd..643dfbcc43f9 100644
> --- a/drivers/tty/serial/mux.c
> +++ b/drivers/tty/serial/mux.c
> @@ -496,7 +496,7 @@ static int __init mux_probe(struct parisc_device *dev)
>  	return 0;
>  }
>  
> -static int __exit mux_remove(struct parisc_device *dev)
> +static void __exit mux_remove(struct parisc_device *dev)
>  {
>  	int i, j;
>  	int port_count = (long)dev_get_drvdata(&dev->dev);
> @@ -518,7 +518,6 @@ static int __exit mux_remove(struct parisc_device *dev)
>  	}
>  
>  	release_mem_region(dev->hpa.start + MUX_OFFSET, port_count * MUX_LINE_OFFSET);
> -	return 0;
>  }
>  
>  /* Hack.  This idea was taken from the 8250_gsc.c on how to properly order
> diff --git a/sound/parisc/harmony.c b/sound/parisc/harmony.c
> index 1440db8b4177..2e3e5aa47682 100644
> --- a/sound/parisc/harmony.c
> +++ b/sound/parisc/harmony.c
> @@ -968,11 +968,10 @@ snd_harmony_probe(struct parisc_device *padev)
>  	return err;
>  }
>  
> -static int __exit
> +static void __exit
>  snd_harmony_remove(struct parisc_device *padev)
>  {
>  	snd_card_free(parisc_get_drvdata(padev));
> -	return 0;
>  }
>  
>  static struct parisc_driver snd_harmony_driver __refdata = {
> -- 
> 2.30.2
> 
