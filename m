Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65957639468
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:08:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C5B17B5;
	Sat, 26 Nov 2022 09:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C5B17B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450125;
	bh=G44bnr+iuPtt+qZ8zu8tlw18X2XouCKtZQHGH+Pp3d4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3p0zT7XDBnn5b8fIL4SyOUyN82C2q2tuDCl9k88//EtV2E5p5OPcFznOjrgSJxP5
	 //C2e0n88B7hyk//TrM0fEh74ncKGakBVbVL263CqQ0gaKcwTm6B4aLn0KJOwKNTIz
	 dIoyCebSeXzblzmD8oFCtam1UU3y26zcfZ4+mrlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCBDF8061B;
	Sat, 26 Nov 2022 08:59:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80EC5F8025D; Wed, 23 Nov 2022 14:56:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF363F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 14:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF363F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mFnb2fJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669211808; x=1700747808;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=G44bnr+iuPtt+qZ8zu8tlw18X2XouCKtZQHGH+Pp3d4=;
 b=mFnb2fJOABG6lFcdbEhpBgQwwTLudFw4C3DR/PofgGpiak4/hybbTMhJ
 +qwcDGcM46PiP3MrWwQdsKkbb7XWBiRccXRW8YuA8jfm5uITQOLZuIIJO
 +40qNGkd2rEtGM8btc7hvgz1iE6Pmhlgh3c4lqVCBGk8N4bbFNYm8xbIm
 cvXxt8A2VwaEzC/slV/H3ni6Of6kj90bVH3wZhGQLazrla33vzO5DdbOS
 KAmiquRI4RPVxDajUFx/jjASP3Dlrz4hfo0QJLwi/LjMJorgkwoGfDPKq
 UuShbF8Py3F4Y8bLEX3MqRWWIgcI7x+LFixKG9pYjR5zL64+fYkG2T35G A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="315221133"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="315221133"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 05:56:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="635924172"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="635924172"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 23 Nov 2022 05:56:28 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 994C4128; Wed, 23 Nov 2022 15:56:54 +0200 (EET)
Date: Wed, 23 Nov 2022 15:56:54 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y34mpkqds3NEZclU@black.fi.intel.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221123122523.1332370-3-gregkh@linuxfoundation.org>
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
 linux-acpi@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Won Chung <wonchung@google.com>, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
 Ira Weiny <ira.weiny@intel.com>, Michael Jamet <michael.jamet@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>,
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

On Wed, Nov 23, 2022 at 01:25:21PM +0100, Greg Kroah-Hartman wrote:
> The uevent() callback in struct device_type should not be modifying the
> device that is passed into it, so mark it as a const * and propagate the
> function signature changes out into all relevant subsystems that use
> this callback.
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Sean Young <sean@mess.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Maximilian Luz <luzmaximilian@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: Andreas Noever <andreas.noever@gmail.com>
> Cc: Michael Jamet <michael.jamet@intel.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com> # for Thunderbolt
