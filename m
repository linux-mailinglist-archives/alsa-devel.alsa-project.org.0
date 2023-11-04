Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5467E0D15
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Nov 2023 03:01:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF03F823;
	Sat,  4 Nov 2023 03:00:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF03F823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699063297;
	bh=FKbs+2MdAbGKYRQisPKhmvfQIVpVesxEPJ/R8DtoaIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tsYQkiJRF741b3c3eu8h8kQpR7U73LoE/5zlOGcgPCSitSd/vMQj8FrpC17iWguFO
	 QWZzAntRMi+sbIdvj9Q0QnCAY45Lo63LNAwfZ4O7M59TGSwHXLcwjYhQHeEg6kfxuc
	 ddRLe5d+3hifY6algqDVuBUuL8EQhotHNMzFTLB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19B8FF8055A; Sat,  4 Nov 2023 03:00:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A68F8020D;
	Sat,  4 Nov 2023 03:00:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16B67F80290; Sat,  4 Nov 2023 03:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE361F80152
	for <alsa-devel@alsa-project.org>; Sat,  4 Nov 2023 03:00:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE361F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AFtFpDZ0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A30D6167D;
	Sat,  4 Nov 2023 02:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CE6C433C7;
	Sat,  4 Nov 2023 02:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699063228;
	bh=FKbs+2MdAbGKYRQisPKhmvfQIVpVesxEPJ/R8DtoaIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFtFpDZ0WPssxiW90AfZHYgq6gwAneqaWAUHT552Pm4CNhTHAn88uNFPGbV1Le+uF
	 uLEinZGYT0fMid5+fQvg4LmJtNVxD/EGsXPXEuNhhCtH9c8yqlDyCCtifDFCuVk9Xp
	 TS0PJe0IuWIUtL6n32RguwsKGyE/I586lSh3WHTVl/NdUB4JaQPGStPOrlyqQVHnnM
	 XudOUL0SnfVmZai3ujpqClE//VBnN+NoHetKsNxgdGcexKS6Ztm5aWKJWSc/LWYLVs
	 lWsBZSM9jtBXQoFeYC/CKjhuYwwluvHD5QJqZ38oeQ1YoJJAvzE3/f9QN5cU3u/Cp1
	 S/ulAtwwqHTFA==
Date: Fri, 3 Nov 2023 22:00:27 -0400
From: Sasha Levin <sashal@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH AUTOSEL 5.15 13/28] ASoC: codecs: wsa-macro: handle
 component name prefix
Message-ID: <ZUWlu5tOtjmO-GlF@sashalap>
References: <20231029225916.791798-1-sashal@kernel.org>
 <20231029225916.791798-13-sashal@kernel.org>
 <c42a83ff-fb7f-4020-b2c3-d8656433a0b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <c42a83ff-fb7f-4020-b2c3-d8656433a0b1@linaro.org>
Message-ID-Hash: Q7VQQEZKKXLDRTIEZKNVR4UARCP2EVYS
X-Message-ID-Hash: Q7VQQEZKKXLDRTIEZKNVR4UARCP2EVYS
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7VQQEZKKXLDRTIEZKNVR4UARCP2EVYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 30, 2023 at 10:32:52AM +0100, Krzysztof Kozlowski wrote:
>On 29/10/2023 23:58, Sasha Levin wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> [ Upstream commit c29e5263d32a6d0ec094d425ae7fef3fa8d4da1c ]
>>
>> When comparing widget names in wsa_macro_spk_boost_event(), consider
>> also the component's name prefix.  Otherwise the WSA codec won't have
>> proper mixer setup resulting in no sound playback through speakers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Link: https://lore.kernel.org/r/20231003155710.821315-3-krzysztof.kozlowski@linaro.org
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This requires previous patch in Mark's queue adding
>snd_soc_dapm_widget_name_cmp(). I did not get any email about it, so are
>you sure you picked up the dependency?

Nope, I'll just drop this patch.

-- 
Thanks,
Sasha
