Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6A3E562F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 11:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3D11670;
	Tue, 10 Aug 2021 11:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3D11670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628586187;
	bh=AjpCIP5JcEXKwAqVhNV93E5jLruH2xXP7IQfE2G18JU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CIhJE/ME1T14LhjMy+HIEMl7NyI9fb8/YrXOCj01CWNyd7zRWsYox/kOQKj63KVmI
	 lMXPLEtl7x1PJo4RmaKevN0QdrhdMkKLalKlJ7cg033nsX0E2OnRV2DWilUZGUgJAJ
	 uEDBAM430ShY3vrKtKnI3FugIDZy7q/dmcWn/g84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DB6FF800FD;
	Tue, 10 Aug 2021 11:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E683BF802D2; Mon,  9 Aug 2021 06:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A11BFF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 06:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A11BFF800FD
Received: by mail-ed1-f43.google.com with SMTP id k9so5325034edr.10
 for <alsa-devel@alsa-project.org>; Sun, 08 Aug 2021 21:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hPnLfQOdhJ9VmhjHCFa74vmYcG7vey0A+Y6VMqc53E=;
 b=KLYkneV6ZvLlNerqN4PhYUgiroHa4lizsK4E27LLcuaL5nnSuyVOW50V6AKz+w8TB5
 7RhntuT9kqGBLYH8PVO+GAUZegodJ3HrAkbD2heBBqM68KzvPvDML+iq+VCjj+5BxRe6
 mGSroCrbut7dALGR3a7mGRmAIrIs2q8VOQcYS6KDQlP9Z6WL519QmwYpspvVEC6FtX+O
 ITXxRNswBq+alnBagAqgfD20g8iDvZOUV5LnEV1tI6ZYr0r74cMKY5hO/6f0DKg/CjnB
 kOCoGYK37FqMuMHRD2U9I4BCepALdkmQxRwkXWIWaaSL5kFOHQMNU4pkG3+CDAcXwL3y
 bE0A==
X-Gm-Message-State: AOAM532ACR8k56jnObKBfPjLhWwXTuw0fs8NZo07eHnqdJzd3rHUloAq
 5BUJDvQ7djNZDn2efP0SSJk=
X-Google-Smtp-Source: ABdhPJxLBa4EXTSLKfWMi4nEZ8Wk8PrT9QK9XE4M+ir2fnBq9dIuQxK16aytPtIw8dDJgnbvoCv0Eg==
X-Received: by 2002:a05:6402:5251:: with SMTP id
 t17mr22730430edd.157.1628482776972; 
 Sun, 08 Aug 2021 21:19:36 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id z70sm3240588ede.76.2021.08.08.21.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 21:19:36 -0700 (PDT)
Subject: Re: [PATCH v2] parisc: Make struct parisc_driver::remove() return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>
References: <20210807091927.1974404-1-u.kleine-koenig@pengutronix.de>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <bef58281-91b3-b2d6-ace8-afe0d08221e1@kernel.org>
Date: Mon, 9 Aug 2021 06:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210807091927.1974404-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 Aug 2021 11:00:43 +0200
Cc: linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Corey Minyard <minyard@acm.org>, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 netdev@vger.kernel.org, linux-parisc@vger.kernel.org, kernel@pengutronix.de,
 linux-scsi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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

On 07. 08. 21, 11:19, Uwe Kleine-König wrote:
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
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> (for drivers/input)
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> changes since v1 sent with Message-Id:
> 20210806093938.1950990-1-u.kleine-koenig@pengutronix.de:
> 
>   - Fix a compiler error noticed by the kernel test robot
>   - Add Ack for Dmitry
> 
>   arch/parisc/include/asm/parisc-device.h  | 4 ++--
>   drivers/char/ipmi/ipmi_si.h              | 2 +-
>   drivers/char/ipmi/ipmi_si_intf.c         | 6 +-----
>   drivers/char/ipmi/ipmi_si_parisc.c       | 4 ++--
>   drivers/char/ipmi/ipmi_si_platform.c     | 4 +++-
>   drivers/input/keyboard/hilkbd.c          | 4 +---
>   drivers/input/serio/gscps2.c             | 3 +--
>   drivers/net/ethernet/i825xx/lasi_82596.c | 3 +--
>   drivers/parport/parport_gsc.c            | 3 +--
>   drivers/scsi/lasi700.c                   | 4 +---
>   drivers/scsi/zalon.c                     | 4 +---
>   drivers/tty/serial/mux.c                 | 3 +--

For the TTY piece:
Acked-by: Jiri Slaby <jirislaby@kernel.org>

thanks,
-- 
-- 
js
suse labs
