Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC005577A87
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 07:46:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A16176B;
	Mon, 18 Jul 2022 07:45:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A16176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658123185;
	bh=yPiN/vSFCUYAKGMcAOjDfDKLGRowj5r7xJ2VAVb8YNU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXwOojFEPBifeNqH1CdPKIRBOb9ry1ae81KeAqQtWxhtdpZ8HtwBGRXOM3CTdzftV
	 NJgM4RA4jZAIh3FVcQovNO/bZT8xi2uDWcsRC1auxaxtygqr3Wwdl3LtjWMaU7BTiT
	 DZ6XJhtmOr1oVt4+IaMJzbF832gzY5GvkdPGtx1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70FFBF800F5;
	Mon, 18 Jul 2022 07:45:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE067F8050F; Mon, 18 Jul 2022 07:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_126,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BBEBF80095
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 07:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BBEBF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MyGLJo7F"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B1702611FB;
 Mon, 18 Jul 2022 05:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E931C341C0;
 Mon, 18 Jul 2022 05:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658123115;
 bh=yPiN/vSFCUYAKGMcAOjDfDKLGRowj5r7xJ2VAVb8YNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MyGLJo7FwtMSN7/ucLim77qNwaOpXXoif0ZXzrnUQsiveoEgctB0z9X+SknjU8+at
 j2UMdw1kUJUYzyAf7HLnXcVJys6C8LXPczHi4spLfNS97w6IeUz6oEQlG10AQvmPaA
 4LHOLn6bUJFqroOmEhARUeQp6fgT2noHhkaNP5wkgApDNHN76RMHEeabVwZ9BMlksb
 sXvv2pEU+te9ZVVtdtcXqpOe4RuraBI10jijC4ziOrOpLwd15+1XeWmp3A6wHWAs3u
 zeFwoJTfXDEibb02/X4cE+MA0w8NUB2XMLJqC0DzqRhVYgUZKi7VKn+wu9VphbVc67
 F6Bw6naodqYXA==
Date: Mon, 18 Jul 2022 11:15:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC/soundwire: log actual PING status on resume
 issues
Message-ID: <YtTzZ4iA0xt68euH@matsya>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org, bard.liao@intel.com
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

On 14-07-22, 09:10, Bard Liao wrote:
> we've been stuck with problems in the dual-amplifier configurations where
> one of the two devices seems to become UNATTACHED and never regains sync,
> see https://github.com/thesofproject/linux/issues/3638.
> 
> This is a rather infrequent issue that may happen once or twice per month,
> but still it remains a concern.
> 
> One possibility is that the device does lose sync but somehow our hardware
> detection fails to see it resync.
> 
> This series just adds a basic read directly from the PING frames to help
> confirm if yes/no the device regain sync.
> 
> The change is mainly on soundwire. @Mark, Could you ack the ASoC patch
> if it looks good to you?

Mark,

The series lgtm, feel free to merge thru ASoC tree with:

Acked-By: Vinod Koul <vkoul@kernel.org>

> 
> Pierre-Louis Bossart (4):
>   soundwire: add read_ping_status helper definition in manager ops
>   soundwire: intel/cadence: expose PING status in manager ops
>   soundwire: add sdw_show_ping_status() helper
>   ASoC: codecs: show PING status on resume failures
> 
>  drivers/soundwire/bus.c            | 32 ++++++++++++++++++++++++++++++
>  drivers/soundwire/cadence_master.c |  8 ++++++++
>  drivers/soundwire/cadence_master.h |  2 ++
>  drivers/soundwire/intel.c          |  1 +
>  include/linux/soundwire/sdw.h      |  5 +++++
>  sound/soc/codecs/max98373-sdw.c    |  2 ++
>  sound/soc/codecs/rt1308-sdw.c      |  2 ++
>  sound/soc/codecs/rt1316-sdw.c      |  2 ++
>  sound/soc/codecs/rt5682-sdw.c      |  2 ++
>  sound/soc/codecs/rt700-sdw.c       |  2 ++
>  sound/soc/codecs/rt711-sdca-sdw.c  |  2 ++
>  sound/soc/codecs/rt715-sdca-sdw.c  |  2 ++
>  sound/soc/codecs/rt715-sdw.c       |  2 ++
>  13 files changed, 64 insertions(+)
> 
> -- 
> 2.25.1

-- 
~Vinod
