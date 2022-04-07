Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A734F7BE1
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 11:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5140317DE;
	Thu,  7 Apr 2022 11:38:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5140317DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649324385;
	bh=DBVPDeXzBmVGG7sCJooAh/+/TXjuIyVnZzS709sXv0k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vknK7lzbThX9+t7W+V/HWLqOEUKK5KV5Ry4fOKRbXJ0vMlQQGHTlJCJg70obrJL+G
	 jJJOJ+Er+aUEU2IKsrx5Qc12/me19G1f14vJEDVUvF+ArvTMw8q/8Xp9ACEJjOIiaa
	 Yoa1lUaAje4jPmWcl9GPgo7nj4XsaxF+LgjgP5EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16C06F804CF;
	Thu,  7 Apr 2022 11:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75A1DF8012A; Thu,  7 Apr 2022 11:38:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F35DAF8012A;
 Thu,  7 Apr 2022 11:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F35DAF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FC8EznJV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3E62B826EB;
 Thu,  7 Apr 2022 09:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF752C385A6;
 Thu,  7 Apr 2022 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649324298;
 bh=DBVPDeXzBmVGG7sCJooAh/+/TXjuIyVnZzS709sXv0k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FC8EznJV7DIJKY83ZM9tbkumPwbYbTlynB0GwArqrleGuh+m/lerRYg1N8NhKVClG
 Pb0JWJFdQ+R2ak82F2gAvUqUoKGSui66C98vofau+fhHyA33s/A0YmvyvuaO4liTKj
 u/w7L080zELv3f/4A0/7FCRpSf64HXByC3X49PbrpNy2h0ktMcXXl41hR7Y5kSG9lW
 6uf6kjyfvEcoJpoJJ0mphVQ/R/UKjydf0aK7yd3yeGzLCu4ggO4ssc06IPUqLbJNKP
 Vl8YErfjIvl/bcrYua0iYPpP7Sy0kDxRcO61+z6gse5BuF4mmyAsrA2klIyyzVIXo/
 CyDVx8C8ZmeQA==
From: Mark Brown <broonie@kernel.org>
To: ajye.huang@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
References: <20220324084708.2009375-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v1] ASoC: Intel: sof_rt5682: Add support for max98360a
 speaker amp on SSP2
Message-Id: <164932429462.3844153.4809967512345990079.b4-ty@kernel.org>
Date: Thu, 07 Apr 2022 10:38:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ajye_huang@compal.corp-partner.google.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, cezary.rojewski@intel.com,
 Takashi Iwai <tiwai@suse.com>, yang.jie@linux.intel.com,
 ranjani.sridharan@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, yong.zhi@intel.com, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com, vamshi.krishna.gopal@intel.com,
 sound-open-firmware@alsa-project.org
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

On Thu, 24 Mar 2022 16:47:08 +0800, Ajye Huang wrote:
> Follow Intel's design to replace max98360a amp SSP2 reather than SSP1
> by judging DMI_OEM_STRING in sof_rt5682_quirk_table struct.
> And reusing max98357's topology since DAI setting could be leveraged.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: Add support for max98360a speaker amp on SSP2
      commit: fcd1e39cca6e3a262f2badfcd5edd76c910ad3bc

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
