Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDFF974B88
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2024 09:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57E0F829;
	Wed, 11 Sep 2024 09:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57E0F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726040195;
	bh=SK5N+Jo20GWnE++Ph+AYV2AX1Wx0GO2o7rRTpgKVeZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P9Xeakg3kU+LHLG/eJUGC0Wd1Xtp0zYwR4N/wDB+uTktO6qML8XxekRRSTXxp0nR9
	 4szAvvEKj5KI8hNPMOfVKOrabxnsuXyAUzAoQqs2555iAVr/CFsLUsexSGv8P7ukIV
	 ESS7ezl46szU48/TjBuLP/noAqkN5KeTuLCFMXf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C00D9F8058C; Wed, 11 Sep 2024 09:36:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8D0EF80301;
	Wed, 11 Sep 2024 09:36:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BC0CF801F5; Wed, 11 Sep 2024 09:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63062F80027
	for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2024 09:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63062F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PTAT7VHD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0194A4259F;
	Wed, 11 Sep 2024 07:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54E2C4CEC5;
	Wed, 11 Sep 2024 07:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726040152;
	bh=SK5N+Jo20GWnE++Ph+AYV2AX1Wx0GO2o7rRTpgKVeZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PTAT7VHD5sro7EE2FwBqAkT7VRz0GIBy176I0dI9NncCxJlb3WIuhaWRU7FeKXvUn
	 d6AkPxZ/fYWiIh4Hs4oronsllSSPpw6nhD3TKvFap/no65EFs+4iPFxDmXRzBOYAYB
	 +i4z6VhNlb3lJ0ZRW8w7uMPofUTLhWDKbZkb4Vp3SQpnGwj1MV9LFNQFuaFuMCCvwN
	 SkH8I60YXmig79DEkbFQ2yFsqPUpDHf5ip79ahc4TkYZ+OUfjdKERwjtqcRqcB7Pul
	 PVeT8DSYXY5w1H+wYRRtwglS7Q5Xl03VTDITF8Q+udIYdEDp4nFTd8ba9BfQN+5KY8
	 3Y+ivgpixVvPQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, stable@vger.kernel.org
In-Reply-To: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
References: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND] soundwire: stream: Revert "soundwire: stream:
 fix programming slave ports for non-continous port maps"
Message-Id: <172604014927.100094.1768831537403270768.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 13:05:49 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
Message-ID-Hash: PXVBQLTDF6YZHD2LWL4TGVUR5JZD3GS6
X-Message-ID-Hash: PXVBQLTDF6YZHD2LWL4TGVUR5JZD3GS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXVBQLTDF6YZHD2LWL4TGVUR5JZD3GS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 09 Sep 2024 18:47:46 +0200, Krzysztof Kozlowski wrote:
> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
> breaks codecs using non-continuous masks in source and sink ports.  The
> commit missed the point that port numbers are not used as indices for
> iterating over prop.sink_ports or prop.source_ports.
> 
> Soundwire core and existing codecs expect that the array passed as
> prop.sink_ports and prop.source_ports is continuous.  The port mask still
> might be non-continuous, but that's unrelated.
> 
> [...]

Applied, thanks!

[1/1] soundwire: stream: Revert "soundwire: stream: fix programming slave ports for non-continous port maps"
      commit: 233a95fd574fde1c375c486540a90304a2d2d49f

Best regards,
-- 
~Vinod


