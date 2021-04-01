Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E62351343
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Apr 2021 12:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF8C16B6;
	Thu,  1 Apr 2021 12:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF8C16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617272383;
	bh=/jx/jQje8kkrqXjx7RDy/j90nb/SyqP/To3rfuqgLRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TcPqkj5ffs08JRV12ctSetQR+Jig/Oerjr6GCMewo60z7986o53BOx3hSWJUbQSZO
	 hN/d0urCIXzgKVDDbYp6W4JHhBmTPd13oAEA2/wMr0A5LLjPpBbJv0CCLLAEYnGZtF
	 IObWCeRcSv33D7BnAMvjfAzY++FL1vHIxeuraPkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C52E4F8042F;
	Thu,  1 Apr 2021 12:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABC2CF80425; Thu,  1 Apr 2021 12:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D935DF8013C
 for <alsa-devel@alsa-project.org>; Thu,  1 Apr 2021 12:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D935DF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Eacqhlpb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C023610A5;
 Thu,  1 Apr 2021 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272220;
 bh=/jx/jQje8kkrqXjx7RDy/j90nb/SyqP/To3rfuqgLRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EacqhlpbFRD8tiLhUf3EBRi8BL3pSQsYZP4uO0NUsCbH7hNwKiN4h+EwQUwiLX9I6
 3uUeZ9WZinW9kPKN3kmD4uErSHQfuRxTNZJasfIkVg8/UPNe9JZ6QpZbIAWq6AuWEv
 foHXsC7yNXxmnhc7Ewn7UEZlLRLAOlg9tCj1VUU7+aI0Z5LLk5s2lK2gxgRDMPbPR1
 bQvazsZq3EGhCCSl3dlT86VpG3oPBc8JmJycBeV7SdPvrq4v9IjIJYojI57kD//YlI
 6Lla4hBTNNaRwDEBm0AyIKljMX6leB+RH0UWkFsublfyHZLuLCI7QCOGc2HWbJ/OBa
 3mFqkk1ozhpvA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 1/2] ASoC: ak5558: Add support for ak5552
Date: Thu,  1 Apr 2021 11:16:19 +0100
Message-Id: <161726938994.2219.919053802022134922.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1617176686-25528-1-git-send-email-shengjiu.wang@nxp.com>
References: <1617176686-25528-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Wed, 31 Mar 2021 15:44:45 +0800, Shengjiu Wang wrote:
> AK5552 is a 32-bit 2ch ADC and has the same register
> map as AK5558.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: ak5558: Add support for ak5552
      commit: d8c5c82e4e5b641404c65bfc6cdf57b5d0a6c836
[2/2] ASoC: dt-bindings: ak5558: Add compatible string for ak5552
      commit: 8d246806d510c1bf7da9aab0473dc0f9c9f99308

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
