Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646FF774DE7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:02:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFEB83E;
	Wed,  9 Aug 2023 00:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFEB83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691532167;
	bh=0CjdeW56CS2059Vkt0DNasnDqdrqZiTUPNvFROKH9Ko=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vugogPqWHO+c/ZMuHJThOoX80x4KDcXAoJlHO2OfRD1umgdJ7jeGvrEMzDSudIvaC
	 PkqW4UmDEDiy6BpuVVoUvGuMgNOFZrtPBR/sYCegSV4MDTxARfzSKeKwQ1DXCwPLUd
	 uyzpiBkF3CrdBgMj1seW9IWKAt6ITO7bckjB8CO0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AC50F80534; Wed,  9 Aug 2023 00:01:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0CD0F80154;
	Wed,  9 Aug 2023 00:01:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B6EF80538; Wed,  9 Aug 2023 00:01:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CFF6F80107
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFF6F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZFemw6DC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84A1E62D96;
	Tue,  8 Aug 2023 22:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9F24C433C9;
	Tue,  8 Aug 2023 22:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691532021;
	bh=0CjdeW56CS2059Vkt0DNasnDqdrqZiTUPNvFROKH9Ko=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZFemw6DCXpLlNx2M8biWQnKG3G228tzyxO2dijgeS5BR8kYOhiNBGzBKha5+8d+b2
	 H+k1cuGzP7aOdznQujTvJWUvn2gbn5el8wfXv0ckwsOco5A349k4qSpCkdR2l2rDPJ
	 /VjtO3ISJJnBU0HNKQG//Cco7C9TWwu0woPCTD18X8jWuxJSRRV+RzWBejgo/u9tTd
	 jbq3m4HVzjWmd4F3Pa9xDXTAf89j+F2oyLPA4YKE2BKJwajq/nn22fqOOwpOLhVdS4
	 2UaIpasp0qBxfi2P/3Ciw85m047r/IcMGcuaKbF08+sZx2IlAYJIflQoRUIWKIs9l1
	 iIzTLi4REA3dA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B9192C395C5;
	Tue,  8 Aug 2023 22:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169153202174.6931.11202742037860925480.git-patchwork-notify@kernel.org>
Date: Tue, 08 Aug 2023 22:00:21 +0000
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 maz@kernel.org, srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, sre@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID-Hash: 4N6AJWBG26X7Z2IHSDX5XKEPNRHNCLOC
X-Message-ID-Hash: 4N6AJWBG26X7Z2IHSDX5XKEPNRHNCLOC
X-MailFrom: patchwork-bot+netdevbpf@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LLE5ISKUZ5F5V4DME4RZ4G2FA5IVCBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri,  4 Aug 2023 08:00:07 +0300 you wrote:
> Update MAINTAINERS entries with a valid email address as the Microchip
> one is no longer valid.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: update Claudiu Beznea's email address
    https://git.kernel.org/netdev/net/c/fa40ea27ede3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


