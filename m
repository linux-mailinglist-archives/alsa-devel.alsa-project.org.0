Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA779FABDD
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 10:13:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8509601DB;
	Mon, 23 Dec 2024 10:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8509601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734945192;
	bh=h9YGRNmTt8k/JhSMq7DzlnJWXJOQxvg7m1qXhlH+PKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vAxWqsbY1UO1wwECGQTGPGcr3imdvsylJZmSLuwgNqerJaC3SwUANa4SnFfLMfUj3
	 70Pjm8kkS3eO7g44sRDfFkENx1DTpdplkvjRct94O8DQBd3Tg9McoLLiZ3+zImokuO
	 oYNiFhDcwIa/JhRO5RuyMDgG8oN8UZG8c3GRCRCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CDECF805D9; Mon, 23 Dec 2024 10:12:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 199E4F805E8;
	Mon, 23 Dec 2024 10:12:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB0E6F805CA; Mon, 23 Dec 2024 10:12:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9A07F805BD
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 10:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A07F805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GhFZfv6m
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7C94A40CAF;
	Mon, 23 Dec 2024 09:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B7BC4CED4;
	Mon, 23 Dec 2024 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734945143;
	bh=h9YGRNmTt8k/JhSMq7DzlnJWXJOQxvg7m1qXhlH+PKQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GhFZfv6m5JwspC6e/Wp0S13HBTWlgYHpfBTKo+bbTfKCjZ/1W5LwqtrtdEhnYqfB/
	 nvRZh8WqgkJ1dtqOgLtAXYWUBRdkNW+gbIWSOMY+iDjBKTDG1CaI8Kr/+GRsNBS+v7
	 Y+uOX6v/Vx4MjR6TzyfAlT+SjcUc8VzWk6Gv8k9o4I/L+Y/npAPWUKL0yHXlW9LebS
	 UhKXxBCD+/cQ/b1acaVF3NzNmd2Y0iy5OdIoTFM5u6gT2i6iiU88J4c2wYGOUD1wC9
	 mMCy93D/kua5d2B3ITwhL3KdZdW7bfmrMCq9Fqns0Ce9x85WAnhKIw5ouk2RSiuN0h
	 nwyBu6q8jaW7A==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
References: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
 power off mode
Message-Id: <173494514030.830310.1951135316198778911.b4-ty@kernel.org>
Date: Mon, 23 Dec 2024 14:42:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
Message-ID-Hash: KHK63MYHJBKA2TAICBWIYRVV37KKWAQ4
X-Message-ID-Hash: KHK63MYHJBKA2TAICBWIYRVV37KKWAQ4
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHK63MYHJBKA2TAICBWIYRVV37KKWAQ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 03 Dec 2024 14:51:44 +0530, Vijendar Mukunda wrote:
> As per design for power off mode, clear the wake enable register during
> resume sequence.
> 
> 

Applied, thanks!

[1/1] soundwire: amd: clear wake enable register for power off mode
      commit: 74148bb59e2064b87eb1715d9eb109adccb75316

Best regards,
-- 
~Vinod


