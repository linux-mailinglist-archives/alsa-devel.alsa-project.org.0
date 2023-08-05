Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B99771263
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Aug 2023 23:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A4B67F4;
	Sat,  5 Aug 2023 23:32:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A4B67F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691271174;
	bh=LwVSf5E2rTZspyIsnpTRtHx3oVtF00aIGMFChodPePE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q94OGSQq+HCeWGhauMBbfZWFRwpcbnLWVTYBnhtVXydrz4uUwbw9IBGC+41lEzWxF
	 WCds1V70YKz28/Mu0seX3vJVnSHYvGAvSpuS8mAQzLLDVP8Br+Ppsx70aAk9pBzpuN
	 kgD6y7yCeeKzmz4cBgK7hfmsEWJIKdqR6hkkH61M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09963F80544; Sat,  5 Aug 2023 23:32:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2022F801D5;
	Sat,  5 Aug 2023 23:32:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AAC0F8025A; Sat,  5 Aug 2023 23:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E94E8F80149
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 23:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E94E8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AQczrQjn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A151E60F07;
	Sat,  5 Aug 2023 21:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02702C433C7;
	Sat,  5 Aug 2023 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691271108;
	bh=LwVSf5E2rTZspyIsnpTRtHx3oVtF00aIGMFChodPePE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AQczrQjn2I523a77DS0Rm592b+0/GAWOqJ3o1zY7yiCxNNkeWrhqgbbjKVmHyEwX6
	 NDgWf5qIl0XOxJEINbQzWvqlhjDGXWrzKiQnnuPnzRSLhqYdKzvTw/9y48utVIpGSk
	 clVozXdN4Zf5bGpeElNo41a+u994yagPUl+rGQhWIaoVnsyG8K/991lCp3O9ZtL+Hx
	 TlMPUcEsfURBEESppk5DunWzZuMiiEYooKWoCn+iHWplkcStDN6hfS7e7nzhTRQAwl
	 g3gifiSzoiRjFl6BuCe635Xjq/UMuN9gVE1AX19oXZjNlwXsPAC+qzNnHH+0k6B4ny
	 b/31HYG/aaVlw==
Message-ID: <14fa33e2-d993-8d9e-7e81-12f72eddc380@kernel.org>
Date: Sat, 5 Aug 2023 23:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: wlf,wm8960: Describe the power
 supplies
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, broonie@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Fabio Estevam <festevam@denx.de>
References: <20230803215506.142922-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230803215506.142922-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OREFXTVQ6TNKQYE7333Z67JMWG4Z3LED
X-Message-ID-Hash: OREFXTVQ6TNKQYE7333Z67JMWG4Z3LED
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OREFXTVQ6TNKQYE7333Z67JMWG4Z3LED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/08/2023 23:55, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> WM8960 has the following power supplies:
> 
> - AVDD
> - DBVDD
> - DCVDD
> - SPKVDD1
> - SPKVDD1
> 
> Add them to bindings to improve the hardware description.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by
automated tooling. Performing review on untested code might be a waste
of time, thus I will skip this patch entirely till you follow the
process allowing the patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof

