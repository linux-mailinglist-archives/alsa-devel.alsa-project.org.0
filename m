Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C95949B13B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 11:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15DB420D4;
	Tue, 25 Jan 2022 11:22:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15DB420D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643106208;
	bh=WQ5zDLwVwwS1ynSOHJWo3a8DI0uSQmuqRVk4pP95Oi8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EagVqDVDJBOivPndfPz/2nvs/352MBRu6pzuUo1beP8FQLZaQp8QfBwktnTglEpuS
	 3EtfTQcrpbJX+vEx2JJrmHtB7LLIVd4hrp8PQtoW0fElnTSqKohWg4RJNqR2ogYoa9
	 Rr+fCBnzxI4Od6l+u3PalE0FXq9SZ5gmxtBzJiUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC297F80536;
	Tue, 25 Jan 2022 11:20:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26099F80527; Tue, 25 Jan 2022 11:20:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D219FF80517
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 11:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D219FF80517
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iZy2JXEY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49077B81753;
 Tue, 25 Jan 2022 10:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE9CC340E0;
 Tue, 25 Jan 2022 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643106026;
 bh=WQ5zDLwVwwS1ynSOHJWo3a8DI0uSQmuqRVk4pP95Oi8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iZy2JXEYkKApBCD2hhPXk8EjIaamFY3tj58S67dzym4UmfRLu+joXr3GGhpaeC4iw
 JbI1QsZRmsQ7C7VONB7YREoh+knaPAZOzuOmC8utuTgCf8bWZNlaZloWk7PVZ6yN8e
 wlT0Bk4j4t5PHsZWQWx+rofNHNf/x8pX+kAnJPYvhsuDRL5k4SdtXCOr3hpFLwalli
 3CsdXQHy7GfFaoghuW0y4KSwa/7tOSRPcXf+x1yXXgnFkioHfsO7FbK1SZvoEY7O4a
 5TNME0d6YOUm/gNUN1Jhik90TzSeXdngj7XxjM87dYZ7DkjtAj16DTAqRd9DjtzC2S
 TK4B1Fw+gsFNw==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski@canonical.com, cgel.zte@gmail.com
In-Reply-To: <20220117110357.863990-1-chi.minghao@zte.com.cn>
References: <20220117110357.863990-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] sound/soc/samsung: remove unneeded ret variable
Message-Id: <164310602383.74844.16089601402972484181.b4-ty@kernel.org>
Date: Tue, 25 Jan 2022 10:20:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com, lgirdwood@gmail.com,
 Minghao Chi <chi.minghao@zte.com.cn>
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

On Mon, 17 Jan 2022 11:03:57 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return value from io_remap_pfn_range() directly instead
> of taking this in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound/soc/samsung: remove unneeded ret variable
      commit: de531908ca4251918f3aff4b21440a8f7b96b0b7

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
