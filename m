Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE876A2234
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 20:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5AE828;
	Fri, 24 Feb 2023 20:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5AE828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677266214;
	bh=xPQw93D3GC9xcaHaoMbz6Z3gb4bco6b9wkvpXKsQuuw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r/ZGXWrMqODBnlA63RxDIzTdeXjHdhsGut4gJwVSfgjNc3ohOTIA7+6cvDy8Nedlj
	 JCKCaLeuEbUsrUCAN+gZUCtcjltJoJJ5kOiTof61P6AVOduGruROxkZZJaGJTOv0pP
	 +rcyssiFCHnl/IzZm1/3SZ+t5lGsoRK65RgEkjFU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F402CF8053D;
	Fri, 24 Feb 2023 20:15:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11167F80542; Fri, 24 Feb 2023 20:15:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E9E7F80534
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 20:15:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9E7F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Qp+ixLlo
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 550CF6602FCE;
	Fri, 24 Feb 2023 19:15:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677266127;
	bh=xPQw93D3GC9xcaHaoMbz6Z3gb4bco6b9wkvpXKsQuuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qp+ixLlo7jr5ro5GPvfJxyUteFRxrYXcU8fkkN/J7w7tJpKnmIsalL7EOdVw2rRPK
	 hxT34DtB4CnYcg+sy4HTYgkXixZE4qQV0yo2HnJzf8LyKhoWCipoknyhuLVvW8/ap+
	 MpQFnglphbUP8qdkyzNJi55Tn6CW7mWBShyzkWqo7NRzI9q3QN7hstBBIBB1qJGKxX
	 onUG3AzRWntkms1QH40ykoIpvf3E9/bQRL4UJm3H5V+Mqtdgta223SXtw3dOzS7+vH
	 c7D4tle6neUph2H/Twcx0GzTl5h+00snvJE8jP/wxWGjfw1vjR4mVQQAylaSTBHQn4
	 /RVBn2TAfSu2A==
Date: Fri, 24 Feb 2023 14:15:22 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: mt8192: Report an error if when an invalid
 sidetone gain is written
Message-ID: <20230224191522.z4j4kipjh6y7lnqe@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
Message-ID-Hash: 6YGH3UO7RH5EKU7V3EGWPERJ6BQM3ME3
X-Message-ID-Hash: 6YGH3UO7RH5EKU7V3EGWPERJ6BQM3ME3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YGH3UO7RH5EKU7V3EGWPERJ6BQM3ME3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 24, 2023 at 02:03:57PM +0000, Mark Brown wrote:
> Reporting an error on invalid values is optional but helpful to userspace
> so do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
