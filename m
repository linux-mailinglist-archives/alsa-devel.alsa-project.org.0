Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F874D0A5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 10:54:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551D7206;
	Mon, 10 Jul 2023 10:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551D7206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688979251;
	bh=IyGeX+4Mek0f3BfYdTx991s5C8rgTlIRvC3CEb5c4S0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VRqLyW3PMg+49+PI1qjWKFqGtPhHUUCyFayNgM5J7BplKd1oQVVMxQvnkaA+u1JZZ
	 8qm8z82IlvAHUaboAMG0lsa1YoFJL9sk7tMhkNRFzDSd89WYlxT6hJnedGfNY/vJN/
	 Jqj2iNYzDqL2259x75+Lz+L2Pv2CRti9uGV61QJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73914F8027B; Mon, 10 Jul 2023 10:53:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC754F80153;
	Mon, 10 Jul 2023 10:53:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57D43F80249; Mon, 10 Jul 2023 10:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E943F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 10:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E943F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gEzQ20OL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B727660F1D;
	Mon, 10 Jul 2023 08:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7594DC433C7;
	Mon, 10 Jul 2023 08:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688979186;
	bh=IyGeX+4Mek0f3BfYdTx991s5C8rgTlIRvC3CEb5c4S0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gEzQ20OLO14A9adWb31gkzx7g9ccFD0U9Cl1FK3UlRwys/JjYPnAShm6yu1y3BBok
	 cdz7W1ZiWBYtTeNTGnnU1hG+iOrWPJHxu6Mn3UEYdRBFcKFiLB+pot8vIUVJYAXCjz
	 U4RjKnd3myCuGLDpzlEpNwlrIiO06Xq0hg/3tiTC1fjR2o3W/+F6T+lJ5PbREgbk25
	 BeKq9gz73Ey0x0n2CeiFSmpOax+ke2Cibmba6dCWeLsVIHZiaXqFGyLjQ8EBLuiTVr
	 3n4fLyKrnvsJSPLG8y3Qg4jgwHUUKzBQoL5+b/RBG2Fd+EHE0XHbuGVKOh02jopVNA
	 KATH7SXbM2ofg==
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230705123018.30903-1-johan+linaro@kernel.org>
References: <20230705123018.30903-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH 0/8] ASoC/soundwire/qdsp6/wcd: fix leaks and
 probe deferral
Message-Id: <168897918178.162250.6567156759422885843.b4-ty@kernel.org>
Date: Mon, 10 Jul 2023 14:23:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
Message-ID-Hash: Z5F77IDMRRJYCC4ZAEZ6FQZK5N4SQRNY
X-Message-ID-Hash: Z5F77IDMRRJYCC4ZAEZ6FQZK5N4SQRNY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5F77IDMRRJYCC4ZAEZ6FQZK5N4SQRNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 05 Jul 2023 14:30:10 +0200, Johan Hovold wrote:
> I've been hitting a race during boot which breaks probe of the sound
> card on the Lenovo ThinkPad X13s as I've previously reported here:
> 
> 	https://lore.kernel.org/all/ZIHMMFtuDtvdpFAZ@hovoldconsulting.com/
> 
> The immediate issue appeared to be a probe deferral that was turned into
> a hard failure, but addressing that in itself only made things worse as
> it exposed further bugs.
> 
> [...]

Applied, thanks!

[1/8] soundwire: fix enumeration completion
      commit: 27e0c9f08ac622db7b907c126249dd23367867ab

Best regards,
-- 
~Vinod


