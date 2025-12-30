Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8ACEA5F3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Dec 2025 18:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 229A9601F7;
	Tue, 30 Dec 2025 18:54:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 229A9601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767117309;
	bh=+N/IjSIDB5ejHj2ePTrKIdz05Jvs6mJBEoU2jFHEjFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j7Mur0xpDG+yEK1k4ckBebD1CO7RRLAZKRQp+yGBMy5mT6p0vpzZK+tcpP6nNNJmZ
	 mdlyjyOVXNysoDwfXnU7PSk9mYF5dJICAhWNXEtPxgDWFDKn7MbmruS78ESHuUNwwA
	 Ct/y4GEgZy8k9GuiorIb2sT+Fj+EBa+fSQpbSWV4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD6D7F805E0; Tue, 30 Dec 2025 18:54:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 441B1F805D8;
	Tue, 30 Dec 2025 18:54:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C426AF804D6; Tue, 30 Dec 2025 18:53:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2BFDF80212
	for <alsa-devel@alsa-project.org>; Tue, 30 Dec 2025 18:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BFDF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OrVh/PY7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 021AD43E40;
	Tue, 30 Dec 2025 17:53:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0471C4CEFB;
	Tue, 30 Dec 2025 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117214;
	bh=+N/IjSIDB5ejHj2ePTrKIdz05Jvs6mJBEoU2jFHEjFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrVh/PY7ejRXIMFdmu2fzHvatsSUKUI6jkfdZmwmXvRjXZMQlAG24v/vT+mwuSTZj
	 JvmMJJYhnl992wkNpqBzMjPezPbMsO9FISnGe0hAlbI9hI0C4A7oviodt7GO6c8Cl8
	 +F5JSqAv13sE4R+P3XXvCLFhqTYsCksIBycUsoRxVBRVckwgurscva4Or644cEqPMn
	 aYTaOc8htK7Udk0AfJm2k9yhVQZWYW6X0tZbjEOWIatXuw7VBxtYZknApSVSQh9azG
	 /lka5watD/jPIJkh8/om06MS25djB+LdyJFmr5SrUaDm0blE2yc7TJCYTkzv7jiMIu
	 2Z7Z4pxNN9jzA==
Date: Tue, 30 Dec 2025 11:53:33 -0600
From: Rob Herring <robh@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: cezary.rojewski@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org, flove@realtek.com,
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Message-ID: <20251230175333.GA854335-robh@kernel.org>
References: <20251226083914.1052653-1-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226083914.1052653-1-oder_chiou@realtek.com>
Message-ID-Hash: 4ZMLWWC7NCCQ4ZOD5WMN46VRYI4JEXUP
X-Message-ID-Hash: 4ZMLWWC7NCCQ4ZOD5WMN46VRYI4JEXUP
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZMLWWC7NCCQ4ZOD5WMN46VRYI4JEXUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 26, 2025 at 04:39:14PM +0800, Oder Chiou wrote:
> Audio codec with I2S, I2C and SPI.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/sound/realtek,rt5575.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

Where's the rest of the series? You are missing an In-Reply-To header 
and that breaks the tools (b4).

Rob
