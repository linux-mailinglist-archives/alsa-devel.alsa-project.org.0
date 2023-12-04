Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC75803578
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 14:51:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0C24820;
	Mon,  4 Dec 2023 14:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0C24820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701697898;
	bh=fsFu1k8Z5gwLxuCeGp27lPUgeerquZ+RKi0ABLqEljs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kg3bifayvftVLBd8yROsnXsfEnR0M0dfLocj29aEEq7mgNfENJ4VNUTyHItTrUcig
	 C3rQauDxjM5avx3yBfYVGCv5sknlTbDn0WXhfGCBm9i6yK2+1P4nfPPs6+8tIJF1Ae
	 6owPzlJ7crT9eUTPXapRwzQ8nopQWtNOu+rruNJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98FD0F80567; Mon,  4 Dec 2023 14:51:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2985CF80578;
	Mon,  4 Dec 2023 14:51:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BD49F8024E; Mon,  4 Dec 2023 14:51:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CCA5F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 14:50:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CCA5F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q2tHwSN+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C593E6116C;
	Mon,  4 Dec 2023 13:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74557C433C8;
	Mon,  4 Dec 2023 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701697850;
	bh=fsFu1k8Z5gwLxuCeGp27lPUgeerquZ+RKi0ABLqEljs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2tHwSN+wWn8UHYIA69m57D3iBC71gI5x8Pv1eEK43/eRjSFxlbPoyD96+QOH3oGd
	 x0LHblC+pDkyrDJ06GPEDjlIzjTw8HTzxBPea4TaBkEJ1upSxdo2wAv84q/rhRsPF8
	 RRivfL7Ve0W169YUbouf4mIY5DrAzJWybYfAcxcdwijnICYE/rgVBKrsrF6GAsnDHI
	 Yvvw+hrRMEvvuaQqmxv0KRC8srVVRKcH5b8J21JPPoO5PuQrS7ZQIaZTnS7Y6hm0SD
	 BQz75iDt5+3JDe9ltkNe8mM4LB7mbQhhOtoaMktj5RGBnR4ysL2fyixFtsz3C1SLVQ
	 7lD++6S6e3Tbg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rA9MB-0003Ud-0P;
	Mon, 04 Dec 2023 14:51:31 +0100
Date: Mon, 4 Dec 2023 14:51:31 +0100
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org
Subject: Re: [PATCH 1/2] ASoC: ops: add correct range check for limiting
 volume
Message-ID: <ZW3ZY_2_G64dNAeS@hovoldconsulting.com>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
 <20231204124736.132185-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204124736.132185-2-srinivas.kandagatla@linaro.org>
Message-ID-Hash: EVLV3RX4RLNJ3FJE4HYAWSWI6DPD7BGI
X-Message-ID-Hash: EVLV3RX4RLNJ3FJE4HYAWSWI6DPD7BGI
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVLV3RX4RLNJ3FJE4HYAWSWI6DPD7BGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 04, 2023 at 12:47:35PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Volume can have ranges that start with negative values, ex: -84dB to
> +40dB. Apply correct range check in snd_soc_limit_volume before setting
> the platform_max. Without this patch, for example setting a 0dB limit on
> a volume range of -84dB to +40dB would fail.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Seems to work as intended with the following patch on the X13s:

Tested-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Should you add a Fixes and CC-stable tag so we can get this backported
(at least to 6.5 for the X13s)?

Johan
