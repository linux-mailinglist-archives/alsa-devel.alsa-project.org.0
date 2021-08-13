Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B333EBB7A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 19:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC7F1887;
	Fri, 13 Aug 2021 19:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC7F1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628875733;
	bh=g0u5xuIwlbndrt3NBTxfX3qA3PDNBcMigkpyLBKohp0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWHNfm/0iYIv1ka1pSS/Pk6mp3CLdbSVflsmO0E3j5NgYo6UQfLdRanzuhzJzx7Ra
	 iA4OMQj4/0UE4j8m+zxPy+bk28XiBq+dm50lHAifuJMHktPWQ5ILPJgGoMI+GG/qQ9
	 8y7Q35PxbEZg8dsySh54+wW+ZOUFH5qPTwYCk4pM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45ED8F804E1;
	Fri, 13 Aug 2021 19:26:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14354F802D2; Fri, 13 Aug 2021 19:26:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B49F1F800AF
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 19:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B49F1F800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ggLMQR/A"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE53D60F36;
 Fri, 13 Aug 2021 17:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628875588;
 bh=g0u5xuIwlbndrt3NBTxfX3qA3PDNBcMigkpyLBKohp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ggLMQR/AUonYNRarxEV87X8y9gm/9UNY5AjWoshzw2LIM+18sAoz8eZuLiteWHN0y
 W3uKVREkE3ccfIeIlQtnxJEpzrnRHT5ldHYBtDtBXZR1MpxsFH5H2PzEkjZeqK60Pz
 uyIhvHQ1b9NAAtQgmpCyBnylcuRzMKTGzY5pJoSdoiklIYvzU0kjf1M8EvYCfBSA26
 Hu6e67mJ2YL86aODvotSKCD4FzSntmdAoJQgRJPuENukFUkfLjVwwjRWi4Dd8aintG
 ZhktwsKB8wTDZlg0j3o6ZmwIQvdZ45HbflpJytHszDrfoYMVq6EEeazD7cRMIuWRpH
 9xVKzrIRSbIYQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 0/8] ASoC: Intel: boards: use software node API
Date: Fri, 13 Aug 2021 18:26:01 +0100
Message-Id: <162887455325.19744.17516860614733384686.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813151116.23931-1-pierre-louis.bossart@linux.intel.com>
References: <20210813151116.23931-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Hans de Goede <hdegoede@redhat.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Fri, 13 Aug 2021 10:11:08 -0500, Pierre-Louis Bossart wrote:
> This is an update on an earlier contribution from Heikki Krogerus
> 
> The function device_add_properties() is going to be removed.
> Replacing it with software node API equivalents.
> 
> Thanks for Hans de Goede and Andy Shevchenko for their comments,
> suggestions and Reviewed-by tags on GitHub. The review thread can be
> found at https://github.com/thesofproject/linux/pull/3041)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: Intel: boards: harden codec property handling
      commit: c50f126b3c9ebb77585838726a3a490ad33b92cd
[2/8] ASoC: Intel: boards: handle errors with acpi_dev_get_first_match_dev()
      commit: 69efe3b834c0803d170ec8957021543963868e63
[3/8] ASoC: Intel: boards: get codec device with ACPI instead of bus search
      commit: d3409eb20d3ed7d9e021cd13243e9e63255a315f
[4/8] ASoC: Intel: sof_sdw: pass card information to init/exit functions
      commit: cdf99c9ab72161885d8670723a21699a384a5dbe
[5/8] ASoC: Intel: sof_sdw_rt711*: keep codec device reference until remove
      commit: 82027585fce0c5e78e666cfbd0066fe3c80070dd
[6/8] ASoC: Intel: use software node API in SoundWire machines
      commit: e5a292d39466ca1f45e185be713616f9389e6a4e
[7/8] ASoC: Intel: remove device_properties for Atom boards
      commit: f1f8a9615451ec3762a45b6985e072c44a995a45
[8/8] ASoC: Intel: boards: use software node API in Atom boards
      commit: 0bd3c071e6e7e140c8b39caab99b3b6f05cb5290

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
