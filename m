Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F847D58DB
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 18:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 646731E7;
	Tue, 24 Oct 2023 18:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 646731E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698165662;
	bh=NNzcrS8AKI7wuEdyogOsoZ+5KHubom34TDM0+RIQhMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gvA28c+UbELxQcIhN9A0GvoRNXpGLyhypL2uuD9Ov85QoA4fyYrs/FFYiYXD01D8n
	 ahxBWS+uDYjzlx3Ka0ohMIceTLQ6bdGh3Ik2Lkv9KascKpnD1WeM2LxqvLEDdP4fFF
	 rHw8X1Z5G8lnPk1bhRC40sWTOKsdtsjExpoaxRiY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3891F8028D; Tue, 24 Oct 2023 18:40:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DEBF80157;
	Tue, 24 Oct 2023 18:40:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9C01F80165; Tue, 24 Oct 2023 18:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21DEBF8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 18:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21DEBF8014B
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-581de3e691dso2712304eaf.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 09:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165599; x=1698770399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dgLAi1M/nR9fJIQpQVSn3gxY5AOxSN1+8PQWp2ZK3E=;
        b=jTfoHtY2T7O9eWtYpj0ZhHO/JzhOc2iCFbdl862CRA+xkMsb6deEUgKPNfmO7B2fDE
         V15w2JKvX6OH+oy5VjHdSFkCGJ4hp+ZauRtleNHj5E+ewKGayD4xvvWc/J0a7o2b+g8i
         5/NU8lLQ3khly8NMYJBSMabXU9QG7Ym6MQ+VCvkh9TjnsAFpNvz0fCooFnjqf/zCYukW
         5YK3szKADJHaoJP1nSP/P2VIAZ1QOR3j1v64LR0I1hIpzQyQB3xilyVMU+kGKsrmW6V0
         Wb+et+zkbxwTC+RsjYSD4HLA9JTqyY8TbnNGofSvPR7Ivam25p+/LNeu8rlx8sATS+wD
         GOEg==
X-Gm-Message-State: AOJu0YymnLN6KRIQEMfi3TSSry+FwXzOhp1hR6cwyHbK6wD5/1u9yxW7
	j1/1ndMA0gkwRT/1Bvz0MQ==
X-Google-Smtp-Source: 
 AGHT+IH7r1RypTRYYRKdrh1wNi7leTTNBWI9FBY2oTxpLiREvX3LYW7p4YgROHwYcoRP/a6v+9+WQw==
X-Received: by 2002:a4a:df11:0:b0:582:28e:93a8 with SMTP id
 i17-20020a4adf11000000b00582028e93a8mr12468463oou.3.1698165599325;
        Tue, 24 Oct 2023 09:39:59 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a4ad816000000b0057aef3cab33sm2002659oov.21.2023.10.24.09.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 09:39:58 -0700 (PDT)
Received: (nullmailer pid 4062523 invoked by uid 1000);
	Tue, 24 Oct 2023 16:39:56 -0000
Date: Tue, 24 Oct 2023 11:39:56 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
	fabrice.gasnier@foss.st.com, andi.shyti@kernel.org, ulf.hansson@linaro.org,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	hugues.fruchet@foss.st.com, lee@kernel.org, will@kernel.org,
	catalin.marinas@arm.com, arnd@kernel.org, richardcochran@gmail.com,
	Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
 linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-p.hy@lists.infradead.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a system bus for
 STM32MP15x boards
Message-ID: <20231024163956.GA4049342-robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
 <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
 <20231012153012.GA698406-robh@kernel.org>
 <b16ed06f-66fd-457b-9610-a67ad07deb60@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b16ed06f-66fd-457b-9610-a67ad07deb60@foss.st.com>
