Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2236308936
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 14:00:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CE886E;
	Fri, 29 Jan 2021 14:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CE886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611925253;
	bh=YW/XI4VLO37R+uMPlnd1P4RxQ0aVbZJZspdFGkUsfIg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PHeut3u2FXXI8EHSUbnRtpNd8UaOPmma5mg6Vt7dEdCuxLNEGZKbxyXSOe6yWo407
	 bJtDzBo04uCZdusFzs9ud/h9ZE5OHIe7N6AcTexYZCrWiOcEfiPncr1s0jsPTFk4Tb
	 ji0N0gosaEwe+QygnXxAwuF/VUTRj7f7Csf7kk2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8955F8025F;
	Fri, 29 Jan 2021 13:59:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD577F80259; Fri, 29 Jan 2021 13:59:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DB22F80130
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 13:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB22F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZdMYAv2J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BE8F64DBD;
 Fri, 29 Jan 2021 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611925151;
 bh=YW/XI4VLO37R+uMPlnd1P4RxQ0aVbZJZspdFGkUsfIg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZdMYAv2J+oUCCjQ5eT9NsXhiI3ThW63rNEmFwXxoQszVsCJf02HKU4CN3DwywM937
 Cw8u+JIS2CLATVo4sj5BAymeFf/fPF2I4J3HbnlXMdoxS3rMaCCqmAsSa1eXadfPMN
 Wr1n/w7yUDDnjtdDdLYliQw6GakqcMmSZ6L5s9GfWyPdi4XRQ1MXsMAQtRVn2zrrKa
 yEt4n6GXiCQ4JktsPi4V0Jvx3JfS+a1+Z7tE2BOA5GzDfayJP82JGBx1QUcQNcIl2E
 7KpdVzzIEmLy8hgy7IEKjtd3PdQhIS7i8qgJYdoMGEJzwBsEqcImzl0NsmzC+TJT67
 i80gF+E7ijt2g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210129100539.23459-1-srinivas.kandagatla@linaro.org>
References: <20210129100539.23459-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: soc-component: fix undefined reference to __ffssi2
Message-Id: <161192510715.37004.11597322530426943391.b4-ty@kernel.org>
Date: Fri, 29 Jan 2021 12:58:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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

On Fri, 29 Jan 2021 10:05:39 +0000, Srinivas Kandagatla wrote:
> microblaze-linux-gcc (GCC) 9.3.0 complains about missing __ffssi2
> symbol while using __builtin_ffs at runtime.
> 
> This is because arch/h8300 is compiled with -fno-builtin option.
> 
> so fallback and use kernel ffs() instead to all the arch builds happy!

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-component: fix undefined reference to __ffssi2
      commit: 8ac9e476b86851c94e0f33bea758e0a00e3f875e

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
