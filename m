Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7039C7C038C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 20:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACD2C151C;
	Tue, 10 Oct 2023 20:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACD2C151C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696963139;
	bh=men6Wwkv7/TKQYnqRezdvTojzHpVL+WgvG2tg1k2L9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V5zOLPARz9iNcusBhT3NgLyb/ynoXX8a3M8Drq2GbuLi2FSsitupAHITD7xZIZe1s
	 w5vLHfQQDKqOmp1tvQXcXkaM64NHjFxBXMJPNcQYwYrH0K8FIAfSjAm9YZ1dskUj3E
	 kL+qRANVjyjtkjmB+JvQLIEm3W7KFVH5WlFn+5R8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C46DF802BE; Tue, 10 Oct 2023 20:38:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D16F8027B;
	Tue, 10 Oct 2023 20:38:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF697F80553; Tue, 10 Oct 2023 20:33:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1E27F802BE
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 20:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E27F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G82dDx8Z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EA7C617C2;
	Tue, 10 Oct 2023 18:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B6EC433C8;
	Tue, 10 Oct 2023 18:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962812;
	bh=men6Wwkv7/TKQYnqRezdvTojzHpVL+WgvG2tg1k2L9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G82dDx8ZVosZ4YpJULHQQGTHciFzpRkRuwllcAxqR9+m8qLIWzSSTXMsARDEpBJnn
	 1ZWsnU6cckAfluy6Wr1P8lbFpjYHLrZ52qD0giScchSwSujTzvKjrH0uix3f9Y9Fz0
	 e7fFvcQOQrKkAucFeFoiA99CL+tkVYqyRPE6ooS0hZWK8hkLA9xfr8xm0FHdTcCZ2B
	 0hSJbSYIjyA18rRl9bOP7dyvT3s2ps90lXQ/llp7pLeziQyvH8Mg4NLfu6gUqDcUxa
	 RWQD8YUendklehp9uryDzJrsazV4apLMOSj7PheWofCph59IMp/0YECRz+QnuBqFbI
	 q/bYY7Bsr/bqw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20231009153412.30380-1-rf@opensource.cirrus.com>
References: <20231009153412.30380-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: ASP1 DOUT must default to Hi-Z when not
 transmitting
Message-Id: <169696281081.221758.5630336947565213531.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:33:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MLZERGHLVXWCLOVQY6G4O63TOGUOTZTN
X-Message-ID-Hash: MLZERGHLVXWCLOVQY6G4O63TOGUOTZTN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLZERGHLVXWCLOVQY6G4O63TOGUOTZTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Oct 2023 16:34:12 +0100, Richard Fitzgerald wrote:
> The ASP1 DOUT line must be defaulted to be high-impedance when
> it is not actually transmitting data for an active channel.
> 
> In non-SoundWire modes ASP1 will usually be shared by multiple
> amps so each amp must only drive the line during the slot for
> an enabled TX channel.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: ASP1 DOUT must default to Hi-Z when not transmitting
      commit: 1bba0badff0ede8dc51641cff4b153422baa3369

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

