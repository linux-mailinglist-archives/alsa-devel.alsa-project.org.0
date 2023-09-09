Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127377997F1
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Sep 2023 14:34:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13051827;
	Sat,  9 Sep 2023 14:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13051827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694262868;
	bh=yIxs3BQmN40ifQP76rbZhk3fyOZSVb9oQaLCp2JJ468=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hNCufGpsxjuNZLH6dCY0kbokgd0DngZ1e0wzQIufIJC2ZXXZZSNxF+dtCZoRXZXES
	 c2q3vQv3VH2HwYvLndUftB0IvjLQGUV0ujXR9BCeZLmkuJJnqIdj5ji0Qfvz7wHUP2
	 /UYPLG/paqHQB5udrMz0J1PkdvDgU3DM2PPR+izQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 777B5F8055B; Sat,  9 Sep 2023 14:33:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96A64F8047D;
	Sat,  9 Sep 2023 14:33:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE5AF80494; Sat,  9 Sep 2023 14:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E870F80236
	for <alsa-devel@alsa-project.org>; Sat,  9 Sep 2023 14:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E870F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=MDTcfkRO
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2128586433;
	Sat,  9 Sep 2023 14:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1694262801;
	bh=FGJ+3GoBJjrtTqJFHFJ12q0FRofA5cXQDyydOvBNyO4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MDTcfkRObBGeXLdQGT1lvvL5V366HVLH1RPZevF89/SRhxGDqQrLQ6qVzl1aSyJqs
	 VSqTXfskgZhUgqlTZyngyHNv55pDAXByBfDp5jKoA47270k4WJFQHAB7tgqXFPoKE6
	 9TtBNa75Xi9v/nR7KlW+pfEmp4dJag4B5NA4Raf/hiH+9EoixyzL4C04YUe5HeYM/m
	 0OuBAABdgkEV9FlTCdDAdJyITbRc4JvDF0vE6VQdMdRDohzMotJgsC2zIHqqHqvPb1
	 RS3KckYNdSU7GqLVMf8720TRs5Zn1sLdrvIiNbSFhI9eVOcvLmE5DRiIoUvKRn6eqx
	 aKk3UA+Nj1BmQ==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 09 Sep 2023 09:33:21 -0300
From: Fabio Estevam <festevam@denx.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix error handling in probe
In-Reply-To: <20230909120237.2646275-1-linux@roeck-us.net>
References: <20230909120237.2646275-1-linux@roeck-us.net>
Message-ID: <f25a7897ba298a2e0187df91d121ab28@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Message-ID-Hash: 4JFKEIMKWERAUHSCANVOAYH244M7IOVI
X-Message-ID-Hash: 4JFKEIMKWERAUHSCANVOAYH244M7IOVI
X-MailFrom: festevam@denx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JFKEIMKWERAUHSCANVOAYH244M7IOVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/09/2023 09:02, Guenter Roeck wrote:
> Commit 422f10adc3eb ("ASoC: wm8960: Add support for the power 
> supplies")
> added regulator support to the wm8960 driver, but neglected to update
> error handling in the probe function. This results in warning 
> backtraces
> if the probe function fails.
> 
> WARNING: CPU: 0 PID: 1 at drivers/regulator/core.c:2396
> _regulator_put.part.0+0x1b4/0x1d8
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G                 N
> 6.5.0-11075-g92901222f83d #1
> Hardware name: Freescale i.MX6 Ultralite (Device Tree)
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x68/0x90
>  dump_stack_lvl from __warn+0x70/0x1a4
>  __warn from warn_slowpath_fmt+0xac/0x220
>  warn_slowpath_fmt from _regulator_put.part.0+0x1b4/0x1d8
>  _regulator_put.part.0 from regulator_bulk_free+0x44/0x64
>  regulator_bulk_free from release_nodes+0x50/0x7c
>  release_nodes from devres_release_group+0xbc/0x138
>  devres_release_group from i2c_device_probe+0x180/0x268
>  i2c_device_probe from really_probe+0xc4/0x2e0
>  really_probe from __driver_probe_device+0x84/0x1a0
>  __driver_probe_device from driver_probe_device+0x2c/0xc4
>  driver_probe_device from __driver_attach+0x94/0x144
>  __driver_attach from bus_for_each_dev+0x70/0xc4
>  bus_for_each_dev from bus_add_driver+0xc4/0x1cc
>  bus_add_driver from driver_register+0x7c/0x114
>  driver_register from i2c_register_driver+0x3c/0xac
>  i2c_register_driver from do_one_initcall+0x68/0x3b0
>  do_one_initcall from kernel_init_freeable+0x18c/0x240
>  kernel_init_freeable from kernel_init+0x14/0x144
>  kernel_init from ret_from_fork+0x14/0x24
> 
> Add the missing calls to regulator_bulk_disable().
> 
> Cc: Fabio Estevam <festevam@denx.de>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Fixes: 422f10adc3eb ("ASoC: wm8960: Add support for the power 
> supplies")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@denx.de>
