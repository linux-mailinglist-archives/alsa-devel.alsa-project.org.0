Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DE163943A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:00:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D3B17D6;
	Sat, 26 Nov 2022 08:59:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7D3B17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449638;
	bh=qWzZYH9hobYJ9k4ccqf32LxYbS7Tr5JzjoLAU1AtyM8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sm5aJvRz6FZ731pIqtkBc+p7Fo5QnLS0DlxmsQ1Ffs5YGmOymXz7ID122qYmZVQ5g
	 Nf/4ejOeLrf4nVlnFwznRw0urOaYZpc8E/whau9H4hZNwPIMxTPAmo6HbU3czacvFP
	 JzPQAR2zomilyqY7oD1ns0bXTL5a5Z0oaanY1p80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2207EF80559;
	Sat, 26 Nov 2022 08:58:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9405F80115; Wed, 23 Nov 2022 17:25:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3107EF80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3107EF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="ebGDyq+q"
Received: by mail-qt1-x836.google.com with SMTP id a27so11512305qtw.10
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 08:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PhJSJnLVsP1vBula4KCFSx5kBTht7CuZrspFHU0N884=;
 b=ebGDyq+q12UGY7Qk5Tupc9qhDLGyIcTZVkm5UZYo/563kMYJJqyAeOt5CzUtM4J8DZ
 3trFHny8FIDylUgXR9JjN8PS72NcWsvrDfr1Nd1Q7FDnTR43onbW+jw1+Ctw0cwtwrCd
 T18F6CTTWbwHWY6WrhS9prZWxtXaTjwzs7IQnIsjaZTmFdCmKdzeecD0BbnuyMQqVQVg
 z0s4POzfjTxMQ62r8mCHZM0rSmjmaRN4hzlYV7zdZbP1xMXxym5gxZ3SKz4kt6tgYYum
 EfCUt6/g2D4WDco0MNWeSPD0NJ6lencxZ7NqZJCJlD8ikZ4WiUl7N0yJnMd2Q4wIPSG2
 7pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PhJSJnLVsP1vBula4KCFSx5kBTht7CuZrspFHU0N884=;
 b=maY/hv2ca1Sb5uUmjm4snF20Gf3tHbs3Sx26OcHcGrxroLeBgTHLizLUfCbX4TSLEB
 T4IUnbg9CDpr01pfJpMg3opQZLgs9xoSr82l/OoMR51UdtlIvAFbwCS9xOUDWj1uuXh7
 zwl34Orlexfxf9NZ6su8yyoNG9HvENjfdiw7V8AgLTgHSSj+qZT2etQAunXci/IuYPmc
 fGa0Ve27TNhDUonj6BIshHjCQDtrcdhQHHMwmNeIHLqsADPWcEqTPJdKHU8B63lp1bR1
 pRifNFO3LFRUB0ScuzeZPBcN4UXuT+F9tfQn8MJdl3q/+FOGQOiSxWFT4lBqPqze7+2y
 7+cA==
X-Gm-Message-State: ANoB5pk4n/JG4b9E6NMdVUobCRV/6O9LNHdLBOjM9WCoVR/dbXuvVxUP
 W8kyZ+RwtYxk5nmwUU161OEZuA==
X-Google-Smtp-Source: AA0mqf7URgWK3LZKBiCOJvrYX2BcRTBThzd2VlaYXoILbXTQHzjAWJMWnGzlcI0wVuCFvjEWzX6GjA==
X-Received: by 2002:ac8:60c:0:b0:3a6:37bd:ace5 with SMTP id
 d12-20020ac8060c000000b003a637bdace5mr14127789qth.426.1669220734011; 
 Wed, 23 Nov 2022 08:25:34 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 q7-20020a05620a0d8700b006f8665f483fsm12561497qkl.85.2022.11.23.08.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 08:25:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxsZ2-00AOLL-MZ;
 Wed, 23 Nov 2022 12:25:32 -0400
Date: Wed, 23 Nov 2022 12:25:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35JfNJDppRp5bLX@ziepe.ca>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y34+V2bCDdqujBDk@kroah.com>
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

On Wed, Nov 23, 2022 at 04:37:59PM +0100, Greg Kroah-Hartman wrote:
> static inline struct device *__kobj_to_dev(struct kobject *kobj)
> {
>         return container_of(kobj, struct device, kobj);
> }
> 
> static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> {
>         return container_of(kobj, const struct device, kobj);
> }
> 
> /*
>  * container_of() will happily take a const * and spit back a non-const * as it
>  * is just doing pointer math.  But we want to be a bit more careful in the
>  * driver code, so manually force any const * of a kobject to also be a const *
>  * to a device.
>  */
> #define kobj_to_dev(kobj)                                       \
>         _Generic((kobj),                                        \
>                  const struct kobject *: __kobj_to_dev_const,   \
>                  struct kobject *: __kobj_to_dev)(kobj)
> 
> 
> Want me to do the same thing here as well?

It would be nice to have a shared macro code gen all of the above
instead of copy and pasting it. Then maybe other cases beyond struct
device could adopt const too..

Jason
