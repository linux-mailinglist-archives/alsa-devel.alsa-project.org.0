Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81154656A60
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0784A73C9;
	Tue, 27 Dec 2022 13:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0784A73C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142562;
	bh=+2qKv3WbUaHawZcISN3in0nPAywpWI8Aax5DXjnieW8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bzztxgqgljV9Yj3dHNggTAWYnZYOFyyZwf9cWO09WKklE3KfslzEl/6hJm3pq5VGh
	 B92niwD7fjvE/bl7dDbSdrQuiJOnQNJGefJLooMoJQdxJBitjxDTbMq44ZcjgwfuvE
	 3W2RjAhz7yGubhxRUZrwoNywTZ25k/cQFJocdtT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E0BF805D2;
	Tue, 27 Dec 2022 12:57:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84A8FF805C0; Tue, 27 Dec 2022 12:57:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 158F0F805BE
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 158F0F805BE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uNhz+hSq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AE86FB80FA7;
 Tue, 27 Dec 2022 11:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40253C433F0;
 Tue, 27 Dec 2022 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142254;
 bh=+2qKv3WbUaHawZcISN3in0nPAywpWI8Aax5DXjnieW8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uNhz+hSqJ/HgrrHYcBT/H/W/ivBLKU744SapG58u/RdodbnRXfWEj9qqTBcc2Zztl
 94lXbTyd0XxZKtFJS9LImsuCaAunrNQw0/2W+9e2x1MO5n2VeSzzh84Pd0vFRqCjDs
 kwNnwOie0EPXpZPoN3dqubYSvquNjm65PZUh0QCKF63ErzR1Is0WkjqyDPNNSZtqaT
 ZvuPYrG5YjZKPJzLvO7ZDXX2Xhllz4FspcPBmEID/4DhXEFfiYTV25C6oInC36TRu3
 rX5+nuV3WCXOHrQTDTvY5PGfjJ7TwjoGB1/1kecR9imUUCZVw0Z1sBMeIxCn1S2vHm
 w+I4MeCu/t3eQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20221221145216.11400-1-j-luthra@ti.com>
References: <20221221145216.11400-1-j-luthra@ti.com>
Subject: Re: [PATCH v4] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Message-Id: <167214225297.82924.10955715874674840625.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 21 Dec 2022 20:22:16 +0530, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> The following properties are still found in some old dts files, but will
> be ignored by the driver:
> - adc-settle-ms
> - assigned-clock-parents, assigned-clock-rates, assigned-clocks
> - port
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: sound: tlv320aic3x: Convert to dtschema
      commit: b66cd83547dabc0ba582e2de716c20c810a21124

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
