Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F36A860A93
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 07:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB34E7F4;
	Fri, 23 Feb 2024 07:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB34E7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708668235;
	bh=sHUvsRjDQ6XZxQcJVWrcNMqRKCZ3kcvH9jVZL6N749I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NqhDPIIFjHeMkjDFvmNcuZoAZaZ7urgs6psuTH0zGo/YN3BWndanH1dJBPL8+lT+y
	 1YB8cEIp1caAnMyTIrbfcJwHmMnMOa3puS4WidJEi6uukszk5LXCy4MD7gycSFBV5q
	 EqBILbGwo9nk76hC5iJ/N+/BT2OUtCLZg2+Jmv48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9B2CF805A8; Fri, 23 Feb 2024 07:03:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D501EF805A0;
	Fri, 23 Feb 2024 07:03:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F799F80496; Fri, 23 Feb 2024 07:00:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D224F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 07:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D224F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=qRkXg/2G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D6AD6333C;
	Fri, 23 Feb 2024 06:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD44CC433F1;
	Fri, 23 Feb 2024 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708668005;
	bh=sHUvsRjDQ6XZxQcJVWrcNMqRKCZ3kcvH9jVZL6N749I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qRkXg/2GMFnYIQ59Evo+IDsjPX8UZU/R8CP0DRLZnTGLO34rxQbVglPLqCpX0G9N7
	 +/FXhRkCExqqwBuWcx/RPE7UzdT5uB7SzBsHdYAg68Svpk/eJeb+l/M0eszo0hk8a2
	 LN236zyscT4isoBB4ixdHgwGToJdnsBGqSq3l+h8=
Date: Fri, 23 Feb 2024 07:00:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-usb@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH usb next] ASoC: Revert "ASoC: dt-bindings: Update example
 for enabling USB offload on SM8250"
Message-ID: <2024022346-hardware-shank-519c@gregkh>
References: <20240222163204.65468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222163204.65468-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: EMXUQJI2UY7AG6OLIKDWKJZSQTXKVIJG
X-Message-ID-Hash: EMXUQJI2UY7AG6OLIKDWKJZSQTXKVIJG
X-MailFrom: gregkh@linuxfoundation.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMXUQJI2UY7AG6OLIKDWKJZSQTXKVIJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 22, 2024 at 05:32:04PM +0100, Krzysztof Kozlowski wrote:
> This reverts commit a9c83252bff616cf3a38d55b7c6a6ad63667f2dd from USB
> tree, because it depends on other DT bindings changes which were not
> applied.  This commit alone causes dt_binding_check failures:
> 
>   Documentation/devicetree/bindings/sound/qcom,sm8250.example.dts:97.44-45 syntax error
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Greg,
> 
> Please take this revert. Original commit should go via Mark's ASoC.

Ah, now I see this, yes, I'll go queue this up right now, thanks!

greg k-h
