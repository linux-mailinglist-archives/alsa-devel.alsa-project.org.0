Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB9B22A6B2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 06:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2EE165E;
	Thu, 23 Jul 2020 06:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2EE165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595479770;
	bh=fy1TB8rjpKHadG1jVEEzeFm3kN+ZDLJr33KVmJVqxI0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZej6008EslgvnUdhYHbpC+tFAV7VoobY4LUUmSsebOtD1O5e2NQL9+j2aJRmQmnj
	 fqb33R/5SPuSFy6shg1rswI+4QqEeLwLoqxVjEvI3duEaMK/E7E4ECJSEqNCNgXc/T
	 oID00ZZbrO90vY4DCkUxsbXHdqs2ceXqMax1/kT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60C1DF8020D;
	Thu, 23 Jul 2020 06:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE6A9F80212; Thu, 23 Jul 2020 06:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B71F0F800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 06:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B71F0F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P3CZDCC9"
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0807420768;
 Thu, 23 Jul 2020 04:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595479659;
 bh=fy1TB8rjpKHadG1jVEEzeFm3kN+ZDLJr33KVmJVqxI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3CZDCC9pU2t1v8t9bgg/NiGEiQ5K9OLbJysPolh2dVRXRZ65RtzNQ7g/Jx1H77FS
 sYMxkgq1ENZwdSKE11kKhcvq/iSanNA2W8V+GXCHSoLzhb44bgCE8za+4CmxQO1HuQ
 xqt/5HZRkAqWwUwGZr52fpPOiocS1eHLvmR8goZE=
Date: Thu, 23 Jul 2020 10:17:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH v2 2/6] ALSA: compress: add new ioctl for setting
 codec parameters
Message-ID: <20200723044734.GU12965@vkoul-mobl>
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
 <20200721170007.4554-3-srinivas.kandagatla@linaro.org>
 <ee2dc239-c1a7-f48f-c6f0-ec6e61ccdda6@linux.intel.com>
 <9bbfebf9-9a70-46e3-1808-413d04aa6b2c@linaro.org>
 <19cfe3fe-4b99-0976-679d-28523d7b9990@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19cfe3fe-4b99-0976-679d-28523d7b9990@linux.intel.com>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

On 22-07-20, 10:36, Pierre-Louis Bossart wrote:
> 
> > > >    * and the stream properties
> > > > + * @set_codec_params: Sets the compressed stream codec
> > > > parameters, Optional
> > > > + * This can be called in during gapless next track codec change
> > > > only to set
> > > > + * codec params
> > > 
> > > Would it be clearer if this was called set_next_codec_params()? or
> > > set_next_track_codec_params()?
> > > 
> > > Having set_params() and set_codec_params() is a bit confusing since
> > > the semantic difference is not captured in the callback name.
> > 
> > set_next_track_codec_params seems more sensible as its next track params.
> > Will change this in next version!
> 
> maybe set_params() and set_next_track_params() are enough, not sure if the
> codec reference helps?

params typically refers to whole set of compress parameters which
includes buffer information and codec parameters, so codec reference
would help.

-- 
~Vinod
