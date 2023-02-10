Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBC369981A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF510EE8;
	Thu, 16 Feb 2023 15:56:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF510EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559430;
	bh=+MtHRTQagF8CoQUSlObJWKdnFUohQUpXVrbp5M6CTGk=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QIXMU3k6ZvE3+ZMCwL2LiZzzNKH6c2qoSa5X0X//7ra+xzAYHBCeG3YauA/011NIA
	 6QyBHlEoPlx04ud1jNPItAN1YuxKiTABRb2NdEdaS+U25aaZL5RxM1761xc8O1T76B
	 h/jkJPXtMrkBDgiQ2mMoo813aqYUR+57KERgUjhk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC6AF8056F;
	Thu, 16 Feb 2023 15:55:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E355AF800E4; Sat, 11 Feb 2023 00:40:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A89B6F80094
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 00:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A89B6F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j3g6xSgV
Received: by mail-pj1-x102e.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso2062646pjr.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 15:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KMeQbkxBbzvMD3Sl9ck9O0fqetDFlWitYcAkilER14=;
        b=j3g6xSgVBMl0RZce22/nXAuvomW+22He2oG4WlKF/IoWovVhjhoh6RVxB/uq5zvv1S
         NPll0tfzJQ8pKVI65peoO8wkgDNUOeTm6AeD3bPG34tiFpzuezzkO12kXYPrx/Lp6bpH
         eGgIuvlrTGePFLSrn6VSg/tVhHF8iMC1RqdI4MpZK51kTQaEeBuG7Zf1RyYGUI3/tOtE
         Oqzz86pqPUd5qPVL+c3xyibkH6mku6T07VH6ftJMGs8sZyabRd1vswbr6v/YNg97EnmA
         guqxfIWivO0wuZX+VsIsU+NxsIr3wFBkgOVtYW2dCTI+1K+cexblV9WhhXg3MQ5vj2an
         9CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KMeQbkxBbzvMD3Sl9ck9O0fqetDFlWitYcAkilER14=;
        b=xK41p9VXLFtvg/oxGL6Wrw2nOTdzjVIRsJuPMKoy17spHDAWWM7FCFJLVoPDcvHYnm
         j9lGYd6m4bsOaJy6DKIIb2D0HSW1XUjmWO/0pujOF09YweJhPDokUXYiE0O27uJcafCN
         LdHoBFDaTELG9y25s07wd9ASTphjO1CpME2WollFty/xBbuo9LBQ4UsgeRFckG3oaIxY
         fB3bkATaY7cGMhoc+J6o9friru/B2v3oaGiAVEnD1Ae/qkEU3l3ZU8lLHS8gRpxLXyRR
         X+99yJET2ZIT3ykKorjoVWEJCtU5PNJjTDXB4oegVGCPNAVgokheOHlJB1pWyDR31qyQ
         lrmA==
X-Gm-Message-State: AO0yUKXBaHR9BoG3RY3jqxmiYP0rBmYvDBcPa8+tlYdTo8gdWqhUMfEl
	l3uCCm7F47ziV4TEyqD70T4=
X-Google-Smtp-Source: 
 AK7set+XBtj9eG/9r0dI6pCHyKxazkKCt2l/VJcnsuyMP5CelIxVLs3Lz67wacQ3226zSyl2840Xzw==
X-Received: by 2002:a17:90b:4d8a:b0:22c:4bc:2126 with SMTP id
 oj10-20020a17090b4d8a00b0022c04bc2126mr17815825pjb.45.1676072450148;
        Fri, 10 Feb 2023 15:40:50 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 k6-20020a17090a4c8600b002339195a47bsm2070583pjh.53.2023.02.10.15.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 15:40:49 -0800 (PST)
Date: Sat, 11 Feb 2023 10:40:34 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC PATCH 5/9] apple-gmux: Use GMSP acpi method for interrupt
 clear
