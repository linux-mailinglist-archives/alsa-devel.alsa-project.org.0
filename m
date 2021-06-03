Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FD399E3A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 11:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2252216F7;
	Thu,  3 Jun 2021 11:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2252216F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622714279;
	bh=4TVdLqCYVtS2itMf7J25AxarDd3UIUhTCdM3TjsKi3s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ex5sKDy3H66qKKAyNMoQLCfsQj3hy7CeA2keNw9umfWOhlEOLfKJK0gnV+QawAJfd
	 RGAReTIvjcYtXhb7wx029VA9LYpfwdRj1hG1IZ1C4mqd22AvbcKwtGmu/Jp4uwY1b1
	 Ps9hSHIZbFQW/f7oFC1Qoo9cCQOiQrwm62/NGqpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7645BF8025B;
	Thu,  3 Jun 2021 11:56:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393D6F80254; Thu,  3 Jun 2021 11:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 412ECF80100
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 11:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 412ECF80100
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lok5L-0004PQ-Ne; Thu, 03 Jun 2021 11:56:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: alsa-devel@alsa-project.org,
	Chris Morgan <macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH v12 0/4] ASoC: codecs: add rk817 support
Date: Thu,  3 Jun 2021 11:56:17 +0200
Message-Id: <162271417225.3165003.1198477663030831596.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210519203754.27184-1-macroalpha82@gmail.com>
References: <20210519203754.27184-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

On Wed, 19 May 2021 15:37:50 -0500, Chris Morgan wrote:
> This series is to add support for the Rockchip rk817 audio codec which
> is present in all Rockchip rk817 MFD chips.
> 
> Changes in v12:
>  - Updated codec cell in MFD driver to a single line.
> Changes in v11:
>  - Stopped checking for presence of parent node in codec driver, as
>    driver should never be called if parent device doesn't exist to call
>    it.
>  - Made codec subnode optional and stopped returning errors if it is
>    missing.
>  - Downgraded missing codec clock message from dev_err to dev_dbg.
>    Users who choose to use the rk817 PMIC but do not choose to use the
>    codec will not get an error message unless they have debugging
>    enabled, whereas users who wish to use the codec but don't have the
>    clock defined will not get an error message unless they have
>    debug messages enabled. This seems like a fair compromise between
>    mututally exclusive users. Note that errors with the clock or codec
>    will still result in a dev_err.
>  - Updated DT documentation to note that codec subnode is optional if
>    no properties are to exist beneath it.
> Changes in v10:
>  - Correct order of test/ack/signed-off to chronological order.
>  - Removed ifdef from mfd driver keep cell from being added when the
>    codec was not to be built.
>  - Changed codec DT parsing messages from error to debug to prevent
>    errors in dmesg log in the rare but valid case a user has the rk817
>    PMIC but does not use the codec.
> Changes in v9:
>  - Add cover letter.
>  - Remove documentation for interrupt parent per Rob Herring's request.
>  - Remove unused MODULE_DEVICE_TABLE to fix a bug identified by kernel test
>    robot.
> Changes in v8:
>  - Added additional documentation for missing properties of
>    #sound-dai-cells, interrupt-parent, and wakeup-source for mfd
>    documentation.
>  - Corrected order of elements descriptions in device tree documentation.
>  - Changed name of "mic-in-differential" to
>    "rockchip,mic-in-differential".
>  - Changed name of sound card from "rockchip,rk817-codec" to "Analog".
>  - Removed unused resets and reset-names from the i2s1_2ch node.
> Changes in v7:
>  - Removed ifdef around register definitions for MFD.
>  - Replaced codec documentation with updates to MFD documentation.
>  - Reordered elements in example to comply with upstream rules.
>  - Added binding update back for Odroid Go Advance as requested.
>  - Submitting patches from gmail now.
> Changes in v6:
>  - Included additional project maintainers for correct subsystems.
>  - Removed unneeded compatible from DT documentation.
>  - Removed binding update for Odroid Go Advance (will do in separate
>    series).
> Changes in v5:
>  - Move register definitions from rk817_codec.h to main rk808.h register
>    definitions.
>  - Add volatile register for codec bits.
>  - Add default values for codec bits.
>  - Removed of_compatible from mtd driver (not necessary).
>  - Switched to using parent regmap instead of private regmap for codec.
> Changes in v4:
>  - Created set_pll() call.
>  - Created user visible gain control in mic.
>  - Check for return value of clk_prepare_enable().
>  - Removed duplicate clk_prepare_enable().
>  - Split DT documentation to separate commit.
> Changes in v3:
>  - Use DAPM macros to set audio path.
>  - Updated devicetree binding (as every rk817 has this codec chip).
>  - Changed documentation to yaml format.
>  - Split MFD changes to separate commit.
> Changes in v2:
>  - Fixed audio path registers to solve some bugs.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: add rk817 codec to Odroid Go
      commit: 18d5c7bf50c6d820c366c2a23d71d468b14c87d6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
