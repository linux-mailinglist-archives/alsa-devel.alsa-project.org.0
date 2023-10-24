Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4E7D5AF6
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 20:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A5C1E7;
	Tue, 24 Oct 2023 20:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A5C1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698173708;
	bh=3tIsULG9clFoEJihk8khIpm9lSY2diH297dFAOUkrp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O/2UFESC5euLLCkGN5i5DLek5wFtPh7goD7fkq7mPiL8R6JpWF80I4tbPHbjLU40u
	 JOCB3NMb/rY3BljHe0WAsQAfbCoSE0UWV/F7xH39rpF5f+f8uPRW98kZ9K6WzDG5SX
	 m3zlFUXNsqn/LSQnv5WfbcfhKrBLzPSk2sbqsTeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D423EF8012B; Tue, 24 Oct 2023 20:53:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62CDBF80557;
	Tue, 24 Oct 2023 20:53:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D5AF80224; Tue, 24 Oct 2023 20:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 108D1F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 20:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 108D1F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RBUDhfwN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51A07CE2AE0;
	Tue, 24 Oct 2023 18:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79C4C433C9;
	Tue, 24 Oct 2023 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698173610;
	bh=3tIsULG9clFoEJihk8khIpm9lSY2diH297dFAOUkrp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RBUDhfwN9muAxF9xHPSrmeWIBOMABgsoM5bUwNFdPaoV/H2b1RQNoQC94B2nLzDPH
	 iiiyrSuMI3AoktCE5eXXlRiJfT0LYydLAygxJV7W1maa0ekfiYHVQIOgz/cRLIh02G
	 1uweraEHM8DADam8IiLpeeNOvxvl9vyx+NLTtSHoDnY0V3BnMQ8Eo9V/pxWNef1s8D
	 GQMud0ALBpvyxnytlpzWWDZjLOAFN1lrrI4YkWx4jGcmdtoiE8gkp29Ynsrh50gRLd
	 dd/zzcVNeYQWPK5wXeqpeBrrg2/ikkfTPjrpnwAx8r3BRpW+eiX2LwFqIknxJ7bSdq
	 hC25blxVAMseQ==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231023154917.671595-1-colin.i.king@gmail.com>
References: <20231023154917.671595-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: codecs: rt298: remove redundant assignment
 to d_len_code
Message-Id: <169817360865.82257.4197167510702272746.b4-ty@kernel.org>
Date: Tue, 24 Oct 2023 19:53:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 2NQHIDVHXVCOBQGYVEKPVANAOFVA7KFJ
X-Message-ID-Hash: 2NQHIDVHXVCOBQGYVEKPVANAOFVA7KFJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NQHIDVHXVCOBQGYVEKPVANAOFVA7KFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 23 Oct 2023 16:49:17 +0100, Colin Ian King wrote:
> Variable d_len_code is being initialized to zero and then re-assigned a
> different value in all the valid cases in the following switch statement.
> The only place it is not being assigned a value is on the return for
> a default case and in this case it does not need to be assigned. The
> initialization is redundant and can be removed.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: rt298: remove redundant assignment to d_len_code
      commit: 91e174fc04b1975b0e4d431a7020779635ff7c05

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

