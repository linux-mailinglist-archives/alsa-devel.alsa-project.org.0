Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DCF870026
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 12:18:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB54C847;
	Mon,  4 Mar 2024 12:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB54C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709551096;
	bh=7AE0bUAE0m/NrS5BRQlOmThRBlhp43jimuMtgWpxI3Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NDRSSSJ1w8hMej2sxPOOPKY8ghMZfTfGxh+8zZddrZDhZ7Mnxk/YZhpwILf1NB799
	 klJMoL5pqs0iTyNPgJZ8cd6qa08pJEP6H2UApBD9ZRYFZy+qs11WrPsBL5YJssBxLn
	 Nrf3zBKxyrajNzK24+QX1gofgPhBjSGZxU22BSwM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B17CF8057B; Mon,  4 Mar 2024 12:17:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03937F8057C;
	Mon,  4 Mar 2024 12:17:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17289F8024E; Mon,  4 Mar 2024 12:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46404F80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 12:17:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46404F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S9d4goJ0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3418CCE1296;
	Mon,  4 Mar 2024 11:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36622C433C7;
	Mon,  4 Mar 2024 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709551045;
	bh=7AE0bUAE0m/NrS5BRQlOmThRBlhp43jimuMtgWpxI3Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=S9d4goJ0cwnQvBNhohbO4VXJsJMh3qlTmT3EFoNh20Rf9iLoGw9WIaFewKr57mR7M
	 +3Xajmhs/lxG1lw/7gW7sNMDoxIcBlj9EDk0g86Rzswp7Enza6Ydb0is9SY+IAhutP
	 RCDF+NlPSTYdwSeVpE500WU3Agll7n0AtEgpJffRnzclxDCyG6XTvznccDviJi1sD6
	 43zr8HFb54cCpNQNIP4SAQSP/B9Flf0H4t/TuERpf+dBEu2zATe+3JUK8CUZc+d3mD
	 k3hfpiL4BB6fGhLXTQPMTS6EtswzK7UoSNW6Zy3xJH9mSui+OhK9PloZZ0hgs+MSi1
	 4XQ5adjIyhw/g==
Date: Mon, 04 Mar 2024 05:17:24 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: supercraig0719@gmail.com, KCHSU0@nuvoton.com, scott6986@gmail.com,
 conor+dt@kernel.org, dardar923@gmail.com, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, CTLIN0@nuvoton.com, YHCHuang@nuvoton.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 devicetree@vger.kernel.org, SJLIN0@nuvoton.com, lgirdwood@gmail.com
In-Reply-To: <20240304101523.538989-2-wtli@nuvoton.com>
References: <20240304101523.538989-1-wtli@nuvoton.com>
 <20240304101523.538989-2-wtli@nuvoton.com>
Message-Id: <170955104307.4120754.16376940240530609048.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Message-ID-Hash: D2OV7XBJ53IT66QABSSJ4TLEPY6FDUW4
X-Message-ID-Hash: D2OV7XBJ53IT66QABSSJ4TLEPY6FDUW4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2OV7XBJ53IT66QABSSJ4TLEPY6FDUW4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 04 Mar 2024 18:15:22 +0800, Seven Lee wrote:
> Added a DT schema for describing nau8325 audio amplifiers.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:25:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:25:20: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:25:30: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:25:41: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:30:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:30:29: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:30:37: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml:30:45: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240304101523.538989-2-wtli@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

