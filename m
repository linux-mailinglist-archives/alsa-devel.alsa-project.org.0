Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3027CA6A6
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 13:22:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8E4857;
	Mon, 16 Oct 2023 13:21:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8E4857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697455363;
	bh=16AKyUtoR6pajVMK2yQqNyWfjYnlASTn9I445Ew14Ys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DNE5f3p8lnxdofEJ4ljuz8zZkwvrXPcHffCg+qtoMYi6O5U41ZEH5FWi7TaWRDQd9
	 M6cekhgOzfFK4J3Fp0WORsEwVfjA81fXeMe7s/yHAkIcOMigmZ4X+A8WwPYJw2xwba
	 OJBg7VnzQJFjvqn0ebR1wXOCTsqOK7gBIp697KIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2E1F80579; Mon, 16 Oct 2023 13:21:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DE7F80558;
	Mon, 16 Oct 2023 13:21:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC1CFF80558; Mon, 16 Oct 2023 13:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7CD5F8055A
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 13:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7CD5F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hkubut12
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA802CE13B2;
	Mon, 16 Oct 2023 11:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AD7C433C7;
	Mon, 16 Oct 2023 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697455253;
	bh=16AKyUtoR6pajVMK2yQqNyWfjYnlASTn9I445Ew14Ys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hkubut12CrO/Qcv23mT30wM0jPVRvGJc37oVA6Pm04PApR1waoyd/uMTC0fmO/w9Z
	 7AhQXLhcAYZpN80ROqCLJHFP3zuc/kEHxw3Ioccydb0BLDE+6vJaRAv9jf0pteXZJd
	 tPFGleEVYr6Re0Kve0mlP1B+hDVVpy5wW3bFBjdmmmz9PCt+pubXLkM0CAoLxz/7be
	 eVfBgHLNcJxPTsuA1koDBbp8zqfKNym6yH9x4pL8p+g5AY4YLPypM2/M4+3u3FBNNY
	 szGy52OO4whI96ILxhyoBOwpFOQwhs5Vxep/HYZkzsFGm01VC+SErtA4+lBlmZCJQG
	 r8awHMLd2hnYg==
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20231013010812.114216-1-yung-chuan.liao@linux.intel.com>
References: <20231013010812.114216-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: bus: improve error handling for clock stop
 prepare/deprepare
Message-Id: <169745525118.217856.10954000456240343694.b4-ty@kernel.org>
Date: Mon, 16 Oct 2023 16:50:51 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
Message-ID-Hash: MMTU2HEUWW7IINUDPALSJ6PIIUSQBP5R
X-Message-ID-Hash: MMTU2HEUWW7IINUDPALSJ6PIIUSQBP5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMTU2HEUWW7IINUDPALSJ6PIIUSQBP5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 13 Oct 2023 09:08:12 +0800, Bard Liao wrote:
> The same logic is used for clock stop prepare and deprepare, and
> having different logs for the two steps helps identify problems.
> 
> In addition, when the "NotFinished" bit remains set, the error
> handling is not quite right:
> 
> a) for the clock stop prepare, the error is handled at the caller
> level, and the error is ignored: there's no good reason to prevent the
> pm_runtime suspend from happening. Throwing an error that is later
> ignored is confusing.
> 
> [...]

Applied, thanks!

[1/1] soundwire: bus: improve error handling for clock stop prepare/deprepare
      commit: ff435da4cc8b6137be9f0b6b4a9af095590d4b8c

Best regards,
-- 
~Vinod


