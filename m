Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F277F4CA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 13:11:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F91F829;
	Thu, 17 Aug 2023 13:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F91F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692270659;
	bh=m+iOFlhLTce7hvaLnYnzvoWQ7/UQ3oXDTw1op5hP3gk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hlmo/Idco4TwOdX3Qm7/wcXBqBZORFaOba69ahYmZ25wj9p1ZWArwdigMd6xVQ3OZ
	 W6MBpwXdU50adrGJ0olX99Ccj/foKHVNzJ/4vLxIfLAh6uCEy1OIWoXlrdpduTdQOy
	 4lKytdhl98R8SwPDwqDunx5K0qyQnyUAqf7Cy7MI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC52CF800D1; Thu, 17 Aug 2023 13:10:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C52A8F8016A;
	Thu, 17 Aug 2023 13:10:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AC1EF8016D; Thu, 17 Aug 2023 13:10:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24C3DF800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 13:09:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C3DF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XK+CGoMy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D118639B3;
	Thu, 17 Aug 2023 11:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC783C433C8;
	Thu, 17 Aug 2023 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692270594;
	bh=m+iOFlhLTce7hvaLnYnzvoWQ7/UQ3oXDTw1op5hP3gk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XK+CGoMyEE7Y1Ld3ZPYRnzrkZ7dNkvty8wLkIjZErBzZc1xQvE9T57HY+YVJsFdHu
	 8MxBGV+cQE80gnumUUDEHh1LjttEW4B9SoYzPCArpQ8zfer1oIzeU5AnEdw9BhtzHe
	 dZzUaFbiHCHid1+hl/I5M65sVoUir2aCdPNfYDCkugI7dWnSslWNTIqF9jyBN/+ads
	 PTEFxaE4DAzoX+cujbJPFKmrm4GATRroVZauXaE+NPYZwHsMUGEEz7ykjj02jyoe5I
	 9CelBVTmWr0iJdeGc+SHKfGqd5WFenf9YzQROCsE+1KcyyfE1GbhmB9YC+/sFmAgnH
	 PtbzyGPf1Gafw==
From: Lee Jones <lee@kernel.org>
To: broonie@kernel.org, lee@kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH v7 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-Id: <169227059141.987802.3881975345148652106.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 12:09:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: KCZVGC6APP7HFD2OVMRMDHXFWTGT42T2
X-Message-ID-Hash: KCZVGC6APP7HFD2OVMRMDHXFWTGT42T2
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KCZVGC6APP7HFD2OVMRMDHXFWTGT42T2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 04 Aug 2023 11:45:56 +0100, Charles Keepax wrote:
> This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> branch.
> 
> This series is mostly just a resend keeping pace with the kernel under
> it, except for a minor fixup in the ASoC stuff.
> 
> [...]

Applied, thanks!

[1/6] soundwire: bus: Allow SoundWire peripherals to register IRQ handlers
      commit: 89e63e62ad14dbe528257882856c08365e5bb337
[2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT binding
      commit: 940cdb69aeb4aa3dde97bd46a5d8422f8a0f1236
[3/6] mfd: cs42l43: Add support for cs42l43 core driver
      commit: c4962e013792df36dceacd692fef0f6803517b3f
[4/6] pinctrl: cs42l43: Add support for the cs42l43
      commit: df393be615ae61993ac0c32edc13dff27b7e925d

--
Lee Jones [李琼斯]

