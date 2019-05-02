Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E31D1136A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 08:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD725177F;
	Thu,  2 May 2019 08:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD725177F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556778861;
	bh=bbWnHZiH8QzR0u8l6OpIMFZut6zR2dchpkjy5ux+RKM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=loHMnxLx2k5N25Y2doEo9fyRnukgUnoM/QIXqLy896NoEzlGpwSRS9fzQ79WJ6J20
	 wO6BgHX5qdl/+vo2hEzP+C+u0OZVzbO19fpAClXJt/U8ZTug5/ftxub3QM//GLW4dg
	 fOyMIlRKWzd/oq0vmZ+pY1SwO2EV7CjsgxvCal6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 457D4F89726;
	Thu,  2 May 2019 08:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C1B7F89724; Thu,  2 May 2019 08:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D892F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 08:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D892F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hBBk4E5Y"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C63620873;
 Thu,  2 May 2019 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556778741;
 bh=h6lQUZAXWXjVncrTfdjGeEblQS97dkVgyYPRpZ8VW90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hBBk4E5Ylzod4E003AbqFlC3AvaC8ABsCM4IbQ7pySzcD9tZpd7Y9fFvgxpkyzf76
 uWYvzldvXXUoG+f1ErefYkAdl4EzYp40H5KClfPuxxJQbn92Kf0JY/ynkoGWqxitpX
 ard7zdwZUgqVgFHTgTHUG4NnS3ytXlg0D5HTTvuw=
Date: Thu, 2 May 2019 08:32:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190502063219.GB14347@kroah.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
 <20190501155745.21806-23-pierre-louis.bossart@linux.intel.com>
 <20190502053746.GE3845@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190502053746.GE3845@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH v4 22/22] soundwire: add missing newlines
 in dynamic debug logs
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

On Thu, May 02, 2019 at 11:07:46AM +0530, Vinod Koul wrote:
> On 01-05-19, 10:57, Pierre-Louis Bossart wrote:
> > For some reason the newlines are not used everywhere. Fix as needed.
> > 
> > Reported-by: Joe Perches <joe@perches.com>
> > Reviewed-by: Takashi Iwai <tiwai@suse.de>
> > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > ---
> >  drivers/soundwire/bus.c            |  74 +++++++++----------
> >  drivers/soundwire/cadence_master.c |  12 ++--
> >  drivers/soundwire/intel.c          |  12 ++--
> >  drivers/soundwire/stream.c         | 110 ++++++++++++++---------------
> 
> Sorry this needs to be split up. I think bus.c and stream.c should go
> in patch with cadence_master.c and intel.c in different ones

Again, _way_ too picky.  You can't look a gift horse _too_ closely in
the mouth...

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
