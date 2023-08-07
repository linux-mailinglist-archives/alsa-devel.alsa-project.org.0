Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35297772EA0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 21:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A343823;
	Mon,  7 Aug 2023 21:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A343823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691436373;
	bh=HBhmn9HKnS8/O4AzZaFEuYjZPHI6Gi65ywDrGFhu+O0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AkEwppafh/kXyZVGJShGBa4rdHm3V39uJZfx/0b3F2j4vDFtHfwQp8sJ41CwAZATC
	 r7isBLb208q7S76zlLovPW/r1PMWmePj9zs/h+EOjULlx+vTro0RbuoIjxnXJqtf+/
	 EpYD2sS41qIbkQcqifARjza+p1g3oxVrMhdmZ1qI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 739DEF80520; Mon,  7 Aug 2023 21:25:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 313F6F8016B;
	Mon,  7 Aug 2023 21:25:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60306F8016D; Mon,  7 Aug 2023 21:25:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A92D2F80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 21:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A92D2F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iSgi+eNK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA7A66216A;
	Mon,  7 Aug 2023 19:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4C3C433C8;
	Mon,  7 Aug 2023 19:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691436310;
	bh=HBhmn9HKnS8/O4AzZaFEuYjZPHI6Gi65ywDrGFhu+O0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iSgi+eNKKTdMVpyW4QT8CWFt2D/ck3D8JFsVcpRQZt8qC3K8iW0GNCQ74ZjKY3T1x
	 RXHFscGL/uKRCEYjTWZAIS8fOSWf7o3y8HJgai22AzGjxiPMVyOpfd7F/b0NcRD1DP
	 Y81MHqQ/P+pWUDVfZ/VRfbQSmf3so9ouxkxbnj73Ra0LZdZtG6OzzRAwtreCoIk2MJ
	 24kI+jifaiY98fTAlm4iRCFGDM/V23pCUMCBi8RT5oWkSNVMkMwcPDAfbgi0pB6qcg
	 ubCVJkTca1I6BDmxeBqCoCLxOm2hRMnmqerH3nGEXqRfboWZ92AwjHsfs9tdm8VDUN
	 NfDqeClA+N67w==
Date: Mon, 7 Aug 2023 12:25:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 maz@kernel.org, srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, sre@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
Message-ID: <20230807122508.403c1972@kernel.org>
In-Reply-To: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5DYLXE76QHYV2A5ZDIOU4PVWZQ2PEAAO
X-Message-ID-Hash: 5DYLXE76QHYV2A5ZDIOU4PVWZQ2PEAAO
X-MailFrom: kuba@kernel.org
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri,  4 Aug 2023 08:00:07 +0300 Claudiu Beznea wrote:
> Update MAINTAINERS entries with a valid email address as the Microchip
> one is no longer valid.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Thanks for updating the email!

A bit of a cross-tree change. Is there anyone in particular that you'd
expect to apply it? If nobody speaks up we can pick it up in networking
and send to Linus on Thu.
