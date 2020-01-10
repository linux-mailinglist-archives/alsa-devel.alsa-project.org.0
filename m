Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68D1367B1
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 07:50:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960EA17B3;
	Fri, 10 Jan 2020 07:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960EA17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578639043;
	bh=N7+4OsSOjTOeFT6+YAaL/n076PHAO1R3jjVmDybHFeQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kxyofyk4QXjgPZaL01fgh0AglpEYG2xDRS5p8szpk2en1ST5iGit2jZrDT2cIH1HI
	 aP20KNoyAuYoAnFg16ycEWYnix+oX/CZOzyk6gU0Ae3j2snbvnbjC4ARjNzoWGS2WG
	 +k68iTRSsEbzLCBLiyi2bO2Pvy891F2KGrlvHGMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93699F8011C;
	Fri, 10 Jan 2020 07:49:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A603BF8011C; Fri, 10 Jan 2020 07:48:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0B8F8010B
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 07:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0B8F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S5nW5cI7"
Received: from localhost (unknown [223.226.110.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB1692077B;
 Fri, 10 Jan 2020 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578638931;
 bh=Of4w1wJ91a4RMgBuLQs9vGiM+W0czF9OyBSxcneVhAY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S5nW5cI7HboFrg2xaURWGqpR8RQQzUzaL4W5ZfJK40sZxDPCoA++vKSkTedumETrG
 2U9piP1eJ9Gq7kx3Co3OmRYXxCsMAC4vlzj5LTPuJEMHJvjZ6mis6Pdn3Q7HDD8lSH
 W+oDfYFjZcKrjNSBRqFFN+JzYPZMRmMZMkpWkBb8=
Date: Fri, 10 Jan 2020 12:18:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200110064838.GY2818@vkoul-mobl>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
 <20200108175438.13121-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108175438.13121-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/6] soundwire: stream: update state
 machine and add state checks
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

On 08-01-20, 11:54, Pierre-Louis Bossart wrote:

>  Stream State Operations
>  -----------------------
> @@ -246,6 +251,9 @@ SDW_STREAM_PREPARED
>  
>  Prepare state of stream. Operations performed before entering in this state:
>  
> +  (0) Steps 1 and 2 are omitted in the case of a resume operation,
> +      where the bus bandwidth is known.
> +
>    (1) Bus parameters such as bandwidth, frame shape, clock frequency,
>        are computed based on current stream as well as already active
>        stream(s) on Bus. Re-computation is required to accommodate current
> @@ -270,13 +278,15 @@ Prepare state of stream. Operations performed before entering in this state:
>  After all above operations are successful, stream state is set to
>  ``SDW_STREAM_PREPARED``.
>  
> -Bus implements below API for PREPARE state which needs to be called once per
> -stream. From ASoC DPCM framework, this stream state is linked to
> -.prepare() operation.
> +Bus implements below API for PREPARE state which needs to be called
> +once per stream. From ASoC DPCM framework, this stream state is linked
> +to .prepare() operation. Since the .trigger() operations may not
> +follow the .prepare(), a direct transitions from
> +``SDW_STREAM_PREPARED`` to ``SDW_STREAM_DEPREPARED`` is allowed.
>  
>  .. code-block:: c
>  
> -  int sdw_prepare_stream(struct sdw_stream_runtime * stream);
> +  int sdw_prepare_stream(struct sdw_stream_runtime * stream, bool resume);

so what does the additional argument of resume do..?

> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 178ae92b8cc1..6aa0b5d370c0 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1553,8 +1553,18 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)

and it is not modified here, so is the doc correct or this..?

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
