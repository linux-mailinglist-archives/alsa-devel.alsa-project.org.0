Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C4569980C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 15:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35ADED7;
	Thu, 16 Feb 2023 15:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35ADED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676559413;
	bh=mcpAj3afndmlOYVVz7zNqAYYyW+PI+VUh5EivaQoBO8=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h8LLrsREwNKD1Y1KKgmmW68yN1PnUMvFQw3clAQZna66L+otfBsoBRmbaVZ6oy1qn
	 hjRQr9Q3qwIeoYM9HdnFER1V1FyNIYIkEP4hfxRSAE7Z5lakS2cllFmRrsaXcUBXbe
	 T2tr+sC1dQbvFYkH/z+oqhQKtw9fxN9Ja13OziVQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17588F80568;
	Thu, 16 Feb 2023 15:55:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC33BF800E4; Sat, 11 Feb 2023 00:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A225EF80086
	for <alsa-devel@alsa-project.org>; Sat, 11 Feb 2023 00:37:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A225EF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eWV0M6rG
Received: by mail-pf1-x42d.google.com with SMTP id n2so4574059pfo.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 15:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWl59Xq4HhZJNA/74ztn8Fz0mUv6Fs/PnU96YJviPtI=;
        b=eWV0M6rGtsHugvA38QqBpUL6jZ4y3mJzobxzFGiKGdTQNp2DYSntYK8fNimGGqSQG3
         v1URcOI0nGZ1/5TGJU4dqMNN0DJxIJ0uM4RokG2TRfHGuj5xlO84qXVGFdSjO+O54Geg
         7GsOk6Yj8pJaVWTcJG1de4lfsJ3gH1OShZrBNpbODHTlSWXeMhbmu3f65mM1QZYVFCIv
         4hvVqBnxmKH6VZ+tNP3BQHxQ0KIlFS7H1alY+jmoagEd/KhnLzqQ0toWliT5JA9sK9sa
         yQjxaTUBmPu4eclYjhf0zO5B1fdePRn/78QzQnXl3qUDNnYPDxsp/AtjsBh4MZEVPZro
         QMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWl59Xq4HhZJNA/74ztn8Fz0mUv6Fs/PnU96YJviPtI=;
        b=j2v2IpKZ7hPOx2dg3Ja70D+EqhshKo3284ZfDrSDMGDA4uWbdCojNsIUI+KhJdwaMA
         JCXCKcaovyO/WY90mOIr+W+mY80q8Pj1sKX7ixsUSUamun4I8eEUOvdy/y5LX/zEo9Av
         R2K+1ujl4C4D5krW7J1xqhSlyd0NNve0bryJSZEWr2ZPgGBF1THUiYSTLjLis4Pd4OPw
         YiMJuxWq7W+CuApuClZxFEu0UiNc+txIxbMjYMV+gg+/8iYkuhJIDdQcT8xrrGWunfH0
         YkA5dWP41zKE/aYsWcoSG3wThj6ewqekmsbU1ZPwdTnMKrD5xorM/dJzQb7uGH2VlvBN
         +RaQ==
X-Gm-Message-State: AO0yUKVnDjQ2VmwI5kNrOz3qYNI3RfJ2m2EJ5JvWd3d3zyuSBpTp+Uq9
	/luhxCZzD4wZOzCm8GfGORg=
X-Google-Smtp-Source: 
 AK7set8/KTxG0Ml6oxWb6/Y9VAH38w4uk9BRJXkFZ7hYp7F15/mhAqCM06D1a5AHUz8YnhSy937ZjA==
X-Received: by 2002:aa7:93c2:0:b0:5a8:4459:384d with SMTP id
 y2-20020aa793c2000000b005a84459384dmr8724287pff.3.1676072231023;
        Fri, 10 Feb 2023 15:37:11 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
        by smtp.gmail.com with ESMTPSA id
 f16-20020aa782d0000000b00587fda4a260sm3776296pfn.9.2023.02.10.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 15:37:10 -0800 (PST)
