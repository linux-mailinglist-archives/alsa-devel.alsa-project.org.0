Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9C899BDA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 13:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47942D16;
	Fri,  5 Apr 2024 13:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47942D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712316396;
	bh=lGhLQBeP+Wco5+eAYUzJL/YnZD/zNP4Ecc8OgvFdTFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NqMyow59rUrVgfyMxy4/u1KlBcoFVOBkyLujuaWOa12C8HGk9Kikg1PBGlzq/Mbzl
	 3r/7PBWIIWTniEyefBF0gIU69cSeVANCi0YNe4vPUVWabjqhLnZI88fH3qJ4Uj4nDa
	 0VTmb60N9CaI6H6D56E53jk1A/RIhG87NwjpTXco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27540F8057A; Fri,  5 Apr 2024 13:26:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97762F805A1;
	Fri,  5 Apr 2024 13:26:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0B85F8020D; Fri,  5 Apr 2024 13:26:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 046ECF80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 13:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 046ECF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=B4gQ3IoO
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12317618CE;
	Fri,  5 Apr 2024 11:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9BEC433C7;
	Fri,  5 Apr 2024 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712316354;
	bh=lGhLQBeP+Wco5+eAYUzJL/YnZD/zNP4Ecc8OgvFdTFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4gQ3IoOEyFtTOHr3ToOiSQ1Ctokd5Xa+W3mvJWNiSqgyosrflmeqcoIa4zaLFXYR
	 EUr0PUiJUDt7x8fZWMgR8Q8SGDca1D/v2/6KsAb3j6ES1H8W6Lgs7j7hi6P1/q7e9q
	 7PoG/TOCHQ2d4j5/9o8c3lddJPSBw9XC6TRN+/sUnGS9MkN1SqowdYSQnnmJ/aPfEG
	 JQSBQnZxCxtZutxgKgyDwyEsPqErkFzyc1LoM8IdjdWCaGlUlIViu+C1xabYCEZ/Mv
	 F1RKAgp8BKzhrgkmlqbu72T9H+/jY2InJ0jbKz3yhBNYNjya4um4NHdykhBZbFBO8W
	 EVeaFX6EiNqTA==
Date: Fri, 5 Apr 2024 16:55:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND] soundwire: qcom: allow multi-link on newer devices
Message-ID: <Zg_fvU-SA9nwmzW8@matsya>
References: <20240403132716.325880-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403132716.325880-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: L3CXU5NJG54ZAGQDI77BTHOWF3QLL4JP
X-Message-ID-Hash: L3CXU5NJG54ZAGQDI77BTHOWF3QLL4JP
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L3CXU5NJG54ZAGQDI77BTHOWF3QLL4JP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03-04-24, 15:27, Krzysztof Kozlowski wrote:
> Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
> over two Soundwire controllers, thus they need a multi-link Soundwire
> stream runtime.

This does on apply on sdw/next.

Pls rebase

-- 
~Vinod
