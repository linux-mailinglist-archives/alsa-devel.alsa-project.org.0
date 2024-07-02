Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8639246F9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 20:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F82D1944;
	Tue,  2 Jul 2024 20:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F82D1944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719943548;
	bh=1PTZ3uQgLKGQChj25rDAqkSCJmHzdA4sq5F+oAYqs4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KiZkg2QQwJYJPPAcA2kltIm62fCiDAPGtqCLvtmC3MW0nSSTYuCnkbxh0I7MGHmpJ
	 BBdnBv4C5Pn6jMEDfd/4hWECRzT5jnHl9Sn3ncoYtxjBVC5cPUC4D2c08scG3kk/Pc
	 6rEYjcwzoYpcAz4Rz/RIJCSEJU6KY0BzWNtpaTCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABFF7F805AF; Tue,  2 Jul 2024 20:05:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3890F805B1;
	Tue,  2 Jul 2024 20:05:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44DF5F8025E; Tue,  2 Jul 2024 20:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8602F8013D
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 20:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8602F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hDW/sPSj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D46FCE1C9A;
	Tue,  2 Jul 2024 18:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFD5C4AF0C;
	Tue,  2 Jul 2024 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719943400;
	bh=1PTZ3uQgLKGQChj25rDAqkSCJmHzdA4sq5F+oAYqs4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hDW/sPSj3h9jL8Kqc/SGeHmG7EvO/537Jie5OQ1hK7jsU0foy6ZK+y+hdhYn3EmLY
	 0TNhVNo+fTLbLYQcFJGD/BCz4/fwCil5Qe+2z+FMBUhNJj9Ih+2fUOAscAzXnNaOeG
	 tn8IDzbb0205hCfEqIIalNz2dEGDvoXvpIZVySK4qpOVMfRIzuwKPWvdjhp0F6buBO
	 0mHqPGeUxfC1KbEP1G8HhhwKidkXeyRko+fpoab6x6s32w9h/uLvCkB3kP8pO7UpPT
	 ZziXOWTUF0bPcPz0LTD8bFOjaPdbqg+S5wrnkkAkQlmw9OS5lJMe8tU3J0HDuKzL/Y
	 NPMVyKHUfl8UQ==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, srinivas.kandagatla@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Manikantan R <quic_manrav@quicinc.com>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
Subject: Re: (subset) [PATCH v2 0/6] ASoC: codecs: wsa88xx: add support for
 static port mapping.
Message-Id: <171994339579.996226.3049749876359199381.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 19:03:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: UFMZZ7TVIR57VEBJWFEZC2EORLC73LPE
X-Message-ID-Hash: UFMZZ7TVIR57VEBJWFEZC2EORLC73LPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFMZZ7TVIR57VEBJWFEZC2EORLC73LPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 27 Jun 2024 15:44:37 +0100, srinivas.kandagatla@linaro.org wrote:
> Existing way of allocating soundwire master ports on Qualcommm platforms is
> dynamic, and in linear order starting from 1 to MAX_PORTS.
> This will work as long as soundwire device ports are 1:1 mapped
> linearly. However on most Qcom SoCs like SM8550, SM8650, x1e80100, these
> are NOT mapped in that order.
> 
> The result of this is that only one speaker among the pair of speakers
> is always silent, With recent changes for WSA codec to support codec
> versions and along with these patches we are able to get all speakers
> working on these SoCs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: wsa883x: Document port mapping property
      commit: 49beb4d2e85634ec1e1c82d76461d9552676045d
[2/6] ASoC: codecs: wsa883x: parse port-mapping information
      commit: 1cf3295bd108abbd7f128071ae9775fd18394ca9
[3/6] ASoC: dt-bindings: wsa8840: Document port mapping property
      commit: d47abee9fede21b19d5227061c5a8761ec1659fb
[4/6] ASoC: codecs: wsa884x: parse port-mapping information
      commit: e1bc5c324bcca3acdbe817ccbf9aa7992d89479d

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

