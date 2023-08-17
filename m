Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D23780126
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 00:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AEFC886;
	Fri, 18 Aug 2023 00:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AEFC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692311923;
	bh=E+bjVNkJR/U/dmLjeSJ4wno6mUJSSAj4g0UdWc8AXng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sQLlOllhXW73+Kpv3qcGnFes1nge9kKW9odVtzNViRWUnY9zSlHTlSWtvzVXvc4kd
	 rxRl5Mq4FhMX4YvLV4YJ1M5pAwe502IXNMJvyhLqH7fKy1AMS2HIsGbnCP/4H6S0Qp
	 gosNKi2InKs03QNIB+dnU8hgo2J0cHYZ0R2Iy9xU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2F59F80571; Fri, 18 Aug 2023 00:36:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BD9AF80571;
	Fri, 18 Aug 2023 00:36:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 316D5F801EB; Fri, 18 Aug 2023 00:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2B40F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 00:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B40F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rxhXvNbl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ADE9363B77;
	Thu, 17 Aug 2023 22:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D742C433C9;
	Thu, 17 Aug 2023 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692311789;
	bh=E+bjVNkJR/U/dmLjeSJ4wno6mUJSSAj4g0UdWc8AXng=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rxhXvNblrMzR6NOZhakhaDUN68Zbf7GvcJNCK5zIk1tWti+dtsUqSWuF/Jq8oCZyf
	 R5e90ZHNUkaoiERuvrGCKn/BzvEM+W/Imlt3HV8Y7TAjZBQZgdpgkAEs/6kPc1eoo+
	 fwtvZAn+6cDfDwLe1ur8tnMjkTKcTwgay9LSplBtKtWMEkJfd7VNGXDklLDd7ChdNp
	 HZXuaZNXAWDOsHHlb4PWDE2tUlOTO6SebJ8g4j4NCDv9QDz5gNK8/iNwN2swJOCFU1
	 i/qxxl4KJGJ4ZyJJ1K0hXuYh+Zd9xlVoLrSt8n0yiJEzVjRbiWCl85+hrs4TQHRtsF
	 1XJw4u34fPNOw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
In-Reply-To: <20230817112712.16637-1-rf@opensource.cirrus.com>
References: <20230817112712.16637-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: cs35l56: Update ACPI HID and property
Message-Id: <169231178796.153247.13552278958576968158.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 23:36:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: GIQ6V36NLGHGKVLFFHSBBUHNZB56WLJM
X-Message-ID-Hash: GIQ6V36NLGHGKVLFFHSBBUHNZB56WLJM
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIQ6V36NLGHGKVLFFHSBBUHNZB56WLJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 17 Aug 2023 12:27:10 +0100, Richard Fitzgerald wrote:
> These two patches add an ACPI HID and update the way the platform-
> specific firmware identifier is extracted from the ACPI.
> 
> CHANGES SINCE V1:
> - Rebased to apply on v6.4 and v6.5.
> - Change kstrdup() to devm_kstrdup()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l56: Read firmware uuid from a device property instead of _SUB
      commit: 897a6b5a030e62c21566551c870d81740f82ca13
[2/2] ASoC: cs35l56: Add an ACPI match table
      commit: e8500a70270334b9abad72fea504ef38a2952274

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