Message-ID-Hash: KXJYLKKEVRDKSINNUZ6O5AFUY7R2HZ7Q
X-Message-ID-Hash: KXJYLKKEVRDKSINNUZ6O5AFUY7R2HZ7Q
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXJYLKKEVRDKSINNUZ6O5AFUY7R2HZ7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 16, 2023 at 02:02:39PM +0200, Gatien CHEVALLIER wrote:
> Hi Rob,
> 
> On 10/12/23 17:30, Rob Herring wrote:
> > On Wed, Oct 11, 2023 at 10:49:58AM +0200, Gatien CHEVALLIER wrote:
> > > Hi Rob,
> > > 
> > > On 10/10/23 20:42, Rob Herring wrote:
> > > > On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
> > > > > ETZPC is a firewall controller. Put all peripherals filtered by the
> > > > > ETZPC as ETZPC subnodes and reference ETZPC as an
> > > > > access-control-provider.
> > > > > 
> > > > > For more information on which peripheral is securable or supports MCU
> > > > > isolation, please read the STM32MP15 reference manual.
> > > > > 
> > > > > Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> > > > > ---
> > > > > 
> > > > > Changes in V6:
> > > > >       	- Renamed access-controller to access-controllers
> > > > >       	- Removal of access-control-provider property
> > > > > 
> > > > > Changes in V5:
> > > > >       	- Renamed feature-domain* to access-control*
> > > > > 
> > > > >    arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
> > > > >    arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
> > > > >    arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
> > > > >    3 files changed, 1450 insertions(+), 1377 deletions(-)
> > > > 
> > > > This is not reviewable. Change the indentation and any non-functional
> > > > change in one patch and then actual changes in another.
> > > 
> > > Ok, I'll make it easier to read.
> > > 
> > > > 
> > > > This is also an ABI break. Though I'm not sure it's avoidable. All the
> > > > devices below the ETZPC node won't probe on existing kernel. A
> > > > simple-bus fallback for ETZPC node should solve that.
> > > > 
> > > 
> > > I had one issue when trying with a simple-bus fallback that was the
> > > drivers were probing even though the access rights aren't correct.
> > > Hence the removal of the simple-bus compatible in the STM32MP25 patch.
> > 
> > But it worked before, right? So the difference is you have either added
> > new devices which need setup or your firmware changed how devices are
> > setup (or not setup). Certainly can't fix the latter case. You just need
> > to be explicit about what you are doing to users.
> > 
> 
> I should've specified it was during a test where I deliberately set
> incorrect rights on a peripheral and enabled its node to see if the
> firewall would allow the creation of the device.
> 
> > 
> > > Even though a node is tagged with the OF_POPULATED flag when checking
> > > the access rights with the firewall controller, it seems that when
> > > simple-bus is probing, there's no check of this flag.
> > 
> > It shouldn't. Those flags are for creating the devices (or not) and
> > removing only devices of_platform_populate() created.
> > 
> 
> About the "simple-bus" being a fallback, I think I understood why I saw
> that the devices were created.
> 
> All devices under a node whose compatible is "simple-bus" are created
> in of_platform_device_create_pdata(), called by
> of_platform_default_populate_init() at arch_initcall level. This
> before the firewall-controller has a chance to populate it's bus.
> 
> Therefore, when I flag nodes when populating the firewall-bus, the
> devices are already created. The "simple-bus" mechanism is not a
> fallback here as it precedes the driver probe.
> 
> Is there a safe way to safely remove/disable a device created this way?

There's 2 ways to handle this. Either controlling creating the device or 
controlling probing the device. The latter should just work with 
fw_devlink dependency. The former probably needs some adjustment to 
simple-pm-bus driver if you have 'simple-bus' compatible. You want it to 
probe on old kernels and not probe on new kernels with your firewall 
driver. Look at the commit history for simple-pm-bus. There was some 
discussion on it as well.

> Devices that are under the firewall controller (simple-bus) node
> should not be probed before it as they're child of it.

fw_devlink should take care of parent/child dependencies without any 
explicit handling of the access ctrl binding.

Rob
