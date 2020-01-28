Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A993E14B090
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 08:51:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1222E165F;
	Tue, 28 Jan 2020 08:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1222E165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580197906;
	bh=B7qsy9QZQczYVmnPo16U4wpApw5sDw04hpRDoAHoIB8=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPJpIZDXdOzPZqYakpXJR4oPWh6R4BUd4mI/psJgS/oj3boBpO4ZN3k8O4CWy6b+A
	 UzgLTR05ZpSZ3yWezYqmepr1xfsFzkgjMXQYvC2lbMJhWUdZBj0ZZJTKcHAmbDrprz
	 hCxWhVNHK8BU1V/Di7aJ4v4OIcrZJHHoU5nPYerc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18703F80082;
	Tue, 28 Jan 2020 08:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B7BAF80123; Tue, 28 Jan 2020 08:50:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEC01F80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 08:49:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC01F80082
IronPort-SDR: NAy+yfYWJxr5/29uKoZYHIooskrofmxznZpdh/BW/G0NO6UBF0f3Ih4Hr7u38Tc1uCuFyajJtK
 Yx7Z7FqNrCKks6SeinwD4p9gXQMfAFyuLZ1me1WXSSubJ7HR//X6mTUPYZCBN9mCG7tCdPUdU5
 xKU6JI3/U1K3pcceRi/vbw1S2/2d5b+rqXX6jAY45x/tlE7C1A1LaAvqV3nvFe1I91iflN4AZs
 3kJQbgnTQxh2kFMnZy7m1y9yS8iFcfWWkqqjuLHZaJ4/btmhXh7aE/EnOkikWl2oV9O5RO6q0K
 OUo=
X-IronPort-AV: E=Sophos;i="5.70,372,1574118000"; 
   d="scan'208";a="4681350"
Date: Tue, 28 Jan 2020 08:49:47 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Ben Dooks <ben.dooks@codethink.co.uk>
In-Reply-To: <318f0256-fe6d-c34d-4deb-74540fca8d0d@codethink.co.uk>
Message-ID: <alpine.DEB.2.20.2001280846330.9620@lnxricardw1.se.axis.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
 <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
 <5d3ae629-5d30-0930-5dd1-15161e64926e@codethink.co.uk>
 <9daeeb94-2b90-18b8-2e1e-daae5acf079d@gmail.com>
 <fd73f68c-80f5-ac80-f6e4-42256d3df76d@codethink.co.uk>
 <37beb96a-a525-c72f-a7e1-e9ef5d61f3b2@gmail.com>
 <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <318f0256-fe6d-c34d-4deb-74540fca8d0d@codethink.co.uk>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX03.axis.com (10.0.5.17)
Cc: "linux-kernel@lists.codethink.co.uk" <linux-kernel@lists.codethink.co.uk>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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


On Fri, 24 Jan 2020, Ben Dooks wrote:

> So I assume aplay has turned the S24_3LE -> S24_LE

A couple of years ago (so may be inaccurate now) I concluded after some 
testing that S24_LE was broken in arecord and aplay, at least when it came 
to .wav files. Meaning that files I recorded with arecord could be played 
back by aplay, but not in any other application I tried, such as Audacity.

I can try to dig out the gory details, but ISTR it came down to the 
header(s) in the .wav file being incorrectly filled in with regard to 
number of bits per sample vs valid bits per sample.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
