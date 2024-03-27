Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763688D37E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 01:47:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D08162BD1;
	Wed, 27 Mar 2024 01:47:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D08162BD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711500476;
	bh=2q5crH4HwBtEVMAdw9c1ugeNy2Oyqk30hp+EirVO3q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TVTxFh47ZO9ILkgr84bxGH1pzb6j4ziHN9fImue7JAHFog9IvMAD6/DgkhgPm9pVT
	 O7OELaFQhqNbXTnJVYg/0jziQiOLXUmWlTuwt9T9hYYBJifIVfKnwf7VgqiJkBJK8m
	 A6hvol4NI7+JuHL15h7R1CSgx1xVu/0US/JoVvI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04469F80579; Wed, 27 Mar 2024 01:47:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74DA5F805A1;
	Wed, 27 Mar 2024 01:47:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD59FF8025F; Wed, 27 Mar 2024 01:47:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0591F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 01:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0591F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UezsQDLg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AF485CE2381;
	Wed, 27 Mar 2024 00:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EB0C433C7;
	Wed, 27 Mar 2024 00:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711500435;
	bh=2q5crH4HwBtEVMAdw9c1ugeNy2Oyqk30hp+EirVO3q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UezsQDLgF9nL66A4jsvBTDD2EOr0eqDdVGhmNGprFvTwmA1eJHgPOWS9WJ7ECimcd
	 RDE0aan9K8Zg8d9M25lbWh96ZCpZ7y0mP+R19goxTSdH2JUd8JcPPdRW83X8rI6QM8
	 MJUThd//pIxYMao207aSg2QzHNfqWYJLPbB+dCwBN2EVPijRRPNUhHocfcqdZVwTSk
	 P3meIA4B8q4n+12qJIk0cKVZsdNFWx3sQ+EkouWPRC+ZdDc/jHiwushF/bhTIdgyqo
	 iwYU8SW6CRg3wKHM6DqpqtfSkZUOfF7qjVM0qmdXWxlmO2PGuFkWXuQEEE+muZ3xGT
	 sSHlZk7LNCyaw==
Date: Tue, 26 Mar 2024 17:47:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Ariel Elior
 <aelior@marvell.com>, Manish Chopra <manishc@marvell.com>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>,
 Hannes Reinecke <hare@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Helge Deller <deller@gmx.de>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas@fjasle.eu>, Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] enabled -Wformat-truncation for clang
Message-ID: <20240326174713.49f3a9ce@kernel.org>
In-Reply-To: <20240326223825.4084412-1-arnd@kernel.org>
References: <20240326223825.4084412-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YR2QRJJUYFDUB2HOCAJQF33DSQVBAVUW
X-Message-ID-Hash: YR2QRJJUYFDUB2HOCAJQF33DSQVBAVUW
X-MailFrom: kuba@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YR2QRJJUYFDUB2HOCAJQF33DSQVBAVUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Mar 2024 23:37:59 +0100 Arnd Bergmann wrote:
> I hope that the patches can get picked up by platform maintainers
> directly, so the final patch can go in later on.

platform == subsystem? :)
