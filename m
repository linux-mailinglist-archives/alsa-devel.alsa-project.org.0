Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705D89BF4C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 14:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA7F233F;
	Mon,  8 Apr 2024 14:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA7F233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712580351;
	bh=tfA9OCUUYmRBc/HfduGlcOEWNno6qBswTFUJs11/8Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ex69ggEqM+sOK3chRqgDJwO39HJ6Cz5UuTx499YIZpKcSme8DGjhXK1ssxl6KcT2/
	 cpTeANJmvcaP+kCKSiiwD6O/jbS81u+u6OQl/3pjJsOONgrpICwyWci3H1dBvF+zom
	 IZ+8AoEKhSNPhqFB1YOgmN6Zsc/sETUafpiwg6yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D26EF80238; Mon,  8 Apr 2024 14:45:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA97CF80568;
	Mon,  8 Apr 2024 14:45:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84E22F8026D; Mon,  8 Apr 2024 14:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B8FBF800C9
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 14:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B8FBF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aQM+9khF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13DD9611BB;
	Mon,  8 Apr 2024 12:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F782C433C7;
	Mon,  8 Apr 2024 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712580303;
	bh=tfA9OCUUYmRBc/HfduGlcOEWNno6qBswTFUJs11/8Xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQM+9khFVzUOxlN8kWH6/Ua0hK+6TWyjo1t158gVxNaLnzWSbD+CfOLvDMaSVOk1S
	 p4yrEToGN4+sy2F9Js4CY63FE/qYbPlpEPkAAqKFDc6lVmM8VbDLurDOH/FQhKA27X
	 9EomU7+rrKF3MTc242A3SPlvFSFz1+ryQ8IEVea1MGYnWzCYaerP80Pt+JRbZrsct0
	 A9eNlJvr4IdSrjXtEafomf6NH64Du3w9oWDfTt6NlaN8sfVaS7WdgSC4LImuFaMc6r
	 wbsLGNYtw2H3Zhg6UYCqI2cd4Tyq1JxhN1IR6rU8a6hQCFpcacnY+KYHRoZ9T4qoQF
	 JMOE4QShg0amA==
Date: Mon, 8 Apr 2024 07:45:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
Subject: Re: [RESEND v3 2/2] ASoC: qcom: sc8280xp: Add support for QCM6490
 and QCS6490
Message-ID: <45yy3cvepk4uwi2jdmh4w6l5ac3dffqhbot6xzv2bwjvo637ss@pryzth2hghyu>
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
 <20240408042331.403103-3-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408042331.403103-3-quic_mohs@quicinc.com>
Message-ID-Hash: 7CH3YOQVKXNLUQJAJJJ24NMY65CTJTS2
X-Message-ID-Hash: 7CH3YOQVKXNLUQJAJJJ24NMY65CTJTS2
X-MailFrom: andersson@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CH3YOQVKXNLUQJAJJJ24NMY65CTJTS2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 08, 2024 at 09:53:31AM +0530, Mohammad Rafi Shaik wrote:
> Add compatibles for sound card on Qualcomm QCM6490 IDP and
> QCS6490 RB3Gen2 boards.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index b7fd503a1666..878bd50ad4a7 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -169,6 +169,8 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id snd_sc8280xp_dt_match[] = {
> +	{.compatible = "qcom,qcm6490-idp-sndcard", "qcm6490"},
> +	{.compatible = "qcom,qcs6490-rb3gen2-sndcard", "qcs6490"},

We now have 4 <platform>-sndcard and two <board>-sndcard compatibles
here.

Not saying that your patch is wrong, but is this driver board-specific
or soc-specific? Srinivas, Krzysztof?

Regards,
Bjorn

>  	{.compatible = "qcom,sc8280xp-sndcard", "sc8280xp"},
>  	{.compatible = "qcom,sm8450-sndcard", "sm8450"},
>  	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
> -- 
> 2.25.1
> 
> 
