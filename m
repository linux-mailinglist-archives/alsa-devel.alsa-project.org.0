Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C02A91C7
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:48:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095861661;
	Fri,  6 Nov 2020 09:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095861661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652493;
	bh=mLsNqMpg+fjeU5Wj1TlalFF/ej18WzbVB4jrTqF1H+g=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcVhWd69XHkjJYk4GLUyeT50EfAjEnX5u8oYTPTKKWW2dgF/m5WN+1IsFMQSnKm3T
	 Q5mQEQTr8Zp7UJRIMp/DEi/sQHsoZo+JPC7dZcWLutegm4Mb5gi/wtAD16RVKsdI61
	 zZJCfpLe6kC9I1otl2eWgB1YJINWF8y7/oaGiSas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB97EF804FB;
	Fri,  6 Nov 2020 09:43:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B15F800EC; Thu,  5 Nov 2020 21:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81E7DF800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 21:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E7DF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tip2y8ih"
Received: from lt-jalone-7480.mtl.com (c-24-6-56-119.hsd1.ca.comcast.net
 [24.6.56.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70B86206CB;
 Thu,  5 Nov 2020 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604608314;
 bh=mLsNqMpg+fjeU5Wj1TlalFF/ej18WzbVB4jrTqF1H+g=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tip2y8ihPjnL+k84Ml5q7RJaT+qHuQ8ouQtkwEu9HT+3NJ+Do7g6/WkFLgvWr0nxG
 XL66eSQHoh7XVgTbzWogbyGV0wbtvQ24hhUBY24NLMphWpdncSrpEJ1V5DOZXDJx+e
 SeV6rpliRjmRwz5J0sZtZO/dmhjGVN3fW+ON4qpQ=
Message-ID: <8a8e75215a5d3d8cfa9c3c6747325dbbf965811f.camel@kernel.org>
Subject: Re: [PATCH mlx5-next v1 04/11] vdpa/mlx5: Make hardware definitions
 visible to all mlx5 devices
From: Saeed Mahameed <saeed@kernel.org>
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, 
 Jason Gunthorpe <jgg@nvidia.com>, gregkh <gregkh@linuxfoundation.org>
Date: Thu, 05 Nov 2020 12:31:52 -0800
In-Reply-To: <20201101201542.2027568-5-leon@kernel.org>
References: <20201101201542.2027568-1-leon@kernel.org>
 <20201101201542.2027568-5-leon@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:14 +0100
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kiran.patil@intel.com, "Michael S.
 Tsirkin" <mst@redhat.com>, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Jason Wang <jasowang@redhat.com>, ranjani.sridharan@linux.intel.com,
 virtualization@lists.linux-foundation.org, fred.oh@linux.intel.com,
 tiwai@suse.de, broonie@kernel.org, Parav Pandit <parav@nvidia.com>,
 Roi Dayan <roid@nvidia.com>, shiraz.saleem@intel.com,
 Jakub Kicinski <kuba@kernel.org>, dan.j.williams@intel.com,
 Leon Romanovsky <leonro@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
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

On Sun, 2020-11-01 at 22:15 +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Move mlx5_vdpa IFC header file to the general include folder, so
> mlx5_core will be able to reuse it to check if VDPA is supported
> prior to creating an auxiliary device.
> 

I don't really like this, the whole idea of aux devices is that they
get to do own logic and hide details, now we are exposing aux specific
stuff to the bus .. 
let's figure a way to avoid such exposure as we discussed yesterday.

is_supported check shouldn't belong to mlx5_core and each aux device
(en/ib/vdpa) should implement own is_supported op and keep the details
hidden in the aux driver like it was before this patch.

