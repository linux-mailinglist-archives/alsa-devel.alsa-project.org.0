Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF2340D38
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 19:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792E385D;
	Thu, 18 Mar 2021 19:37:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792E385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616092725;
	bh=wr6Q6HZlXVnrsvtuBWNvxU1f0G1sRfiETnfGyiruHHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hyg4iBlhXeDGA/IgOhqNHhAiga1P0jjGYg6I6vIKT3/XF9YmfawSCT69oh4mgZCxP
	 tHtFTgBpbAwO9vOZc8Ta5KxDpoE5kjDwrFHerZi5DMMerEUFhbtr19hpumIaGmdkzh
	 rH72DVP9zUMCRgqvNtXshJdzAiSMQ+nfOLMjfRJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3382FF80482;
	Thu, 18 Mar 2021 19:36:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B258F80425; Thu, 18 Mar 2021 19:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85437F800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 19:36:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85437F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oGCu4tBQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A585664F1B;
 Thu, 18 Mar 2021 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616092586;
 bh=wr6Q6HZlXVnrsvtuBWNvxU1f0G1sRfiETnfGyiruHHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oGCu4tBQOHmvRwv/HU6Dh19XQUZDGKUlQm6VVm2fPvFPoXw6GcUmPCFsp/GsHgJwj
 d7Huhwe/jSsuYByelgdo5WWzL/o8QuwV789+Jtmsf0nWlslfrGmpl865DeMaEQTcFp
 sVKe9AJlIdDF5ZERJ8hEvsH56Ac2UfTO+sogVMhezNKR7+ocSEFvYA41ho3C/Lxgqx
 5SLU42N9i0sZY3rKjKURkua4hkgecTAEyxMv/Ng1YR3Io009vVP9cnmE1Oq2CcfjJf
 t0koZKMThl0TPipO8vmRvnt4t4VSQ5/Y7cG6dnEhKCRC9t3/Urho011Lo0QcxqyaG8
 TjeDNaJKqu3cA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: devicetree: bindings: sound: Fix a typo in the file
 rt5682.txt
Date: Thu, 18 Mar 2021 18:36:06 +0000
Message-Id: <161609213719.41838.12776145581293380370.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210313231850.17278-1-unixbhaskar@gmail.com>
References: <20210313231850.17278-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, rdunlap@infradead.org
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

On Sun, 14 Mar 2021 04:48:50 +0530, Bhaskar Chowdhury wrote:
> s/drving/driving/

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] docs: devicetree: bindings: sound: Fix a typo in the file rt5682.txt
      commit: 8dd855334736f275e9de71096d816c8d9da46bf7

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
