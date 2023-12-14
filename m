Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EFC8131C5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 14:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECFF7A4E;
	Thu, 14 Dec 2023 14:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECFF7A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702561096;
	bh=O5TgA8MD5vafe0qN8lLvWfpYDU/q2IvTpt6dbdNgacg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cMxaotP2Kkv1u4N1DJnRqvsrtLCxgF6GFHwn2g5756nPdWwcY5GDCUatYInhyY6vl
	 m9oZ4jU+kGZDheEZXmrB6y8wgot2ucrzp+gHOQHIX0VwV0MfgC/PPuOSzNRtg6A00S
	 1FdTx00y4dRY8Jov5KDjpeI/hldv7AwQa5eQAOQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AD23F8056F; Thu, 14 Dec 2023 14:37:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2DB2F80571;
	Thu, 14 Dec 2023 14:37:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F525F8016A; Thu, 14 Dec 2023 14:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AADC1F8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 14:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AADC1F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g9XWIkX5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4D1ACCE2447;
	Thu, 14 Dec 2023 13:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174CEC433C8;
	Thu, 14 Dec 2023 13:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702561043;
	bh=O5TgA8MD5vafe0qN8lLvWfpYDU/q2IvTpt6dbdNgacg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g9XWIkX5pkRl7TBT4gmlxHjimfT4hsCXHzEdPeejrdKwSGeP/dHhm039YlV2lK2/r
	 YIQiL3tSVd7K7WTw7jecTQPoLMXBqwCrv+sSmFAj/lbwhilSNNHYEIFf1DL2brw1xU
	 iS6KYL3LaeGCeZHNL+5PvMatoTf6K9ue2nJtX9KTAcm86Tugh709uBEWzMwCorBNYX
	 5/cYGvLQ+VB5FN0vLHeQPz2bJZFDK3klGrwn3hz06QGSn2y7rRHm3ZSiBko0lcba8p
	 qW6fLOw8J4mm4VeF2ZOONEaF/JaqeMDAlXeyJfvDFMl5e9JGq8XDMJXDnLRrr12VrL
	 5MazXj1ESj/nw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: kuninori.morimoto.gx@renesas.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, daniel.baluta@gmail.com,
 alsa-devel@alsa-project.org, iuliana.prodan@nxp.com, shengjiu.wang@nxp.com
In-Reply-To: <20231128081119.106360-1-daniel.baluta@oss.nxp.com>
References: <20231128081119.106360-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH v4 0/2] ASoC: audio-graph-card2: Introduce
 playback-only/capture-only DAI link flags
Message-Id: <170256104081.58703.13815510713299468490.b4-ty@kernel.org>
Date: Thu, 14 Dec 2023 13:37:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: KV4GVZRPWTJPT7LMKSJ5YAXWCHEJDLDM
X-Message-ID-Hash: KV4GVZRPWTJPT7LMKSJ5YAXWCHEJDLDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KV4GVZRPWTJPT7LMKSJ5YAXWCHEJDLDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Nov 2023 10:11:17 +0200, Daniel Baluta wrote:
> This patchseries allows users to specify a link only direction with
> audio-graph-card2.
> 
> Changes since v1 - https://lore.kernel.org/lkml/20230801082433.548206-1-daniel.baluta@oss.nxp.com/T/
>      - used audio-graph-card2 instead of simple-card as we are deprecting simple-card.
> 
> Changes since v2:
>      - Fix device tree binding error reported by Rob
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: audio-graph-card2: Introduce playback-only/capture-only DAI link flags
      commit: d29351e8c20d61a852bbdfcab7bb7166bd916558
[2/2] ASoC: dt-bindings: audio-graph-port: Document new DAI link flags playback-only/capture-only
      commit: af29e51bee8223d8b26e574489d2433b88cdeb2f

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

