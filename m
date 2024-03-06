Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22BB873906
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 15:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77F684D;
	Wed,  6 Mar 2024 15:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77F684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709735245;
	bh=CvQGHmWgOnsOTN4nRgF7DFatpkWfraS3t2qrVvApk14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gvQOpd3f8fLcLUpj/e8hdVE5lyf5nvnRRoD04AMZD12EQT6LYSqwh3SG6hNFPfqlA
	 8IFnb2hWpi8Qt5CODZ+RmcNbB0ucM+LuJ5KD6A3SGLMTvqxSJmxFVD5yLZ806uuaKu
	 F7sRbfvymAY9RBCsaQ22cFOcwCHKHTeuGilqiwbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F126F805AA; Wed,  6 Mar 2024 15:26:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F9D2F8057E;
	Wed,  6 Mar 2024 15:26:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A1EF8024E; Wed,  6 Mar 2024 15:26:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AC08F80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 15:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC08F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qVWWsexe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C9CF6183D;
	Wed,  6 Mar 2024 14:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BBDC433C7;
	Wed,  6 Mar 2024 14:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709735200;
	bh=CvQGHmWgOnsOTN4nRgF7DFatpkWfraS3t2qrVvApk14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVWWsexejXTXdMwUVX+jFW9ip/xjVh4qPvLSTAWGD6bf2LV6/etQYZWwQ4HqcgABk
	 qecK8zq5ybarJwt9MnLg8u3m6zHJS98+I/jYeARtuu7rNSwmNe70WTUagcxHKGK/mC
	 dyLwuqulQ3kr8kGulGWx42i4gzCA/aw+t62tIIFa95Iw9AlMo4ZHmgTZrj9jk8dzeW
	 d7bYZk1SDI7P2qDg9OCKCeu+yv+NoGa0xqDwgZCoELX2+NwPCQ+zMuSNpdV8eccqpS
	 rvx3S7BE2HhA0y0zijKMQYRTQn7E0WQfxhwpkWkBWFCceDXN5qkFksNSxNpZyzu6pu
	 OcWHWd+8er0ZQ==
Date: Wed, 6 Mar 2024 19:56:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Shalini Manjunatha <quic_c_shalma@quicinc.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Raghu Bankapur <quic_rbankapu@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Jha <quic_kkishorj@quicinc.com>
Subject: Re: [PATCH V0 0/1] ASoC: soc-compress: Fix and add missing DPCM
 locking
Message-ID: <Zeh9HMcWxfgPJS1T@matsya>
References: <cover.1709720380.git.quic_c_shalma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1709720380.git.quic_c_shalma@quicinc.com>
Message-ID-Hash: RJX7BNIPDX6K7JRB4CQSXFW2TPBULKV6
X-Message-ID-Hash: RJX7BNIPDX6K7JRB4CQSXFW2TPBULKV6
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJX7BNIPDX6K7JRB4CQSXFW2TPBULKV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06-03-24, 16:23, Shalini Manjunatha wrote:
> We find mising DPCM locking inside soc_compr_set_params_fe()
> before calling dpcm_be_dai_hw_params() and dpcm_be_dai_prepare()
> which cause lockdep assert for DPCM lock not held in
> __soc_pcm_hw_params() and __soc_pcm_prepare() in above flow
> when ever we play compress offload audio playback use case.

where is the patch ?

> 
> To fix this issue added DPCM lock and unlock in both places of
> above code flow mentioned.
> 
> Shalini Manjunatha (1):
>   ASoC: soc-compress: Fix and add DPCM locking
> 
>  sound/soc/soc-compress.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> -- 
> 2.7.4

-- 
~Vinod
