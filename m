Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65029752AD6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 21:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F513A4B;
	Thu, 13 Jul 2023 21:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F513A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689275992;
	bh=vafqn8AR/75AYFDccVSyG2B7wIw7vf0a/ENgk2BFQ5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rISU5N7j47rbqly5Q2PH9ebo77h7L505L8WgC9ReMTzxGK51bKJsbnTRip+FGbBRF
	 Fm4H+b9sLALIJm+pIf+grmySOxEWQj59e8OgvJAdasU01zCaUD6XrqYPq9OoI2xWTw
	 rwwG+kY7piHTwpyInHeamR0cM4a57vsBlwnpgJTc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6C7FF80290; Thu, 13 Jul 2023 21:19:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4DCF80236;
	Thu, 13 Jul 2023 21:19:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8677BF80249; Thu, 13 Jul 2023 21:18:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3A6DF80093
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 21:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3A6DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ksrHrhz3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8131261B30;
	Thu, 13 Jul 2023 19:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28CFC433CB;
	Thu, 13 Jul 2023 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689275927;
	bh=vafqn8AR/75AYFDccVSyG2B7wIw7vf0a/ENgk2BFQ5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ksrHrhz37aqbjc8nMVvBXofezYTckyYbgwb+srWOwq8suRbJfGMYzgHmecDdPLJ3P
	 Cm5mPq7es7cq4lfAiiHNJHWdE77bF7V6U8LCzbeiuUuSJp6ZBSiy3x/4dnxsndFTkO
	 RyY9RVFGvIKZxie5oNBPIlXHtNXREih3wM/CTbKl0Rc2DW5w7qEPjJ+C4vag5GMyC7
	 57w81oAfGkrTVtj5lLZnErlSmx8Sa5xzB2B52XuCTGcxZEE7feoMvnesYoMHbodrht
	 y2fkh7foNZUiRgds9f8NQWmqR475tovgzjjCEdjvyGs2EyNaKImJlmy9K3MEaX07AW
	 /CZo3Y7R11R4g==
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
Subject: Re: [PATCH 00/11] mfd:: Update Cirrus Logic drivers to use maple
 tree register caches
Message-Id: <168927592510.1059976.1452188805408715416.b4-ty@kernel.org>
Date: Thu, 13 Jul 2023 20:18:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: GVGH3SXVKTSCG2ZEAVXF3WSYGNMXGEE2
X-Message-ID-Hash: GVGH3SXVKTSCG2ZEAVXF3WSYGNMXGEE2
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVGH3SXVKTSCG2ZEAVXF3WSYGNMXGEE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 13 Jul 2023 01:49:18 +0100, Mark Brown wrote:
> With the v6.5 merge window the maple tree register cache has acquired
> the ability to generate multi-register writes during sync operations,
> removing the last major limitation it had compared to the rbtree cache.
> As part of a general modernisation effort update the Cirrus Logic
> drivers to use the more modern data structure, realistically there is
> likely to be very little user visible impact either way but generally
> the implementation choices of the maple tree cache should be a bit
> better on modern hardware.
> 
> [...]

Applied, thanks!

[01/11] mfd: cs47l15: Update to use maple tree register cache
        commit: b4dcbfa82d1264f7c813b6fa4cdc63851daa9b86
[02/11] mfd: cs47l24: Update to use maple tree register cache
        commit: 7814d7e4eac9ad7f87dd1a670feadd9caafd3713
[03/11] mfd: cs47l35: Update to use maple tree register cache
        commit: 1ae7edc5cb666d6d382263d50d9a48cb8a6898e9
[04/11] mfd: cs47l85: Update to use maple tree register cache
        commit: e7c8dce6e5dc3f9963bc9762278f8db33770db95
[05/11] mfd: cs47l90: Update to use maple tree register cache
        commit: 703458beace3c8530808371398dd147339f31c71
[06/11] mfd: cs47l92: Update to use maple tree register cache
        commit: 5b6b74f62046d44269d3720fdfe5cc482392b99e
[07/11] mfd: wm5102: Update to use maple tree register cache
        commit: d635f7d7f1be3160291d22cb05148259c9fdfafd
[08/11] mfd: wm5110: Update to use maple tree register cache
        commit: aad8ec37d158a35c2397a76964f9541fe3fd59b6
[09/11] mfd: wm8994: Update to use maple tree register cache
        commit: 03665778ce02e9bf95ef18f2548cb6dfca01a347
[10/11] mfd: wm8997: Update to use maple tree register cache
        commit: 8e3c1052f4fb404f7264059e706807de43f68a23
[11/11] mfd: wm8998: Update to use maple tree register cache
        commit: 0d606d3545727c1399bd61b1340dde84e900178f

Best regards,
-- 
Lee Jones <lee@kernel.org>

