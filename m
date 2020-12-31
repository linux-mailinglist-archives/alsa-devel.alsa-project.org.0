Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1E52E802F
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 14:30:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 743931705;
	Thu, 31 Dec 2020 14:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 743931705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609421446;
	bh=syL2yE+tntkgSTyF3VynGhZ4nc47tn0RNbecRMAL9Lw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jtgnI5DG5ijKTTyQuGJzEhHnyDreyJdCebhs5eRICzukchchpS9MqJz9j4Qy3Rqw+
	 4b0ZM2PW8ybcYhOsS/YiUzWArpxUwM8vki0UywI85ylw3X+P4Tv8n/PhmnECWbS2LB
	 NJMLvwY+dgSxxUN06pycDXbZYqlEn9fYxAFyCgOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C951F80475;
	Thu, 31 Dec 2020 14:29:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7CD1F8022D; Thu, 31 Dec 2020 14:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C9CFF8015F
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 14:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C9CFF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L4C9cJmW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18AD920786;
 Thu, 31 Dec 2020 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609421327;
 bh=syL2yE+tntkgSTyF3VynGhZ4nc47tn0RNbecRMAL9Lw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L4C9cJmWb/chfLXI+nTycET9UKhRkQSULtLDvLGfLATu2F1WBDAuE5T9RMjBYQIvT
 7H0mICW3ug4nxp0WpCcRjuyDd2+0aWsrz+bDYGN8pB6jtw1ZjO0orEAqsl/QGl0iA9
 FugQ5FbOcLTzJhTBzTxh8s8Oi2GKywF52cR5x/FrqDseA7Bz28HhuRVchk0zjY3XjB
 WJIdV9jyrm5MRQkJUeatEa2E0hPjhW8MERINOFcTKxBNsT3iAZo0sOuHVAEH6yJzE3
 Qa5CgopQb73dVyJT655MnlROEVn5q4z//H+LyhEkEIuCKEl+Ckv4E9oZPlwznOBP17
 YFBQxxENniR9A==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20201230172427.13865-1-rf@opensource.cirrus.com>
References: <20201230172427.13865-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: wm_adsp: Only use __be32 for big-endian data
Message-Id: <160942130384.56416.4203389160143679656.b4-ty@kernel.org>
Date: Thu, 31 Dec 2020 13:28:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 30 Dec 2020 17:24:26 +0000, Richard Fitzgerald wrote:
> This fixes some minor cases where u32 or unsigned int types were used
> to store big-endian data, and __be32 types used to store both big-endian
> and cpu-endian data. This was producing sparse warnings.
> 
> Most cases resulted from using the same variable to hold the big-endian
> value and its converted cpu-endian value. These can be simply fixed by
> introducing another local variable, or avoiding storing the intermediate
> value back into the original variable.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wm_adsp: Only use __be32 for big-endian data
      commit: a0b653e89a3afd2a833f23589a83488fac842ddb
[2/2] ASoC: wm_adsp: Use snd_ctl_elem_type_t for control types
      commit: f6212e0ab3ff28d4e2e53a520496a052c241df39

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
