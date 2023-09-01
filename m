Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB879176D
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F26F84C;
	Mon,  4 Sep 2023 14:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F26F84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693831551;
	bh=wXQ1RuPCLZieC9OHR8QUNVjvRkuuGolpdgK3IGi+xuE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LoLT5DoYYKYMPsUGi+Yi88nnGJKIhCa06In98Q1RoJg7Lj8jBZO7nNhRA8psPOOjt
	 nT3m77KWBve0Y+ZO+L2BjQw5FH1XJwoDVkvfDrJsQCshSocM9i9vQKN62IgxRxG5Nx
	 A9astE+h8+OmDSakUe7MCaDisGNIpFb33zOzfVQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40DA2F80568; Mon,  4 Sep 2023 14:44:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABC83F80552;
	Mon,  4 Sep 2023 14:44:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA45FF80158; Fri,  1 Sep 2023 16:46:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 722B5F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 16:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 722B5F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=GIy9VkfB
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6150B9C1115;
	Fri,  1 Sep 2023 10:46:14 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id WTgS_UA3MdI6; Fri,  1 Sep 2023 10:46:13 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B65029C095C;
	Fri,  1 Sep 2023 10:46:13 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B65029C095C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1693579573; bh=wXQ1RuPCLZieC9OHR8QUNVjvRkuuGolpdgK3IGi+xuE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=GIy9VkfB7t82abQ6LGimGxkoelOQTC67XNvO/E3UtRVIfGc+lPxpZj8Mev1ERojne
	 tOEg62fBzLE2VgkcTslwSsW9Kw9DjxxGdbC/TmEDGWVjNrcv2AO401WifgKIZ1gjgp
	 chpHbblW2Pxyy2dMWY06tfkw2+aQ7QPajndRHUfMtsILLSzjK5o84j703mZMwm8vn/
	 IvVS75Ml0dTWoax6WqoDE36fpPwXu8cMFj8hvEQVWV3MSMS2ex0aoB2qx8r7V5HkS4
	 PFKwcjLX0TW7dvQwYtGfgzFFdMuwm9Rwa7Z2CWts/MXuk6PkEeV0xyWMkR6gJzyGm1
	 4/6S9yYculupA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3zbF2Qb-Srau; Fri,  1 Sep 2023 10:46:13 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EAF4C9C29CD;
	Fri,  1 Sep 2023 10:46:12 -0400 (EDT)
From: elinor.montmasson@savoirfairelinux.com
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Cc: alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCH] ASoC: fsl-asoc-card: dummy codec compatibility integration
 for use with S/PDIF controller
Date: Fri,  1 Sep 2023 16:45:40 +0200
Message-Id: <20230901144550.520072-1-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KREU3ZYTWOVDM2WC3KXRRR4ZD5JUROTU
X-Message-ID-Hash: KREU3ZYTWOVDM2WC3KXRRR4ZD5JUROTU
X-Mailman-Approved-At: Mon, 04 Sep 2023 12:44:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KREU3ZYTWOVDM2WC3KXRRR4ZD5JUROTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

Following some work to reduce the impact of audio resampling in Linux,
we would like to use the ASRC of the i.MX8 SoCs with the S/PDIF
controller. With that aim, this series of patch for the machine driver
fsl-asoc-card proposes to add compatibility with the dummy codec driver.
This is a first step in using the S/PDIF controller with the ASRC, as
the imx-spdif machine driver uses the dummy codec with the fsl_spdif DAI
driver.

The five first patches add compatibility with the dummy codec through a
new compatible, fsl,imx-audio-dummy-codec. Codec parameters are set with
default values.

The remaining patches add configuration options through device tree for
the codec parameters that can also impact the CPU DAI. These are usually
hard-coded in fsl-asoc-card for each audio codec. Because this dummy
codec could be use with other CPU DAI than the S/PDIF controller, these
could need specific configuration.

This series of patch was successfully built for arm64 and x86 on top of
the latest for-next branch of the ASoC git tree at
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/ on
the 28/08.
These modifications have also been tested on an i.MX8MN evaluation
board, with a linux kernel RT v6.1.26-rt8.

Regards,
Elinor Montmasson

