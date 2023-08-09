Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8177608A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 15:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 333C91CE;
	Wed,  9 Aug 2023 15:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 333C91CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691587320;
	bh=FMdA3cKXSQdmBnvN0TjeYP8vF1c5SQrL3G9P6aZQLjo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=de9rkQAlzZCVTvwfC3iee99D+moHHHtDnUAdKkoncX9pNeTCo5yWHEnRe9dIzRzZl
	 7sphr6lhJQzYQhH8PFZlSHCjZSRWeEqlT1MUmhp1+XUUw7skE37F49+MSwpKpXwSZ+
	 ymGfBc7u/FYRyVAkoayFhIjD8QF1E9qI3pM8prBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 977DEF80134; Wed,  9 Aug 2023 15:21:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D1EF80116;
	Wed,  9 Aug 2023 15:21:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7136F80134; Wed,  9 Aug 2023 15:21:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,SPF_PASS,
	T_SPF_HELO_TEMPERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B899DF800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 15:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B899DF800FE
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qTj7M-0007HJ-8E; Wed, 09 Aug 2023 15:20:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jaroslav Kysela <perex@perex.cz>, Judy Hsiao <judyhsiao@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Subject: 
 Re: [PATCH v2 29/39] ASoC: rockchip: merge DAI call back functions into ops
Date: Wed, 09 Aug 2023 15:20:51 +0200
Message-ID: <5640565.VdNmn5OnKV@phil>
In-Reply-To: <87r0od9m6i.wl-kuninori.morimoto.gx@renesas.com>
References: 
 <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
 <87r0od9m6i.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID-Hash: 7FO4YUBCIWVHO5V3DJ24WIAGQXK43CB4
X-Message-ID-Hash: 7FO4YUBCIWVHO5V3DJ24WIAGQXK43CB4
X-MailFrom: heiko@sntech.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FO4YUBCIWVHO5V3DJ24WIAGQXK43CB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Mittwoch, 9. August 2023, 00:57:58 CEST schrieb Kuninori Morimoto:
> ALSA SoC merges DAI call backs into .ops.
> This patch merge these into one.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>


