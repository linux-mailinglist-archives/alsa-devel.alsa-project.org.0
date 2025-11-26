Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCBC8A474
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F98F60150;
	Wed, 26 Nov 2025 15:19:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F98F60150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166802;
	bh=4o77OKWbcP6woDhrfz9J5DQUS4w6IllxS0M8ItejPwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z/5DKA2LqJ1WXGLhIPp3cGOzhScABORqpfCvMtIbRjGGqGQoQCgYSshWybi4SwrZI
	 vD6w3MfET+pxPeylBejmkdTDOCsKcJVun7/4s5iklpC8EJ0tM+8N3O/ywGF/0M9RXY
	 pdck/8zLmXJ86AsMan4BpcCgIY4BMMfMBLqP21+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA27F805F9; Wed, 26 Nov 2025 15:19:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19EE8F805EE;
	Wed, 26 Nov 2025 15:19:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4372EF8047D; Wed, 26 Nov 2025 10:05:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7E98F80087
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 10:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7E98F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s2dNG9qU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13EFE6018B;
	Wed, 26 Nov 2025 09:05:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88065C113D0;
	Wed, 26 Nov 2025 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764147934;
	bh=4o77OKWbcP6woDhrfz9J5DQUS4w6IllxS0M8ItejPwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s2dNG9qU1/HOUpSJ2Y8qbIP5tXCoY+uBg4SBnVa9bitaFkgWVugRh8Ul0w8vSBvT7
	 EHDsK051fZRUevgmikVbldiY2VfNyF4UZ4BtQgiMnj7700FS5oofPplM1UBnp4oHLB
	 ijm0s2b57vuO5rNN5hpBS0LWemHWZO0+Zuny4w2kerEEi/igMhfWGBK48csYX0TJst
	 IKNxv6C558HSt8czYPO9p+sIsFjs3m0JG9CZCQhaWybTfrilaE9BIVdF6nG2Xbp9ef
	 kfocFp0LAQrbRrclSD8nrDFAoGRzFpy1wMyUZs0UsnvUeCJPxksHlJwRAubnP3Q4vQ
	 mDwZ8ifJpI/ug==
Message-ID: <8af3d19b-a204-4120-bb08-3de21e6a60cb@kernel.org>
Date: Wed, 26 Nov 2025 10:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] platform/x86: serial-multi-instantiate: ACPI
 example code
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: ilpo.jarvinen@linux.intel.com, broonie@kernel.org,
 andriy.shevchenko@linux.intel.com, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, 13916275206@139.com,
 platform-driver-x86@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, letitia.tsai@hp.com
References: <20251126081741.10588-1-baojun.xu@ti.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251126081741.10588-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: hansg@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UOG36IVUFQXU6WCXIQMRTGA53WN6BSVB
X-Message-ID-Hash: UOG36IVUFQXU6WCXIQMRTGA53WN6BSVB
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOG36IVUFQXU6WCXIQMRTGA53WN6BSVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun Xu,

On 26-Nov-25 9:17 AM, Baojun Xu wrote:
> The tas2781-hda supports multi-projects, In some projects,
> GpioInt was dropped due to no IRQ connection.
> See the example code below:
> 
> But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
> if looking for IRQ by smi_get_irq() fails, it will return an error,
> will not add new device, and cause smi_probe to fail.
> So need to add an exception case for these situations.
> BTW, this patch will take effect on both I2C and SPI devices.
> 
> Device (SPKR)
> {
>     Name (_ADR, One)
>     Name (_HID, "TXNW2781")
>     Method (_CRS, 0, NotSerialized)
>     {
>         Name (RBUF, ResourceTemplate ()
>         {
>             I2cSerialBusV2 (0x0038, ...)
>             I2cSerialBusV2 (0x0039, ...)
>             // GpioInt (Edge, ...) { 0x0000 }
>             //"GpioInt (...) {}" was commented out due to no IRQ connection.
>         })
>         Return (RBUF)
>     }
> }
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thank you, the patch itself looks good, but the above information
from the cover-letter really should be in the commit message of
the patch itself.

Can you please send a v4 with this info added to the commit
message ?

Regards,

Hans




> 
> Baojun Xu (1):
>   platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ
>     missing projects
> 
>  drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 

