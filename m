Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF93831DFF
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 17:58:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187BF1FF;
	Thu, 18 Jan 2024 17:58:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187BF1FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597130;
	bh=QYRlUkW/XpdCNFGIHDOmI1vkPXM8L2eljOqXfzrzFsQ=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JbWcv+stP6zVQeqoTN1uQ88qcpYj6IdXeaf+l80HDaw0s4SzTGXzNS8bGom7vU4hc
	 Ce3xvagmhGk18vc2dAXda58jB8rExOPiFNlc0IrVDQR04HxX4v3HYETgLG8VHGWu5/
	 01Dd97ZgOXihDw/hIWd74QIBadgJ2+bUz+O4aIo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63DE5F80520; Thu, 18 Jan 2024 17:58:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBC0CF8057D;
	Thu, 18 Jan 2024 17:58:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0150F801F5; Thu, 18 Jan 2024 17:58:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
	SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi
 [62.142.5.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18587F80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18587F80074
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c2b5c193-b622-11ee-b972-005056bdfda7;
	Thu, 18 Jan 2024 18:58:11 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 18:58:10 +0200
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/6] Add cs42l43 PC focused SoundWire CODEC
Message-ID: <ZalYooJxj7Ba0sYU@surfacebook.localdomain>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
Message-ID-Hash: KMKUKV7D72MWJ4SLSQGGH5XQRDZFWCQ3
X-Message-ID-Hash: KMKUKV7D72MWJ4SLSQGGH5XQRDZFWCQ3
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMKUKV7D72MWJ4SLSQGGH5XQRDZFWCQ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Aug 04, 2023 at 11:45:56AM +0100, Charles Keepax kirjoitti:
> This patch chain adds support for the Cirrus Logic cs42l43 PC focused
> SoundWire CODEC. The chain is currently based of Lee's for-mfd-next
> branch.
> 
> This series is mostly just a resend keeping pace with the kernel under
> it, except for a minor fixup in the ASoC stuff.


Sorry for the late review, nevertheless, I was alerted by the pin control code
probe function that does something custom with devlinks. This is a red flag,
please find time to fix that.

The rest of the review (since the code is in upstream) is probably good to have
via follow up cleanups.

-- 
With Best Regards,
Andy Shevchenko


