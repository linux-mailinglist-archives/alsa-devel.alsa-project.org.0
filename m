Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7B86A2231
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:15:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9A61DC;
	Fri, 24 Feb 2023 20:15:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9A61DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677266158;
	bh=7MIYugRF4OeYSBU4bCpar84Hqz7+bV4a7/GjaOqhtPw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfEqsLpsn6FvqvimzRHEIlafIxHOcUaCUZsQtIrXcNLJPxx/guBJZc2jo4YzIlu+L
	 w6o5fzjnbD1HPuOR3ngxU7ojGImAMeK+1wAAJTe+bDUZCl/AnCF1rqagHUv7hD90NX
	 D3cILnLIl9S8yfs1fWnRCqcciO9dWS4Ykh86V128=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CACA6F80116;
	Fri, 24 Feb 2023 20:15:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1476AF80125; Fri, 24 Feb 2023 20:15:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4F98F800C7
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F98F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=PRETDL9/
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 538826602FCE;
	Fri, 24 Feb 2023 19:14:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677266099;
	bh=7MIYugRF4OeYSBU4bCpar84Hqz7+bV4a7/GjaOqhtPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRETDL9/iBhS4S+FVHo+zY5QuY+M9m2bXMnVfviqogi+YSixjFekYZfWjzicgF2C8
	 evXIeXfGn5rGA865YJ1ltShN3utyNoVc1gwimcsbF4sj6QUcs11XxQ7BYFOX5p6rz5
	 8bpYdSqxODRW2ya/9tfUSgreE6/4c5itaX1lY3cluKjFXht9SfiFT+l82ZEbtp+jLv
	 K5NXKQ4pUHjGn9FxG2I88ET+/cJhbvjuDUzefKXrIxRalXmCmLUK/9sH7TJTBhicGf
	 3nANM21h+f3gaBg7bC/yv4B84hTAaTzCoM15LT3l6TAwVeAu5cNwgncIIyttp0qMLB
	 zFzCp9XepqKsQ==
Date: Fri, 24 Feb 2023 14:14:54 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: mt8192: Fix event generation for controls
Message-ID: <20230224191454.pklri23677z6lae4@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
Message-ID-Hash: VLXWKOBA5PWJ36NAMSIA5SOGY6JHANDR
X-Message-ID-Hash: VLXWKOBA5PWJ36NAMSIA5SOGY6JHANDR
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLXWKOBA5PWJ36NAMSIA5SOGY6JHANDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 24, 2023 at 02:03:56PM +0000, Mark Brown wrote:
> ALSA controls put() operations should return 1 if the value changed and 0
> if it remains the same, fix the mt8192 driver to do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
