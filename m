Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C7975964
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 19:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0EF1857;
	Wed, 11 Sep 2024 19:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0EF1857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726075732;
	bh=qwGVd7fR70DXTQ4TIBjZjiSafIbHZwIjIbXr7gxXOq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nq+x2gzm56TVfthN9LFGaP2n86KfUSyg1xXZULvGAKuQGIrYtkIDFPDMHuXJ2TRoe
	 F3MBOFS7UXyu3+eNoPRgvAVpTW/iQx3zUPcmzu2HdCP6qcsoIQAIKVjxfpm0fv/0sx
	 hDOaNu1gprxeoMlTdRpE7dciQ4LaTccaO/DugLD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 604BAF805C2; Wed, 11 Sep 2024 19:28:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E79F805D9;
	Wed, 11 Sep 2024 19:28:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32F6DF801F5; Wed, 11 Sep 2024 19:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BD25F8010B
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 19:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BD25F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UB+2E1Dj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 822045C0741;
	Wed, 11 Sep 2024 17:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5505C4CECD;
	Wed, 11 Sep 2024 17:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726075671;
	bh=qwGVd7fR70DXTQ4TIBjZjiSafIbHZwIjIbXr7gxXOq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UB+2E1Dj6M0yGOQ9WVbz59c6z1zP5/jqE9ha9gFl0Mhvq7262M1TGCrSc8+hO9QUg
	 X2EL7sU9oI1hF6Bjs4z2cFKJ/TW3xGIWOFa2mhFY1/KRCZiDpKyVYODBknUM4sXYc5
	 Trc6QfFHAbEaBXSmzoxHR+hDiali7cnhbs5CXVQgmutkGVMLLUXk+f96s36zse7AfJ
	 xLVb3nxgQBUKmUSJUqnjzPyFV4nhPUYnIR9Z1x0NW5D87dq4eFmD1If5nD7Ct20OD8
	 cFhHzmRmT5J5il5v/CuLNb2HH+ocPkQVx/Obt0N0vj8GJrLG5xiMMPCXCNFcHnBAwa
	 5d/EaeLRTOg2g==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87wmjkifob.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmjkifob.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: renesas,rsnd: add
 post-init-providers property
Message-Id: <172607567061.120511.8528081437305526295.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 18:27:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: UW6UE7SQ7Q2W5ZAPWMTZFIUO6D5YINTA
X-Message-ID-Hash: UW6UE7SQ7Q2W5ZAPWMTZFIUO6D5YINTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UW6UE7SQ7Q2W5ZAPWMTZFIUO6D5YINTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Sep 2024 23:13:47 +0000, Kuninori Morimoto wrote:
> At least if rsnd is using DPCM connection on Audio-Graph-Card2,
> fw_devlink might doesn't have enough information to break the cycle
> (Same problem might occur with Multi-CPU/Codec or Codec2Codec).
> In such case, rsnd driver will not be probed.
> Add post-init-providers support to break the link cycle.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rsnd: add post-init-providers property
      commit: a2187d0dadfc308551bbb1b8d6caee69e2ad4744

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

