Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB4430A54E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 11:28:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116101753;
	Mon,  1 Feb 2021 11:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116101753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612175339;
	bh=PS8IJ5JvjZuy5zHzMyJ9YXXpfetmK358icWc9qRWdAg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mP0KTCx7eSa5A+aNaJBsu8bCr4ALpHUN4Y9Oj+/Frlyi1rUW1iPOgxkA9TtnhpXG0
	 NdjLZmbkMllMgNGs9NLM23lUROZv07SLBfwxEROXFtIX67Txt0V3LJnWvDxUtLv/uA
	 TFJ8LIEoLXl3nMRABfeEZvDMVxjkxGsFd8vZLEaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E94E7F80151;
	Mon,  1 Feb 2021 11:27:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 341ECF80154; Mon,  1 Feb 2021 11:27:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF7DBF80151
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 11:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF7DBF80151
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iXgHbP3b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 295D764E0F;
 Mon,  1 Feb 2021 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612175235;
 bh=PS8IJ5JvjZuy5zHzMyJ9YXXpfetmK358icWc9qRWdAg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXgHbP3by/cp7VCm81uh8jumovxCHj/+brOghZuWOvNupn7obmdzp36kPwTY/j0ll
 SenD7VNR2YLA/Ag2uCeBfkzvEXrrbFYGQNjK+W07dhHLF/6kmo4aKr/be7ikDehI/6
 dp8a8DKuFWcx6sWuKBsEjs+u/RDWMUsd46aAiKZMgz4ZYUQhwSZ6qcaVQcK1iexoR3
 Ag/iEkHozCodKArXpr9U9OtrUOjq5xc47KDzJfvO4KnNDUjHTgmFn3FMfeyn/+FCQ0
 XINdU4TMDfCR94Qhywdjq1RDN/rqiCHF+jPgcXC06mbp09Ib8+Vn315YFX9ldi3aiI
 knzPiObvyzObw==
Date: Mon, 1 Feb 2021 15:57:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
Message-ID: <20210201102709.GT2771@vkoul-mobl>
References: <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
 <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
 <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
 <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
 <adb91730-35db-db7a-75b3-4771723de945@linux.intel.com>
 <31ff9d2b-760a-374e-5b37-45d8e8116f7b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31ff9d2b-760a-374e-5b37-45d8e8116f7b@linaro.org>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On 25-01-21, 16:23, Srinivas Kandagatla wrote:
> 
> 
> On 22/01/2021 16:42, Pierre-Louis Bossart wrote:
> > > > 
> > > > if you completely remove the stream and re-add it with updated
> > > > configuration things should work.
> > > 
> > > That's exactly what we do currently!
> > > 
> > > The updated ports due to new configuration ex: for "mic capture"
> > > dailink needs to be communicated from slave(codec) to master so that
> > > it can allocate correct ports. That is what this patch is trying to
> > > do (share current port map information).
> > 
> > .. we have a disconnect on how to do this configuration update.
> > 
> > The 'stream' support was designed so that a stream can be split across
> > multiple devices (both masters and slaves). With this design we need to
> > have a central configuration and distribute the information to all
> > devices taking part of the stream.

That is correct, but in this case a stream consists of one master and
one or more slave devices. This is not a multi-master design. The adding
of multiple masters should not be done here... that does not seem
logically right in this situation

> > It seems you are in a different solution-space, where the codec driver
> > needs to notify the master of which ports it needs to use?
> 
> Correct! As Codec is the place where we have mixer controls ant it can
> clearly tell which master ports should be used for that particular
> configuration.

And that should come from firmware (DT etc) and driver should pass on
this info

> > I also don't see where the mapping is actually set. Patch 2 uses a
> > mapping but there's no codec driver change that defines the mapping?
> > 
> > Do you actually call sdw_stream_add_slave() with a new mapping?
> > 
> Yes, currently am working on a codec driver for WCD938x Codec, which I will
> posting very soon!
> 
> > It feels we are missing the codec part to really see what you are trying
> > to do?
> My WIP code is at https://git.linaro.org/people/srinivas.kandagatla/linux.git/tree/sound/soc/codecs/wcd938x.c?h=wcd938x/wip#n4526
> 
> Currently the master ports are hardcoded in the driver for now, but these
> will come from DT.
> 
> --srini

-- 
~Vinod
