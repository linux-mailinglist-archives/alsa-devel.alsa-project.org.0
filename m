Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FB1772FFD
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 21:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA2F686F;
	Mon,  7 Aug 2023 21:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA2F686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691438195;
	bh=goD4ByHBwqYYj95qYjcyojZaR3O2ZOeLLA0qA84L1/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPmVLMhp8DgQQQ8m0Q8RY1Mh85bDmJ1AbAn7ufcykQ2OMVfY13Q26ZoSPfoLgMBdB
	 GmhexKrbJvcEnlcgHSDkdsY6mG8RsSAcqBYe9KMDLRezlW4t+Zb04qu/lKlq000Fio
	 6PIczkaSuHuuwDzUgghPP0iZp/zNKZA/eTyfe7s8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61323F80587; Mon,  7 Aug 2023 21:54:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F6D8F8057A;
	Mon,  7 Aug 2023 21:54:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07846F80552; Mon,  7 Aug 2023 21:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA48FF8016B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 21:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA48FF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gKDmeHJL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77403620E8;
	Mon,  7 Aug 2023 19:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B35C433CA;
	Mon,  7 Aug 2023 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691438064;
	bh=goD4ByHBwqYYj95qYjcyojZaR3O2ZOeLLA0qA84L1/g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gKDmeHJLYLRWhrUN+ij6zHFu8nms8fGCHuVCCQfBknWtTUEZilPDyTd2R4FCFC6tb
	 hdY4A9xchWr7URRVpyq1Ro2ScGT4uV2QLvhzGIL3kcSvpBKJrX/LxjyaRMz0GjIAOp
	 Gsd3MK7clyj1+mr1BDXfLI3k/V1ZLanIs/qakqSciL2is7KMBrenBzkHYrGAWXRFZX
	 m1HtKBcclCTKKBZp5hK2M0VLTlBcWAWNuZd90HXNVdTU4wxQCUaKsEHcTIiMKNsArN
	 tFrFXBE1YLIiQeOqVmuWlxJCBB6naofyFzZA7fZpOcMud7Imv1LnkLowi6j7fNpMJ2
	 /0kmGMgK9tkNQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, rf@opensource.cirrus.com, shumingf@realtek.com,
 herve.codina@bootlin.com, 13916275206@139.com, ryans.lee@analog.com,
 ckeepax@opensource.cirrus.com, sebastian.reichel@collabora.com,
 ajye_huang@compal.corp-partner.google.com, povik+lin@cutebit.org,
 yijiangtao@awinic.com, trix@redhat.com, colin.i.king@gmail.com,
 liweilei@awinic.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 wangweidong.a@awinic.com
Cc: zhangjianming@awinic.com
In-Reply-To: <20230804114749.215460-1-wangweidong.a@awinic.com>
References: <20230804114749.215460-1-wangweidong.a@awinic.com>
Subject: Re: [PATCH V4 0/3] ASoC: codecs: Add awinic AW88261 audio
 amplifier driver
Message-Id: <169143806017.302632.37564599708375249.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 20:54:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 2RWSRM3JFAZMFYYTPUM2YLBLW7WLZDJW
X-Message-ID-Hash: 2RWSRM3JFAZMFYYTPUM2YLBLW7WLZDJW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 19:47:46 +0800, wangweidong.a@awinic.com wrote:
> The awinic AW88261 is an I2S/TDM input, high efficiency
> digital Smart K audio amplifier
> 
> v3 -> v4: Modify the dev_err_probe usage
>           Changed the use of sizeof in kzalloc
>           Changed the function name
>           Merge aw88261_device.c into aw88261.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Add schema for "awinic,aw88261"
      commit: 517d52ae5cf75d55970345ece4f6743abdf4620f
[2/3] ASoC: codecs: Add code for bin parsing compatible with aw88261
      commit: 7f4ec77802aa17518990ed954bf536fd3bcf25cb
[3/3] ASoC: codecs: Add aw88261 amplifier driver
      commit: 028a2ae256916eeae1040049d2d0129535ace60e

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

