Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF687787DC
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 09:10:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434EC828;
	Fri, 11 Aug 2023 09:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434EC828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691737828;
	bh=YimjOo4i63vgRZqsG35a+urQVO7OPLU+EV2AAAkyZOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TU6cocP/G59ZSeNL63vV/6R+vHnb6FVaanSmy892kcjOLaNsf6IBJe1fkqk/U2Ek4
	 1dF+lt9DTi39fLo4Y1nIWXN7a86lqPBw2x702PGcjWoFR8/IuQpfObf/4Yv82Q/Opi
	 R4qZawszmW3QkPRGLvLR2X1rulr7oIEW+m2v5vEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8227F80510; Fri, 11 Aug 2023 09:08:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1226DF80510;
	Fri, 11 Aug 2023 09:08:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 374F0F8016E; Fri, 11 Aug 2023 09:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6E18F80166
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 09:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6E18F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F47+daCA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12DEA63F3B;
	Fri, 11 Aug 2023 07:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82AE2C433C8;
	Fri, 11 Aug 2023 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691737610;
	bh=YimjOo4i63vgRZqsG35a+urQVO7OPLU+EV2AAAkyZOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F47+daCAtAzDglTToTYMykUvM0fHnxXfUeLObZ0qhT+uEhG+toOw8klzE41vWXX2M
	 EarXn6D1BTjxX4MQX5vll/u788CYCgqosmMkj2nKS8KDRFtny5xwA4s5N8lhLLCp9w
	 1eb6edRsVHzVLxlkIH1pZ+Y72YLX084eFL89LsgHtj7xO/+rpgEYLaOzbad7s17u3T
	 E8oFbBJyCncgz7NdvRhMAwyAAGI0+JRwpuApjSxzXNk69y3XWusZYpB9SbaBiipICX
	 cGBHTmJ1TekiW0bzGQq93QHeJnysfVVn7KECqNI56EogpswIYLF2O0TmX5No2oRxkz
	 K6s2hBsI6V0kA==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
References: <20230731091333.3593132-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/3] soundwire: allow for more than 8 devices, keep
 IDA for wake-capable devices
Message-Id: <169173760931.104525.18320129974065669032.b4-ty@kernel.org>
Date: Fri, 11 Aug 2023 08:06:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: TYXHZ4D3MQHONXNVCBDFR6KX7RZAKAMG
X-Message-ID-Hash: TYXHZ4D3MQHONXNVCBDFR6KX7RZAKAMG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYXHZ4D3MQHONXNVCBDFR6KX7RZAKAMG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 31 Jul 2023 17:13:30 +0800, Bard Liao wrote:
> This series suggests a hybrid strategy for device number allocation, where
> only wake-capable devices use a system-unique Device Number which will be
> used on LunarLake to handle wake-ups using the HDaudio WAKEEN and WAKESTS.
> 
> Pierre-Louis Bossart (3):
>   soundwire: extend parameters of new_peripheral_assigned() callback
>   soundwire: bus: add callbacks for device_number allocation
>   soundwire: intel_auxdevice: add hybrid IDA-based device_number
>     allocation
> 
> [...]

Applied, thanks!

[1/3] soundwire: extend parameters of new_peripheral_assigned() callback
      commit: 23afc82fb22bccd3f1d2a856d3eccb70453f33b0
[2/3] soundwire: bus: add callbacks for device_number allocation
      commit: 39d80b0e5fed2c32f66093fead626358b7106974
[3/3] soundwire: intel_auxdevice: add hybrid IDA-based device_number allocation
      commit: e66f91a2d10b9a25eedcaddee9d6f08c8132760a

Best regards,
-- 
~Vinod


