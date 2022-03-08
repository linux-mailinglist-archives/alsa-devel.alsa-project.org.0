Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCEE4D1EFE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:24:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E35C1891;
	Tue,  8 Mar 2022 18:24:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E35C1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760299;
	bh=Lg5l+lVaiRIYO+OoxUwg4IcaNNcQpd0IYxoVQ9lTYyc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Opg0GTqxrPqGotipThsOiv142pA4qUDd/Gj8xJXQeEq/UJ3GQqXd47fORa0/nfPuu
	 IaxahnHfyiorg8sGy+gYfDUj2ii3yq5FRHY6BHjlCdPOjKBxoTHRFSEA+CuOK8Gsc3
	 0cO4RjJg0MxllL49zzVUZcpi9bMlo89r0ISgcU7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B99D8F8052E;
	Tue,  8 Mar 2022 18:21:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 590A1F80519; Tue,  8 Mar 2022 18:20:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83DC0F80508
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:20:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83DC0F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P5jpwNri"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64E9061248;
 Tue,  8 Mar 2022 17:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739ACC36AF4;
 Tue,  8 Mar 2022 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760052;
 bh=Lg5l+lVaiRIYO+OoxUwg4IcaNNcQpd0IYxoVQ9lTYyc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P5jpwNriCQnrkXZfgZbGJA+O8dFA/CLORZmFnDVhwGnFmh45csUJUDeISFA2z79zF
 eYOyLl9YBPhKUA6NJwP4XONz2NqEkqipQuCKIIc+LDAQ1M4TBYZ1eDZHkgGqbZJBy9
 c8IG6ilWDCFtSBJQ5Y/3OnUwWWnoV6cXQxYa95+XFbk+R8nkrkKv3DqBKVKp+a/P7M
 fkSLWYTI9jO2Abbxhv5NA/OrN7N1OniOcrx/JRJWrzdhsOUh1TQ30L5e7+xATOQ4Ba
 hX6qC+LhswHYrVob3V9yWC6w26K4NtNEPXDiOa5trmYOAh8BowOC1l7K5EtM5B+W1m
 mH19YylPEprjg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Lianjie Zhang <zhanglianjie@uniontech.com>
In-Reply-To: <20220307151939.32870-1-zhanglianjie@uniontech.com>
References: <20220307151939.32870-1-zhanglianjie@uniontech.com>
Subject: Re: [PATCH v2] ASoC: Intel: catpt: use asoc_substream_to_rtd()
Message-Id: <164676005019.54315.15405377603345473367.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:20:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>
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

On Mon, 7 Mar 2022 23:19:39 +0800, Lianjie Zhang wrote:
> Now we can use asoc_substream_to_rtd() macro,
> let's use it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: use asoc_substream_to_rtd()
      commit: 51996ca26fc7b5dbeea80eddba0e8a4ece6af459

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
