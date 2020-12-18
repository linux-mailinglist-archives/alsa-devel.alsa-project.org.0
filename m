Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9362DEA0B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 21:16:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E53317AB;
	Fri, 18 Dec 2020 21:15:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E53317AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608322556;
	bh=cAaYGLbx+veeWkLpPkNhNVZXHztP+U2YsKXs0JdDK1w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+84m/4G+y5VniYIGjQfhbvTwMaSK0IC9ZVJQF0SmO0fc7RDt54+AE225CrX7ukQx
	 yO2vrNsj/m4HOBqpNKV1lRLew+L1gp60UG3Eu2tjLsSJ3eBMEAk1OJAV2t0c15ti5E
	 8kGn00NK/7lIwkR3KG0RqQ/zdSMvrmleWSMfYpPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A40A9F80240;
	Fri, 18 Dec 2020 21:14:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 596E9F801F7; Fri, 18 Dec 2020 21:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F1F0F8014B
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 21:14:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1F0F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="jHvWhOqW"
Received: by mail-qv1-xf2c.google.com with SMTP id a4so1191615qvd.12
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 12:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+6dOcXCZmIRThv69enwRAoT3Ssvc0OhfvILN9vdlg4o=;
 b=jHvWhOqW9gjdg6bCt0oq8HPNAPiqjsnvVkc2ZUdCGpEZNIdSLT+GDPCECJElwUYAxA
 Y1pIExXfv/DBr7VTF+bFuxD1/qc48sp4jjZGVoGH32YbTQAwsodVlyqEal+TFhSvUReR
 bQH7LL5BN51mLTZ7XWLywXYOanGqutzAK76tB+8PuUq+RbgeAnOhwHP+K4O7eHiCyJ6Z
 PbkZyuovTuop9ttweKxiab8tuHcdQfnii8DrxMLWuGsSk2o7ieWZHMk1nqidqmHDP5kd
 mRvodxQKAx0bRwGOtG28y4RrryymGsGvvkNhr00Frg6N6/bpTYHvKS3sn6joFWSellTo
 IV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+6dOcXCZmIRThv69enwRAoT3Ssvc0OhfvILN9vdlg4o=;
 b=O46hXXVhfXTzA45D8h6YxOBpo+3uAQU0lPt+HfSvnb0RsygWbKEiAieJ+ePHC2AaNO
 MxfNGwRJ/Rv+HIVpyX3oFBMnA58mEHOltbk9Mt0sSn5nYZ8pj/9L35khUx4MyQKTO8aA
 z8lPCvIhPCByimnqbwfh43JNunlvHBDkAnn3kQIdy9O04bwHXpcLE+rkWbVHDAtfsO3E
 oZyxmcF0wcZFXk7FeKomNZYquC7mhP4C/kyhUlTo8zHG9QYJ0PGz5dFaUtwQiptuBNQH
 4x4uTDTPHawoc2mCiKP5eYUMpz4mzqunIPcGcv8V8vR+xvVAyYo+R1kLTlxfa8liyayX
 0vYQ==
X-Gm-Message-State: AOAM531kxnpFPgUWkOSbERidphCKyGsfLercpGz1cOEQn28+5RQNP8YH
 ikUWC8IXVOSoHVU+LauUyfb1fw==
X-Google-Smtp-Source: ABdhPJz7x65BC/4X9IrtWfhOoatGUO93t2Fz3LqYQnC1yk/9wcYLKCu/MCpGx2+lmEtdYxTq7GxBsw==
X-Received: by 2002:a05:6214:15c1:: with SMTP id
 p1mr6432035qvz.8.1608322450319; 
 Fri, 18 Dec 2020 12:14:10 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id p15sm6479556qke.11.2020.12.18.12.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 12:14:09 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kqM8e-00CtcB-SK; Fri, 18 Dec 2020 16:14:08 -0400
Date: Fri, 18 Dec 2020 16:14:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218201408.GP5487@ziepe.ca>
References: <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com> <20201218131709.GA5333@sirena.org.uk>
 <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk>
 <20201218162817.GX552508@nvidia.com>
 <20201218180310.GD5333@sirena.org.uk>
 <20201218184150.GY552508@nvidia.com> <20201218190911.GT207743@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218190911.GT207743@dell>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Parav Pandit <parav@mellanox.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>
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

On Fri, Dec 18, 2020 at 07:09:11PM +0000, Lee Jones wrote:

> ACPI, DT and MFD are not busses.  

And yet ACPI and PNP have a bus:
  extern struct bus_type acpi_bus_type;
  extern struct bus_type pnp_bus_type;

Why? Because in the driver core if you subclass struct device and want
to bind drivers, as both PNP and ACPI do, you must place those devices
on a bus with a bus_type matching the device type. Thus subclassing
the device means subclassing the bus as well.

The purpose of the bus_type is to match drivers to devices and provide
methods to the driver core. The bus_type also defines the unique name
space of the device names.

It is confusing because the word bus immediately makes people think of
physical objects like I2C, PCI, etc, but that is not what bus_type
does in the object model of the driver core, IMHO.

So, if you subclass struct device for MFD's usage, then you must also
create a bus_type to handle driver binding. The MFD bus_type. Just
like auxillary does.

Making a mfd subclass is the logical thing for a subsystem to do,
co-opting another subsystem's bus_type is just really weird/abusive.

auxillary bus shows how all these parts work, and it is simple enough
to see the pieces clearly.

Jason
