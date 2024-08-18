Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71365955BD5
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Aug 2024 09:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A77B21DD;
	Sun, 18 Aug 2024 09:35:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A77B21DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723966513;
	bh=GKvPpus/+NOGjQDJYajGzzRA501OtgqRsEfEuZJt2/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m6aTC/NNfgcdX3KX11eaj4F4KTd3BIEzvuDyTzhFOj72B3dcN76D0sTchFoS7UFIu
	 pOBjXOcskSD7LrFSqMybcpUJBeRux5NMDt4IASAqXa516INEhEK+8GbqE8HSKgBKD8
	 9ydZkd5cy9rSVjn9dwZyMmWWZHZiVk9qluB74KA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2A78F805AB; Sun, 18 Aug 2024 09:34:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4996AF805AD;
	Sun, 18 Aug 2024 09:34:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 724A5F80494; Sun, 18 Aug 2024 09:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C03CF80107
	for <alsa-devel@alsa-project.org>; Sun, 18 Aug 2024 09:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C03CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lAArWeba
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4792861011;
	Sun, 18 Aug 2024 07:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A4D7C32786;
	Sun, 18 Aug 2024 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723966128;
	bh=GKvPpus/+NOGjQDJYajGzzRA501OtgqRsEfEuZJt2/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lAArWebaGY82aAuWaY1Dzg9d04r7rIx7qJLEV065/TO7IPsIz8GBg0fRvvMwLft/P
	 QLrsmiRXOQ1aN098XRxYSAMv/9XetRMvCoFDVDBmQwTTnuuwL2Uu8nwYclHDe2r3IL
	 BegLRZBklX/wQvZ2SZg2OmzMz/HcWxkAkQfvrLT1FmPaHOqDK+jQsy4EckVyXr+mSz
	 wojxUQSguulMu+Ayd79iHLCWHxYfH7uXzduaTD11bzOaeX43ow/HcEOQ3DI3O4ZTJ6
	 LNIArK0vL7P63kVwia4HfzbloypYHyYuHBd3smkHcTqEPwUdNLmylzKIlHxz6/HM5S
	 f3TUl7rYLLChg==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
Message-Id: <172396612475.999533.6561108954467438983.b4-ty@kernel.org>
Date: Sun, 18 Aug 2024 12:58:44 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
Message-ID-Hash: WKX2KF6D2XNWOHG74IZDQ7GT4IJE2KZ5
X-Message-ID-Hash: WKX2KF6D2XNWOHG74IZDQ7GT4IJE2KZ5
X-MailFrom: vkoul@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKX2KF6D2XNWOHG74IZDQ7GT4IJE2KZ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 29 Jul 2024 16:01:57 +0200, Krzysztof Kozlowski wrote:
> Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
> 'sink_ports' - define which ports to program in
> sdw_program_slave_port_params().  The masks are used to get the
> appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
> an array.
> 
> Bitmasks can be non-continuous or can start from index different than 0,
> thus when looking for matching port property for given port, we must
> iterate over mask bits, not from 0 up to number of ports.
> 
> [...]

Applied, thanks!

[1/1] soundwire: stream: fix programming slave ports for non-continous port maps
      commit: ab8d66d132bc8f1992d3eb6cab8d32dda6733c84

Best regards,
-- 
~Vinod


