Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8576737F45
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 12:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8692820;
	Wed, 21 Jun 2023 12:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8692820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687341947;
	bh=TkhnU2iO60KxroaUzwi5K/9HVKzmC+S3U1Gmy9jPOLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DVvZjJThUD78mmCvGmtdCCfocUjk/lsGU9F3Do1bz3CcRNvTWlyFptJQQntxB4wnP
	 K5ZZnMVQk5BgtWbrftZG65onRSI3hUqLPPRD+kX5XkJouOTvQ857yIThQHzBMS0di5
	 Q5Sl8hEeLfLs8c6IvnDNAo2amTxPFnYk5PbeGLiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD9C0F80548; Wed, 21 Jun 2023 12:04:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B60F80132;
	Wed, 21 Jun 2023 12:04:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09294F80141; Wed, 21 Jun 2023 12:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5F5FF80124
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 12:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5F5FF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZZpmaVLM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 224706150F;
	Wed, 21 Jun 2023 10:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E2DC433C8;
	Wed, 21 Jun 2023 10:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687341885;
	bh=TkhnU2iO60KxroaUzwi5K/9HVKzmC+S3U1Gmy9jPOLM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZZpmaVLMIM+bIiN8ius4k8PHeJAeZ9L4HLOFFQ306hpR9kansM1W6V6lKaCHKvBn/
	 BqrO3sZ4eHvHTM5fM8QL+BE0CHRJ5DQOnXPn4+B07ZFENZZOZ/Fw9h5SVMo4ouIFDk
	 zh+Dm0BeKBW+PsZjyiehEme1yMbTorEm6iP1SpfKocUjvmq6LfYLENtA6shG1zTHaC
	 VaWcUVF/RlcnOiTCh5SO/wEVRqChL3cZKREkdi8uQvS73FP6w8uHF7IVXw8XnHt+zp
	 wUNyB3Qa/QoVDAgoBbTUeh7ZBCanLzeBflXfzSLRZMk5UN7IWahnS5Mw8pePsucmUH
	 NQiBxE7qlAooA==
Message-ID: <7875a8c3-0ea6-d725-1dd1-bad42f089e80@kernel.org>
Date: Wed, 21 Jun 2023 12:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 13/14] ASoC: dt-bindings: renesas,rsnd.yaml: add common
 port-def
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
 <878rcdblq9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <878rcdblq9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4V7LC6CCKGL4QMC5WMLAULZJKDJCMCBM
X-Message-ID-Hash: 4V7LC6CCKGL4QMC5WMLAULZJKDJCMCBM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4V7LC6CCKGL4QMC5WMLAULZJKDJCMCBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/06/2023 04:19, Kuninori Morimoto wrote:
> renesas,rsnd uses both "ports" has "port", and these are very similar.
> To avoid duplicated definitions, this patch adds common port-def.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

You missed at least DT list (maybe more), so this won't be tested by our
tools. Performing review on untested code might be a waste of time, thus
I will skip this patch entirely till you follow the process allowing the
patch to be tested.

Please kindly resend and include all necessary To/Cc entries.

Best regards,
Krzysztof

