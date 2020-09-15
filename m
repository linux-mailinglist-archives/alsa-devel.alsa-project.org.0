Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C216226A6DC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 16:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1126F1676;
	Tue, 15 Sep 2020 16:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1126F1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600179133;
	bh=+R+IKAKZQYkLR7KIiLxpuuPm5bZnjzeal3GKWrEShUo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hB/nWW7eKPpNJ6/xMSBNw15tFyfAnPvBY2KZUkrnaPPoYIuM40yoTVtJmHLU1aVZV
	 vDDwR0rWyJmfLHb/KiuuXJf3a7+BJTb5EJOHPYNQwPVT3bOBqPU3J/qj63ipUcm7cp
	 qOsJTUqkUTuLr47D71OC4n6nJJoacgAo87CTJW8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 386A5F8025E;
	Tue, 15 Sep 2020 16:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A62F80212; Tue, 15 Sep 2020 16:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B1C4F800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 16:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B1C4F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="ZDUvluzG"; 
 dkim=pass (1024-bit key) header.d=hansenpartnership.com
 header.i=@hansenpartnership.com header.b="ZDUvluzG"
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 9BF068EE188;
 Tue, 15 Sep 2020 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1600179008;
 bh=+R+IKAKZQYkLR7KIiLxpuuPm5bZnjzeal3GKWrEShUo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZDUvluzGV6yKCC/nF9wrKzitsx/6M3Qz4Dv0CFUEt0vmhscavKWlYegA3t3D9AtoS
 cgl18SKCLQ6g+fOWhOlSE1rajdI6kKqsO/3XSzI9vcO6roMQjXQ+sBvii1pDKecG7Q
 7/nP62+cOOfIkefYX7rGreL2C+Tu2bzmyrkPw+GQ=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id o2D0dkS7cauB; Tue, 15 Sep 2020 07:10:08 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
 [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 329868EE107;
 Tue, 15 Sep 2020 07:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1600179008;
 bh=+R+IKAKZQYkLR7KIiLxpuuPm5bZnjzeal3GKWrEShUo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZDUvluzGV6yKCC/nF9wrKzitsx/6M3Qz4Dv0CFUEt0vmhscavKWlYegA3t3D9AtoS
 cgl18SKCLQ6g+fOWhOlSE1rajdI6kKqsO/3XSzI9vcO6roMQjXQ+sBvii1pDKecG7Q
 7/nP62+cOOfIkefYX7rGreL2C+Tu2bzmyrkPw+GQ=
Message-ID: <1600179006.5092.6.camel@HansenPartnership.com>
Subject: Re: [PATCH 07/17] 53c700: improve non-coherent DMA handling
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 15 Sep 2020 07:10:06 -0700
In-Reply-To: <20200915062738.GA19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914144433.1622958-8-hch@lst.de>
 <1600096818.4061.7.camel@HansenPartnership.com>
 <20200915062738.GA19113@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
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

On Tue, 2020-09-15 at 08:27 +0200, Christoph Hellwig wrote:
> On Mon, Sep 14, 2020 at 08:20:18AM -0700, James Bottomley wrote:
> > If you're going to change the macros from taking a device to taking
> > a hostdata structure then the descriptive argument name needs to
> > change ... it can't be dev anymore.  I'm happy with it simply
> > becoming 'h' if hostdata is too long.
> > 
> > I already asked for this on the first go around:
> 
> And I did rename them, those hunks just accidentally slipped into
> patch 12 instead of this one.  Fixed for the next versions.

Ah, yes, found it ... thanks for doing that!

James

