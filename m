Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0392DCAC
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2024 01:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26944847;
	Thu, 11 Jul 2024 01:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26944847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720654449;
	bh=4j7HhjyR3P0XTsOa2hJfJvKNhltv5iQXTeJBSXBmgDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m8VSkBhe3gTezR5GUQvwnQTRL7N/5b+MAeYZ29SkJFPCuEbmVB9yQokn2nnFEc/1v
	 qnDgpYGPRDRB54wXMLVMxMQ5PqJ1YEMYLVWaRPQaifaLaqxrOgjsXa60S1o1jxdXWh
	 NG4k9hi14RIjRJFKA2gesZmr0W1KOGue1+0YaFaU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F9A6F805C0; Thu, 11 Jul 2024 01:33:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5FD3F805AD;
	Thu, 11 Jul 2024 01:33:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 193AFF801F5; Thu, 11 Jul 2024 01:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47850F8013D
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 01:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47850F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KuruZDGU
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B804C61BF7;
	Wed, 10 Jul 2024 23:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84466C32781;
	Wed, 10 Jul 2024 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720653971;
	bh=4j7HhjyR3P0XTsOa2hJfJvKNhltv5iQXTeJBSXBmgDs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KuruZDGU1G9jIshYs8VLqAtfT4LDSGyTiG3NMoJm4+yhB4U++ekx+EtxHSpUo9cD6
	 6m2pVVNOcvWU8KFzFsoPyqttrDJVxzW2+hwK8E8cpyHvACGi4OGzCrKyHjzxFhiYfI
	 x5en6NxFiJCLl/OSjS7xD459Oo49zmKpo9Aj7bRFclnALDYUV7H5sSP2kbholTWkRz
	 pvKX2MOJeuZ6L21eB+TxWTaPV3jhv+vEcKa09o8KsUaRQY1L6CrOT7IWmcxxYRgdC/
	 qt3kewJN0ylFfma5mUF11JYIemKsHBomT/5zchH9KgbjWRm9c3XAHuJ0zlPM3yMfaD
	 sX8gm/0aL/Edg==
From: Mark Brown <broonie@kernel.org>
To: Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240709184231.125207-1-animeshagarwal28@gmail.com>
References: <20240709184231.125207-1-animeshagarwal28@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: cirrus,cs4270: Convert to
 dtschema
Message-Id: <172065396818.391308.16919623245935152451.b4-ty@kernel.org>
Date: Thu, 11 Jul 2024 00:26:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: CWKXDNAD6ANCOB3C2UYUCOXYAPKKMKLE
X-Message-ID-Hash: CWKXDNAD6ANCOB3C2UYUCOXYAPKKMKLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWKXDNAD6ANCOB3C2UYUCOXYAPKKMKLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Jul 2024 00:12:25 +0530, Animesh Agarwal wrote:
> Convert the Cirrus Logic CS4270 audio CODEC bindings to DT schema. Add
> missing va-supply, vd-supply and vlc-supply properties, because they
> are already being used in the DTS and the driver for this device.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs4270: Convert to dtschema
      commit: e021e0eecba99d7ec68f6e7972a72175f54ff6e3

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

