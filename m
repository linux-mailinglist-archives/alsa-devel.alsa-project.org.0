Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2573DCFCD
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 06:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4137B17E3;
	Mon,  2 Aug 2021 06:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4137B17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627879091;
	bh=bOV8QRJlZSK0S7Tob0YrhYTd7LxOrJnuNVmVAD3nWv4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TgmefoY8apOA+YNoag9nWPebf407nBHPjDl5H9Bbp9LO37i/5nY0eLd4EKZ0dGol/
	 thFTPyICQzbjwXbNB8fBy19UsvObhdSpAglpaCVHTY0BrDqZ6BUdmyBbopx7xkPxCv
	 Th7uNg5l7tDj0JHWG2VV+UFrH8A4iMMNoCAInvBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE696F8026A;
	Mon,  2 Aug 2021 06:37:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B17F80268; Mon,  2 Aug 2021 06:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32361F8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 06:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32361F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Irj82VvJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3166060FC1;
 Mon,  2 Aug 2021 04:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627879030;
 bh=bOV8QRJlZSK0S7Tob0YrhYTd7LxOrJnuNVmVAD3nWv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Irj82VvJt8GldTn81sJ6UBXl7QOcZ3yl6deRr++5lx6t/7qzUSglVFtdHXDjW6Dci
 RJU1NpN61Gcm2jr+kHyXlvm3Icg7u0yheDdGNh//DhczKkTxNMTVLRlNzOwzKYaFf+
 OWXaigfvCUU2OWLcxDvZc0XqkE/y8dYY1zA+ZdFph1PJBlmw20YOWASUPvpyx+d7po
 X97IfQ28MwUDull+1UM1HljNzne7y3M1/7f/0de5CoYVtDP2EM+an2dHAYSzMvYGzE
 JvXUpOTpMKtMpvA9loG8OTkdYG86eB2BKhIaOgJJuBg4Tck382GVuQZjF3YbqFfCkP
 A2FQFPWrmOVlw==
Date: Mon, 2 Aug 2021 10:07:06 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Subject: Re: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent bases
Message-ID: <YQd2ckho9D9DF9lJ@matsya>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
 <20210727161133.GY4670@sirena.org.uk>
 <DM6PR11MB40744606D9CD2D3FD27FC92FFFEA9@DM6PR11MB4074.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB40744606D9CD2D3FD27FC92FFFEA9@DM6PR11MB4074.namprd11.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 28-07-21, 00:38, Liao, Bard wrote:
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: Wednesday, July 28, 2021 12:12 AM
> > To: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: alsa-devel@alsa-project.org; vkoul@kernel.org; vinod.koul@linaro.org;
> > linux-kernel@vger.kernel.org; tiwai@suse.de; gregkh@linuxfoundation.org;
> > srinivas.kandagatla@linaro.org; pierre-louis.bossart@linux.intel.com; Kale,
> > Sanyog R <sanyog.r.kale@intel.com>; Liao, Bard <bard.liao@intel.com>
> > Subject: Re: [PATCH v2 0/6] soundwire/ASoC: abstract platform-dependent
> > bases
> > 
> > On Fri, Jul 23, 2021 at 07:54:45PM +0800, Bard Liao wrote:
> > > shim base and alh base are platform-dependent. This series suggests to
> > > use variables for those bases. It allows us to use different bases for
> > > new platforms.
> > 
> > The ASoC bits look fine to me, what't eh plan for merging this?  I can apply to
> > ASoC if people like, or should the Soundwire bits go via the Soundwire tree?

I have acked the sdw parts, pls pick them thru ASoC tree. If we have
conflicts, I can merge the immutable tag from your tree.

> Thanks Mark. Apply to ASoC or Soundwire are both fine to me.

-- 
~Vinod
