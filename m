Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9066A221F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:08:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95DF21E0;
	Fri, 24 Feb 2023 20:07:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95DF21E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677265693;
	bh=CCW4naAHvfl4tjBL1Fqp4N6OXlt0PApFtXxoADlWb68=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ezn1IR4QO/wDUvv8gJJGuNCeCpM+PGDUI3DIJf5pUCwb2DScJS1hLT1OmphkXKLLL
	 CguxeWp1ri8Xx+Mdk1ilU+p4nrYiDD69D7jYzMeN6+Htu5haUhoajyB9hArSKHLiwk
	 pRQYfakvcj+MjjCxfjKNSuCy+nGuxyA92/kE/rGs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3366F800C7;
	Fri, 24 Feb 2023 20:07:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDD88F80125; Fri, 24 Feb 2023 20:07:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 68FE8F800C7
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68FE8F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ZnwcqKqj
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A2E326602FCE;
	Fri, 24 Feb 2023 19:07:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677265622;
	bh=CCW4naAHvfl4tjBL1Fqp4N6OXlt0PApFtXxoADlWb68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnwcqKqjUfDZPu0RLuyMr6gR4w84I1K+tAaBLoztEfEqXZq0Z0vfwgpYy/xmYPUOp
	 K5GPK9VN2ekdlb1iof/C3NeauEhO9uzh60IWL/k0rxvBJIBFFnZ/h8z7XomRVjWfdG
	 ue1167sxgj6A+Xv6TaZtt3WXQTbPOp9OJOFtvFI7bVEi8GsfemGBzlx3G2bfoQYNbz
	 SKH8oEl3/aUqbFfWFNj0OCREI3MmDWkO/7AO7LIdg5gM5jpTwqIrd/FgxgxbeW59Fz
	 wGAt6i/WIhdHYDXeiVL0dGXLhhcP1RZ/oiIbskcSWTKrTND+dkaEUs5DTLZ4+YBcHf
	 Ia1TkwtumA6Ow==
Date: Fri, 24 Feb 2023 14:06:57 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: mt8192: Remove spammy log messages
Message-ID: <20230224190657.edrvkg22gz5gff4g@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
Message-ID-Hash: ZBCOVOKZ3NJBQ3MZSKGOFXKF4JKJXEJ5
X-Message-ID-Hash: ZBCOVOKZ3NJBQ3MZSKGOFXKF4JKJXEJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBCOVOKZ3NJBQ3MZSKGOFXKF4JKJXEJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 24, 2023 at 02:03:55PM +0000, Mark Brown wrote:
> There are a lot of info level log messages in the mt8192 ADDA driver which
> are trivially triggerable from userspace, many in normal operation. Remove
> these to avoid spamming the console.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Probably the spammiest messages are 

[   33.881459] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_runtime_resume()
[   33.889320] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_enable_clock()
[   34.029456] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_runtime_suspend()
[   34.041718] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mt8192_afe_disable_clock()

from mt8192-afe-pcm.c, so I think it would make sense to get rid of those in
this commit as well.

Way less spammy, but there are also

[  176.209790] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_hw_params(), id 43, rate 48000, channels 2, format 6, mclk_rate 24576000, bck_rate 3072000
[  176.224149] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_dai_tdm_hw_params(), out_channels_per_sdata = 2
[  180.272153] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_en_event(), name TDM_EN, event 0x8
[  180.281462] mt8192-audio 11210000.syscon:mt8192-afe-pcm: mtk_tdm_bck_en_event(), name TDM_BCK, event 0x8, dai_id 43

from mt8192-dai-tdm.c.

Anyway, if you prefer to keep only changes in the ADDA driver for this commit
that's fine too, and I can send another patch removing these other ones later.

Either way,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
