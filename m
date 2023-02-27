Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BBB6A3D7C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 09:53:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2F882A;
	Mon, 27 Feb 2023 09:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2F882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677488024;
	bh=Sf3MrhyeShGhLOGSYT3msnb2qghBOREsCUqRzqNCHR8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h4lpmmrYc7CoBs5rYNHIeRg7lg4/GmajZEnsy3Kqgp0pOciZMs0oUZF7rXD1Sg26z
	 HjBsMQW2xmFHBvTFgXiKi3ZeFivhz8VfUyfD6UUqURalWYRr0wpB2sq6XqPo7NOpnE
	 V9oLZ63UnfG69BVAabQmgEqvTCwEcgUFHyednXm0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6281DF8049C;
	Mon, 27 Feb 2023 09:52:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D2DF8051B; Mon, 27 Feb 2023 09:52:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91962F800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 09:52:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91962F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=YEPx3bIP
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2007B6602219;
	Mon, 27 Feb 2023 08:52:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677487937;
	bh=Sf3MrhyeShGhLOGSYT3msnb2qghBOREsCUqRzqNCHR8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YEPx3bIPDldiXq3sftrtxJzUECVcOlg+HV3KYwCvSv1IXndnxB3pXbHVb+OFjBND/
	 BBuKdG43JUKkkIqSvIR1/jA0v1hdRone4AWY4d59tkJ2tUboyM4SXFmv4N7ryu+L8K
	 YJtOWBUKJZYttRJWSEpuNF7yHsAGkckda1MYAF2eDhDAxBPQ0KLwl+LuBlf7d07Qjl
	 gPBoim9l/sGWnM1CBoAGfJn653qBZKRRc15Rsv9zxOz2kZcKdwu5eZmTUDWF8dyNqQ
	 3N+yve+R/ti76hmHvUwUSbsOxhEOkui+NWQgj1liXXf81WVoyij3w6IGvoG6kue5DT
	 T1uo416NnpupA==
Message-ID: <90768a8f-3f03-f177-3b48-03efe88b587f@collabora.com>
Date: Mon, 27 Feb 2023 09:52:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/4] ASoC: mt8192: Report an error if when an invalid
 sidetone gain is written
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UNX5IUD34C4GHBQDB2TPH2QHBJF5D7KC
X-Message-ID-Hash: UNX5IUD34C4GHBQDB2TPH2QHBJF5D7KC
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNX5IUD34C4GHBQDB2TPH2QHBJF5D7KC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 24/02/23 15:03, Mark Brown ha scritto:
> Reporting an error on invalid values is optional but helpful to userspace
> so do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

