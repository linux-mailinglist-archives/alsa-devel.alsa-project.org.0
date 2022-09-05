Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCCD5AD6E3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 17:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F95D857;
	Mon,  5 Sep 2022 17:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F95D857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662393076;
	bh=qLG+gfl6NXOiN1sJRiTTTnudslb/lpCs8P99I2VG72E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pe08U5d4Xa23J6HqgygF9hNKR3YSdUI7HKPljSTgY2GPfonnPjmsgtbJJe7KPoed6
	 2D+ZdX5vFW/G4IrewTy19X4x6kAyXt6rSOC89FhjhQ1auHUnRZ0z4+6ngLspACf6lR
	 H1VMoY7u4DJx9DqzXwYPkxQZ6vE1hM8/P/wwJdsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C03CBF800E8;
	Mon,  5 Sep 2022 17:50:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1945DF80238; Mon,  5 Sep 2022 17:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 857E7F800E8
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 17:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857E7F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UAnRCd0O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 073A561329;
 Mon,  5 Sep 2022 15:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3695CC433D6;
 Mon,  5 Sep 2022 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662393011;
 bh=qLG+gfl6NXOiN1sJRiTTTnudslb/lpCs8P99I2VG72E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UAnRCd0Ouphg1HatAZN2aLqLIxt84vYh1H5kpFF30njCC69n22BclB7oaliWbWB8V
 GNdNXUOvCrDPFRUk8nUie3N14Eaa0KpdHbgUiGlgdvGYkyEkXXn0z+F8gXBo1PlDUH
 bJhFN+uTJ8Zn+pUYEoiaXcKIyiQX9L69w/KMVDo+g2ej2nlsNLMYNby9Op9YRMmaRJ
 0KSzH14F2FFXRRS1J/P82ungI+y57iw0tlI9of6axXGyL2HITafdgD/oXHnuO2S230
 X38INZF+INO73jSxbEcdTRY0dr/KwBH1J33BxvZsFItM0d8nVisc37Pzg1M/6o6n5l
 bVb7KoF4bJ1Vg==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220904102840.862395-1-cezary.rojewski@intel.com>
References: <20220904102840.862395-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v6 0/2] lib/string_helpers: Introduce
 parse_int_array_user()
Message-Id: <166239300589.745322.7930709481816524867.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:50:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: andy@kernel.org, pierre-louis.bossart@linux.intel.com,
 intel-poland@eclists.intel.com, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, willy@infradead.org, hdegoede@redhat.com,
 andy.shevchenko@gmail.com, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, yung-chuan.liao@linux.intel.com
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

On Sun, 4 Sep 2022 12:28:38 +0200, Cezary Rojewski wrote:
> Continuation of recent upstream discussion [1] regarding user string
> tokenization.
> 
> First, parse_int_array_user() is introduced to allow for splitting
> specified user string into a sequence of integers. Makes use of
> get_options() internally so the parsing logic is not duplicated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] lib/string_helpers: Introduce parse_int_array_user()
      commit: d2a411f810a0db055f02cc18e5cfa833bb2c9ccc
[2/2] ASoC: SOF: Remove strsplit_u32() and tokenize_input()
      commit: b9163e9b5f14d690752010ee843b2d788c3536f1

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
