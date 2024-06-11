Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CF7903A26
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 13:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE421A4A;
	Tue, 11 Jun 2024 13:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE421A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718105557;
	bh=OnCmFVAhBCd6GUVnj8XGIwoQY2qJ3+hZAJEHD8rdoAw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eS3C+wo0rnIx1oEgkZN7Kds9ihOH3mR79DQKlC0ad50H+z3S0eY/DWLqJfZzo/mz5
	 Ir6qE69wPJPiubEpoTgZA1yu03G1Vsr1sLKW2krkpYzeCdhcaCOgFY9W14VwJC9bej
	 J8EAyKURSoh3cFqnY9m68P6t+GCbw7TdyXMDkx8g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AB24F805B6; Tue, 11 Jun 2024 13:32:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E49B6F805B3;
	Tue, 11 Jun 2024 13:32:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D3B3F8057A; Tue, 11 Jun 2024 13:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C5DDF800D0
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 13:31:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C5DDF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VAPR5LKt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 083D8CE1ADA;
	Tue, 11 Jun 2024 11:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D952C2BD10;
	Tue, 11 Jun 2024 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718105503;
	bh=OnCmFVAhBCd6GUVnj8XGIwoQY2qJ3+hZAJEHD8rdoAw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=VAPR5LKtdZJ6ltEsaabGN+ZyGfFgpu+JS10QeGq3FnDRMjJ2/hX3jobTHRnsIn1RT
	 vPf5p22bqGFbojZ9HcMlb1sxHIag/WuW1y7fk58G0YX7HaBTw+BX1yvq96yE7Bc4Hl
	 SKizL1thSGFnmhmiktsJ/NaoWPiCCjopEGaVm+sxBTxX59fQkCp2vdH2YH2sDfQ18J
	 lHdh3C8qQfbvUL6VWpNnZW9AF636vlKCHwWvuKVOOpg9ob8f3ilfE4EJ8OZWbj7RRU
	 +NfW1ubhfQMgnpZmj0OSbzoPwMAmUpUtOTPxgS7G8SfF9Z+rcWA2DIblkXjZvyrU/g
	 5xneH846+zizw==
Date: Tue, 11 Jun 2024 05:31:42 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Takashi Iwai <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>,
 Jaroslav Kysela <perex@perex.cz>, Michael Ellerman <mpe@ellerman.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Chancel Liu <chancel.liu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org
In-Reply-To: <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <20240611094810.27475-2-piotr.wojtaszczyk@timesys.com>
Message-Id: <171810550202.1047088.17292010858616719651.robh@kernel.org>
Subject: Re: [Patch v2 2/2] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT
 binding
Message-ID-Hash: QHVFKWOVG4EQX3TVJ2I5FZG62KDDYMLR
X-Message-ID-Hash: QHVFKWOVG4EQX3TVJ2I5FZG62KDDYMLR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHVFKWOVG4EQX3TVJ2I5FZG62KDDYMLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 11 Jun 2024 11:47:52 +0200, Piotr Wojtaszczyk wrote:
> Add nxp,lpc3220-i2s DT binding documentation.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v2:
> - Added maintainers field
> - Dropped clock-names
> - Dropped unused unneded interrupts field
> 
>  .../bindings/sound/nxp,lpc3220-i2s.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.example.dtb: i2s@20094000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611094810.27475-2-piotr.wojtaszczyk@timesys.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