Message-ID: <20230211104034.53e6f8ac@redecorated-mbp>
In-Reply-To: <ee952253-9ee4-aa81-fefa-609cbf6e1e2b@redhat.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
	<20230210044826.9834-6-orlandoch.dev@gmail.com>
	<ee952253-9ee4-aa81-fefa-609cbf6e1e2b@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: orlandoch.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HKJBAQTDO6WZSEESNVVAK7FYILQY4X5A
X-Message-ID-Hash: HKJBAQTDO6WZSEESNVVAK7FYILQY4X5A
X-Mailman-Approved-At: Thu, 16 Feb 2023 14:54:48 +0000
CC: platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Evan Quan <evan.quan@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aditya Garg <gargaditya08@live.com>,
 Aun-Ali Zaidi <admin@kodeit.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HKJBAQTDO6WZSEESNVVAK7FYILQY4X5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 20:43:58 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
> 
> On 2/10/23 05:48, Orlando Chamberlain wrote:
> > This is needed for interrupts to be cleared correctly on MMIO based
> > gmux's. It is untested if this helps/hinders other gmux types, but I
> > have seen the GMSP method in the acpi tables of a MacBook with an
> > indexed gmux.
> > 
> > If this turns out to break support for older gmux's, this can
> > instead be only done on MMIO gmux's.
> > 
> > There is also a "GMLV" acpi method, and the "GMSP" method can be
> > called with 1 as its argument, but the purposes of these aren't
> > known and they don't seem to be needed.
> > 
> > Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> > ---
> >  drivers/platform/x86/apple-gmux.c | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/apple-gmux.c
> > b/drivers/platform/x86/apple-gmux.c index
> > 760434a527c1..c605f036ea0b 100644 ---
> > a/drivers/platform/x86/apple-gmux.c +++
> > b/drivers/platform/x86/apple-gmux.c @@ -494,8 +494,29 @@ static
> > const struct apple_gmux_config apple_gmux_index = {
> >   * MCP79, on all following generations it's GPIO pin 6 of the
> > Intel PCH.
> >   * The GPE merely signals that an interrupt occurred, the actual
> > type of event
> >   * is identified by reading a gmux register.
> > + *
> > + * On MMIO gmux's, we also need to call the acpi method GMSP to
> > properly clear
> > + * interrupts. TODO: Do other types need this? Does this break
> > other types? */
> >  
> > +static int gmux_call_acpi_gmsp(struct apple_gmux_data *gmux_data,
> > int arg) +{
> > +	acpi_status status = AE_OK;
> > +	union acpi_object arg0 = { ACPI_TYPE_INTEGER };
> > +	struct acpi_object_list arg_list = { 1, &arg0 };
> > +
> > +	arg0.integer.value = arg;
> > +
> > +	status = acpi_evaluate_object(gmux_data->dhandle, "GMSP",
> > &arg_list, NULL);
> > +	if (ACPI_FAILURE(status)) {
> > +		pr_err("GMSP call failed: %s\n",
> > +		       acpi_format_exception(status));
> > +		return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static inline void gmux_disable_interrupts(struct apple_gmux_data
> > *gmux_data) {
> >  	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
> > @@ -519,7 +540,10 @@ static void gmux_clear_interrupts(struct
> > apple_gmux_data *gmux_data) 
> >  	/* to clear interrupts write back current status */
> >  	status = gmux_interrupt_get_status(gmux_data);
> > -	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
> > +	if (status) {
> > +		gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS,
> > status);
> > +		gmux_call_acpi_gmsp(gmux_data, 0);  
> 
> Ugh no, please don't go around calling random ACPI methods from
> untested firmware revisions / device models.
> 
> ACPI code (even Apple's I have learned) tends to be full of bugs. If
> we did not need to call GMSP before then please lets keep not calling
> it on the older models. Just because it is there does not mean that
> calling it is useful, it might even be harmful.

I'll make it only use this ACPI method on MMIO gmux's in v2 then.

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> > +	}
> >  }
> >  
> >  static void gmux_notify_handler(acpi_handle device, u32 value,
> > void *context)  
> 

