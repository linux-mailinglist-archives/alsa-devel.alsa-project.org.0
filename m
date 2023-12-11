Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E648880CAF3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:26:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81476839;
	Mon, 11 Dec 2023 14:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81476839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702301217;
	bh=VKs1EvBmGIBwqV2FwfnKtoshqlh3tYuJXm/ZPmZw9mc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EpOZE/DTbuG5pcDwH5ZczH+5Rv+t7c9+yhoCT2Sb7dZtaw1fDz+uMzyWUEJVshv05
	 1AFvFmnwazizeaWjSYQUxtV1F++G0qeLFkjjYDzmuHcYKlypYUCqgV73QNy0sSY1WI
	 D0DcOtWQ+xJ+agUd0Cy6O4CrmdSLZeDLIlgTGF+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9B57F805D2; Mon, 11 Dec 2023 14:26:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7FEF805E6;
	Mon, 11 Dec 2023 14:26:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 448EDF80114; Mon, 11 Dec 2023 14:25:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D808F800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 14:25:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D808F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HtdhY6jF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2402BCE0F6B;
	Mon, 11 Dec 2023 13:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE84C433C8;
	Mon, 11 Dec 2023 13:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702301145;
	bh=VKs1EvBmGIBwqV2FwfnKtoshqlh3tYuJXm/ZPmZw9mc=;
	h=From:To:Cc:Subject:Date:From;
	b=HtdhY6jFU/kTASHqTfLYT4x6ST54NyjoG3iXRxd3TyyTGiQxtkiy7dCdmMcfHtWzn
	 pkIJhCpB/1B6TiLofbbMGpTQq42JpzfNOu5b1m8plSRfFFI1vA7yS0e+eQrtO9A4t2
	 P1nv//3JLBryXto4tV/p3iu/0goPC7CorOhYa03i5fTEsdMNGQFTBKNJRKiR9Dow6W
	 /6OnJaGPtKzVzNaXQAfb/YjqP7QSDMpfd1JeIda2s1QYKQZLDXtDs+jSOx4Xoz5ZJb
	 nnw1YTxeJu7q3P7eWVEuCD9HrvzRM+xxgAaCrxeKaRUY9ekUurk4sunduxJnGUYPXd
	 PV0ZkwXGujsYw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rCgIq-0007Ff-0Q;
	Mon, 11 Dec 2023 14:26:32 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	stable@vger.kernel.org,
	broonie@kernel.org,
	alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH stable-6.6 0/2] ASoC: qcom: sc8280xp: Limit speaker digital
 volumes
Date: Mon, 11 Dec 2023 14:26:06 +0100
Message-ID: <20231211132608.27861-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K22G25S5QTRHQRCKHABQJYAFLGGG6QSQ
X-Message-ID-Hash: K22G25S5QTRHQRCKHABQJYAFLGGG6QSQ
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K22G25S5QTRHQRCKHABQJYAFLGGG6QSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a backport of the following series:

	https://lore.kernel.org/lkml/20231204124736.132185-1-srinivas.kandagatla@linaro.org/

which did not build on 6.6 due a rename of the asoc_rtd_to_cpu()
interface.

Johan


Srinivas Kandagatla (2):
  ASoC: ops: add correct range check for limiting volume
  ASoC: qcom: sc8280xp: Limit speaker digital volumes

 sound/soc/qcom/sc8280xp.c | 17 +++++++++++++++++
 sound/soc/soc-ops.c       |  2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.41.0

