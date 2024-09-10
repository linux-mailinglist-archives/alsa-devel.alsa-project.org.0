Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A47D972B1E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 09:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3E2846;
	Tue, 10 Sep 2024 09:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3E2846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725954366;
	bh=A3iT3UI6JBnawx1kR183QC48x7S8QfaDWO3AeTsDm8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PZP8u5u9eixujVFmbL5iaEoxb7FfDuP3IlWC55WLZIqS8Y/lMOBXbfdVUEm4uBTPn
	 mY7teNYz2qtoAeJT9ykvBZUu67XRym+uzLKnOhLvn3zZ0TzKDZ1FkkBkzKatAq1ZP3
	 sttyKyPLmxD+B6RCtbPzXqB1iV6m5N+QXWwUYdlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EE98F8059F; Tue, 10 Sep 2024 09:45:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8E6EF805B2;
	Tue, 10 Sep 2024 09:45:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC615F801F5; Tue, 10 Sep 2024 09:45:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA992F80027
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 09:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA992F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pLaJL4I2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 066555C05EF;
	Tue, 10 Sep 2024 07:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7164FC4CEC6;
	Tue, 10 Sep 2024 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725954329;
	bh=A3iT3UI6JBnawx1kR183QC48x7S8QfaDWO3AeTsDm8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLaJL4I2aJXLRPZC/BfopQSW1B9zauaDiNO8jVrQ/9KX7TebFEuzyroiZdz6Odtav
	 nQg68cJj+lOxNHfW6mwWO38ctNPzJRFVzw2m45P3nwilhOc2vipK7XyA1HjrOeM83/
	 Zt+WBy2/BHiOyfV2JmL9megPEo85W6n/ZjyZVmHHpMlGQrSOPm7O7MHU+9i74KjxNd
	 smEgNXg3I3pJ9TmatdNkCeq7PaDJ528tIVEdUqyYdnHL4m54SDJzVgUez/dbTU1hjX
	 qJJm9YBjKgc0fXEm/Zd90ikgvExXGOkxHX9PDIMjgsZWKEdfjIwgPWWCweZi473giv
	 psu5nJuzCMjRA==
Date: Tue, 10 Sep 2024 09:45:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com,
	kernel@quicinc.com, quic_pkumpatl@quicinc.com
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: wcd938x-sdw: Add static
 channel mapping support
Message-ID: <jkczvc3lclyr74mecvy5dr737sjyiotepamsoz35wtnmx3cigi@vuvyovfecbvc>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
 <20240909105547.2691015-2-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909105547.2691015-2-quic_mohs@quicinc.com>
Message-ID-Hash: GHWUD24CYV4PXNZYGTGYHLVFRO277UXB
X-Message-ID-Hash: GHWUD24CYV4PXNZYGTGYHLVFRO277UXB
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHWUD24CYV4PXNZYGTGYHLVFRO277UXB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 09, 2024 at 04:25:44PM +0530, Mohammad Rafi Shaik wrote:
> Add static channel mapping between master and slave rx/tx ports.
> 

I see ongoing discussion, so if these property stay, grow the
description here to explain how this describes hardware or which part of
hardware you are covering.

> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)

Best regards,
Krzysztof

