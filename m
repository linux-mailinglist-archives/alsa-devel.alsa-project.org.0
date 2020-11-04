Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1CE2A716D
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 00:23:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7FB1682;
	Thu,  5 Nov 2020 00:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7FB1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604532197;
	bh=OMB15+ypVS6RFGu368eoqkUhfAJEzG9CEbmt4kkjw0s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RaeZscGWuFtKhAZbidT9Nt1/bElhHP8fgH6nMYi4fGXjnk5SAnWb8Jkhgo1eVJ6/h
	 /1YS6touAlAS1BxePCXjEBGOr4+kc5IvGaDxKH7FiQKy7Q65/HPKBkbGXex9eC0MQM
	 6aXU84Zb18DDxoZm0T0jM5FjDqZUdRcz3zLWJK9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 308D6F8015A;
	Thu,  5 Nov 2020 00:21:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEAC6F80234; Thu,  5 Nov 2020 00:21:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98098F800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 00:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98098F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="nbBwJZMY"
Received: by mail-ej1-x644.google.com with SMTP id dk16so233545ejb.12
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 15:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkxbaeAsRvfPNMaiW0gFtiCQOBmoS4GNd3nY4Wwz8Hk=;
 b=nbBwJZMY+xrKg6w6NoyyZ8wH6PRrpWDJMwjQmqe2WQUKuJO5hUA4CVT37Q2bT3zk6M
 XXGYTpqF1YDiy5XaStqn2/wwlKmEE4KiWnngd9Hg4pwEnL3nDkVgzYAWjotLvVSgC8RI
 OHRURM5VZ+ERQIF6Zw6htdalcHKNqqZ5XS6xWz/S3YRSMU2iC+YP3iut1T2hy68jS+YE
 L1nTzHri580AMi64MfXaRmO1YeFLTfHm4V1xZh5k6V5MQdopCu5nARpraa1dfQ7trQzf
 +6RvDh4gvwQHvyG3b9jdZ9wWt+STGKccdgYSKelxfhKJOayGBw+tSbjtTiFw+2KIRg8M
 qiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkxbaeAsRvfPNMaiW0gFtiCQOBmoS4GNd3nY4Wwz8Hk=;
 b=tSbgK9E01OCpqSH3bdSp+kmXxFikabNreuvX8D86dHHNBmoA/sf2fFGoAxMXyHOAnS
 DG7kPytEL9zGCONT4xJ5+uWA8emk/rZIzoQUYEYsqPYb9oT2tLCltDg60s0ooXAyZCdd
 FSnrPjIYWHYfVbsTiwmASxpJ5CRFOuZ6hRoc0yIopnzuz2hB2Px60XFKJt+NEHikWqIu
 DA6hgyvjnuGekXijkOREE2VBVNoLWMNsHMjlaT6PLY25wbdX4nCimuBiGj8oy/KyJSO8
 LrROygeAOU2dRm9HX3psVzTN7XklLfx2R+eX9RjOYiH0e9JmLnwICZ19kXHDX2AwWzpP
 iKDA==
X-Gm-Message-State: AOAM533e7wZKnCJpgut9c7E9fviPzU3e5jhrn0xUWgar5kqO2+yH2YkV
 N2BgobEtHBkGaBkx2mgjb6lswTqImrYYyG2o61K6mw==
X-Google-Smtp-Source: ABdhPJxvb/hNG9Gu9hrl82xWn1tmJIgoueWGEVMCGBlWcYM3JxH/JkmRoeh47/b7BtcC3eHP9KumYl6m1HGAoVQj2Mk=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr427071ejb.472.1604532094560; 
 Wed, 04 Nov 2020 15:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-7-leon@kernel.org>
 <20201103154525.GO36674@ziepe.ca>
In-Reply-To: <20201103154525.GO36674@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 4 Nov 2020 15:21:23 -0800
Message-ID: <CAPcyv4jP9nFAGdvB7agg3x7Y7moHGcxLd5=f5=5CXnJRUf3n9w@mail.gmail.com>
Subject: Re: [PATCH mlx5-next v1 06/11] vdpa/mlx5: Connect mlx5_vdpa to
 auxiliary bus
To: gregkh <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Takashi Iwai <tiwai@suse.de>, Jason Wang <jasowang@redhat.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Jakub Kicinski <kuba@kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>, Mark Brown <broonie@kernel.org>,
 Parav Pandit <parav@nvidia.com>, David M Ertman <david.m.ertman@intel.com>,
 Roi Dayan <roid@nvidia.com>, virtualization@lists.linux-foundation.org,
 "Saleem, Shiraz" <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
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

On Tue, Nov 3, 2020 at 7:45 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
[..]
> > +MODULE_DEVICE_TABLE(auxiliary, mlx5v_id_table);
> > +
> > +static struct auxiliary_driver mlx5v_driver = {
> > +     .name = "vnet",
> > +     .probe = mlx5v_probe,
> > +     .remove = mlx5v_remove,
> > +     .id_table = mlx5v_id_table,
> > +};
>
> It is hard to see from the diff, but when this patch is applied the
> vdpa module looks like I imagined things would look with the auxiliary
> bus. It is very similar in structure to a PCI driver with the probe()
> function cleanly registering with its subsystem. This is what I'd like
> to see from the new Intel RDMA driver.
>
> Greg, I think this patch is the best clean usage example.
>
> I've looked over this series and it has the right idea and
> parts. There is definitely more that can be done to improve mlx5 in
> this area, but this series is well scoped and cleans a good part of
> it.

Greg?

I know you alluded to going your own way if the auxiliary bus patches
did not shape up soon, but it seems they have and the stakeholders
have reached this consensus point.

Were there any additional changes you wanted to see happen? I'll go
give the final set another once over, but David has been diligently
fixing up all the declared major issues so I expect to find at most
minor incremental fixups.
