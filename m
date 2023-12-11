Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED580C2DB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 09:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD71A9F6;
	Mon, 11 Dec 2023 09:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD71A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702282474;
	bh=3GqnJlLQgzJix4uleFQHfKZjGRQYL0QZLwm4aAsiEkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NLOpSzjddanqcaYFdE0c//jkw8VBrMCSIztmbixM9Cy+gvN0IwdJYzeO/HkVZxH6w
	 fg0Y73OgGhxTBZHtbJr951kfc1q/PMNXvmZYaODb9gdWchN5ycB0OXcPjeOIBFbduX
	 aYN0NF9RRGNZ0gw3q3zhMMGJrmQFpB+GpUCrzYHk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22F93F80587; Mon, 11 Dec 2023 09:14:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B3A4F80570;
	Mon, 11 Dec 2023 09:13:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58B5EF80124; Mon, 11 Dec 2023 09:07:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90089F800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 09:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90089F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kvVtjOw1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 15107CE0EBE;
	Mon, 11 Dec 2023 08:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557A6C433C8;
	Mon, 11 Dec 2023 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702282038;
	bh=3GqnJlLQgzJix4uleFQHfKZjGRQYL0QZLwm4aAsiEkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvVtjOw11aO9mExns9Vh/CwD0zBcHAhfP57vRwAHZ14s4oH5bglxziHG/3/I3exA6
	 tsRvtOK/xvqi6pPrBTitdRhGV8G0D7ZBiwv/xzzAiJAjVBuo/vbAcrmErpzgolBFm5
	 Rix3xhfcyefxA+rsQOzZZTGub0tRHg95c7VZ4eVK2/e61czbbjIdgtKFPc3GoWKtAv
	 tgr7HK0Iz0FWjWAMv5POP32INgUXkUUVhbIRMYu3agqwbJ6AF7/2Qek5iYhDctqGi9
	 eDsnDcOrS/WBiIj1nSAJhuhbi8wbfRMYKweSHXLDv4h0ck1NC8sB6DID59+SfoDfDp
	 EwBG1iqaXiaSA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rCbKd-00016z-2a;
	Mon, 11 Dec 2023 09:08:04 +0100
Date: Mon, 11 Dec 2023 09:08:03 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
	srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 0/2] ASoC: qcom: Limit Digital gains on speaker
Message-ID: <ZXbDY1iA_DQLIzqq@hovoldconsulting.com>
References: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204124736.132185-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: 2YPWWEB5NHXFXDFGR3BIGLOD2EMO3FHW
X-Message-ID-Hash: 2YPWWEB5NHXFXDFGR3BIGLOD2EMO3FHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YPWWEB5NHXFXDFGR3BIGLOD2EMO3FHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Greg and Sasha,

On Mon, Dec 04, 2023 at 12:47:34PM +0000, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Limit the speaker digital gains to 0dB so that the users will not damage them.
> Currently there is a limit in UCM, but this does not stop the user form
> changing the digital gains from command line. So limit this in driver
> which makes the speakers more safer without active speaker protection in
> place.
> 
> Apart from this there is also a range check fix in snd_soc_limit_volume
> to allow setting this limit correctly.
> 
> Tested on Lenovo X13s.
> 
> Srinivas Kandagatla (2):
>   ASoC: ops: add correct range check for limiting volume
>   ASoC: qcom: sc8280xp: Limit speaker digital volumes

These were unfortunately not marked for stable, but could you pick them
up for 6.6?

The upstream commits are:

	fb9ad2448508 ("ASoC: ops: add correct range check for limiting volume")
	716d4e5373e9 ("ASoC: qcom: sc8280xp: Limit speaker digital volumes")

>  sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
>  sound/soc/soc-ops.c       |  2 +-
>  2 files changed, 18 insertions(+), 1 deletion(-)

Johan
