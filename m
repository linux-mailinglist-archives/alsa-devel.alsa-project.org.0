Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA517F7762
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0361E91;
	Fri, 24 Nov 2023 16:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0361E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838872;
	bh=RrK05VPdbcEwjcNqpX/em+leW78xzLeDnWA0JVf9tjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H22+w2NWEWLOnHN/vqEXdCEhDnMmmAeXX1VEIBZM1E31iwSfJx1vVBcO8vBHg01pf
	 lzhcdxAUNB2c1nkSOys9SFsdJDOkHZiz38IO4E/WbrDpsyZwSCph8MIGmM+XnzCVcq
	 rdraludeQyjwfeBaPiHF8fHlG9z7aZBOL0ACXyqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75B36F805AA; Fri, 24 Nov 2023 16:14:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A502EF805A8;
	Fri, 24 Nov 2023 16:14:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0934EF80310; Fri, 24 Nov 2023 16:14:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77700F80254
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77700F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qcmDfJU2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BC57FCE29F8;
	Fri, 24 Nov 2023 15:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5389C433C8;
	Fri, 24 Nov 2023 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700838810;
	bh=RrK05VPdbcEwjcNqpX/em+leW78xzLeDnWA0JVf9tjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qcmDfJU2JBKrjkB0oEVGhW8xMgziK3ZQpCdiS7lkpC8pJ4EuIMRiSvz29gweSEW7d
	 Jk2t0GrZTnuQ6Xsn0LwPH31Grv4+hS6AuZ+vlzyZMJdk6/EJ8cMZfOE7gtaNju29Kr
	 3mnHuUHYIyiVAp0Iv8IkmcF94zBYY/lLNM5mzpCh1iA+xLfZk2V49DIXLKgktvWJ9W
	 lnYjSWh8DgLc9WAE3gtsy6hBuk1ffwwZaavtktBHmBkSZ/qMYa7hzhugNW1rWjeoUI
	 mVMs75QoK6nBFGF6zGXPUyxWhceJ8LsFI4JJPIt7uTKQlCxgq+/n7bvuFlVBlRhUCI
	 rqCepTPpaa1GQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, cezary.rojewski@intel.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231124124015.15878-1-peter.ujfalusi@linux.intel.com>
References: <20231124124015.15878-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes
 when HDMI is not available
Message-Id: <170083880747.2597788.470442567674025665.b4-ty@kernel.org>
Date: Fri, 24 Nov 2023 15:13:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: NQB4R6PMI2ZH6WZOHKCM2VY37J5U6W7C
X-Message-ID-Hash: NQB4R6PMI2ZH6WZOHKCM2VY37J5U6W7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQB4R6PMI2ZH6WZOHKCM2VY37J5U6W7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Nov 2023 14:40:15 +0200, Peter Ujfalusi wrote:
> When the HDMI is not present due to disabled display support
> we will use dummy codec and the HDMI routes will refer to non existent
> DAPM widgets.
> 
> Trim the route list from the HDMI routes to be able to probe the card even
> if the HDMI dais are not registered.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI is not available
      commit: 3d1dc8b1030df8ca0fdfd4905c88ee10db943bf8

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

