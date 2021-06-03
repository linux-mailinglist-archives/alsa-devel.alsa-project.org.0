Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADAD39ADCF
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 00:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38691718;
	Fri,  4 Jun 2021 00:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38691718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622758819;
	bh=jt6fW0lp64VOl0II5IDX3ZhKas82lzkBPi0CMQQSW8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHC0AM+N4QE6tFRx+4CHDB+c8nj84t+iPhKfOZ0at0EvGPtuc6LERwQ/THMLp5hnd
	 LEIhVVJHP/BJayt0OOSCGMSW4SaA4bcI2b7BKEZjXH1w/UydiO0DLTyp0im2EHqI0R
	 yR4cRF5cQ+Wj6YTv/Wm+goyW8Ketvqt1y3Qlwqs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 461EDF8025B;
	Fri,  4 Jun 2021 00:18:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09791F8025B; Fri,  4 Jun 2021 00:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from toothrot.meleeweb.net (toothrot.meleeweb.net [62.210.131.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00103F80100
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 00:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00103F80100
Received: from [80.111.226.61] (port=51724 helo=lady-voodoo.scabb)
 by toothrot.meleeweb.net with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 id 1lovfW-0045zT-Sg; Fri, 04 Jun 2021 00:18:26 +0200
Date: Thu, 3 Jun 2021 23:18:25 +0100
From: Bertrand Jacquin <bertrand@jacquin.bzh>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: snd-soc-lpass requires REGMAP_MMIO
Message-ID: <YLlVMdJeqCjXJEAD@lady-voodoo.scabb>
References: <20210529184957.373232-1-bertrand@jacquin.bzh>
 <20210601125939.GA4322@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210601125939.GA4322@sirena.org.uk>
Jabber-ID: bertrand@jacquin.bzh
X-GPG-Key: 0xA3B5C016618D9AAA
X-GPG-Fingerprint: D71B FE62 F66F 3C8B 1A25  A461 A3B5 C016 618D 9AAA
X-GPG-URL: https://sks-keyservers.net/pks/lookup?op=get&search=0xA3B5C016618D9AAA
User-Agent: All mail clients suck. This one just sucks less.
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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


On Tuesday, June 01 2021 at 13:59:39 +0100, Mark Brown wrote:
> On Sat, May 29, 2021 at 07:49:57PM +0100, Bertrand Jacquin wrote:
> 
> > This does also apply to other Qualcomm Macro LPASS all making call to
> > devm_regmap_init_mmio()
> > ---
> >  sound/soc/codecs/Kconfig | 4 ++++
> 
> A Signed-off-by is required for patches, please see submitting-patches.rst 
> in the kernel tree for details on what this is and why it is important.

This sounds legit, I have submitted an updated version.

Cheers,

-- 
Bertrand
