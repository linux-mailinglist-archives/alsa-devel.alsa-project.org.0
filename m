Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84365770680
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 18:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E147284C;
	Fri,  4 Aug 2023 18:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E147284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691168372;
	bh=AIyB0V+fmBm1nEWIRBjm9UjeEbb7XHhZZ7hR3ZnxFW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HINmd58W/mz7uIVLfclGx/Yu4XSDVuQaNi96ye1ccakB243gxL+h2kahFwQj1kEYp
	 ZRgVKuv/SfL8hOm2Btg1YEkn4OAXOop9H923hGkRQO4+wQz8uxFf5yAUkl5pAJ1cfo
	 ux3M+wOnKQReWrPo3N8uMhlvHOc1tUFYWEryX3FY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C64B0F80587; Fri,  4 Aug 2023 18:57:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 809E4F8056F;
	Fri,  4 Aug 2023 18:57:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4015EF8025A; Fri,  4 Aug 2023 18:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1577BF8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 18:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1577BF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X5SigBDR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78F6E620AE;
	Fri,  4 Aug 2023 16:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFCCC433C8;
	Fri,  4 Aug 2023 16:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691168244;
	bh=AIyB0V+fmBm1nEWIRBjm9UjeEbb7XHhZZ7hR3ZnxFW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X5SigBDRnyL8M6ydZcaxmr+nn5EvME04lZRZovORb1iSZqnMxu/EqQ3UJPf+kAPej
	 rfdbKloceMFWAybAFePm3lRENBrFXPXhwVvSl9G7OWJ7mWnSyB1fRWqR37yUpRE7lH
	 ie7JtrNg1w22tmT3kkKSwBkLIGNYfLYlhMUKsSWyilx5muSEcPONAqnONPunrgIeNF
	 5ez7/wXWbQ+stOQnVnUV4PDwX4mA5BZSI4SamPsz2qrqdOgcMcRj/cBuW+iTcikaWr
	 6qDYZNPppG/OCZ0WPFOl7AlaD8TUJ/5gmw3BiP33H7v0C12oHfvahNluo4piCZiOCF
	 XyWUbmQxG5GcQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20230804085402.1328033-1-yangyingliang@huawei.com>
References: <20230804085402.1328033-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: ti: davinci-evm: simplify the code with
 module_platform_driver
Message-Id: <169116824355.110745.17089237266580144139.b4-ty@kernel.org>
Date: Fri, 04 Aug 2023 17:57:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: OC5QGDUTJJR7QSHJTWCAHF76YQG4K4MA
X-Message-ID-Hash: OC5QGDUTJJR7QSHJTWCAHF76YQG4K4MA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OC5QGDUTJJR7QSHJTWCAHF76YQG4K4MA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 16:54:02 +0800, Yang Yingliang wrote:
> The init/exit() of driver only calls platform_driver_register/unregister,
> it can be simpilfied with module_platform_driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: davinci-evm: simplify the code with module_platform_driver
      commit: 9606cda3501ae5d1a865d839ee5dbae9552a7b37

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

