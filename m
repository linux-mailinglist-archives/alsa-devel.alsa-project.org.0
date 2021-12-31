Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E77CD482464
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 15:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5839C16C9;
	Fri, 31 Dec 2021 15:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5839C16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640961710;
	bh=2W2cwR7BA+V3M91KMdo9uv7m6sBpz3dbJ6TOw8ZwOsA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UfaWVghMZbDY4pWQ0JJqL+unzs0zhqriOY9SrC487WohNwPsR9iMhRXqTbq1aQfcY
	 5woKeXg61cuJxRzURGNp50Pk5E87lxEpXrFIuAWHyQGSZLGuRtjwL8c83W1+sW6vs0
	 e+ifgBMrbVuqKAWbQxOrPNJFqqr4yykfsPyYcc1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543D4F800C1;
	Fri, 31 Dec 2021 15:40:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1182F800C9; Fri, 31 Dec 2021 15:40:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55452F8010B
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 15:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55452F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LpTeI5wQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3ABB61795;
 Fri, 31 Dec 2021 14:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DB0C36AEC;
 Fri, 31 Dec 2021 14:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640961597;
 bh=2W2cwR7BA+V3M91KMdo9uv7m6sBpz3dbJ6TOw8ZwOsA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LpTeI5wQiK+t9XWW6ufpzlYWGvsTw4AUlwbgInViIurwwMafKLp23FAprisyCSv9U
 eoMY08kYN4K7IEkdcRQldz/YyC5xWYUc/4utxzIInEFn7U985MFiMbtJH7vyxsg3WY
 Fb/Imbs69sQydoYq2vveay+TxlBx62f7IQA5oCtw+jNV4pQqw3d5O60WO0DXrA6+w/
 WbVTdrRFloRlZkL40jIw4orqWi6z3ddIO/JENu3Nwvl4EkWtTnMo8A5qDaMeozrQhq
 fhrdsIAs3OQ+Q2R6sVV1uOu9jF1FQt0eUxjzXkwqcO/1Luk1Bf28K8d2iXaSR4/7Bo
 W/YpqxRWr82Yw==
From: Mark Brown <broonie@kernel.org>
To: Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v6 00/10] Add support for CS35L41 in HDA systems
Message-Id: <164096159451.2355590.17653987935012339046.b4-ty@kernel.org>
Date: Fri, 31 Dec 2021 14:39:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 17 Dec 2021 11:56:58 +0000, Lucas Tanure wrote:
> Add support for laptops that have CS35L41 connected to an HDA
> codec by I2S and direct I2C connection to the CPU.
> 
> Laptops that use CS35L41 and are SPI will be added in the future,
> after the support for it is resolved at i2c-multi-instantiate driver.
> i2c-multi-instantiate thread: https://lkml.org/lkml/2021/12/10/557
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: cs35l41: Convert tables to shared source code
        commit: a87d42227cf5614fe0040ddd1fe642c54298b42c
[02/10] ASoC: cs35l41: Move cs35l41_otp_unpack to shared code
        commit: fe120d4cb6f6cd03007239e7c578b8703fe6d336
[03/10] ASoC: cs35l41: Move power initializations to reg_sequence
        commit: 062ce0593315e22aac527389dd6dd4328c49f0fb
[04/10] ASoC: cs35l41: Create shared function for errata patches
        commit: 8b2278604b6de27329ec7ed82ca696c4751111b6
[05/10] ASoC: cs35l41: Create shared function for setting channels
        commit: 3bc3e3da657f17c14df8ae8fab58183407bd7521
[06/10] ASoC: cs35l41: Create shared function for boost configuration
        commit: e8e4fcc047c6e0c5411faeb8cc29aed2e5036a00

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
