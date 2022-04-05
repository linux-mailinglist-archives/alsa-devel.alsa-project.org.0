Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A94F298C
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 11:37:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E09DA185C;
	Tue,  5 Apr 2022 11:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E09DA185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649151452;
	bh=zT3irbGVt3X2Et8+vyXx6aZg/vZcNg0U56oJku84TFQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FLRrQmilkbDu5M1Ce961HSIdHZLtuJNKbbn0iiuXuvuVc6dyor47p81GZjDCPesJr
	 R4ZoMxnv/f3fMh67PlQAezVf+c4DVOgM15RbU3jBETj/QjaMmgQN4eDaHJNa1PZm5U
	 3Y4orrICC6P2X48lC40CCFWuZ35UW/oU9GGwaBW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4090AF805BB;
	Tue,  5 Apr 2022 11:31:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDD6BF805B2; Tue,  5 Apr 2022 11:31:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26216F805A1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 11:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26216F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fMuWo0ZP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A7D9FB81CBF;
 Tue,  5 Apr 2022 09:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A4CC385A0;
 Tue,  5 Apr 2022 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649151107;
 bh=zT3irbGVt3X2Et8+vyXx6aZg/vZcNg0U56oJku84TFQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fMuWo0ZPlANVzGu5ppJQecXaqhpBpe3Ree39VRgMJUXfLsZcnlWZYn4Bb6JdZzEt6
 kfkkCbgXpZBizbqONNyDQgreSvyQYUCLkzlWARPDRG8JoqrGilHIn4h7APVsQ2ePTB
 KIybPbxVXq8FkDoNnU+DH07tgj+E1L/cjetl9t8910rALz8YrkXpWLX+corUg6AYga
 6/DMSzjY0UeSFx/AeONqJh0dQHy2ZA7Ah1jIf0QWepnhvAsJQKuUmsjD18he4ZFV5M
 Z4hgI7SRU41//csuz/06aQ8w1ET2X5HwjlShDbUUQH/H396oJCgv5pECOlphfzu0Tj
 ruzsbMq413xMA==
From: Mark Brown <broonie@kernel.org>
To: jaska.uimonen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com
In-Reply-To: <20220331114957.519-1-peter.ujfalusi@linux.intel.com>
References: <20220331114957.519-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Correct error handling in
 soc_tplg_dapm_widget_create()
Message-Id: <164915110588.276574.4721484381493432444.b4-ty@kernel.org>
Date: Tue, 05 Apr 2022 10:31:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com
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

On Thu, 31 Mar 2022 14:49:57 +0300, Peter Ujfalusi wrote:
> Academic correction of error handling:
> In case the allocation of kc or kcontrol_type fails the correct label to
> jump is hdr_err since the template.sname has been also allocated at this
> point.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Correct error handling in soc_tplg_dapm_widget_create()
      commit: 9c363532413cda3e2c6dfa10e5cca7cd221877a0

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
