Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB563943C
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4975B17F5;
	Sat, 26 Nov 2022 09:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4975B17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449666;
	bh=EfiX2/IiNE/Gp7XY++Xx28h8Fsj9GFlNLbGeLo5T8/k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUOQwbxGck2xSa2lXbFQb8Yon97SOjs0sbGkV8L/UbaFL8N0Ppcm6T85aJLMjhgKp
	 a6eRtKpzJU4DjvjPjVLolw1X+/MsnZ18T8pfRP2Df6JY9iuHCBAqwUjfavyjyM1fOI
	 zpVtd3Ek25pvdhlmLxVq/kG+ELolnw80vgeAJNuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20004F80563;
	Sat, 26 Nov 2022 08:58:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D8B6F8025D; Wed, 23 Nov 2022 18:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E0F7F80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 18:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E0F7F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="My/je7B5"
Received: by mail-qv1-xf34.google.com with SMTP id cz18so6313206qvb.13
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mZGGAbQVRBkDZyExP7ffjlyLb6N0sV9F4cgg4l8gSxE=;
 b=My/je7B5AkyQl5fsdxgrcU4MlCIO0r7BQ5Ticu0quoimRFyd1QFWg1CIRYo2hSlhCk
 gVjIJJSUMGBCSbu4UDXzbQPaiJloUApBWvaqFNa76nYHQxGNxzJWcDLEm0qltzXuuN/Z
 gO+uDnAR3m7NYXWzCuDuYM8LFnvN0Xu6vLCMlAClrlBYpN6lXcqxJLcrsGyjBmH/Sv12
 +4Tfy+Id6dykaHW4e8It4+0URa6BTBpgvGETfgKsz3tVQND5afP3nmgNdrdjI227ASXm
 vr1NQmNHtxvof8mhDMYhIaXb4hON7jWdw6w75cCEJBe1LxtxXk3bYjl3v+s4zDC4Zj8c
 gKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZGGAbQVRBkDZyExP7ffjlyLb6N0sV9F4cgg4l8gSxE=;
 b=iPiqziisv70XTVoJqhMRowLvXIt4fLqvkRhrQqmP/eZrU7IeZKJAPpB5FTepK4AgBZ
 wN+Rcj9FwLWluUFdq0tpghJ//XiphSmdk746Gb379hPwqLp+jHQoCQV2J3Z2aVpNauZp
 iz+Uns1j1Ns6MbQoA3QMsHXSBdlFjSPa+kdfvnkstKV3yV7IT8hPxosCQV/mpzh30Lts
 Cmbzfi31oNbh8KRKfdu1hrUnE0Fho++pmjOzOn7EckkwcbF42HAh5y9HL5582eNUiMvp
 fBFy83AWOWepLt9VlgU03ItB2ZsSD93wZ+SzO96HdojL+kq9Zy3KJY+G34sBLmUVDvgJ
 dCNA==
X-Gm-Message-State: ANoB5pmNf495MHFV10GeQDpxHQi3SUuuGXHRMeRIVawv43s2dUjzpDZq
 6NSPUfBZQuU5yT1YjuFAnEamdw==
X-Google-Smtp-Source: AA0mqf6wKiTjKYxvtjsF4TJ4YPeSr0mdEUQ+pw8A+HZdflt1p0dm9sIfWC/e+svu0siqN7xcA8Vb/g==
X-Received: by 2002:a05:6214:209:b0:4bb:6bbd:8c1b with SMTP id
 i9-20020a056214020900b004bb6bbd8c1bmr9012796qvt.111.1669226143925; 
 Wed, 23 Nov 2022 09:55:43 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 o18-20020a05620a111200b006faaf6dc55asm11988986qkk.22.2022.11.23.09.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:55:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxtyI-00Afdu-Dk;
 Wed, 23 Nov 2022 13:55:42 -0400
Date: Wed, 23 Nov 2022 13:55:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35enjI+dhhqiG3B@ziepe.ca>
References: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com> <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35dMIaNYSE0Cykd@casper.infradead.org>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sean Young <sean@mess.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
 Andreas Noever <andreas.noever@gmail.com>, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-acpi@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Won Chung <wonchung@google.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Jamet <michael.jamet@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Jilin Yuan <yuanjilin@cdjrlc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > #define generic_container_of(in_type, in, out_type, out_member) \
> > 	_Generic(in,                                        \
> >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > 		  )
> 
> There's a neat trick I found in seqlock.h:
> 
> #define generic_container_of(in_t, in, out_t, m)			\
> 	_Generic(*(in),							\
> 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> 		in_t: ((out_t *)container_of(in, out_type, m))	\
> 	)
>
> and now it fits in 80 columns ;-)

Aside from less letters, is their another benifit to using *(in) ?

Jason
