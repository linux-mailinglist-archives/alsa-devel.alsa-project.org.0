Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4E97560A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 16:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2E7B82B;
	Wed, 11 Sep 2024 16:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2E7B82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726066286;
	bh=xJGwEM8YdZSxNYttVYLxVUocEygY6JMFJPPwCIRo8DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oTTziAim2+tTHIxpxmq085untKahQrAqE8IXkGBxqfOK04QmiTBIof6HSIutVWzaN
	 z+L+TWDWsGEC18WK6B1sBr7GY31eWWWTQDUzU/EEoVKjokaG1HvN5XyNnPQNzTc70t
	 abTGPjqnpGA9TXGy8iBXyGKx6C+e7jbBm7RQru/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01A76F805C6; Wed, 11 Sep 2024 16:51:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A24D7F8010B;
	Wed, 11 Sep 2024 16:51:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2397FF8019B; Wed, 11 Sep 2024 16:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46670F801F5
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 16:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46670F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eEpM6Mpw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 383F7A4510E;
	Wed, 11 Sep 2024 14:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03406C4CEC0;
	Wed, 11 Sep 2024 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066255;
	bh=xJGwEM8YdZSxNYttVYLxVUocEygY6JMFJPPwCIRo8DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEpM6Mpwr4cju+H4p1MJKbRpXjj2puIuuNAo4TVcg73PaInpxIfH7sWewcyZ5HY9C
	 Dv8pQajLgmlz5gOouiSqBb5UjJlwTYWbPry4Aut1MCI5NmnDSS1YU7l4mqTccYjUtb
	 UWaq28WJebHaJkUtFUp+5Yo9vh94hS6ryKKIz4nSj0EuRu4kibwjxCUbAMZImd8KkC
	 FD8j0KxpDwEq8Wj6Ua5kUsxWcefkdu/I5tMsVPToJoPwTQhjnubH0pTFtqQxL6kEw0
	 Y2tfgZ7ulY1UWskVyshEn72d5KRrTLhUVBCXWyvAeDgBSmGM2W2x2zqaWrwkOf9lMX
	 l18ZaLm+tlHRQ==
Date: Wed, 11 Sep 2024 09:50:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	claudiu.beznea@tuxon.dev, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, nicolas.ferre@microchip.com,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, broonie@kernel.org,
	codrin.ciubotariu@microchip.com
Subject: Re: [PATCH] ASoC: dt-bindings: microchip,sama7g5-spdifrx: Add common
 DAI reference
Message-ID: <172606625336.165976.15010375858914287805.robh@kernel.org>
References: <20240910082202.45972-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910082202.45972-1-andrei.simion@microchip.com>
Message-ID-Hash: A7L6HQGAM2YJ7AVUIT3YO2RYSKMVCQE7
X-Message-ID-Hash: A7L6HQGAM2YJ7AVUIT3YO2RYSKMVCQE7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7L6HQGAM2YJ7AVUIT3YO2RYSKMVCQE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 10 Sep 2024 11:22:03 +0300, Andrei Simion wrote:
> Update the spdifrx yaml file to reference the dai-common.yaml schema,
> enabling the use of the 'sound-name-prefix' property
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  .../devicetree/bindings/sound/microchip,sama7g5-spdifrx.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

