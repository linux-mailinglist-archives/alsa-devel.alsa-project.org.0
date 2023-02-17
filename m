Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF2569A9E4
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 12:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC44EE1;
	Fri, 17 Feb 2023 12:09:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC44EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676632239;
	bh=2EN/utsOcccxHsG8Ua9etBSupDjzX48yoJ+ybSvNK94=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bkl4Cap+qz2Ndy7dSlpYqEJhdGSOMRm7v1Ase1b+W8LnODR92LSoZ11ijR2rOUABL
	 Y+CIbbpdFtYIVLhf/mGSUzBt6wJ9fcxp1G2792qeNwrssqSluoZRteJ8AQzovtaAX6
	 L5CD13R9WO6SA/Vj1v6E/WmZqF3M0F66gZR4XkG0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FB78F80526;
	Fri, 17 Feb 2023 12:09:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C3A2F80527; Fri, 17 Feb 2023 12:09:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65DFFF800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 12:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65DFFF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=hBG26Ynz
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFEDB660212E;
	Fri, 17 Feb 2023 11:09:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676632174;
	bh=2EN/utsOcccxHsG8Ua9etBSupDjzX48yoJ+ybSvNK94=;
	h=From:To:Cc:Subject:Date:From;
	b=hBG26YnzPlGdkTQORH6zGjRvl6FmBicptS+a8P4xEA1kzV6MoQ90iRgKnQFMNL/D5
	 Zmb9GlPwJiKWuzSdc8J2rTKJvMzjCjjaW3QVtOwavxMuub2QZysbyP7c/E1Qvgg/vZ
	 ZF7auZXnf4vbBLCuZKFnOW1LWY4mBtasYteGGPYlP1wGp1TFsVH9P5O/N2kCUboyvW
	 5baqQS/KH8WphRkkaOekCl9/BJRaAC/nZFS3eiUYTY50yfpFMWtPkUjXA2lJjRUczD
	 Epav0chkx+XbpjU55xeuTNiEEbpARIWA+M0BED+4dpTBbZ7Xy3e8YOYtq6Oro+K0Yz
	 HvBjnkl10CpMQ==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 0/9] Refactor Vangogh acp5x machine driver
Date: Fri, 17 Feb 2023 11:08:41 +0000
Message-Id: <20230217110850.1045250-1-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MBHO5TFKWZVBLVSAFVDBHABSQHCZQZ2N
X-Message-ID-Hash: MBHO5TFKWZVBLVSAFVDBHABSQHCZQZ2N
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBHO5TFKWZVBLVSAFVDBHABSQHCZQZ2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Provide small fixes and refactor the code for easier insertion of a new
platform using the same acp5x machine driver.

Changes since V1:
 - Don't use smaller variable names
 - Don't use 100 limit for all lines
 - Use component prefixes to avoid collisions
 - Improved commit messages

Lucas Tanure (9):
  ASoC: amd: vangogh: Remove unnecessary init function
  ASoC: amd: vangogh: Small code refactor
  ASoC: amd: vangogh: use sizeof of variable instead of struct type
  ASoC: amd: vangogh: remove unnecessarily included headers
  ASoC: amd: vangogh: use for_each_rtd_components instead of for
  ASoC: amd: vangogh: Check Bit Clock rate before snd_soc_dai_set_pll
  ASoC: amd: vangogh: Move nau8821 and CPU side code up for future
    platform
  ASoC: amd: vangogh: Centralize strings definition
  ASoC: amd: vangogh: Add components prefix in structs and function
    names

 sound/soc/amd/vangogh/acp5x-mach.c | 297 ++++++++++++++---------------
 1 file changed, 144 insertions(+), 153 deletions(-)

-- 
2.39.2

