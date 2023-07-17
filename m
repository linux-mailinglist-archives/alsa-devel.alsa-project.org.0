Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D7755C48
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 08:59:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4727E84A;
	Mon, 17 Jul 2023 08:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4727E84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689577181;
	bh=ftPB+gA80Oi5Fk0N1wnPVaxi1tBS/P5y3ItAmzUQ2mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MtLuoraStW3mE5L+HTQ7zQq8gchfj/I/EOLN9nNVE3yIQoZMcvR99HVvWo0PD3ay9
	 vcWd7imHOgy+I71IpjyK88E1r0RkyN0pKkAFLwb/Ec+hteYJorLW/tI0voIeqNnVj8
	 LGFZFW4WiUxPawcXjmnc46k8V8ZK5ULDBmVn1oWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE8DF800D2; Mon, 17 Jul 2023 08:58:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22B99F8027B;
	Mon, 17 Jul 2023 08:58:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77BD2F8047D; Mon, 17 Jul 2023 08:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA4A9F8007E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 08:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA4A9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZS4FHXkI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5EC760F40;
	Mon, 17 Jul 2023 06:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE236C433C7;
	Mon, 17 Jul 2023 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689577118;
	bh=ftPB+gA80Oi5Fk0N1wnPVaxi1tBS/P5y3ItAmzUQ2mE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZS4FHXkIzqcvlSAtdl0aCCk/VXJ13yVtaByRKXvFjk39M3kp47FXUHwW7Bl1UstAU
	 iKablHGr/ppzss1ColXmbJNVnx7l43OEQtLF/6Nc4qlJ9ewLJPnPDbqLqQ41+AKhcW
	 aut8mBp2nMB9n6t+8tYKV3AMxL63CU5mIGN2HkTmYJOaZRjy1imzzl+2ltHpphAmQf
	 VAHZCflgO0CM1GlolLy20xwOjgxi7euhWQ5rKsikv4bUmknGsUZXCCE1l13+Gd08Nj
	 CG9XJbO95r8KsxtuVnQ3+jAcF4Pa/e/VYD5GkCbhCvMdB99x/xUxTfKEm/LobHGQb6
	 CYeg5zvOMf8OQ==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230714174946.4063995-1-robh@kernel.org>
References: <20230714174946.4063995-1-robh@kernel.org>
Subject: Re: [PATCH] soundwire: Explicitly include correct DT includes
Message-Id: <168957711444.296382.9973518648433664121.b4-ty@kernel.org>
Date: Mon, 17 Jul 2023 12:28:34 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: 6FEDNTTOT77RQEHOFGVAMBPV7AKSHBQB
X-Message-ID-Hash: 6FEDNTTOT77RQEHOFGVAMBPV7AKSHBQB
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6FEDNTTOT77RQEHOFGVAMBPV7AKSHBQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 14 Jul 2023 11:49:46 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] soundwire: Explicitly include correct DT includes
      commit: 3f92da3ea4480648ebeb8a4802085908a5c64cee

Best regards,
-- 
~Vinod


