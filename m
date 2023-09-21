Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 262E27A942E
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 14:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5531A4A;
	Thu, 21 Sep 2023 14:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5531A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695298656;
	bh=YXpKcY1zj9CbhWrNoJOaRCo5if0SZJ8FAfi8Te+CR3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jfxcxMykBWktwXC78qrlBrKF81EnIbRBAYJVm/Gfxouek27n6wAHKfESh0UaNWdvA
	 8Ao1RwDDgYc5qjE/ChF68DbcM2GvbGhzsKF1b9FSKe6nLej8AThxuUz9yWT+sBs9uz
	 G/gD4sgu8KLbZLBJE67sx/BveWmvii3fzPRvap2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 699B9F80549; Thu, 21 Sep 2023 14:16:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2148F801F5;
	Thu, 21 Sep 2023 14:16:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFF0DF8025A; Thu, 21 Sep 2023 14:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from muru.com (muru.com [72.249.23.125])
	by alsa1.perex.cz (Postfix) with ESMTP id D9DC8F80124
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 14:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9DC8F80124
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id BA1328109;
	Thu, 21 Sep 2023 12:16:27 +0000 (UTC)
Date: Thu, 21 Sep 2023 15:16:26 +0300
From: Tony Lindgren <tony@atomide.com>
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, bcousson@baylibre.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20230921121626.GT5285@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-2-andreas@kemnade.info>
 <7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
 <20230920063353.GQ5285@atomide.com>
 <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dac768d2-2c66-4d6b-b3d3-d1ef69103c76@gmail.com>
Message-ID-Hash: DBF2YXIWBJCUB2J2HLH4ZQVWUJWIQNZN
X-Message-ID-Hash: DBF2YXIWBJCUB2J2HLH4ZQVWUJWIQNZN
X-MailFrom: tony@atomide.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBF2YXIWBJCUB2J2HLH4ZQVWUJWIQNZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

* Péter Ujfalusi <peter.ujfalusi@gmail.com> [230920 17:40]:
> It is not the parent's fck, it is the PRCM clock which is selected as
> the sourcee of the clock generator (CLKS) for BCLK/FSYNC. That is the
> functional clock as well for the McBSP instance.

Oh OK

> Out of reset it is using the PRCM source which is fine in all current users.
> I would do this fix or workaround in a different way: instead of
> ignoring the error, avoid it in the first place. Do nothing if the
> already selected clock is requested.
> That would remove the error and will fail in case the reparenting is not
> working -> boards will know this and might be able to do something about
> it in a reasonable way.
> 
> How that sounds?

Sounds good to me :)

Tony
