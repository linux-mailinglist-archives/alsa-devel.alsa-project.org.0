Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A52CD31361D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 16:06:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D1801681;
	Mon,  8 Feb 2021 16:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D1801681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612796795;
	bh=SdhQPOxHBaOxP7uB+n1WhqFyjom2B/zd3rQI/1wC7gI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3ugCXoxFQiBzTKuHlsdyoOT72gAih1Rb1RnlHoD66FR7h0rWosFGPq7dQ6DnxpV8
	 jTg1LAy0aURXhU2q4ozqbS8ooOoJcb7LsS7fC+60B3j+M1GjFV4VJJNNoRszJNtm3M
	 KNCfHg3ge/KyttaMQdxgG5M5OFiuc6I4xACTN0Ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03F6F80114;
	Mon,  8 Feb 2021 16:05:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D47FF80169; Mon,  8 Feb 2021 16:05:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C835CF8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 16:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C835CF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cntU4YDJ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2F4464EE0;
 Mon,  8 Feb 2021 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612796693;
 bh=SdhQPOxHBaOxP7uB+n1WhqFyjom2B/zd3rQI/1wC7gI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cntU4YDJiKilcC/iJrm8DtaeF5WeQp6wTyF0Xb/xLcgHVlU9/SQzLVipEptry/07C
 8ZM9IQvouzh+DcCN006qwUcgB+Rd1VtM0wAj2S3QTAq12ANP6ZopXvLmMg6eecvPk4
 NncFMHtV++/nkfq08EHGyS1IXQgqulSDe3VZag8pZUjbZi0h1MOxOB3NLPpx6azDtK
 7B5h5I7CV92SGe7bpfpqDYQk6szH87iVQqqKwINwnLSz5hXv0ZdKYXaD+dga4aVuHa
 Z3XIFr7mMKrJuka2MUTdnIbJHgqcNS2k3yYVzA6aRGskZlOCEmrL2GtA9Hs/3V8oYg
 00EB+/V/ssFVA==
Date: Mon, 8 Feb 2021 20:34:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v2 0/9] soundwire/regmap: use _no_pm routines
Message-ID: <20210208150449.GF879029@vkoul-mobl.Dlink>
References: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
 <20210206102644.GN2656@vkoul-mobl.Dlink>
 <20210208125032.GF8645@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208125032.GF8645@sirena.org.uk>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

Hello Mark,

On 08-02-21, 12:50, Mark Brown wrote:
> On Sat, Feb 06, 2021 at 03:56:44PM +0530, Vinod Koul wrote:
> 
> > Applied all sdw patches, thanks
> 
> Is there a tag I can pull the new APIs from?

Yes, please pull from below:

git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git tags/soundwire-5.12-rc1

Thanks
-- 
~Vinod
