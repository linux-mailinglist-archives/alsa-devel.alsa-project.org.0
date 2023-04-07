Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436B26DA90E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 08:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1108ECC;
	Fri,  7 Apr 2023 08:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1108ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680849955;
	bh=smTCBFIGHrjUaej+WC9aX2FlcE+64sY4UeW5a0kKAIw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PV3asWEV86nLDUH6yQ9pqXjUyFFi2sUVvRD7QuR6IBb+nDWqYTHjmBxLlddAU7HpP
	 OpiLkaifHKDqM1CWegtMrT7mXBERjEaqRsuS4mRP7kfeEUyTktQG8PJkMyxjzzLFhg
	 83hVh8XLasO/tVsPOoP/wODwHyaKProbWX5VDM/E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE332F80249;
	Fri,  7 Apr 2023 08:45:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2B71F8026A; Fri,  7 Apr 2023 08:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 498A2F8015B
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 08:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 498A2F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bFbZEIl0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 23CBE64F06;
	Fri,  7 Apr 2023 06:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8241EC433EF;
	Fri,  7 Apr 2023 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680849815;
	bh=smTCBFIGHrjUaej+WC9aX2FlcE+64sY4UeW5a0kKAIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFbZEIl0PqlT4iE55biHBcvpvPjEhQGGSAMrUC78/UBrOsEWT9pmV/UfDW1BtB3iC
	 kfETtlc7+y2g93BkQb8T9mJdf2cNkOJUgdANbXEWojEkiX6rM3WRBpZinYj04r57gm
	 XsALMDaZ5s2w9bIoayALpkirMbkBYieIaWXaCyc5Spp7h4kA5/0kVhi2ldW+f4tqNs
	 tgv9H4YEf4cBQqSGvAZar82oOBLL3rNECvKpOxMOtPzodxltp9QU+i9pQ13DX+tKel
	 mZgRrBXOQ3i5EqFWKGxVQPYI2OK1uLZY3I5VDm9k9q80St+DSJUlELDLuIblA9/TLc
	 dwDUcscjUxhJA==
Message-ID: <68d22a80-663c-104a-c51c-496fa1a29d00@kernel.org>
Date: Fri, 7 Apr 2023 08:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8523: Convert to dtschema
To: Mark Brown <broonie@kernel.org>
References: <20230405203419.5621-1-danascape@gmail.com>
 <2dc882b7-d09f-dfa0-67a1-3f9e6f1ac457@linaro.org>
 <2c32b1e0-20f7-4d9f-9dbc-8725562e456e@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2c32b1e0-20f7-4d9f-9dbc-8725562e456e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5ODJGVYOU7RSAVMO2J64QEJ26GHCZXZS
X-Message-ID-Hash: 5ODJGVYOU7RSAVMO2J64QEJ26GHCZXZS
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, daniel.baluta@nxp.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ODJGVYOU7RSAVMO2J64QEJ26GHCZXZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/04/2023 22:26, Mark Brown wrote:
> On Thu, Apr 06, 2023 at 07:38:19PM +0200, Krzysztof Kozlowski wrote:
> 
>> Please squash all your three WM bindings (wm8711, wm8580 and wm8523)
>> into one binding, if they are the same. Probably other WM from your
>> previous submissions as well. We really do not need binding per each of
>> this simple codecs. If they ever need to grow, then we can split them.
> 
> At a minimum all of these devices should have separate regulator
> specifications should they ever grow regulator support (and ideally
> would have regulators specified in the binding from the get go).

Good point. The bindings are incomplete that's why they look so similar.
Therefore maybe we should not merge them, just like we do not add
non-trivial-devices to trivial-devices schema, just because device is
incomplete.

> There's also no reason to restrict simple CODECs to a particular
> manufacturer...

True, we could extend it to other brands.

Best regards,
Krzysztof

