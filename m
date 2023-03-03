Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E56AA5F2
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Mar 2023 00:54:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD601E7A;
	Sat,  4 Mar 2023 00:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD601E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677887662;
	bh=f0VZGTA8oOnAaMkfwB2QB6pLFSy4sdHSrlgXIOshidI=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cvjCB1xOQTnaeZ0pQ2yM4wH73kysr7Gs3n08DW4ZmSMo0tm3/CUEIFuuGyepZBiw2
	 hNxctfe5c2MyTQbl5rWBgmKJhV7626ZKVEEnZ9EbhXk6S0gij1xurnMZ6vBtlmGlfd
	 JcXLSpF+/lDdYuIhoZW698JtkPlRxy114ohbhTYM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B5FEF8025A;
	Sat,  4 Mar 2023 00:53:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C975F80266; Sat,  4 Mar 2023 00:53:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F052CF80236
	for <alsa-devel@alsa-project.org>; Sat,  4 Mar 2023 00:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F052CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pPg3aquM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D2874B819A2;
	Fri,  3 Mar 2023 23:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4363BC433EF;
	Fri,  3 Mar 2023 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677887602;
	bh=f0VZGTA8oOnAaMkfwB2QB6pLFSy4sdHSrlgXIOshidI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pPg3aquMyk8quzI4S98uu90F22x1h3GOUJkYSghdVqGCJWF1TcwvUvWST3RzZWK8w
	 rCHK+YOBvoipN8b1QlvOUPK4vO5E/mokaSvQZlqqbSQfxWi4p8/N8sCxNVmAKrrdaq
	 L+h0LZD50TpI9OyO6nPzyLw7uPq/6Cx03FTFrpn19RzgmE50c7c89ik0FdARIV8cMi
	 B0WVX0zjm5XxcDVW0ukFs/6w+rp0DSh3l+3DzO5WLU6q9CluToYJP5DDIEiJz6y69+
	 oV+Adjksmu9f6MgqJwE49S/CHR61kap4SKD/E7xE5SEzkMpjz6rvoI+mZwuszZRkkE
	 5pyD+qJFcUj2w==
Date: Fri, 3 Mar 2023 15:53:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: yamllint: Require a space after a comment
 '#'
Message-ID: <20230303155320.5e394431@kernel.org>
In-Reply-To: <20230303214223.49451-1-robh@kernel.org>
References: <20230303214223.49451-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LLEMONEGALSQPDDF3QIKVNH4IW2FB5XG
X-Message-ID-Hash: LLEMONEGALSQPDDF3QIKVNH4IW2FB5XG
X-MailFrom: kuba@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLEMONEGALSQPDDF3QIKVNH4IW2FB5XG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri,  3 Mar 2023 15:42:23 -0600 Rob Herring wrote:
> Enable yamllint to check the prefered commenting style of requiring a
> space after a comment character '#'. Fix the cases in the tree which
> have a warning with this enabled. Most cases just need a space after the
> '#'. A couple of cases with comments which were not intended to be
> comments are revealed. Those were in ti,sa2ul.yaml, ti,cal.yaml, and
> brcm,bcmgenet.yaml.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Jakub Kicinski <kuba@kernel.org>
