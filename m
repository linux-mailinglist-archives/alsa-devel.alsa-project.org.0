Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46EF930076
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2024 20:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9B6A4B;
	Fri, 12 Jul 2024 20:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9B6A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720808831;
	bh=4ltIoQPQG0NoADCdOAcmlyewrnqCOWPkwumIg3OXYpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a3I8IQvxqC+QDVCRYkHKMDOSLYdGDJdNG/8+cxW0YQrG14SBhhbcJ811jGuCxFNyP
	 Yw4nVni0vrnU07v5pxWX53FBAX0x3PI5jBFy2rerTtz9JtRZrpR4tKRgJmWR7bulpa
	 Xmo2og5+PfvrLkamlA02LmYsxzMBu2JHLpWf4Mqw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95F9FF805BB; Fri, 12 Jul 2024 20:26:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B586DF805AD;
	Fri, 12 Jul 2024 20:26:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8011F801F5; Fri, 12 Jul 2024 20:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3896F80074
	for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2024 20:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3896F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=m8HGjLz7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61C1ACE1B64;
	Fri, 12 Jul 2024 18:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C9FC4AF0B;
	Fri, 12 Jul 2024 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720808322;
	bh=4ltIoQPQG0NoADCdOAcmlyewrnqCOWPkwumIg3OXYpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8HGjLz7AjVYY2vnhUBjSGjrqokQOMCyjIZmu/Da0gIX8fN6E7EyckMt8e9+8ZF/X
	 L5ixfm74dNKoidlodbJD+F4DZD/s/zIZc/91b0jgoJZhK24ax77MPLGqKPbqMwhUEY
	 0vGTEFGQUwXA7kFXfDNuZD+fyc+L9Lee3xJaO+FLz4ViRMcRYoqJua0JcugnfprkNF
	 iRtR77NdDD0MaaoyRKNz0q2CtQlcWyfi/RJKPDhsWL3U3mgMRnPPpuVpRED4TGi9DT
	 cCX/rgpGes5ZWo24pCanllR56PpW8JlOCupFEIAuvwBYd7qAvmHumUiyoAMd0wRtdc
	 0bpppb8SGrmvA==
Date: Fri, 12 Jul 2024 12:18:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH v3] ASoC: rt1318: Add RT1318 audio amplifier driver
Message-ID: <20240712181841.GA1448997-robh@kernel.org>
References: <b3055442ce6d4994aa01aa1fad6ba1fe@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3055442ce6d4994aa01aa1fad6ba1fe@realtek.com>
Message-ID-Hash: XERCWVI76U7ZB77L6ZI6QXCHTAXLLDPA
X-Message-ID-Hash: XERCWVI76U7ZB77L6ZI6QXCHTAXLLDPA
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XERCWVI76U7ZB77L6ZI6QXCHTAXLLDPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 19, 2024 at 05:53:42AM +0000, Jack Yu wrote:
> This is the initial i2s-based amplifier driver for rt1318.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> ---
>  include/sound/rt1318.h    |   16 +
>  sound/soc/codecs/Kconfig  |    5 +
>  sound/soc/codecs/Makefile |    2 +
>  sound/soc/codecs/rt1318.c | 1354 +++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/rt1318.h |  342 ++++++++++
>  5 files changed, 1719 insertions(+)
>  create mode 100644 include/sound/rt1318.h
>  create mode 100644 sound/soc/codecs/rt1318.c
>  create mode 100644 sound/soc/codecs/rt1318.h

[...]

> +
> +static const struct of_device_id rt1318_of_match[] = {
> +	{ .compatible = "realtek,rt1318", },

This is not documented. Please add a DT binding schema for it.

Rob
