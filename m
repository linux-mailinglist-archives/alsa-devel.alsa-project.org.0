Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661714D0E0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 20:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788F9167E;
	Wed, 29 Jan 2020 20:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788F9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580324504;
	bh=VHBRBnw2h4GsjMuB5lF1vz4yq/CSqx+92B9B3Ll2Wek=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLsB/8lJV91MirPBX+yWumQ6Lcl/X5PWVHTzWBWuK1rVuEFQhpKrkHpZW9gAVplp7
	 da3vlvlLGxoJeXAfbi8bZJli3w5RmlvycSPUs13E7pnS4MyzobUIom5zzv9GK5WOJM
	 Z50vcDf1oQ858A4UDymssxY7kq3PLfnkqaant0yo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D844F80229;
	Wed, 29 Jan 2020 20:00:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E1E9F8021E; Wed, 29 Jan 2020 19:59:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BEA5F80082
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 19:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BEA5F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jXBvgrnE"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60D52214DB;
 Wed, 29 Jan 2020 18:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580324389;
 bh=c7yzCXgx2VeReADwCtsyrmEoFKsbx0JQVq7K3TBHe2c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jXBvgrnEYcjkAed9JZ0PUvKZZKJYdeTJJHQaG8d5O99gUG7M3EL4C/GkscRgYVnK6
 0qXl85Ygla6x3bIl+FrQd0K5R+8PdEOcmrneI5ommesgTNNqxiDSmHOHRLknMwE3zq
 d5+XgPzS/6WKCtQaVhu4WywGhukaS0AbmDYQ0xJI=
Date: Wed, 29 Jan 2020 19:59:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Message-ID: <20200129185947.GA478824@kroah.com>
References: <CAFQqKeUnT=QHkBWp3ZDeuBtYCS=f7FLa0+eS9sRo8reK0N6YWg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFQqKeUnT=QHkBWp3ZDeuBtYCS=f7FLa0+eS9sRo8reK0N6YWg@mail.gmail.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] Question about the correct license to use with
	debugfs in SOF
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 29, 2020 at 09:04:06AM -0800, Sridharan, Ranjani wrote:
> Hi Greg,
> 
> Can I please bother you with you quick question about the right license to
> use for the
> debug.c file in the SOF directory?

What is "SOF"?

> Currently, it is dual licensed with GPLv2.0 and BSD. But Pierre brought up
> a concern about this conflicting with all the exports in the file being
> GPLv2.0. Should this be fixed to change the license to GPLv2.0 only?
> Appreciate your help in this regard.

Why ask a developer a legal question, don't you all have a whole huge
legal department who knows all of this type of thing really really well?

Would you ask a programmer a medical question?

That being said, think about trying to justify the existance of a BSD
licensed file trying to access gpl-only symbols, why in the world would
this even be a question?  Why have it dual licensed at all when I was
told that Intel was NOT going to do this anymore for any kernel code?

bah,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
