Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345F358831A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 22:26:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5E1C850;
	Tue,  2 Aug 2022 22:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5E1C850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659471995;
	bh=Ey9Ry8FgMCnLx5z8M7GJPMUkYp4CCdxvX06b5Ic/gt8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psooNr7Z2v2F+nItu8wMEnA0vW8iLHh1SR1wfSXwATMUFBoZ1tMFnMWK//czbDUkI
	 VD3ey02+yITskWuGkb2pJyuZ59yS99JdKB5YWl6/CFXEvqz6/XNjls/JAS46G9u/ra
	 7o4KmWIGGsG3znC4wI6QdUb23TvAXbCLYL2gphiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C27F8026D;
	Tue,  2 Aug 2022 22:25:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07488F8026A; Tue,  2 Aug 2022 22:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D66EF800B8;
 Tue,  2 Aug 2022 22:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D66EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hp5bIZmq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D2E7614C2;
 Tue,  2 Aug 2022 20:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC440C433C1;
 Tue,  2 Aug 2022 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659471927;
 bh=Ey9Ry8FgMCnLx5z8M7GJPMUkYp4CCdxvX06b5Ic/gt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hp5bIZmqftWQO7deymF2MqbDs4Muz1xzBpfB8Qizv7v/qYbHWMyoT5Q8mZGcToR0+
 n7UNcUOjT6Y+CLHF4lfV75jNPQ0RBZAL7lJ+YmDINn/8WSBYTRUXyflrsaAtOO21nA
 gPofzjCstkI0fHxWDtx9bLg5bTMZoQCKqOhUSY489uSgfaX/xb4WqV4ObpTkd0csPV
 k/0hlV5ZKlJayvsGYSot7UF15Fc3TR2EYcci/68qNPlx5Jd3w/XdAo49ztP6Gshz1V
 Dk6bhhuSpsSotDalr6yONcw66lx8SOKIEsLVl7nCTnA2SR0Hg72WKYsuqDG7xwUD+W
 7NVK+8DywYyxQ==
Date: Tue, 2 Aug 2022 13:25:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] soc: sof: fix clang -Wformat warnings
Message-ID: <YumINAZ4WaM4rG7Q@dev-arch.thelio-3990X>
References: <20220721211218.4039288-1-justinstitt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721211218.4039288-1-justinstitt@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, alsa-devel@alsa-project.org,
 llvm@lists.linux.dev, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Tom Rix <trix@redhat.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

Hi all,

On Thu, Jul 21, 2022 at 02:12:18PM -0700, Justin Stitt wrote:
> When building with Clang we encounter these warnings:
> | sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
> | 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
> |                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
> |                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~
> 
> Use correct format specifier `%d` since args are of type int.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Reported by Nathan here:
> https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/
> 
>  sound/soc/sof/ipc3-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
> index b2cc046b9f60..65923e7a5976 100644
> --- a/sound/soc/sof/ipc3-topology.c
> +++ b/sound/soc/sof/ipc3-topology.c
> @@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
>  	}
>  
>  	dev_info(scomp->dev,
> -		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
> +		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
>  		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
>  		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
>  
> -- 
> 2.37.1.359.gd136c6c3e2-goog
> 
> 

Is it too late for this patch to make 6.0? We are trying to enable
-Wformat for clang in 6.0 and this instance of that warning was
introduced this development cycle by commit 323aa1f093e6 ("ASoC: SOF:
Add a new IPC op for parsing topology manifest"). If I am tracking all
my patches correctly, this is the only instance of -Wformat that does
not have a patch applied to a maintainer's tree so it would be really
unfortunate if we could not sure it on for -rc1.

We could probably route this via the Kbuild tree with an Ack along with
the patch that enables -Wformat if it cannot go via Mark's or Takashi's
ree.

Cheers,
Nathan
