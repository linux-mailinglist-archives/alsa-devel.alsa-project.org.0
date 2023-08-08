Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC557773AD3
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 17:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4953E7;
	Tue,  8 Aug 2023 17:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4953E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691506900;
	bh=2cQOXwqn6SYODcUa7f0Mx6nUDgwXXurTh8Kk9vcpbVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i25J+YmBs6j9Ls+DfTMHnwpj3dD9eP6KHQccf5R3nuxRf9Dhnt0/EclGRp+/8fgQG
	 FUJCQnY2gqZcgMmXboIBrF5qynkaIyep7O5+rGjs42AbxdvQZ/FIVMF5FqyHOKD9ab
	 WY03KRgRWDVE7Rp/jv+E8Xp35tFoKxFmXkHzNFG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A2DF80549; Tue,  8 Aug 2023 17:00:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFAFF80154;
	Tue,  8 Aug 2023 17:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 433F9F80534; Tue,  8 Aug 2023 17:00:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 619D8F800B8
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 17:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 619D8F800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vFTrgJmV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D19A6259A;
	Tue,  8 Aug 2023 15:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44886C433C8;
	Tue,  8 Aug 2023 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691506836;
	bh=2cQOXwqn6SYODcUa7f0Mx6nUDgwXXurTh8Kk9vcpbVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vFTrgJmVK0/2AZWeuZUJkTozX53OlymZF55AVH/LIu5aKeHKmX36OPL2av3VLkW8B
	 pudVgn9cxiLPqCVpUyXUdT1EFdruGwhgkXsVfQfofUA86B7KcyHMe94ZLoTXF8l2Dm
	 /oC3VGLCWM22fWr//7jzvJj+cSudjm6oduM6AS4UYu+h75LFmb52Qd26FgFyxfxjzh
	 ObodANp8hg1jAfKUAlL1BpE6YcYLoLYIBXHvgoGnrpJcREw9/QAn/Si5bJprY+FLii
	 hv5DOSG5vgqyJDpIg5AIe+Hlw8FzkbLj0WvwJ04PSgW/len+LRLqAWgqW3xQthFoxh
	 O7aX4eb1tfYIQ==
Date: Tue, 8 Aug 2023 08:00:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: aw88261: avoid uninitialized variable
 warning
Message-ID: <20230808150034.GA637683@dev-arch.thelio-3990X>
References: <20230808125703.1611325-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808125703.1611325-1-arnd@kernel.org>
Message-ID-Hash: Z2ZSLEVDZPKJ6IEET6CEJXOTEU3B5TLX
X-Message-ID-Hash: Z2ZSLEVDZPKJ6IEET6CEJXOTEU3B5TLX
X-MailFrom: nathan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2ZSLEVDZPKJ6IEET6CEJXOTEU3B5TLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 08, 2023 at 02:56:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> aw88261_reg_update() returns an unintialized error code in the
> success path:
> 
> sound/soc/codecs/aw88261.c:651:7: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>                 if (aw_dev->prof_cur != aw_dev->prof_index) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
>         return ret;
>                ^~~
> sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its condition is always true
>                 if (aw_dev->prof_cur != aw_dev->prof_index) {
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Return zero instead here.
> 
> Fixes: 028a2ae256916 ("ASoC: codecs: Add aw88261 amplifier driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Alternatively, it seems like the final 'return ret' can just be replaced
with 'return 0', as every other assignment of ret returns directly if it
is not zero. Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  sound/soc/codecs/aw88261.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
> index 82923b454dd47..6e2266b713862 100644
> --- a/sound/soc/codecs/aw88261.c
> +++ b/sound/soc/codecs/aw88261.c
> @@ -652,6 +652,8 @@ static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
>  			ret = aw88261_dev_fw_update(aw88261);
>  			if (ret)
>  				return ret;
> +		} else {
> +			ret = 0;
>  		}
>  	}
>  
> -- 
> 2.39.2
> 
