Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C894DB991
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:39:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4706F1860;
	Wed, 16 Mar 2022 21:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4706F1860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463176;
	bh=AG1wtDx7BWSkmwerI9/9JsW5Jg7gueu8xBwV1c9teE0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GxV3Bj2Ni2/4C5tUHhBsgtnH56+vWnyvB7J+lhQi5yKmjaBqURFpeD47Pa6M69ZGi
	 2OYLn+O4baZjl0ImXt7UNqk/F9Tqn2TLDww/QiAXG26sfMcJsdbKbEZkab/3XpoPfE
	 40vEQU4vsq3JKNrM+zG2QJ2HE1nSnIc+iKFM30Lk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A46F80543;
	Wed, 16 Mar 2022 21:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74620F8053C; Wed, 16 Mar 2022 21:36:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79EE2F80538
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79EE2F80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QJX+NWof"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A21DB81D47;
 Wed, 16 Mar 2022 20:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275B9C340E9;
 Wed, 16 Mar 2022 20:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462958;
 bh=AG1wtDx7BWSkmwerI9/9JsW5Jg7gueu8xBwV1c9teE0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=QJX+NWofTH7Ok9sdiFlR8DEYOvBVyM+xeaC/RQfoT8TfaB6Mv3zb3qDz3wDAIeHKL
 obgPL9L6k598FlLUzEfdbY69Fakin3pC11JZrfnY1m9Hh06Sdi/oDmid/W2gTQ1pom
 8NltZFnAnDE0Ijo0Og7zcX/cwDWqgQj42QwhZacmKH1BCVNTVzbMGSHZj+kmzNXZEe
 NcOaSOAXcLYOyJ4SpCIKrwOaiHcUdiXUBaOZMdh4kP3CDs5h309NQ+7t+16+JYfUCS
 AlElBsQdO+nczG01jxfm5IRb/U+xv0Ehgl/Uqvk/nippeGLh0vLd+kYmahV8J76z/v
 5qNfYmk2iuoSA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Miaoqian Lin <linmq006@gmail.com>, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220316083631.14103-1-linmq006@gmail.com>
References: <20220316083631.14103-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: Add missing of_node_put() in
 wcd934x_codec_parse_data
Message-Id: <164746295687.1220201.2304000170447062243.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 16 Mar 2022 08:36:31 +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> This is similar to commit 64b92de9603f
> ("ASoC: wcd9335: fix a leaked reference by adding missing of_node_put")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: Add missing of_node_put() in wcd934x_codec_parse_data
      commit: 9531a631379169d57756b2411178c6238655df88

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
