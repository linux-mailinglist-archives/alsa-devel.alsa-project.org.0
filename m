Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5564F298F
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1433D1877;
	Tue,  5 Apr 2022 11:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1433D1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151504;
	bh=Uqt4Rvg63aRdj9hZ0vXZpJjI/ZA6EwWuIDLv54bOxwo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzXHINxs1bE6fCi4QnSplmT00kRvL0jkS1K41/B1B1FxPgR9yFdv5Lzcs6LKAMUqk
	 SG1WCtPkplpwqUtppJBvHMIV50y4lG2IfzTHFNoh6GrKFpIOIgxx7GWNVC1XVKZXPr
	 ExzTVWDJCpuVbLDoyeGYs5yYxpRN7s1Gq1M4HhGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C45AF805CA;
	Tue,  5 Apr 2022 11:32:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76918F805B6; Tue,  5 Apr 2022 11:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63818F805B6
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63818F805B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n36vOthX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42EA5616D7;
 Tue,  5 Apr 2022 09:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C92C385A3;
 Tue,  5 Apr 2022 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151114;
 bh=Uqt4Rvg63aRdj9hZ0vXZpJjI/ZA6EwWuIDLv54bOxwo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n36vOthXHLgBR8U70GkSdWRXUPZFWLhaRMeE3ILrsNnW5h3OafWHu93Wy/AsNC2U6
 l+txKfz2aN2JQw5HqWS9snn9+wIGbK2n7DV4QmnsULkM4ZE7TaxkNrL8KwqZ1NnsCx
 fSv1g/3uJh+1swLEUBStio3W6YBoU3njTpt3ITtyPkD+hUBalr+tK9SDK5v1CCmk4Y
 Mw5vOPZILCIlXFnGCZNvj29YK3zp8k5fV8EbT6/kZ8IWQCahclIQfEgtTfh+eSMA3u
 F7XaFfVFf+WE+Q69jAwtmyuksgdVjYxKRY0rZoEMKmMonmEHWk/TGa90gxd3DYrJFz
 cqp+Jjh+fiKRg==
From: Mark Brown <broonie@kernel.org>
To: ALSA development <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20220329120039.2394138-1-perex@perex.cz>
References: <20220329120039.2394138-1-perex@perex.cz>
Subject: Re: [PATCH v2] ASoC: SOF: topology: use new sound control LED layer
Message-Id: <164915111301.276574.1983288641297607846.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Tue, 29 Mar 2022 14:00:39 +0200, Jaroslav Kysela wrote:
> Use the new sound control LED layer instead the direct ledtrig_audio_set()
> call - see 22d8de62f11b ("ALSA: control - add generic LED trigger module
> as the new control layer").
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: use new sound control LED layer
      commit: 9b014266ef8ad0159b39920a752f191bcd6f356c

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
