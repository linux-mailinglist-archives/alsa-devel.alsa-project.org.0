Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FE6BDBA6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 23:28:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F5E1073;
	Thu, 16 Mar 2023 23:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F5E1073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679005680;
	bh=WwxwPCvjpCbckP2pXDaLHBrp9SZZk810RjqZ3N5cTFU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R6uVctvddvbcbBCjFn5r1TDIyFB/lKrh3FycBqbArTbWswDbbJNyxF9yL3yhWLgYc
	 +gCN7yP+KBHh57q7ltsAiqOUFTzMvNZpd9tQh+dSQYV9l/OtU5hru9DIQ9pW6JZdjD
	 LrZOB6M4nrjy/dzcpRqL2MnknQ83BlCG0WJOJhDA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F80F8032D;
	Thu, 16 Mar 2023 23:27:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C992CF80423; Thu, 16 Mar 2023 23:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 57900F8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 23:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57900F8016C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B00701FB;
	Thu, 16 Mar 2023 15:27:40 -0700 (PDT)
Received: from bogus (unknown [10.57.52.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 774083F64C;
	Thu, 16 Mar 2023 15:26:52 -0700 (PDT)
Date: Thu, 16 Mar 2023 22:26:19 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: firmware: arm,scmi: Document
 assigned-clocks and assigned-clock-rates
Message-ID: <20230316222619.r4jzk3lzdxzamr2s@bogus>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
 <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
 <20230316203417.GA3833267-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316203417.GA3833267-robh@kernel.org>
Message-ID-Hash: QWLWC5WI62VO35SRB3LSU3CGDGOETQRR
X-Message-ID-Hash: QWLWC5WI62VO35SRB3LSU3CGDGOETQRR
X-MailFrom: sudeep.holla@arm.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Drake <drake@endlessm.com>,
 Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWLWC5WI62VO35SRB3LSU3CGDGOETQRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 16, 2023 at 03:34:17PM -0500, Rob Herring wrote:
> +Stephen
> 
> On Wed, Mar 15, 2023 at 01:47:56PM +0200, Cristian Ciocaltea wrote:
> > Since commit df4fdd0db475 ("dt-bindings: firmware: arm,scmi: Restrict
> > protocol child node properties") the following dtbs_check warning is
> > shown:
> > 
> >   rk3588-rock-5b.dtb: scmi: protocol@14: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)
> 
> I think that's a somewhat questionable use of assigned-clock-rates. It 
> should be located with the consumer rather than the provider IMO. The 
> consumers of those 2 clocks are the CPU nodes.
> 

Agreed. We definitely don't use those in the scmi clk provider driver.
So NACK for the generic SCMI binding change.

-- 
Regards,
Sudeep
