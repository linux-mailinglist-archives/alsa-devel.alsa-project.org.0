Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E23481404
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 15:22:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DD117B8;
	Wed, 29 Dec 2021 15:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DD117B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640787746;
	bh=t1Q2soBd5qTNLEns0XqkUzMuWS/BmHcrlv7JNvXquLI=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=arRzIMOwL0haro+8HIJxJ+p6V/oSI1oLLVpeQG4dxGrYsdRsRKw0ZzmPIOLsJC6Au
	 4UVKBBhlCDwUSa4pj/kl/qdAQ3TVJ/i+Z/Pv/PKmXC4d3g5VO+KPFCcc5aU8jVopdp
	 whwoFmWDGDQzJCtAW10Z4BnXShp6aIHc7VZJxC5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 948B5F804F2;
	Wed, 29 Dec 2021 15:20:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5BD4F80158; Mon, 27 Dec 2021 18:49:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A9CCF800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 18:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A9CCF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ehv/beOO"
Received: by mail-oi1-x236.google.com with SMTP id j124so26359809oih.12
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 09:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
 b=ehv/beOOjVHY0/sgKdcpY8YzavbZDivcQVdBoIeoRKI4qC8EayE8VBARAwiSsJBeMg
 Zz3lXu+y9k2nNSuIlCNv/KXJeQUZt+jBe9GlImPC6RkELaI4OwGtotJ8lJT4/RYUvXeg
 5Yx++5EIDR1wB7QuoetS4tNem0svdSDSCecLUq4Nl5eBOUOKs2Gs+UisJK8zu7iYw2pq
 PcDsXaJJl8yT+sBrdf2ZMSprNPKxdo/1kTE/fvwlcME88l50Ds0vKqwzoH4bPkfvnAPw
 BW+JRWfrn/ItjQte78Dwgt8Dko2eYYW3nLA+EyqURprwTeFBH4+RkctBrk7LJGBiMFCC
 vwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
 b=P8aEU0W1XMgZATOPSeshGrExJ7fHl1gCla0kF01HjE+RCnZbl3NzGhm84scM7eYf5E
 1yh8EoTolbvNSZhuC9T02mw+vCzod3NTpKx0INrt8hBjyt+/QnmMeydIYN3aXJrV6I8V
 sEp0Zb/N5xeFYGwvQOTUVfA+bgfYPtsD0xvZO/xmEKjHYXBNuoO0drXIPSv3QWArg1rU
 ubu20JxLC6UGBGSuIgCOlFJkTx9eKxzcaPVK0D+/15V3jKd3p1nGB0kRh6twantYB4M9
 g5y8HopBNO5Gdba9ymxbsjGYW7cCx4BdD9IkEeBK9z68yXoecLBJwfv/M2n58hXAm61/
 pzEg==
X-Gm-Message-State: AOAM5315Y4HXI0hC+HbDI1IfUFYhqYvFJHsMbLi8uIxueCvjHKs2E8J6
 qWEGPFJxPrTV5gRaAGL+v7b5z/xZhAI=
X-Google-Smtp-Source: ABdhPJxb6+7biAtxOQefdtgXxvyx2b2YNDyhmSemqV7yYJxoDKcbxu7R4xufBgYDTWnPfrrEWMwb0g==
X-Received: by 2002:a05:6808:20a6:: with SMTP id
 s38mr14781112oiw.152.1640627337723; 
 Mon, 27 Dec 2021 09:48:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 23sm2931424oty.6.2021.12.27.09.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 09:48:57 -0800 (PST)
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Jouni Malinen <j@w1.fi>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.com>, Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 Mark Brown <broonie@kernel.org>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Forest Bond <forest@alittletooquiet.net>, Jiri Slaby <jirislaby@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <281298ec-3898-9b02-1d92-66bf6df41170@roeck-us.net>
Date: Mon, 27 Dec 2021 09:48:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 29 Dec 2021 15:20:41 +0100
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-csky@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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

On 12/27/21 8:42 AM, Niklas Schnelle wrote:
> Introduce a new LEGACY_PCI Kconfig option which gates support for legacy
> PCI devices including those attached to a PCI-to-PCI Express bridge and
> PCI Express devices using legacy I/O spaces. Note that this is different
> from non PCI uses of I/O ports such as by ACPI.
> 
> Add dependencies on LEGACY_PCI for all PCI drivers which only target
> legacy PCI devices and ifdef legacy PCI specific functions in ata
> handling.
> 

This effectively disables all default configurations which now depend
on CONFIG_LEGACY_PCI. Yet, I don't see CONFIG_LEGACY_PCI added to
configuration files which explicitly enable any of the affected
configurations. Is that on purpose ? If so, I think it should at least
be mentioned in the commit description. However, I think it would be
more appropriate to either delete all affected configuration flags from
the affected configuration files, or to add CONFIG_LEGACY_PCI=y to those
files.

Guenter
