Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 348DC88C29A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 13:51:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93D6C2367;
	Tue, 26 Mar 2024 13:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93D6C2367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711457516;
	bh=EZ6pFz2V/DRj+qMyZoOeq2lbUpexXlez3RxaoFi+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jrs2hoJPY8o1RNo2UnoOZOWa9/9eqnURBbcfMLK2L2hrgDBcJjBV+gtCt/Dvcv4gm
	 FOH3Fitd5pLOfGZWZBYtwQN612MYF6sRF6gsd7pJTDt9TYVdnUjGr4wbesJ98eg6SW
	 sKzgGMUCAoADflVHPqeYfVzL3psxP4qJpgobRj5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5111F8057F; Tue, 26 Mar 2024 13:51:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D518F805A1;
	Tue, 26 Mar 2024 13:51:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53D56F802DB; Tue, 26 Mar 2024 13:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57CDCF801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 13:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57CDCF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hi4UuAkf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F0B06CE1E6A;
	Tue, 26 Mar 2024 12:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A915FC433C7;
	Tue, 26 Mar 2024 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711457469;
	bh=EZ6pFz2V/DRj+qMyZoOeq2lbUpexXlez3RxaoFi+MTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hi4UuAkf7sRJXkUAI0utHWP1JtUexhos3i4hWj3DGSXskzhSxaXKD0qB03KV1OkI7
	 L/ChM9Z1h4adf2dIg6wUaCzjJ3eLfBDkBylZXq0b7yGDBrZpbReMXj1f9aMQmd1Kwo
	 DzDr2QlaMScm3Ihw3LLvRkbZY+Y27M23r/M/VOLby+GIC+MeV58VsLBtr+rL8s6Fqf
	 Mlle6khD750cq7FDEM0aL3/bjQGXa1lVwfwGBLpXJ8CJ/KVsyz8TZO2KoR8sAfMGRS
	 z3P5HIKkDXT52iWRF+MzvyXROBqGH7VasspTtEPfHnDbdVVoZebYQNXQqXjc8aXbOK
	 eSVJmfSdtXj6A==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221925.206507-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac_hda: improve error logs
Message-Id: <171145746742.70451.13798013977820982009.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 12:51:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: I27R6K54U4H4KFMX4IS52FPQONMIDKJB
X-Message-ID-Hash: I27R6K54U4H4KFMX4IS52FPQONMIDKJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I27R6K54U4H4KFMX4IS52FPQONMIDKJB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Mar 2024 17:19:25 -0500, Pierre-Louis Bossart wrote:
> We have a couple of duplicate logs and missing information, add
> __func__ consistently and make sure useful error codes are logged.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: improve error logs
      commit: ea5fee227ff3dae209062ac9544906debe1e9ac1

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

