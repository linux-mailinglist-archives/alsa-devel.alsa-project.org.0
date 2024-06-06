Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3088FE74A
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14E92846;
	Thu,  6 Jun 2024 15:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14E92846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717679561;
	bh=7j2qQVuSNB+C9zogsWp3FupLtbD+FHkF7koYC+sia4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cCgURAl3tIS6SxLdSoCTRwvnDBLdatNKYhzvAy8AeJYKYffrAmvpWvtc5ROkAdjz8
	 TLWLfHrRKyFetsfQh8ip0oYybhB7+GXe2knLyHSXhL3dpjOp6qsUnu10bA63RoAjnb
	 mHqPh8HBPGzlqf/W5UDaDk2JV2cEVAuGBm4F89Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CBCEF80588; Thu,  6 Jun 2024 15:12:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB16F80589;
	Thu,  6 Jun 2024 15:12:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43C4CF8025A; Thu,  6 Jun 2024 15:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACF34F8001D
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACF34F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dmBjBFWJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FB5B61600;
	Thu,  6 Jun 2024 13:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C1EC2BD10;
	Thu,  6 Jun 2024 13:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717679032;
	bh=7j2qQVuSNB+C9zogsWp3FupLtbD+FHkF7koYC+sia4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dmBjBFWJ/xv8UjRs7CxI6Gw+fljoJfgF29Lj/OiHSK1rq6Vp98Zvg9rMzM97iFv9e
	 ko3XSsOC2PQCJyq1L05+RoVwvZvlYO3Ud1WPqiUjFEd4Ew3wymKPmdptI0yFGMB2Gw
	 hRppoj2oROTTSN60Sije1INt2BXxYeXdgObrvBigABam8xkOYEv61iIU98PNrdOOzs
	 16u7U3mingg89AfCuFu9goSwGoiFVVUfsrzUhrUz9w2eGpCGhLrK86Jct5ffgxE8VG
	 Ns6SU8IHdn65sIBerEl4q7JIvgYHoSvqVdJbHIOubT4n3e7Ogy6mlTFjNvj+5oq6na
	 jNZZEvOHVpYIQ==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <20240606-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v2-1-70d44fa30790@linaro.org>
References: 
 <20240606-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v2-1-70d44fa30790@linaro.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: convert amlogic,g12a-tohdmitx to
 dt-schema
Message-Id: <171767903036.1300004.2234947523747840276.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 14:03:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: UGSNAVMYCUK54L554OMYBNIL6XRLJEXD
X-Message-ID-Hash: UGSNAVMYCUK54L554OMYBNIL6XRLJEXD
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGSNAVMYCUK54L554OMYBNIL6XRLJEXD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jun 2024 10:06:58 +0200, Neil Armstrong wrote:
> Convert text bindings to dt-schema format for the Amlogic TX HDMI
> control glue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: convert amlogic,g12a-tohdmitx to dt-schema
      commit: a1708fda9388c83215f0be82ad47df10be6e1975

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

