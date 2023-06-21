Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A07737C92
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 09:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B0F74C;
	Wed, 21 Jun 2023 09:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B0F74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687334347;
	bh=wbEoKbWYhhhgVeRpxk2hZ6u/CPga6SFFXTn2OH3ChCo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jcibEIKloXLgYWqBR9ztIxUIpCtFo5ONbPR76CEaO7qZzNVB6vSbguct5y2L6scm2
	 XER66rx7ohN0eaRizG9fT4oqQJj+T5U7GtJGx40XawGOwTP81kntYwO//8QpDklHOw
	 dI4nNo76M+F/vXNWYzbUtHeb/LqCzEXx5Yq7f8B8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8524DF80132; Wed, 21 Jun 2023 09:58:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F68F80132;
	Wed, 21 Jun 2023 09:58:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3CEFF80141; Wed, 21 Jun 2023 09:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9DCE4F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 09:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DCE4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=k6BglyF1
Received: from [192.168.1.90] (unknown [188.27.34.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BDD65660000E;
	Wed, 21 Jun 2023 08:58:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687334286;
	bh=wbEoKbWYhhhgVeRpxk2hZ6u/CPga6SFFXTn2OH3ChCo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=k6BglyF1lU5/n1s+Rw70+F23h8RHTZcM4IoenAX9rUBC9xl4EUJQAF6ILK2D/0oz0
	 I9b9Tv9GAeI+pIOFIn+STouQBcl/u7+UDSakR3+Q0p4np77sKmvtlU/sbXveNJv8ME
	 8d1qqBLUhD7NAde/qfO3TuFtcC1Aoi6XETIHsEyY2uFfY4EFQGMmZyonLf8Jgcjwvj
	 BrFEGM/RxUP1k4dvZHVIDOYpyaTuMNfNeMOcpP0QKh9KWJw2ToR/210Ft1B15KGNeD
	 zmLR0ur13HGoPJjgQtFSFcUhFEyNEcL2v/DxmR2TuGe82JWKufp9tNcPwOQRVwAG/T
	 NHpXx0veVdBKQ==
Message-ID: <892273c4-82b2-47d5-c03c-2d298424c18f@collabora.com>
Date: Wed, 21 Jun 2023 10:58:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] AMD Vangogh support for NAU8821/MAX98388
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20230620222743.274432-1-cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20230620222743.274432-1-cristian.ciocaltea@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EF6VBDT5X245Y5MMDG65J5PDJIXPEWWQ
X-Message-ID-Hash: EF6VBDT5X245Y5MMDG65J5PDJIXPEWWQ
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EF6VBDT5X245Y5MMDG65J5PDJIXPEWWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/21/23 01:27, Cristian Ciocaltea wrote:
> This patch series extends the Vangogh machine driver to support a variant based
> on the Nuvoton NAU88L21 Codec and the Analog Devices MAX98388 Speaker Amplifier.

Please ignore this for the moment, as it depends on a firmware upgrade
and would break the existing devices based on the CS35L41 codec.

I will resend as soon as a proper solution is figured out.

Thanks,
Cristian
