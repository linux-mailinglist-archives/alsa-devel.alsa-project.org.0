Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9463943B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:00:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0D9C17EE;
	Sat, 26 Nov 2022 08:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0D9C17EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449646;
	bh=YD6oYTEEfrn1R4WlO3CL7w3f/WyZIdk+JOEJs3hWlUw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYFSJ8FVDAVKNUht1ezaCX7YvBBs5oWidmxsjoYFt9JC4tFPVCt+YqtwimbHR/olL
	 XmHblmUJQCvmNMUKZOg3GgZGSKNcqQHkaFNO++TP04Hhq3LdmKa60K51Zkn1foxLqw
	 cIHMUoeN8PmZIhZI87huGB2GSVld6xa3PaMPBQsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A3D7F8055C;
	Sat, 26 Nov 2022 08:58:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52C91F8025D; Wed, 23 Nov 2022 18:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B605F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 18:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B605F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="QdimsGNf"
Received: by mail-qt1-x834.google.com with SMTP id cg5so11644556qtb.12
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 09:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6abR5j0hlMc008eliuHFOuiB/x1h/HoL7zgQ4kEGBMg=;
 b=QdimsGNfTzv5cy4RlQtfTKKDVSVgL8yuEuK366wzZaMiRqxQeXrAmjllaGNMyScpdc
 MsNj5mbl3pLDNd2BV325hkTwPL9BYOzi+kSwJtllQ0DULWANmidzNeIUXiQk3VoNfo/E
 4ptv6rfZ5hd4J7x9tjAwSNGafLibrKF4EVw5LGSe1ZZy6+s8bRLN4jhguOSkiDMu6QPi
 wPTI6VMOMjq510vQvLMtGptkpvLXdJgY7O2FNJzlSZh8JHnJa/Z4WKXEodaMMk2QwC7K
 RiiKOKWHUqu9/c7mJwob6VF0WfIK7heBoUcwO8au92H5yk7bWPYSDK9PEgWhaqz377vC
 k3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6abR5j0hlMc008eliuHFOuiB/x1h/HoL7zgQ4kEGBMg=;
 b=PttCp7f72gmTPleZmIMjro81uJ4/5MBN6/BY7nPeUBY1p/pxKahfTKwKhVqIqt/vO8
 h6Xt4nRKpcftqVhXPIntT5EU6Pm2+kNvj3uHlZJApSU9Z8vY83zexjW7xu0RtLfTU5wZ
 mdeP0FGNecJXXPqqEsgdP5YYwo3MVLCCH0x8NBfg0GBnKqSwbo3tGeSUWIVrj82BuC9g
 Vd27mBCW3gRyGeTdM3f29m8iNrzhGhzO5UEyTImHIxXS+Nvs71uy+yaowoKBPEYFv4a3
 2O1suyyc4bsO9J5jq9Jg6/a/ROgfqJuXm9WM0TLANNK+pCqNw9jQvgH9+wXExD5I4UwT
 RsOg==
X-Gm-Message-State: ANoB5pnZ1GEdDavLN4PItFI+JbCJuyXaHW22qr/nIIrFAPRHSI4kVY5V
 m3DkG94nJuCaYvDQst+L+kqAiQ==
X-Google-Smtp-Source: AA0mqf6VK9T3mvV/iEAQivkf3Os9vtgvXBxWtvIIq8G+B7LGY/huw6PyHSkg/FXOahM3VUH5qsITeg==
X-Received: by 2002:a05:622a:5819:b0:3a5:5d34:66a9 with SMTP id
 fg25-20020a05622a581900b003a55d3466a9mr11256824qtb.623.1669224598066; 
 Wed, 23 Nov 2022 09:29:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 bq30-20020a05620a469e00b006ef1a8f1b81sm12581219qkb.5.2022.11.23.09.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:29:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxtZM-00ATfh-9i;
 Wed, 23 Nov 2022 13:29:56 -0400
Date: Wed, 23 Nov 2022 13:29:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35YlI93UBuTfgYy@ziepe.ca>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35R+/eQJYI7VaDS@kroah.com>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, Frank Rowand <frowand.list@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, linux-acpi@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Won Chung <wonchung@google.com>,
 Len Brown <lenb@kernel.org>, devicetree@vger.kernel.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 Michael Jamet <michael.jamet@intel.com>, Ming Lei <ming.lei@redhat.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 linux-media@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>,
 linux-usb@vger.kernel.org
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

On Wed, Nov 23, 2022 at 06:01:47PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Nov 23, 2022 at 12:25:32PM -0400, Jason Gunthorpe wrote:
> > On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> > > static inline struct device *__kobj_to_dev(struct kobject *kobj)
> > > {
> > >         return container_of(kobj, struct device, kobj);
> > > }
> > > 
> > > static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> > > {
> > >         return container_of(kobj, const struct device, kobj);
> > > }
> > > 
> > > /*
> > >  * container_of() will happily take a const * and spit back a non-const * as it
> > >  * is just doing pointer math.  But we want to be a bit more careful in the
> > >  * driver code, so manually force any const * of a kobject to also be a const *
> > >  * to a device.
> > >  */
> > > #define kobj_to_dev(kobj)                                       \
> > >         _Generic((kobj),                                        \
> > >                  const struct kobject *: __kobj_to_dev_const,   \
> > >                  struct kobject *: __kobj_to_dev)(kobj)
> > > 
> > > 
> > > Want me to do the same thing here as well?
> > 
> > It would be nice to have a shared macro code gen all of the above
> > instead of copy and pasting it. Then maybe other cases beyond struct
> > device could adopt const too..
> 
> I think I tried to create such a beast, but failed, so ended up
> open-coding it in a few places in the USB headers already.  I can try it
> again, but the redirection gets tricky (defines creating defines...)

This seems OK:

#define generic_container_of(in_type, in, out_type, out_member) \
	_Generic(in,                                        \
                  const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
                  in_type *: ((out_type *)container_of(in, out_type, out_member)) \
		  )

#define kobj_to_dev(__kobj) \
	generic_container_of(struct kobject, __kobj, struct device, kobj)

Jason
