Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3FC7BF6BD
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 11:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78ABEFCE;
	Tue, 10 Oct 2023 11:04:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78ABEFCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696928726;
	bh=AIGG6fyFvhD007VLi8fAW7s1M4cQfB2NwmTFR5Zn+D0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lqeDX7WG+cwL6bMJyV47SaWURem/hBZEj4oip7gJYIfBw4Bsxq8hNwDZ5Q6qa2TVE
	 s7oU8k1DgoQ0rjQMXuCIC5CtoHBuBsESkytw/tmmMld4Q+d3Eg2zbRSX22Wxr3Dlhq
	 BVuFW+jBEyBl8OJ7E6cR6pakK1L6pxzyl4a+53Lk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04D2FF8055A; Tue, 10 Oct 2023 11:04:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 623B4F8019B;
	Tue, 10 Oct 2023 11:04:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6139AF8027B; Tue, 10 Oct 2023 11:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24CE7F80166;
	Tue, 10 Oct 2023 11:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CE7F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=oXwf+ivG
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 41D8E66030BF;
	Tue, 10 Oct 2023 10:03:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696928639;
	bh=AIGG6fyFvhD007VLi8fAW7s1M4cQfB2NwmTFR5Zn+D0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oXwf+ivG1BTAOyTdMRjqAhWU8Qohy3vhgIGeU3NarqAUeFwhp4CirTe1sawubRlzJ
	 3gjPhAWjbTF6KENqS7qwWq4novPLu1dvsEdV1LNMNU7HzxfM0TV5pd5deg7kh3g/co
	 kt3R2vwOEMMFZJkOL878y8DHQcmUiqo2QEnOPRMVADuXwmSCCmHJ3RhmG0TolX2H7c
	 JxA7zkyCWyV5E9gVsSkSvhBswmqTRWJGg9qCFzvRIwIr1AXgHNlOxgYgszUY1VrNta
	 rmioEndFP838jQ5FuAT7LV+3dt1HBcxqwsseEwIj161kK4g3s5cxrKt+BLGhZuOIqC
	 RY+r9YHV7twkQ==
Message-ID: <62fbac76-9dfc-8959-d08c-2fed58f38926@collabora.com>
Date: Tue, 10 Oct 2023 11:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback returning
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 24WMKISKT7TMQCBRLLF6PDEHLIIKVII7
X-Message-ID-Hash: 24WMKISKT7TMQCBRLLF6PDEHLIIKVII7
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/24WMKISKT7TMQCBRLLF6PDEHLIIKVII7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 09/10/23 17:59, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> The SOF platform drivers all use either sof_of_remove() or
> sof_acpi_remove() which both return zero unconditionally. Change these
> functions to return void and the drivers to use .remove_new(). There is
> no semantical change.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


