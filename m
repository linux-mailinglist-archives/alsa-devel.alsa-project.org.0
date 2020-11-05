Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6F2A83FE
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 17:50:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEB341678;
	Thu,  5 Nov 2020 17:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEB341678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604595024;
	bh=hp00NowhH8u0qY+Qq9UNO5zvUU1DEntAGxSIxcgcf/Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smtFib/B6dz7fBbrYUFaVcdw6tnEeaucq97X3ZZMcgibwfotXbcjKZc4XbjYa8yTJ
	 kpSusm8NguNdzXWP00rsLcJ3/YgSkV+KQ5WH6oLLBcx5zUA6X43rRn/zLCVkGMOBBt
	 XNKst9eTIrQ/vTWnWThkBqt+z1+r2Dmqo+ideJw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BED3F800EC;
	Thu,  5 Nov 2020 17:47:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3B64F800EC; Thu,  5 Nov 2020 17:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4064F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 17:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4064F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca
 header.b="T/9h4B64"
Received: by mail-qk1-x741.google.com with SMTP id a65so1740642qkg.13
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zhqw6nXW7an1sciymnqR0tpduOyD+zat59s5GBmVtbM=;
 b=T/9h4B64oiALMfc42uebDeGSEyGeD0JwaqBLLTEWSdW7X4iF0nNQTGD8ItXWOPi1xM
 DOvW9K/135GnWww5roe4BdwNCigRiUCwRDf4zxYgylBvKtGQ0y4XU2iCE2XUZ07ICn3L
 rTXg0XPkpw/UUFWbC8Cig/5dZdORb0CzNbOAohUH2HvpxEPnNWIhHQhklANJ/hAkg8H3
 MKb/DtGr/YW1Na1efMq3URRzjr/gbNFdmBokrf0ljC1HCRvWFNeTvkJMTB7Vdi6j+NUo
 8K7nKdD6xanzOWR6UK32MPYw28AHa+zQYvDZXAfI7cRkoGcIsjwKs0OHgVNNYy/123gh
 Xm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zhqw6nXW7an1sciymnqR0tpduOyD+zat59s5GBmVtbM=;
 b=SWjqvyIz1pCiMX9bZagRdbyi/sNVMcf7znfg86O69HUJOU66/stT/86GJIHvJQgS72
 H7YrlYTYqDyhAU9KSviWUV6LAIOr1Y1mw8zLwGSpD3qBJ8KoU9zzX5H7Gmo7mFxNNDZc
 zdvFcHDGQEIC6iRAlJOtTsnhUrj0lCJz8fWtpBHvJdxZ+8agNnopaIO8g0q5sUQ5f5sF
 8YqDEOI9F6yAnJRJIlx9BWRoJV305y4Zvhp4GdByW4cSdfzxZynTKAjFRkwy7ZnKQIIu
 Fi8qydVw+YIVWgIQpcCjEjWlGd24hpHWnkDJFFWv412OaOe+rihWur08hOHGJlTSdnxl
 WKGQ==
X-Gm-Message-State: AOAM530EfbBjMwI8JVDzcelcxRZ4dt9CaO9+8JlT/19CsKN0MnLF5Rnd
 EyC9FGNi6v1uovwfo+0PZTqC/w==
X-Google-Smtp-Source: ABdhPJwzljYxFoBvKq1VFYeruz7gb+7H6oGN3WPy1j1HdsQNZAjc4YfzOlkNglv0PQR1cXTjqGzkUA==
X-Received: by 2002:a05:620a:697:: with SMTP id
 f23mr2825760qkh.374.1604594859867; 
 Thu, 05 Nov 2020 08:47:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id g20sm1208553qtq.51.2020.11.05.08.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 08:47:39 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kaiQE-0007e8-Gm; Thu, 05 Nov 2020 12:47:38 -0400
Date: Thu, 5 Nov 2020 12:47:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: gregkh <gregkh@linuxfoundation.org>
Subject: Re: [PATCH mlx5-next v1 06/11] vdpa/mlx5: Connect mlx5_vdpa to
 auxiliary bus
Message-ID: <20201105164738.GD36674@ziepe.ca>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-7-leon@kernel.org>
 <20201103154525.GO36674@ziepe.ca>
 <CAPcyv4jP9nFAGdvB7agg3x7Y7moHGcxLd5=f5=5CXnJRUf3n9w@mail.gmail.com>
 <20201105073302.GA3415673@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105073302.GA3415673@kroah.com>
Cc: alsa-devel@alsa-project.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Takashi Iwai <tiwai@suse.de>, Jason Wang <jasowang@redhat.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Doug Ledford <dledford@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, "Patil, Kiran" <kiran.patil@intel.com>,
 Mark Brown <broonie@kernel.org>, Parav Pandit <parav@nvidia.com>,
 David M Ertman <david.m.ertman@intel.com>, Roi Dayan <roid@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Saeed Mahameed <saeedm@nvidia.com>, "David S . Miller" <davem@davemloft.net>
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

On Thu, Nov 05, 2020 at 08:33:02AM +0100, gregkh wrote:
> > Were there any additional changes you wanted to see happen? I'll go
> > give the final set another once over, but David has been diligently
> > fixing up all the declared major issues so I expect to find at most
> > minor incremental fixups.
> 
> This is in my to-review pile, along with a load of other stuff at the
> moment:
> 	$ ~/bin/mdfrm -c ~/mail/todo/
> 	1709 messages in /home/gregkh/mail/todo/
> 
> So give me a chance.  There is no rush on my side for this given the
> huge delays that have happened here on the authorship side many times in
> the past :)

On the other hand Leon and his team did invest alot of time and
effort, very quickly, to build and QA this large mlx5 series here to
give a better/second example as you requested only a few weeks ago.

> If you can review it, or anyone else, that is always most appreciated.

Dan, Leon, Myself and others have looked at the auxiliary bus patch a
more than a few times now. Leon in particular went over it very
carefully and a number of bugs were fixed while he developed this
series.

There seems to be nothing fundamentally wrong with it, so long as
people are fine with the colour of the shed...

Jason
