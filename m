Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A07A77AA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 11:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812A9886;
	Wed, 20 Sep 2023 11:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812A9886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695202552;
	bh=QRqraJthrB8s9rPFRvGC6l5CWWwWQnee/47O8rOjCCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cNJ3V+LLA3R7yeTs8k4NyX/29n+GuEgBf1TAn20sAe9b6Y2HGD61IxwLEPV5ww24m
	 cIt84YqsfVGid1hwQG6+QvtY07trdglPuUQwY3SAK9F/ET+uVo7KsQacTflJ+/3Qkr
	 kylriQkdmj0X1ZT4byydh+kxWrTO0on+7K9q/LT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93DE7F80549; Wed, 20 Sep 2023 11:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9BBF801F5;
	Wed, 20 Sep 2023 11:35:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F141F8025A; Wed, 20 Sep 2023 11:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D88C7F800F4
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 11:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D88C7F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hHW7X4m7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 6E0ACCE1AA7;
	Wed, 20 Sep 2023 09:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BA7C433C8;
	Wed, 20 Sep 2023 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695202484;
	bh=QRqraJthrB8s9rPFRvGC6l5CWWwWQnee/47O8rOjCCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hHW7X4m7KYpDH5gfY61PdqOpjN3Y7rHvb8kCZPi2x4QeZ4282xmLjtH/VG98fLLt2
	 nnMOFneixT9add37HLtFNJq4cPxFz0G0CYiPYBF4mfuu0Wd7Ylcic2Yyig9S88zxI/
	 wZ1y138LMKQb3ZE6Dc99cRaKauE718Qsi7GkZqONwyB7rIFvccLpXII9v54328Y5Xf
	 QMXEZusEupYfBMolEIdWaI69MR1OWSs30AEjcVl3TLDIdedsK3IFxjtHA+Oc2h17Q8
	 HkBgJqIzsp7+r3Xf1XkVKFMg6EwaPxvbBnArHbwZ0wuxPx8VLJEKw6szjW+9BTpb7T
	 nXEayUPV2CyBA==
From: Lee Jones <lee@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: 
 <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <528425d6472176bb1d02d79596b51f8c28a551cc.1692376361.git.christophe.leroy@csgroup.eu>
Subject: Re: (subset) [PATCH v4 23/28] mfd: core: Ensure disabled devices
 are skiped without aborting
Message-Id: <169520247904.3353856.9378855807085829647.b4-ty@kernel.org>
Date: Wed, 20 Sep 2023 10:34:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
Message-ID-Hash: 4YYFC664M774CCOUJUMBW7JHUZVFAQI6
X-Message-ID-Hash: 4YYFC664M774CCOUJUMBW7JHUZVFAQI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YYFC664M774CCOUJUMBW7JHUZVFAQI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 18:39:17 +0200, Christophe Leroy wrote:
> The loop searching for a matching device based on its compatible
> string is aborted when a matching disabled device is found.
> This abort prevents to add devices as soon as one disabled device
> is found.
> 
> Continue searching for an other device instead of aborting on the
> first disabled one fixes the issue.
> 
> [...]

Applied, thanks!

[23/28] mfd: core: Ensure disabled devices are skiped without aborting
        commit: 36d139dc63db18eb95165fcc2bd3c670c948d605

--
Lee Jones [李琼斯]

