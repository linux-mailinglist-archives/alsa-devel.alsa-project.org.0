Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C336289E147
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 19:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70D452BD5;
	Tue,  9 Apr 2024 19:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70D452BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712682894;
	bh=LPEx6tsL7wgLYi+kk5vkpbbYiQkRmiIS+PLtSy0YjfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fPIYf3jgQxNOI1A8Y6pUpetYSinqojrKVDPiQVca4195qCJrs2Y9y729v5eY2y/Uj
	 desj6ZZjtpN70IRFIZhYL1Qxq7Yu5ScjQ7mUGyRPcDclzj5/my5CqX5lznbWQ/A7dk
	 8QaeU+JyqNDa91SE4dBnRMtfep6W9vWBnoPN6/l4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10B1AF805AA; Tue,  9 Apr 2024 19:14:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83DAAF805A9;
	Tue,  9 Apr 2024 19:14:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13D71F8026D; Tue,  9 Apr 2024 19:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E28B4F80130
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 19:14:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E28B4F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pcmC9XFN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9112D6194D
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 17:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9030DC43601
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712682843;
	bh=LPEx6tsL7wgLYi+kk5vkpbbYiQkRmiIS+PLtSy0YjfY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pcmC9XFN912RMvFMTBsOxs05rus3ioP7iQqJNazGrzDoiP7Ljc4Y9u/OFo2drMYc5
	 Y47oEgBi7UKRS5do5zUKwbtZ6obphKVWoEavPZT728bSAwtVk7J8TSsQZX4ZSa7DKv
	 hpFtmGvI8QwKr8MN2FMRQIJIRKkYD8x6LP5+Ja/yJW27JqneVDqXo/cNBtG96EGr+G
	 T2mQsRtFnusKVDFoDxcoM5aumg8aLfbIe3M865YcFvvVFW1WBeBZOTRWODvbam1aBD
	 yAl1wwAPpS2WSDZ6sYFOjTipL19UOEuq8sVy1JM2KysQHpLosxbKubCxvsHDf3sSbL
	 +uaHRk85y/R4A==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516cbf3fd3dso6787564e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Apr 2024 10:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9InwObtbUH8B/VtHRvC4SWvjCOPnRf+BISFZySdKVy7B00A+bsDuN4L7ttOMg/zt5OFDprKiixDedcPGN3Fp8AcFafbse1Qhea4E=
X-Gm-Message-State: AOJu0Yx8bGepIsk8Voldfkvj3cKQC5wesDAqHoTLVnIJivWrsEhNNf3g
	8v8OidcclV4xfm2sqXH3qi4gpKDNkUbKUFEtQ/XI9KnwDWe8U0Hre3z8UcFzaAEyCN86Q8lapVK
	9qaoxZu54PN5j1vYbPku96K4PZg==
X-Google-Smtp-Source: 
 AGHT+IHdmA/YWkORigJ39s8mUHP/Uw9g5JVSthQiryNaRNFp29Jw8Pu75u88BQ1j6apcee4IbBJ9bbXspK3Ch4S3xfA=
X-Received: by 2002:ac2:4acb:0:b0:515:99f6:2ca4 with SMTP id
 m11-20020ac24acb000000b0051599f62ca4mr50062lfp.36.1712682841868; Tue, 09 Apr
 2024 10:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
In-Reply-To: <61608010-fbce-46c6-a83d-94c04d0f000d@foss.st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 9 Apr 2024 12:13:48 -0500
X-Gmail-Original-Message-ID: 
 <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Message-ID: 
 <CAL_JsqJTiBK3qzdMzL-ZuARosKGqnf_PjyCj13_H=V415y9sHQ@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] Introduce STM32 Firewall framework
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Oleksii_Moisieiev@epam.com,
	gregkh@linuxfoundation.org, herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, vkoul@kernel.org,
	jic23@kernel.org, olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	mchehab@kernel.org, fabrice.gasnier@foss.st.com, andi.shyti@kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hugues.fruchet@foss.st.com, lee@kernel.org,
	will@kernel.org, catalin.marinas@arm.com, arnd@kernel.org,
	richardcochran@gmail.com, Frank Rowand <frowand.list@gmail.com>,
 peng.fan@oss.nxp.com,
	lars@metafoo.de, rcsekar@samsung.com, wg@grandegger.com, mkl@pengutronix.de,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LEAPRLURGDN2V67TU7EAEL74OFCYC4JG
X-Message-ID-Hash: LEAPRLURGDN2V67TU7EAEL74OFCYC4JG
X-MailFrom: robh+dt@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEAPRLURGDN2V67TU7EAEL74OFCYC4JG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 8, 2024 at 3:44=E2=80=AFAM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Gatien,
>
> On 1/5/24 14:03, Gatien Chevallier wrote:
> > Introduce STM32 Firewall framework for STM32MP1x and STM32MP2x
> > platforms. STM32MP1x(ETZPC) and STM32MP2x(RIFSC) Firewall controllers
> > register to the framework to offer firewall services such as access
> > granting.
> >
> > This series of patches is a new approach on the previous STM32 system
> > bus, history is available here:
> > https://lore.kernel.org/lkml/20230127164040.1047583/
> >
> > The need for such framework arises from the fact that there are now
> > multiple hardware firewalls implemented across multiple products.
> > Drivers are shared between different products, using the same code.
> > When it comes to firewalls, the purpose mostly stays the same: Protect
> > hardware resources. But the implementation differs, and there are
> > multiple types of firewalls: peripheral, memory, ...
> >
> > Some hardware firewall controllers such as the RIFSC implemented on
> > STM32MP2x platforms may require to take ownership of a resource before
> > being able to use it, hence the requirement for firewall services to
> > take/release the ownership of such resources.
> >
> > On the other hand, hardware firewall configurations are becoming
> > more and more complex. These mecanisms prevent platform crashes
> > or other firewall-related incoveniences by denying access to some
> > resources.
> >
> > The stm32 firewall framework offers an API that is defined in
> > firewall controllers drivers to best fit the specificity of each
> > firewall.
> >
> > For every peripherals protected by either the ETZPC or the RIFSC, the
> > firewall framework checks the firewall controlelr registers to see if
> > the peripheral's access is granted to the Linux kernel. If not, the
> > peripheral is configured as secure, the node is marked populated,
> > so that the driver is not probed for that device.
> >
> > The firewall framework relies on the access-controller device tree
> > binding. It is used by peripherals to reference a domain access
> > controller. In this case a firewall controller. The bus uses the ID
> > referenced by the access-controller property to know where to look
> > in the firewall to get the security configuration for the peripheral.
> > This allows a device tree description rather than a hardcoded periphera=
l
> > table in the bus driver.
> >
> > The STM32 ETZPC device is responsible for filtering accesses based on
> > security level, or co-processor isolation for any resource connected
> > to it.
> >
> > The RIFSC is responsible for filtering accesses based on Compartment
> > ID / security level / privilege level for any resource connected to
> > it.
> >
> > STM32MP13/15/25 SoC device tree files are updated in this series to
> > implement this mecanism.
> >
>
> ...
>
> After minor cosmetic fixes, series applied on stm32-next.
> Seen with Arnd: it will be part on my next PR and will come through
> arm-soc tree.

And there's some new warnings in next with it:

      1  venc@480e0000: 'access-controllers' does not match any of the
regexes: 'pinctrl-[0-9]+'
      1  vdec@480d0000: 'access-controllers' does not match any of the
regexes: 'pinctrl-[0-9]+'

Rob
