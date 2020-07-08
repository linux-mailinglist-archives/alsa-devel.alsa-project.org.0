Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807721813F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 09:32:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A44E1672;
	Wed,  8 Jul 2020 09:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A44E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594193541;
	bh=r0dgow9rUsKgNihdZtEDDnS8/19yUYtOrwqxHuYb/Dk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n7X0HHr96+OpHq7JxnONNpGksjhepqlS0S9f1CRvlkXneHBqFOIDecF1xIs97INLw
	 HMJpbUhtZz4BTCW8zgqkXB5uLdP16222wYHFMcxCZQKJKKsvZ5rplfF7TopndOek0R
	 A1tb1vqnJeT4omX4cqtjHNK19w6pvAoJQ1mNuN4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42664F8015C;
	Wed,  8 Jul 2020 09:30:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5BCF8015A; Wed,  8 Jul 2020 09:30:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12C5FF80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 09:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12C5FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b4siWivv"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E43EA2064C;
 Wed,  8 Jul 2020 07:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594193426;
 bh=r0dgow9rUsKgNihdZtEDDnS8/19yUYtOrwqxHuYb/Dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4siWivvpsbhrb/hA4+uJM8L5LUKMVI++w20ZWQd9JE1hS+xmIxO4e1u0DAihFgNF
 MijMbYe2NkR7DhtkfxY0Ae5Jzcd51gAkFSxKSe/nOcptk/HVV9Z/BVZYu5Wj9/qQvW
 Ho44lQISN493RS5P8FYl3Hnw5q0LbwB8aOaz/rIg=
Date: Wed, 8 Jul 2020 13:00:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: change SoundWire maintainer
Message-ID: <20200708073020.GA34333@vkoul-mobl>
References: <20200703192644.751-1-sanyog.r.kale@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703192644.751-1-sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, gregkh@linuxfoundation.org,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
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

On 04-07-20, 00:56, Sanyog Kale wrote:
> Add Bard as SoundWire maintainer from Intel and change Sanyog's
> role as reviewer.

Sad to see you go!

> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Need ack from Bard (i think he is on vacation)

> Signed-off-by: Sanyog Kale <sanyog.r.kale@intel.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1c1527a34d99..9559e947bf67 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16012,8 +16012,9 @@ F:	sound/soc/sof/
>  
>  SOUNDWIRE SUBSYSTEM
>  M:	Vinod Koul <vkoul@kernel.org>
> -M:	Sanyog Kale <sanyog.r.kale@intel.com>
> +M:	Bard Liao <yung-chuan.liao@linux.intel.com>
>  R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> +R:	Sanyog Kale <sanyog.r.kale@intel.com>

Do you still want to be a reviewer, I would like folks in this to be bit
active for reviews etc

Thanks

>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/driver-api/soundwire/
> -- 
> 2.17.1

-- 
~Vinod
