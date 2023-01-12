Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A39F566732C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 14:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D5883F5;
	Thu, 12 Jan 2023 14:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D5883F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673530181;
	bh=16fVlm5BEAXD2CaeGyhk5GUo/dMIEWz6Tu0bVYGVjX4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AzzQcdNxjugxWNGT/DPHYOPHowESNepFl+1OgcWfNYnSGgoFYwkX9L6Wr6obt3JWU
	 rl0BqP5lnlBE21wL6PX7C9v9bsHM1xtrfKGVKeygmBKZtrkOGY+Z0UKaghVbzyLPiq
	 3eRuKMSvKbcpYtoln5bQwd0J0NAsFwxaIkZ4hDs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5A0AF8019B;
	Thu, 12 Jan 2023 14:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C55FF804C1; Thu, 12 Jan 2023 14:28:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FD81F8013D
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 14:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD81F8013D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q94/u+zs
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F33BB81DD9;
 Thu, 12 Jan 2023 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF8DC433D2;
 Thu, 12 Jan 2023 13:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673530110;
 bh=16fVlm5BEAXD2CaeGyhk5GUo/dMIEWz6Tu0bVYGVjX4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q94/u+zsIoRkMd+xoxUb25mks//iSKp3tt80MbmErAsiQAVksVIELpzMsnCQltIxu
 j0eCBiQNs2v1G9glvQlPFWj+yareBn3YdDd5Q1cAdhHu6afGWsPhbq97gzGpQ5pJKh
 ajquGxrW78RPx+Bfc3lhiW2oNMDRsQfNFS9OiJUNyeXpfErHW8luOgu7cMg5kbvJOh
 Jbl67UWH0fY7X8KGAOp0FwqKsXDim6CP/BhxEUiiSW2PBzH5XCItQDxnRZln4/pnKy
 EwBM3XvqojU6FJS1TQM2amiI2FcTPxgz3qp1ZC3wUxPCAbMKryTGoYbm2afWcFrB9K
 hePRIRAlt+prQ==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112112356.67643-1-andriy.shevchenko@linux.intel.com>
References: <20230112112356.67643-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ASoC: amd: acp-es8336: Drop reference count of
 ACPI device after use
Message-Id: <167353010930.1918645.13522071123192979685.b4-ty@kernel.org>
Date: Thu, 12 Jan 2023 13:28:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 12 Jan 2023 13:23:56 +0200, Andy Shevchenko wrote:
> Theoretically the device might gone if its reference count drops to 0.
> This might be the case when we try to find the first physical node of
> the ACPI device. We need to keep reference to it until we get a result
> of the above mentioned call. Refactor the code to drop the reference
> count at the correct place.
> 
> While at it, move to acpi_dev_put() as symmetrical call to the
> acpi_dev_get_first_match_dev().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp-es8336: Drop reference count of ACPI device after use
      commit: d784fc8be6814b31854f7b529919ca4506ff8066

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
