Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF46383B47B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 23:08:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C4D825;
	Wed, 24 Jan 2024 23:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C4D825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706134083;
	bh=hnBTLdmXWaZcqPHY+gzD4i/37L5SLPfwrdKsBL0cpEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=orpTOL+MmkfjdJ9C0bVlLjMUOXnJaRmQ5Bf3GeYdvq+qJjPm4N6YjuB/doNWRwwna
	 a1wJhhb9ELMbW1ULv6DMc+r8ydz7P3z4Ukd1FHZlRyw6leBR23HJ1o8FgAf+GU7DpI
	 lFAhPAecqDBcMNuh0o2ZI91dbZZTPHwGGjQgUq4E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EAFFF80589; Wed, 24 Jan 2024 23:07:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82324F8057E;
	Wed, 24 Jan 2024 23:07:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9746F8028D; Wed, 24 Jan 2024 23:07:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37629F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 23:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37629F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oOoHLexc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 295636200D;
	Wed, 24 Jan 2024 22:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C878C433C7;
	Wed, 24 Jan 2024 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706134038;
	bh=hnBTLdmXWaZcqPHY+gzD4i/37L5SLPfwrdKsBL0cpEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOoHLexcsJBgDEp/saL5fzCCdq86j+YUMysg/UNA+Ky/q5IVGjrRrK7kvjA6IIOmN
	 UEV2Wf5KXd4MML2fnI5w8v0jtqa7tNhTjP1RSJd8edBUhAxlWma2zhfsPlqhwbqVa3
	 GRbyiF+eTAowjZwVSCtFM+P7zOMnCSFeVZYhKQBPUB936AX1hI7zxmEySqVItwAvJm
	 C++TEA624nt6jdf4pM5S+2flo3X1uv/n7/7qV8Tw8Y8miF4gU74PGZ72T/mxvbgzGt
	 +1/E5IF3Y0fvO50Y+vAELxX8+1govwRkwydB21finM+v6D/tItKxqabiQYRZPE1DNE
	 bpCcQg03AaKOw==
Date: Wed, 24 Jan 2024 16:07:16 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/6] of: Add of_phandle_args_equal() helper
Message-ID: <20240124220716.GA2454626-robh@kernel.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
 <20240124074527.48869-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124074527.48869-2-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: FQBH644W5E7CNZDCSKMMBSNFXUZS5RUZ
X-Message-ID-Hash: FQBH644W5E7CNZDCSKMMBSNFXUZS5RUZ
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQBH644W5E7CNZDCSKMMBSNFXUZS5RUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 08:45:22AM +0100, Krzysztof Kozlowski wrote:
> Add a helper comparing two "struct of_phandle_args" to avoid
> reinventing the wheel.
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Dependency of cpufreq and reset change.
> ---
>  include/linux/of.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

I've wanted to write this series for some time. Great work.

Rob
