Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A68AE551
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 14:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0213114E7;
	Tue, 23 Apr 2024 14:03:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0213114E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713873807;
	bh=vjqw66gxg/k9RXm6AmFoqyNmXnRBIYP9D+Q0yn+Hl1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qlp+Tizw2e+9J8SB65D5Fl5Wz3OV+vuFwluQRjIuRPi0g23ozWBY3nu5qUbnNASi8
	 52Y4sGYPqTy/Kvd5XYDH629NRbEOV64N907ESVRRSPbinqpjMcn4b728vHUtcWKIi0
	 73/6YdjylY8YfcsjiJkEV9wqb20qYODbIpA+thoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C04EF805AC; Tue, 23 Apr 2024 14:02:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E561F8057C;
	Tue, 23 Apr 2024 14:02:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5D97F80423; Tue, 23 Apr 2024 14:02:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5613F801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 14:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5613F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VHJePlC8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20BA5CE1030;
	Tue, 23 Apr 2024 12:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E79C3277B;
	Tue, 23 Apr 2024 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713873745;
	bh=vjqw66gxg/k9RXm6AmFoqyNmXnRBIYP9D+Q0yn+Hl1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VHJePlC8LmSMSnm/X7ALvprhDUROvJksMQVYLlYpEUPTnr7aV+I/Jpe3KIiJJjfEd
	 HK4/B/F97gzwuh/6eDE1qGIUFYLAym/OlZGwLYhG8Ew67iDed1sfbVDIJP+gT182sa
	 1r73mvuw+JjCxWHgKccUR33KFhYaBZ9vqq36K7bJeMXRk/mTuxzGhbeERTLk0Qe+od
	 ce9I48bSCv8hWUgFaGfrVy9eJuVa07bL3I0bsZs1iO+5eRctXGRzX/dOqHHCoRdOoR
	 nSOACPHFE21kyfrTkjcBywuVBzeGZAmr4QY++Vm7RNVO+Udi5HqCRbZTnxN5VcNQtX
	 iqgZnDkBREeRQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rzEqt-000000005PS-1iZ6;
	Tue, 23 Apr 2024 14:02:23 +0200
Date: Tue, 23 Apr 2024 14:02:23 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
Message-ID: <ZiejT5yddioQ8upR@hovoldconsulting.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
Message-ID-Hash: PY67WQXYHDXIZ5FH64SU4EJHEBHDBSH6
X-Message-ID-Hash: PY67WQXYHDXIZ5FH64SU4EJHEBHDBSH6
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PY67WQXYHDXIZ5FH64SU4EJHEBHDBSH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 02:43:52PM +0100, Srinivas Kandagatla wrote:
 
>  static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
>  	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>  	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
> +	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
> +	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),

Shouldn't these be split in dedicated HDMI and DP jacks too? What if you
have a machine with HDMI and DP jacks which would otherwise both claim
"HDMI/DP0"?

Johan
