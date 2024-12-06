Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9946C9E6557
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2024 05:15:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F61210C;
	Fri,  6 Dec 2024 05:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F61210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733458555;
	bh=jyZygs4PtekuSAYjjYdnwJp1CvMvMHamuwdIrETXvjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k24Lu0O64G20nm/Lr6WC5ZKMjhB3COEPh5aOUiqZIpdr2uBANsDVUzBZaCtO5Fzg9
	 joXtxR2icpump3kiS+kr7U18z0AtzyDWRYQAzs7bMT3TUIjn+1jx19NY+qSLm2MRpi
	 GqY/FgLMis73KwLTRyw+Kz+inuSgr0sxXO4OqD6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1617F805AD; Fri,  6 Dec 2024 05:15:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26F28F805AD;
	Fri,  6 Dec 2024 05:15:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F17FAF8047C; Fri,  6 Dec 2024 05:15:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13A1EF800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2024 05:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A1EF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m0KAta9D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0D635C7124;
	Fri,  6 Dec 2024 04:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F92C4CED1;
	Fri,  6 Dec 2024 04:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733458515;
	bh=jyZygs4PtekuSAYjjYdnwJp1CvMvMHamuwdIrETXvjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0KAta9DmxO/95gtyc85ZtnoajDQ222at1FzRkXfT32Jf9Fbhf+RqEVcb9NjGPEM+
	 Bgg1AQqDP+jkjB5S8x1vLYAxOljEjpMTSrAn/JLbVK9g2D1qR9C7am1iEc1fXkYu7U
	 6fwUyX5/wSKLv13jzrzIfUG2Re7oOD/uUxiv8r3ssy8jGkf6Ywci2SSWx6obsePYcq
	 sjQopfwZ+TYhzlyfwx1fh8nijWNL5rdCle6eSUhc3yXaspApDz8uPQBFe4oAmXWGkj
	 Hq1ZDUgu+HD46gvI+Wp+JpuEQDDvscp4nIp8PJ7ebz4DqakOY04oojV6z25bHD5Gg2
	 e3GhbIbQuH8sA==
Date: Fri, 6 Dec 2024 09:45:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 RESEND 1/6] ALSA: compress: Add output rate and output
 format support
Message-ID: <Z1J6ThMuT6IW87gr@vaman>
References: <20241204053346.1865723-1-shengjiu.wang@nxp.com>
 <20241204053346.1865723-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204053346.1865723-2-shengjiu.wang@nxp.com>
Message-ID-Hash: Y7AAH2JQMAAZ6JXWCKE2IEZIO3GW6TQC
X-Message-ID-Hash: Y7AAH2JQMAAZ6JXWCKE2IEZIO3GW6TQC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7AAH2JQMAAZ6JXWCKE2IEZIO3GW6TQC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04-12-24, 13:33, Shengjiu Wang wrote:
> Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
> struct snd_codec_desc, these are used for accelerator usage.
> 
> Current accelerator example is sample rate converter (SRC).
> Define struct snd_codec_desc_src for descript minmum and maxmum
> sample rates. And add 'src_d' in union snd_codec_options
> structure. These are mainly used for capbility query.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Jaroslav Kysela <perex@perex.cz>

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
