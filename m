Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5527E88C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 14:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC60180C;
	Wed, 30 Sep 2020 14:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC60180C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601468951;
	bh=ze7XtQIWV0+tf75Dx8DzOueUECeACm+2itAr1txzyZw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDtUlfqx4SijT8BI8TvX1oOBilhjgQqxDYNdlGombG4ho0d4tQCzJrOCqdnoypJgR
	 UORBcIan6U96w/9DrhtoUv7MM6l6pFK3udxMkMVYiNJFGxn6DQjSjSq1BTun0VweKz
	 7NA70tOyvVu1mkks6692TqZkT8XYnzz5UtT1fe8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA02F801F9;
	Wed, 30 Sep 2020 14:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD07F801ED; Wed, 30 Sep 2020 14:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD511F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 14:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD511F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1GJgoQAK"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E3912071E;
 Wed, 30 Sep 2020 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601468835;
 bh=ze7XtQIWV0+tf75Dx8DzOueUECeACm+2itAr1txzyZw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1GJgoQAKa2drG9T/F0LXfBsgp+bvg+znegj47U/Nx01PqgdkozUG9l3at9oHDQQ7W
 GDtm7c6za2x1hZyaGwvu9sUa1k+hr+s+blP9cX9aNLMWy1t736sGKn0orurfbrWNgE
 Kwz8Yo/fZKfT+zXjb0BOh9SRpJu0m8rwchXsvBFU=
Date: Wed, 30 Sep 2020 14:27:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] regmap: add support to
 regmap_field_bulk_alloc/free apis
Message-ID: <20200930122719.GA1618571@kroah.com>
References: <20200925164856.10315-1-srinivas.kandagatla@linaro.org>
 <20200925164856.10315-2-srinivas.kandagatla@linaro.org>
 <20200930115915.GB1611809@kroah.com>
 <20200930120849.GG4974@sirena.org.uk>
 <20200930121100.GA1616135@kroah.com>
 <20200930121552.GH4974@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930121552.GH4974@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, srivasam@codeaurora.org, lgirdwood@gmail.com,
 rafael@kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, rohitkr@codeaurora.org
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

On Wed, Sep 30, 2020 at 01:15:52PM +0100, Mark Brown wrote:
> On Wed, Sep 30, 2020 at 02:11:00PM +0200, Greg KH wrote:
> > On Wed, Sep 30, 2020 at 01:08:49PM +0100, Mark Brown wrote:
> 
> > > We have managed versions of the other regmap allocation functions, it
> > > makes sense for consistency to have managed versions of these too.  I
> > > think there's a meaningful difference between a simple and expected
> > > wrapper like these and infrastructure which hasn't been proved out by
> > > users.
> 
> > Ok, do you think these are really needed?
> 
> > A review would be nice :)
> 
> I applied this patch the other day - ea470b82f205fc in -next.

Great, sorry for the noise.

greg k-h
