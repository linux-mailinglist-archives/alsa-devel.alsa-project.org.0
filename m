Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FA76D4B74
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D3D1FA;
	Mon,  3 Apr 2023 17:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D3D1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680534536;
	bh=9XtzN3OjyD2EdWqBisgPuKgrj6g/+EyaufBYf2jb4Io=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W8eJJGTWqAw/++UPxgtNjEL6H8cNLWL/4gNbT9qwKEEMUt/LXhzU+QgpMPKms01EZ
	 NC+FRuF1s2dDYJuSf8DOFnI6PINYsvnGXsmbUH08IUZuQ8ZJd+NAxWUT1a5JtP46FV
	 mbcPUck8Jriaq7QGSqeoQ5aIVRSDqdPiA1RqtE5Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 666EEF80249;
	Mon,  3 Apr 2023 17:08:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6170EF80423; Mon,  3 Apr 2023 17:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D2B7F801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D2B7F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GHAEzlEZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1A1961FC7;
	Mon,  3 Apr 2023 15:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D711CC433D2;
	Mon,  3 Apr 2023 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680534464;
	bh=9XtzN3OjyD2EdWqBisgPuKgrj6g/+EyaufBYf2jb4Io=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GHAEzlEZqjrAWLj1f3yse1Nnv+wuZtoKxDHYCmL5lLSzaO1u7+rScEmXO1eQ5Xz5f
	 +xAAczFoDl2ZC26s4pCO2EZa4rEICIeduFnTV42Zlww2N2cDt/AeHKyV6+NjScf+2V
	 9fqzZ9fkJ30rF3Adgxxu0J/sNwsEQ1BQVVkvZq8dF+bcj0hyQl838uvvyJLihBjfcD
	 fk7qiqnrOBVXQgoW1LMmVZ3BEAGjf+A982MjPx3/vpbTOsP92heRDqROh6+NOIV6Aw
	 jBM4PpaNklhfhni+6FsSw7cYYwacPg8y8g5cO7fwSc2Rf78WCYqxJMyFkNTnGndDt6
	 ddqxCFTF4dRDA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?utf-8?q?Andr=C3=A9_Morishita?= <andremorishita@gmail.com>
In-Reply-To: <20230401181930.533067-1-andremorishita@gmail.com>
References: <20230401181930.533067-1-andremorishita@gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: maxim,max98371: Convert to DT
 schema
Message-Id: <168053446153.47553.4385638479008014826.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 16:07:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: ATHLIYUNORFSO2TYHBMWYGITJJ2TOZET
X-Message-ID-Hash: ATHLIYUNORFSO2TYHBMWYGITJJ2TOZET
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 daniel.baluta@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATHLIYUNORFSO2TYHBMWYGITJJ2TOZET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 01 Apr 2023 15:19:29 -0300, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: maxim,max98371: Convert to DT schema
      commit: 5781c22ea87700cd1da8f8de8a82fc10ef2f14d2

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