Date: Sat, 11 Feb 2023 10:36:57 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [RFC PATCH 2/9] apple-gmux: consolidate version reading
Message-ID: <20230211103657.53108b64@redecorated-mbp>
In-Reply-To: <f4992ffa-68db-7f8c-b92d-a0e1348a7839@redhat.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
	<20230210044826.9834-3-orlandoch.dev@gmail.com>
	<f4992ffa-68db-7f8c-b92d-a0e1348a7839@redhat.com>
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
Message-ID-Hash: GA7EIJCGZ4TWL6UAMRJ7U2OYOSLT3HK6
X-Message-ID-Hash: GA7EIJCGZ4TWL6UAMRJ7U2OYOSLT3HK6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GA7EIJCGZ4TWL6UAMRJ7U2OYOSLT3HK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Feb 2023 20:41:19 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> Hi,
> 
> On 2/10/23 05:48, Orlando Chamberlain wrote:
> > Read gmux version in one go as 32 bits on both indexed and classic
> > gmux's.
> > 
> > Classic gmux's used to read the version as
> > 
> > major = inb(base + 0x4);
> > minor = inb(base + 0x5);
> > release = inb(base + 0x6);
> > 
> > but this can instead be done the same way as indexed gmux's with
> > gmux_read32(), so the same version reading code is used for classic
> > and indexed gmux's (as well as mmio gmux's that will be added to
> > this driver).
> > 
> > Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>
> > ---
> >  drivers/platform/x86/apple-gmux.c | 14 ++++++--------
> >  include/linux/apple-gmux.h        |  6 +-----
> >  2 files changed, 7 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/apple-gmux.c
> > b/drivers/platform/x86/apple-gmux.c index
> > e8cb084cb81f..67628104f31a 100644 ---
> > a/drivers/platform/x86/apple-gmux.c +++
> > b/drivers/platform/x86/apple-gmux.c @@ -580,15 +580,13 @@ static
> > int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> > if (indexed) { mutex_init(&gmux_data->index_lock);
> >  		gmux_data->indexed = true;
> > -		version = gmux_read32(gmux_data,
> > GMUX_PORT_VERSION_MAJOR);
> > -		ver_major = (version >> 24) & 0xff;
> > -		ver_minor = (version >> 16) & 0xff;
> > -		ver_release = (version >> 8) & 0xff;
> > -	} else {
> > -		ver_major = gmux_read8(gmux_data,
> > GMUX_PORT_VERSION_MAJOR);
> > -		ver_minor = gmux_read8(gmux_data,
> > GMUX_PORT_VERSION_MINOR);
> > -		ver_release = gmux_read8(gmux_data,
> > GMUX_PORT_VERSION_RELEASE); }
> > +
> > +	version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
> > +	ver_major = (version >> 24) & 0xff;
> > +	ver_minor = (version >> 16) & 0xff;
> > +	ver_release = (version >> 8) & 0xff;
> > +
> >  	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major,
> > ver_minor, ver_release, (gmux_data->indexed ? "indexed" :
> > "classic")); 
> 
> The problem with this is that there is nothing (no known register)
> at address base + 7 and now you are reading from address base + 7
> here where before the code was not, we have no idea how the hw
> will respond to this.  This should be pretty innocent but still ...

That makes sense, hopefully someone will be able to test it.

> 
> > diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
> > index 1f68b49bcd68..eb2caee04abd 100644
> > --- a/include/linux/apple-gmux.h
> > +++ b/include/linux/apple-gmux.h
> > @@ -67,7 +67,6 @@ static inline bool apple_gmux_is_indexed(unsigned
> > long iostart) */
> >  static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool
> > *indexed_ret) {
> > -	u8 ver_major, ver_minor, ver_release;
> >  	struct device *dev = NULL;
> >  	struct acpi_device *adev;
> >  	struct resource *res;
> > @@ -95,10 +94,7 @@ static inline bool apple_gmux_detect(struct
> > pnp_dev *pnp_dev, bool *indexed_ret)
> >  	 * Invalid version information may indicate either that
> > the gmux
> >  	 * device isn't present or that it's a new one that uses
> > indexed io. */
> > -	ver_major = inb(res->start + GMUX_PORT_VERSION_MAJOR);
> > -	ver_minor = inb(res->start + GMUX_PORT_VERSION_MINOR);
> > -	ver_release = inb(res->start + GMUX_PORT_VERSION_RELEASE);
> > -	if (ver_major == 0xff && ver_minor == 0xff && ver_release
> > == 0xff) {
> > +	if (!(~inl(res->start + GMUX_PORT_VERSION_MAJOR))) {  
> 
> Assuming we can get this tested well enough that I'm ok with the
> change in general please write this as:
> 
> 	if (inl(res->start + GMUX_PORT_VERSION_MAJOR) == 0xffffffff) {
> 
> Which I believe is what you are trying to achieve here ?

Yes that is a neater way of doing what I was trying to do, I'll use
that in v2.

> 
> Regards,
> 
> Hans
> 
> 
> 
> >  		indexed = apple_gmux_is_indexed(res->start);
> >  		if (!indexed)
> >  			goto out;  
> 

