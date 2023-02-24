Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C76A224D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:21:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641751E9;
	Fri, 24 Feb 2023 20:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641751E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677266459;
	bh=93WOmXt3Of9KXOA1+0JJLvM2QcA/MehDyh1OEKDHA+k=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hTn4T2ZIHoQHNujZLfTtLct3zDsEsp3NpGDAH8ewL391KqkohxzNZGKi1azmlamnd
	 A8VK0uetaq5IEtzuXB9ZI6zsX+exM02eYTNC91QVSIkgv1SWidDL7a9oe1VjbErWDQ
	 d/IrN8U57uJWyDLqTLA7pIcViRg4r1AdAf2Y6lus=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE7B9F80116;
	Fri, 24 Feb 2023 20:20:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61A2FF80125; Fri, 24 Feb 2023 20:20:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23199F800BA
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23199F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=OusYABMC
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F2056602FCE;
	Fri, 24 Feb 2023 19:20:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677266401;
	bh=93WOmXt3Of9KXOA1+0JJLvM2QcA/MehDyh1OEKDHA+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OusYABMC/GMZI+VunNJn3PdsgJr6AbABf3RI19Z1F5wcqComEwcdMt3gCFzU+VeML
	 6AxCeO8L3MXcza4//XqoCgfkw0BS6i3wFu7D/X0JdzOZ6+paNaY7TqOwIWWJDmtjmI
	 1SbSHD3oFMbBCS0BQdEZN4bIkyXnui+7nTUSVBjtGOR+gp2ijk6NOu15oIksRJqT5A
	 cqcvCvUYNWL/TcK/jbaVSE5cEHPmJfR0da9XXJRaZopq6z0K24GUTQEpJeaqAOo9gP
	 RDCe7n/j6Ig7Mna3GMw8pvbRqx5e53yUV/4pAPY+3ucozGAdr2F4Thmgo427LOW2SK
	 5QN6mVPjtIW3Q==
Date: Fri, 24 Feb 2023 14:19:55 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: mt8192: Fix range for sidetone positive gain
Message-ID: <20230224191955.h74h3fcsj6w3k5al@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
Message-ID-Hash: SJ6QGLJCG4SPHAYUOGFXABXTR5S5UWH6
X-Message-ID-Hash: SJ6QGLJCG4SPHAYUOGFXABXTR5S5UWH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJ6QGLJCG4SPHAYUOGFXABXTR5S5UWH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 24, 2023 at 02:03:58PM +0000, Mark Brown wrote:
> The Sidetone_Positive_Gain_dB control reports a range of 0..100 as valid
> but the put() function rejects anything larger than 24. Fix this.
> 
> There are numerous other problems with this control, the name is very non
> idiomatic and it should be a TLV, but it's ABI so probably we should leave
> those alone.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
