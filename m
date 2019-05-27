Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A55E72AE58
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 08:04:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0321787;
	Mon, 27 May 2019 08:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0321787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558937054;
	bh=Psxsg4pnbetDivrjQUGD50SmLM5XKAQsblLjNDpfd/M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IRODcv1bv6X1Jg8IRWKXEhe3SCbdLkXKCRpczk55pJyhzRTOJNjd3AmJgW4lJjMQn
	 W7FsNNGirb6l9fvJ3DLAoLTSJ9a8c5+6uoY6J4s3xfMpteNPQI0VUosP0Gys/GIkDJ
	 SBNjrK8hMUOSFJ4PExdZpXbBdCNIc0mAbOk6bFAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95EE5F896E4;
	Mon, 27 May 2019 08:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D40A1F896E4; Mon, 27 May 2019 08:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6C1F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 08:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6C1F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qUeiVe/N"
Received: from localhost (unknown [171.61.91.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B9648216FD;
 Mon, 27 May 2019 05:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558934640;
 bh=oqHyKLmqbmz83G7bOIGzPBCvDihDOBQfvCCdsIaxkoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qUeiVe/NgRc8Q7rApCnxPrh+x8ci1o4I45nVg4YYqLGu80xuiq2QgVQR7d+APhL5F
 EW/RzPuvOBI5Vopy+V8SID54PLNarCa+pXlubg3AO5xhY0U5JxTwaluE76J64O50l8
 u9qZY8QVUFKgc/DE+Wrej54PC0DIs3RNARLzV8sA=
Date: Mon, 27 May 2019 10:53:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190527052356.GA15118@vkoul-mobl>
References: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com
Subject: Re: [alsa-devel] [PATCH v2 00/15] soundwire: corrections to
 ACPI/DisCo/Intel support
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

On 22-05-19, 14:47, Pierre-Louis Bossart wrote:
> Now that we are done with cleanups, we can start fixing the code with
> actual semantic or functional changes.
> 
> This patchset corrects issues with Intel BIOS and hardware properties
> that prevented a successful init, aligns the code with the MIPI DisCo
> spec, adds rate-limiting for frequent errors and adds checks on number
> of links and PDIs.
> 
> With all these changes, the hardware can be initialized correctly and
> modules can be added/removed without issues on WhiskyLake and
> IceLake.
> 
> Parts of this code was initially written by my Intel colleagues Vinod
> Koul, Sanyog Kale, Shreyas Nc and Hardik Shah, who are either no
> longer with Intel or no longer involved in SoundWire development. When
> relevant, I explictly added a note in commit messages to give them
> credit for their hard work, but I removed their signed-off-by tags to
> avoid email bounces and avoid spamming them forever with SoundWire
> patches.

Applied all, thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
