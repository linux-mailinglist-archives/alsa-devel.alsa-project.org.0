Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA76C540E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 19:48:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CCC6EA5;
	Wed, 22 Mar 2023 19:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CCC6EA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679510920;
	bh=RyfgFQn6cmcpNwaXWmhwPP/IPVrUpF4hyFEZZyoj9hc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XiAWVLOPRM0I7Hu1y5lOIzgygMKpL5iBm6Ttu6plpQZiMrC5iRMwMC02UYLo+Y/DN
	 4Z5ODCqy348+dYkWyGI8yCuz2lU/nUddwYSSwLvYo+qOjr8XCj33sWwvyWIR8H2TGw
	 xiEVDTdvAgmsPm68ScwXT1iHB6E3AT35exOiqS8c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 797EFF8027B;
	Wed, 22 Mar 2023 19:47:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3004F804FE; Wed, 22 Mar 2023 19:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AC7FF80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 19:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC7FF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PallPik1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1497621BE;
	Wed, 22 Mar 2023 18:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729D9C433EF;
	Wed, 22 Mar 2023 18:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679510854;
	bh=RyfgFQn6cmcpNwaXWmhwPP/IPVrUpF4hyFEZZyoj9hc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PallPik1/1Kowp8EcEUxrh7rM3O7BRPCZ6oppxuQmzwzOvqYptroM4KJWwQ0rt9/L
	 L8asdF2VHbEXC86ywqOPEw0YZFe3jVOaQoEePqi2mv1h4GurkmzB+HnjayeN38epm8
	 RKLW71wLYayyOU1/Z+N32m3g/lMs+0Uu3PsKuEat+FOK8hdj5AzHeEtx0tQfJoUVAw
	 Fnk3nrZD2KSOL5+ozhryQUwV+V1TMQQLAfQzNgF7agC3s1ls5x3sInRc53IzdBi8vE
	 Fj5JRofr9QnjS12+ceZEhJuyOBTXUVtNeBnEiTCcQBBDcloypZGrJIi2Xsv+9oSgUe
	 8YICSkxBJ2WlQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230322074916.23225-1-peter.ujfalusi@linux.intel.com>
References: <20230322074916.23225-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: sof_rt5682: Updates for MTL BT
 offload
Message-Id: <167951085178.1092488.1377023413252181567.b4-ty@kernel.org>
Date: Wed, 22 Mar 2023 18:47:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: YNEAJGVWRJHJF6B5X267M4ITB2JAQQGW
X-Message-ID-Hash: YNEAJGVWRJHJF6B5X267M4ITB2JAQQGW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 uday.m.bhat@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YNEAJGVWRJHJF6B5X267M4ITB2JAQQGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Mar 2023 09:49:14 +0200, Peter Ujfalusi wrote:
> Enable BT offload for Rex variants and RVP.
> 
> Regards,
> Peter
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_rt5682: Update BT offload config for Rex
      commit: 54e288766906569a9e5ca2ff3a09fb4e4cc25a37
[2/2] ASoC: Intel: sof_rt5682: Update BT offload config for MTL RVP
      commit: f19f24d47900656962cafa51426660c8aa32744d

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

