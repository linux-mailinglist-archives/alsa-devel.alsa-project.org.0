Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B17828D5
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 14:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B3A07F1;
	Mon, 21 Aug 2023 14:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B3A07F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692620313;
	bh=veiDrmwqJU+LoUoffNhEFba5PtaFW4YWJImLcQ1gViU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t8/qqcbvRZG6RnM0uMUuRc5N/vPWeSGhLWdCgRG9SPP1V+iTSsdBbe9vcg98/6kCE
	 h3rgDGUWRGdzDvVfZfFVmi1NQjzO3B7WNdqWDx02OU+ku0wSZqEDWC8Gu82KVJFXFp
	 gnoPStUagmPmIrpZIAJLWovMOfnG0cp1pmqOiYDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 987CDF80272; Mon, 21 Aug 2023 14:17:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43D9DF8016C;
	Mon, 21 Aug 2023 14:17:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B67F80199; Mon, 21 Aug 2023 14:17:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7075F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 14:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7075F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VZ/bcmF0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C6DA633B4;
	Mon, 21 Aug 2023 12:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BC9C433C8;
	Mon, 21 Aug 2023 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692620250;
	bh=veiDrmwqJU+LoUoffNhEFba5PtaFW4YWJImLcQ1gViU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZ/bcmF0SGuuPh/Fr//uzxTs9s0uTNFMC38LvMOvmDtRaZKtCevzLk4gZG5ijLic+
	 S77tyzVzxZIeaq5QQie+0NJ7cip+g8goSjREnFxw2+YWjUk9SIOwzP/8bPkVYIjWIa
	 UJKXoS9zx7vrLi9SzLBicrnM8KGcEufV5aZPkfFFNCKfWYultt4gY+xpGfnPNorlHU
	 sRR8dOWJb0DA8thc0XmU/4ErPDDBpvU11NFruKx4FH9YSE/AfRrkWFpxVyUpNn7Yxo
	 p3fH52kDPvrBoaJ3q3V9Qq4PE1+KTpgj20k1XL5leYW3dtC0BAiJZH3urMeW8CT2rn
	 Y2Hd9JlhNl+9g==
Date: Mon, 21 Aug 2023 13:17:21 +0100
From: Lee Jones <lee@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 23/28] mfd: core: Ensure disabled devices are skiped
 without aborting
Message-ID: <20230821121721.GH1380343@google.com>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
Message-ID-Hash: 3IGUL7EQDELNRSHQPSSS5RDP6W5QZ3LK
X-Message-ID-Hash: 3IGUL7EQDELNRSHQPSSS5RDP6W5QZ3LK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3IGUL7EQDELNRSHQPSSS5RDP6W5QZ3LK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023, Christophe Leroy wrote:

> From: Herve Codina <herve.codina@bootlin.com>
> 
> The loop searching for a matching device based on its compatible
> string is aborted when a matching disabled device is found.
> This abort prevents to add devices as soon as one disabled device
> is found.
> 
> Continue searching for an other device instead of aborting on the
> first disabled one fixes the issue.
> 
> Fixes: 22380b65dc70 ("mfd: mfd-core: Ensure disabled devices are ignored without error")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/mfd/mfd-core.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

This is too big of a change to be added this late in the cycle.

Pushing review until after v6.5 is out.
-- 
Lee Jones [李琼斯]
