Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8B94FCA5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 06:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CEDA21B6;
	Tue, 13 Aug 2024 06:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CEDA21B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723523344;
	bh=wpwi0ABCpp/fgkqrTv1+QuSZw7VZSn7T7zdqlyzHuzE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0PfHKUwl39aArTqYIr8eDpErtKdMjERgqFOPG3nBfxVTkN8AE+qm3tV/H+l0sBQZ
	 vv5ZuVTX4QmDkb/rr1IO2DnWqboAMpondwzS3PXVdEwxwVZOhhWbiLmAtKjlRfFk1Z
	 seeih/kP4tOx6X672Hi1OtuS2hF+eMxUz+qhBrT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9488EF805AF; Tue, 13 Aug 2024 06:28:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C4DF805AD;
	Tue, 13 Aug 2024 06:28:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AEF7F80423; Tue, 13 Aug 2024 06:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9213DF8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 06:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9213DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hbuFRMU2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C970ECE1173;
	Tue, 13 Aug 2024 04:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB382C4AF09;
	Tue, 13 Aug 2024 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723522980;
	bh=wpwi0ABCpp/fgkqrTv1+QuSZw7VZSn7T7zdqlyzHuzE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=hbuFRMU2cxJKNWakFAu1FeNWOGPlUJPWqiBrM3xL4n4TTmQO2j5LTDpgXkE14Vypm
	 GiHp5tlytZBsFDe/bi7SSADLkl5TTvWUUoksk3tzmYEsvnpSE+SfBgBueKpP1o9tmu
	 Zg8XIVQZHecwg9ApAcvKaXk5WEBdsR25zTRRHRNwBqKapmLJb5qp7QQdhMiN0qfLTU
	 LkAgTxEV8mXibgc/lQroYwino9fcca9vBaewCLjxysyUd0tYcFaNHjFu8fV9/D10KE
	 1v/HvOPvs3qkpJXRpE0Wn7CbsDWsjGGesBGklkjZPOfWSF2bKL8MhsBhCJlZ4ZDfd4
	 fB+NKC3lceyfg==
Date: Mon, 12 Aug 2024 22:22:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20240813025436.52410-3-kiseok.jo@irondevice.com>
References: <20240813025436.52410-1-kiseok.jo@irondevice.com>
 <20240813025436.52410-3-kiseok.jo@irondevice.com>
Message-Id: <172352297724.3355027.16490098797646859934.robh@kernel.org>
Subject: Re: [PATCH 2/2] ASoC: sma1307: Add bindings for Iron Device
 SMA1307 amplifier
Message-ID-Hash: 6PMYXSC7UNYRNSAXBWQN3RBBULZX7BG2
X-Message-ID-Hash: 6PMYXSC7UNYRNSAXBWQN3RBBULZX7BG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PMYXSC7UNYRNSAXBWQN3RBBULZX7BG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 13 Aug 2024 11:54:36 +0900, Kiseok Jo wrote:
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  .../bindings/sound/irondevice,sma1307.yaml    | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml: use-binary: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240813025436.52410-3-kiseok.jo@irondevice.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

