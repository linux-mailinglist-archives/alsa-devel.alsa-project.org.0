Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20928CD1C19
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Dec 2025 21:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C486022C;
	Fri, 19 Dec 2025 21:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C486022C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766176163;
	bh=mH/3+P1Mni8rlKaukV/fxOSy+vtN9HEN1c/tYQywphs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTdHP+HREGcodPDJIcuFpSL5TE4GS91D+aYvgMxedaAJbALKJk5mE9m4qQeJolJ+p
	 Cx1fnsqDOeX86rWRehC1xD1xJ0BrIV046kavoCxZL3Fa1Gp8ypc4wUyOjCzq1Jx1OX
	 gVgJMUa4DwR7aQ9vtXKbHIjvEE3Zg/nuoS6J7qPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90E6AF805DF; Fri, 19 Dec 2025 21:28:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29A06F805D8;
	Fri, 19 Dec 2025 21:28:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBA95F805C3; Fri, 19 Dec 2025 21:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C369F800FE
	for <alsa-devel@alsa-project.org>; Fri, 19 Dec 2025 21:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C369F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=crnVuR+g
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B44760008;
	Fri, 19 Dec 2025 20:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A879FC4CEF1;
	Fri, 19 Dec 2025 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766176130;
	bh=mH/3+P1Mni8rlKaukV/fxOSy+vtN9HEN1c/tYQywphs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crnVuR+g5NQ0T9xAWciVjRH4LzvzWCNRFTDXObYNb3YWkrr3WcDTgqyCV0k6jtgjF
	 J6A87OsC47ct0vvFAlcU73hCImjE5ZeQqYGHEj6oUAQTFQgFIE1BlijsFybHHSHkdr
	 VP+b33seyUDuDCouYbAEkiPrQCXoruNMq8nTT0jFwV4RJZ/AjKeFgHn0XE0Tn4ibgy
	 fBmv1I3Wzr+lUpEPNRdQp+Cz6HfAL8ZAuwCFhjrhLk+S5XA+FWXDlhtHbfkh2XGauG
	 5OmJEiHKOUNWYYke88nVE+Ye35NNwy/PERGgNCyyNIFDG/bP/6h7UNz/pgf6vO6LeB
	 2IA9CIpqzW+Mg==
Date: Fri, 19 Dec 2025 14:28:47 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: derek.fang@realtek.com, krzk+dt@kernel.org, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	conor+dt@kernel.org, perex@perex.cz, flove@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com,
	cezary.rojewski@intel.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v10 2/3] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Message-ID: <176617612625.3881717.16468499127318005797.robh@kernel.org>
References: <20251216071853.3929135-1-oder_chiou@realtek.com>
 <20251216071853.3929135-3-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216071853.3929135-3-oder_chiou@realtek.com>
Message-ID-Hash: 3NVRSRG3WUWBBOONIIBQIX32TSARCFEP
X-Message-ID-Hash: 3NVRSRG3WUWBBOONIIBQIX32TSARCFEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NVRSRG3WUWBBOONIIBQIX32TSARCFEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 16 Dec 2025 15:18:52 +0800, Oder Chiou wrote:
> Audio codec with I2S, I2C and SPI.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../bindings/sound/realtek,rt5575.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

