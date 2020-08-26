Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB969252DB1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 14:05:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F801751;
	Wed, 26 Aug 2020 14:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F801751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598443520;
	bh=D1uJfmjgC/26o2z3u1zFuw7ebz3MKhc1sl8fKcEtvqE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iy/Doo1Ok2/SSMqH7Dp6fPk1UpDhTByZ5VqfLzOR2RIXhzFdzs1tLxHZwMwmCjyAd
	 tawA18yM6CIRP+TNz+pMJjqTxsqSDbAX3yNGqo0EBDO0E3ekpisgqHUp/xG9uGBTRx
	 0t+6P4DotGNdsvcm9TB8tLI13Fucp9F4S8wrFcvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8802EF80105;
	Wed, 26 Aug 2020 14:03:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49FB6F801D9; Wed, 26 Aug 2020 14:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D5F3F800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 14:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D5F3F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="duxjQB0p"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA8C920897;
 Wed, 26 Aug 2020 12:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598443407;
 bh=D1uJfmjgC/26o2z3u1zFuw7ebz3MKhc1sl8fKcEtvqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=duxjQB0p/RG9lpGyNMl+3wLI/iY6Ywj0fIehqcHQRy6ik4BDUpo57UKpANLlRQY8O
 1EqLuq51Wy4AoOO/kkgVX/g7QDGd7sZiqZsXWQyan50Wc2rpumt4wwqr+KMxZIN7m/
 5Y2Bz85mXHQCqsQvBiD9JNTOcc2O9QLUW0B6pt0Q=
Date: Wed, 26 Aug 2020 17:33:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] regmap: sdw: move to -EOPNOTSUPP
Message-ID: <20200826120323.GD2639@vkoul-mobl>
References: <20200825171656.75836-2-pierre-louis.bossart@linux.intel.com>
 <20200825214858.GK5379@sirena.org.uk>
 <6f7e5830-4dd8-1ecc-20c3-df75bc9ef265@linux.intel.com>
 <20200826095600.GA4965@sirena.org.uk>
 <s5ha6yhu3af.wl-tiwai@suse.de>
 <20200826101301.GB4965@sirena.org.uk>
 <s5h8se1u2or.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h8se1u2or.wl-tiwai@suse.de>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 26-08-20, 12:22, Takashi Iwai wrote:
> On Wed, 26 Aug 2020 12:13:01 +0200,
> Mark Brown wrote:
> > 
> > On Wed, Aug 26, 2020 at 12:09:28PM +0200, Takashi Iwai wrote:
> > > Mark Brown wrote:
> > 
> > > > checkpatch is broken.
> > 
> > > Heh, I'm not objecting it :)
> > 
> > > OTOH, it's also true that ENOTSUPP is no good error code if returned
> > > to user-space.  Unfortunately many codes (including what I wrote) use
> > > this code mistakenly, and they can't be changed any longer...
> > 
> > It's also used internally in various places without being returned to
> > userspace, that's what's going on here - the regmap core has some
> > specific checks for -ENOTSUPP.
> 
> Sure, for such an internal usage any code can be used.
> The question is a case like this -- where the return code might be
> carried to outside.  Though, looking through the grep output, all
> callers simply return -EINVAL for any errors, so it doesn't matter
> much for now.
> 
> 
> BTW, there are a few callers of devm_regmap_init_sdw() checking the
> return value with NULL.  This will crash as the function returns the
> error pointer, and they must be checked with IS_ERR() instead.

Yes that is correct, all expect wsa codec do the incorrect thing. Will
send patches for these shortly

Thanks
-- 
~Vinod
