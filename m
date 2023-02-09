Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C9D690DF3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:07:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F164E7F;
	Thu,  9 Feb 2023 17:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F164E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675958856;
	bh=T4VIMR/tzQuwfeVBQ2ksYdSEBgoAycBIAu8jyPAnMKY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RQdrks3N1afpub4lMQzoe8KTwenlGbxN5b85N4EO2SBnWUXo6PEnnfbH10bhNvY+p
	 F8G6Lr24B7b2ACfrIns3GTnaYXHamdT9UlWxYKwEkxABCkTGX14tKnJ1UQFURbscQp
	 zKSpyMdhNGdW2yRTGT/MJVwqqoZsC/jWE1Lb/wBw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70FA3F8021D;
	Thu,  9 Feb 2023 17:06:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42571F80269; Thu,  9 Feb 2023 17:06:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F6C4F8018A
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F6C4F8018A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HzmbNhf7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1F9B6619EE;
	Thu,  9 Feb 2023 16:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F961C433EF;
	Thu,  9 Feb 2023 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675958795;
	bh=T4VIMR/tzQuwfeVBQ2ksYdSEBgoAycBIAu8jyPAnMKY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HzmbNhf7+ikl96209BumKZWyN0sqqK+GyVUB/ep2x87Lf/3s1uexROtJDPHyM/PeC
	 UDW5soYdlskeE+XU9X6l1PXQxbxI26nlhzx4ZJWRa3/yHsifQpPlRVy+eBbc+S2flK
	 eUWDU4MjS/ru/ZWMJQoNKvFA0SrU/7KQ3YeFtxI4u7j8vBvRaWobJc6ZvLxadP6BJF
	 TG8k38GEIW05m9T+C527fEACdD0fzXrWoX/7dVnRuGaSe0k0KsZVs/hG0fVr9gMawg
	 kbFXNdZlczm4hmM7WHas7c/Ivx1W1lTSrVw47w31B621NM+MRsfoorbzBS9xiwST0Q
	 AuV4yn32lxOkg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208160410.371609-1-krzysztof.kozlowski@linaro.org>
References: <20230208160410.371609-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: maxim,max98090: Convert to
 dtschema
Message-Id: <167595879391.443322.9482805543558463715.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 16:06:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: MPOCSUF3S4ZJSNAJODNUG3SBVPFT5OTN
X-Message-ID-Hash: MPOCSUF3S4ZJSNAJODNUG3SBVPFT5OTN
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPOCSUF3S4ZJSNAJODNUG3SBVPFT5OTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 08 Feb 2023 17:04:09 +0100, Krzysztof Kozlowski wrote:
> Convert the Maxim Integrated MAX98090/MAX98091 audio codecs bindings to
> DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: maxim,max98090: Convert to dtschema
      commit: 0551ff7cf51abefe7351a8c486e6318196b3b6fe
[2/2] ASoC: codecs: max98090: simplify snd_soc_dai_driver
      commit: 35ff1051b9594b05041eb2444a339345944b3241

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

