Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21582CDA77
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 16:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0779E1845;
	Thu,  3 Dec 2020 16:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0779E1845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607011041;
	bh=fhjad0eTO9P9/T4Tz1q8beFBF5kUWHnYijHywzYZd30=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y2DccEr5K2aNdrC/D1/K2b3fioZi4ABv4TH1pOqGr81veADwpJU5xz/IplTqYJUd1
	 0DrI3g/1hgdKchN7OcZRv332j2kgIKY8aK8+TE1ibEanBuG1C+5drUphaOd7kwpAy7
	 qrHQ5zcP3r7d+FfT3ZvmOMHTTKzKo+dRetVeSXFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C739F8026B;
	Thu,  3 Dec 2020 16:55:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16A32F8016D; Thu,  3 Dec 2020 16:55:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8F63F80158
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 16:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F63F80158
Date: Thu, 3 Dec 2020 17:55:22 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201203155522.GE16543@unreal>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8j/PgVDii3Jthzx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8j/PgVDii3Jthzx@kroah.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>, lgirdwood@gmail.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, jgg@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>, kuba@kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, davem@davemloft.net,
 linux-kernel@vger.kernel.org, Parav Pandit <parav@mellanox.com>
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

On Thu, Dec 03, 2020 at 04:07:42PM +0100, Greg KH wrote:
> On Wed, Dec 02, 2020 at 04:54:24PM -0800, Dan Williams wrote:
> > PS: Greg I know I promised some review on newcomer patches to help with
> > your queue, unfortunately Intel-internal review is keeping my plate
> > full. Again, I do not want other stakeholder to be waiting on me to
> > resolve that backlog.
>
> Ah, but it's not only you that should be helping out here.  Why isn't
> anyone else who is wanting this patch merged willing to also help out
> with patch review and bug fixes that have higher priority than adding
> new features like this one?
>
> It's not your fault by any means, but the lack of anyone else willing to
> do this is quite sad :(

First step to get help is to ask for the help. From whom did you ask?
And where did you ask? I never heard any request to help with newcomer
patches, nor direct, nor in korg-users/newbies MLs.

Thanks

>
> greg k-h
